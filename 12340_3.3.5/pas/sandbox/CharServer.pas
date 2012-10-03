unit CharServer;

interface

uses
  Struct, Defines,
  ClassConnection;

procedure cmd_SMSG_AUTH_CHALLENGE(var sender: TWorldUser);
procedure cmd_CMSG_AUTH_SESSION(var sender: TWorldUser);
procedure cmd_CMSG_CHAR_ENUM(var sender: TWorldUser);
procedure cmd_CMSG_CHAR_CREATE(var sender: TWorldUser);
procedure cmd_CMSG_CHAR_DELETE(var sender: TWorldUser);
procedure cmd_CMSG_PING(var sender: TWorldUser);
procedure cmd_CMSG_ITEM_QUERY_SINGLE(var sender: TWorldUser);
procedure cmd_CMSG_CREATURE_QUERY(var sender: TWorldUser);
procedure cmd_CMSG_GAMEOBJECT_QUERY(var sender: TWorldUser);
procedure cmd_CMSG_NPC_TEXT_QUERY(var sender: TWorldUser);
procedure cmd_CMSG_JOIN_CHANNEL(var sender: TWorldUser);
procedure cmd_CMSG_MESSAGECHAT(var sender: TWorldUser);
procedure cmd_CMSG_LOGOUT_REQUEST(var sender: TWorldUser);
procedure cmd_CMSG_DESTROYITEM(var sender: TWorldUser);
procedure cmd_CMSG_ZONEUPDATE(var sender: TWorldUser);
procedure cmd_CMSG_UI_TIME_REQUEST(var sender: TWorldUser);

implementation

uses
  Logs, Convert,
  wowZLib,
  LbCipher, LbClass,
  TMSGStruct, TMSGBuilder, TMSGParser, TMSGBufGets,
  NetMessages, NetMessagesStr,
  UpdateFields,
  DB,
  ClassCharList,
  ClassWorld,
  OpCodesProcTable,
  Commands,
  Responses,
  SysUtils, DateUtils, Windows;

procedure cmd_SMSG_AUTH_CHALLENGE(var sender: TWorldUser);
var
  msg: T_SMSG_AUTH_CHALLENGE;
begin
  Randomize;
  sender.ServerSeed:= random(65535) * 65535 + random(65535);

  msg.unk:= 1; // 1..31
  msg.ServerSeed:= sender.ServerSeed;
  msg.Random1:= random(65535) * 65535 + random(65535);
  msg.Random2:= random(65535) * 65535 + random(65535);
  msg.Random3:= random(65535) * 65535 + random(65535);
  msg.Random4:= random(65535) * 65535 + random(65535);
  msg.Random5:= random(65535) * 65535 + random(65535);
  msg.Random6:= random(65535) * 65535 + random(65535);
  msg.Random7:= random(65535) * 65535 + random(65535);
  msg.Random8:= random(65535) * 65535 + random(65535);
  sender.SockSend(msgBuild(sender.SBuf, msg));
end;
procedure cmd_CMSG_AUTH_SESSION(var sender: TWorldUser);
var
  i, login_len: longint;
  L: AnsiString;
  s: string;
  server_digest: TSHA1Digest;
  Hasher: TLbSHA1;
  Temp: array of Byte;
  imsg: T_CMSG_AUTH_SESSION;
  imsg2: T_CLIENT_ADDON_INFO;
  omsg: T_SMSG_AUTH_RESPONSE;
  imsg3: T_CMSG_CHAR_CREATE;
  omsg2: T_SMSG_ADDON_INFO;
  c: TCharData;
  z_err, unzipped: longint;
begin
  // default that's ok
  omsg.ResponseCode:= AUTH_OK;

  i:= msgParse(sender.RBuf, imsg);
  if i <> msg_PARSE_OK then MainLog(NetMsgStr(GetBufOpCode(sender.RBuf))+': ParseResult = ' + ParseResultStr[i]);

  MainLog('CMSG_AUTH_SESSION: AccountName ['+imsg.Login+'], Build ['+strr(imsg.Build)+']');
  sender.AccountName:= imsg.Login;

  // Find session KEY from ListLoginUsers
  for i:=0 to ListLoginUsers.Count-1 do
    if ListLoginUsers.UserByIndex[i].AccountName = imsg.Login then
      move(ListLoginUsers.UserByIndex[i].Data.Session[0], sender.SessionKey[0], 40);

  // Calculate Server Digest
  login_len:= Length(imsg.Login);

  Hasher:= TLbSHA1.Create(nil);
  SetLength(Temp, login_len + 4 + 4 + 4 + 40); // login + (zero) + CLIseed + SRVseed + key

  L:= AnsiString(imsg.Login);
  Move((@L[1])^, Temp[0], login_len);
  i:= 0;
  Move(i, Temp[login_len], 4);
  Move(imsg.ClientSeed, Temp[login_len + 4], 4);
  Move(sender.ServerSeed, Temp[login_len + 4 + 4], 4);
  Move(sender.SessionKey[0], Temp[login_len + 4 + 4 + 4], 40);

  Hasher.HashBuffer(Temp[0], Length(Temp));
  Hasher.GetDigest(server_digest);

  SetLength(Temp, 0);
  Hasher.Free;

  // Check Session KEY expires
  for i:= 0 to 19 do
    if server_digest[I] <> imsg.Digest[I] then
    begin
      omsg.ResponseCode:= AUTH_INCORRECT_PASSWORD;
      MainLog('CMSG_AUTH_SESSION: AUTH_INCORRECT_PASSWORD');
      break;
    end;

  // Check Version
  if vall(UPDATEFIELDS_BUILD) <> imsg.Build then
  begin
    omsg.ResponseCode:= AUTH_VERSION_MISMATCH;
    MainLog('CMSG_AUTH_SESSION: AUTH_VERSION_MISMATCH');
  end;

  // create traffic key
  sender.InitCryptors;

  // Answer
  omsg.Unk1:= 0;
  omsg.Unk2:= 0;
  omsg.Unk3:= 0;
  omsg.GameType:= GAME_TYPE_WOTLK;
  sender.SockSend(msgBuild(sender.SBuf, omsg));

  if omsg.ResponseCode = AUTH_OK  then
  begin
    MainLog('CMSG_AUTH_SESSION: AUTH_OK');
    s:= ''; for i:=0 to 39 do s:= s + inttohex(sender.SessionKey[i],2);
    MainLog('SESSION KEY: ' + s);
  end
  else
  begin
    sender.SockDisconnect;
    exit;
  end;

  // Addon Info
  // client sends info for Blizzard addons only, hardcoded somewhere in the client

  // 1. unzip the data
  for i:= 0 to length(sender.RBuf)-1 do sender.RBuf[i]:= 0;
  sender.RBuf[0]:= hi(imsg.zipLen + msg_CLIENT_HEADER_LEN - 2);
  sender.RBuf[1]:= lo(imsg.zipLen + msg_CLIENT_HEADER_LEN - 2);
  z_err:= wowDezip(addr(imsg.zipData[0]), imsg.zipLen, addr(sender.RBuf[msg_CLIENT_HEADER_LEN]), unzipped);
  if (z_err <> wowZ_OK) or (imsg.zipLen <> unzipped) then
  begin
    mainlog('BlizzardAddonInfo: unzip error');
    exit;
  end;

  i:= msgParse(sender.RBuf, imsg2);
  if i <> msg_PARSE_OK then
  begin
    MainLog('BlizzardAddonInfo: '+NetMsgStr(GetBufOpCode(sender.RBuf))+': ParseResult = ' + ParseResultStr[i]);
    exit;
  end;

  // 2. answer
  MainLog('BlizzardAddonInfo:');
  omsg2.Count:= imsg2.Count;
  SetLength(omsg2.Info, omsg2.Count);
  for i:= 0 to omsg2.Count-1 do
  begin
    s:= strr(i+1)+': '+inttohex(imsg2.Info[i].Enabled, 2)+' '+inttohex(imsg2.Info[i].CRC, 8)+' '+inttohex(imsg2.Info[i].Unk, 8)+' '+imsg2.Info[i].Name;
    omsg2.Info[i].TypeID:= ADDON_TYPE_BLIZZARD;
    omsg2.Info[i].isInfoBlockPresent:= 1; // true
    if imsg2.Info[i].CRC = BlizzardPublickKeyCRC then
    begin
      omsg2.Info[i].isPublicKeyPresent:= 0; // false
      MainLog(s);
    end
    else
    begin
      omsg2.Info[i].isPublicKeyPresent:= 1; // true
      move(BlizzardPublicKey[0], omsg2.Info[i].PublicKeyData[0], 256);
      MainLog(s+' <RESTORED>');
    end;
    omsg2.Info[i].Flags:= 0;
    omsg2.Info[i].isURLPresent:= 0; // false
  end;
  omsg2.BannedCount:= 0;
  SetLength(omsg2.BannedInfo, omsg2.BannedCount);
  sender.SockSend(msgBuild(sender.SBuf, omsg2));

  // Autocreate several chars
  if ListChars.Count > 0 then exit;

  // creating Human Mage Male
  imsg3.name:= 'Maga';
  imsg3.raceID:= RACE_HUMAN;
  imsg3.classID:= CLASS_MAGE;
  imsg3.sexID:= GENDER_MALE;
  imsg3.skinID:= 0;
  imsg3.faceID:= 0;
  imsg3.hairStyleID:= 0;
  imsg3.hairColorID:= 0;
  imsg3.facialHairStyleID:= 0;
  imsg3.outfitID:= 0;
  c:= TCharData.Create;
  DB_MakeNewChar(imsg3, c); // born char params of race, class, gender
  DB_AddChar(sender.AccountName, c);
  MainLog('AUTO_CREATE_CHAR ['+c.Enum.name+'], '+RaceStr[c.Enum.raceID]+', '+ClassStr[c.Enum.classID]+', '+GenderStr[c.Enum.sexID]+', '+Int64ToHex(c.Enum.GUID));

  // creating Orc Warrior Male
  imsg3.name:= 'Wara';
  imsg3.raceID:= RACE_ORC;
  imsg3.classID:= CLASS_WARRIOR;
  imsg3.sexID:= GENDER_MALE;
  imsg3.skinID:= 0;
  imsg3.faceID:= 0;
  imsg3.hairStyleID:= 0;
  imsg3.hairColorID:= 0;
  imsg3.facialHairStyleID:= 0;
  imsg3.outfitID:= 0;
  c:= TCharData.Create;
  DB_MakeNewChar(imsg3, c); // born char params of race, class, gender
  DB_AddChar(sender.AccountName, c);
  MainLog('AUTO_CREATE_CHAR ['+c.Enum.name+'], '+RaceStr[c.Enum.raceID]+', '+ClassStr[c.Enum.classID]+', '+GenderStr[c.Enum.sexID]+', '+Int64ToHex(c.Enum.GUID));

  // creating Draenei Shaman Female
  imsg3.name:= 'Drau';
  imsg3.raceID:= RACE_DRAENEI;
  imsg3.classID:= CLASS_SHAMAN;
  imsg3.sexID:= GENDER_FEMALE;
  imsg3.skinID:= 0;
  imsg3.faceID:= 0;
  imsg3.hairStyleID:= 0;
  imsg3.hairColorID:= 0;
  imsg3.facialHairStyleID:= 0;
  imsg3.outfitID:= 0;
  c:= TCharData.Create;
  DB_MakeNewChar(imsg3, c); // born char params of race, class, gender
  DB_AddChar(sender.AccountName, c);
  MainLog('AUTO_CREATE_CHAR ['+c.Enum.name+'], '+RaceStr[c.Enum.raceID]+', '+ClassStr[c.Enum.classID]+', '+GenderStr[c.Enum.sexID]+', '+Int64ToHex(c.Enum.GUID));

  // creating BloodElf Paladin Female
  imsg3.name:= 'Blua';
  imsg3.raceID:= RACE_BLOOD_ELF;
  imsg3.classID:= CLASS_PALADIN;
  imsg3.sexID:= GENDER_FEMALE;
  imsg3.skinID:= 0;
  imsg3.faceID:= 0;
  imsg3.hairStyleID:= 0;
  imsg3.hairColorID:= 0;
  imsg3.facialHairStyleID:= 0;
  imsg3.outfitID:= 0;
  c:= TCharData.Create;
  DB_MakeNewChar(imsg3, c); // born char params of race, class, gender
  DB_AddChar(sender.AccountName, c);
  MainLog('AUTO_CREATE_CHAR ['+c.Enum.name+'], '+RaceStr[c.Enum.raceID]+', '+ClassStr[c.Enum.classID]+', '+GenderStr[c.Enum.sexID]+', '+Int64ToHex(c.Enum.GUID));

  // creating Human DeathKnight Male
  imsg3.name:= 'Deak';
  imsg3.raceID:= RACE_HUMAN;
  imsg3.classID:= CLASS_DEATHKNIGHT;
  imsg3.sexID:= GENDER_MALE;
  imsg3.skinID:= 0;
  imsg3.faceID:= 0;
  imsg3.hairStyleID:= 0;
  imsg3.hairColorID:= 0;
  imsg3.facialHairStyleID:= 0;
  imsg3.outfitID:= 0;
  c:= TCharData.Create;
  DB_MakeNewChar(imsg3, c); // born char params of race, class, gender
  DB_AddChar(sender.AccountName, c);
  MainLog('AUTO_CREATE_CHAR ['+c.Enum.name+'], '+RaceStr[c.Enum.raceID]+', '+ClassStr[c.Enum.classID]+', '+GenderStr[c.Enum.sexID]+', '+Int64ToHex(c.Enum.GUID));

  // you can add more autocreated chars,
  // just fill imsg3 what are you want and do DB_MakeNewChar and DB_AddChar after

end;
procedure cmd_CMSG_CHAR_ENUM(var sender: TWorldUser);
var
  m: T_SMSG_CHAR_ENUM;
  i: longint;
begin
  DB_GetEnumCharList(sender.AccountName, m);
  mainlog('SMSG_CHAR_ENUM of ['+sender.AccountName+']: '+strr(m.Count)+' chars');

  for i:= 0 to m.Count-1 do
    MainLog('  '+strr(i)+': ['+m.Enum[i].name+'], '+RaceStr[m.Enum[i].raceID]+', '+ClassStr[m.Enum[i].classID]+', '+GenderStr[m.Enum[i].sexID]+', '+Int64ToHex(m.Enum[i].GUID));

  sender.SockSend(msgBuild(sender.SBuf, m));
end;
procedure cmd_CMSG_CHAR_CREATE(var sender: TWorldUser);
var
  i, total_chars: longint;
  c: TCharData;
  imsg: T_CMSG_CHAR_CREATE;
  omsg: T_SMSG_CHAR_CREATE;
begin
  total_chars:= ListChars.Count(sender.AccountName);
  if total_chars+1 > ENUM_CHARS_COUNT then
  begin
    omsg.ResponseCode:= CHAR_CREATE_ACCOUNT_LIMIT;
    sender.SockSend(msgBuild(sender.SBuf, omsg));
    exit;
  end;

  i:= msgParse(sender.RBuf, imsg);
  if i <> msg_PARSE_OK then MainLog(NetMsgStr(GetBufOpCode(sender.RBuf))+': ParseResult = ' + ParseResultStr[i]);

  if DB_CharExists(imsg.name) then
  begin
    omsg.ResponseCode:= CHAR_CREATE_NAME_IN_USE;
    sender.SockSend(msgBuild(sender.SBuf, omsg));
    exit;
  end;

  omsg.ResponseCode:= CHAR_CREATE_SUCCESS;
  sender.SockSend(msgBuild(sender.SBuf, omsg));

  c:= TCharData.Create;
  DB_MakeNewChar(imsg, c); // born char params of race, class, gender
  DB_AddChar(sender.AccountName, c);
  MainLog('CMSG_CHAR_CREATE ['+c.Enum.name+'], '+RaceStr[c.Enum.raceID]+', '+ClassStr[c.Enum.classID]+', '+GenderStr[c.Enum.sexID]+', '+Int64ToHex(c.Enum.GUID));
end;
procedure cmd_CMSG_CHAR_DELETE(var sender: TWorldUser);
var
  imsg: T_CMSG_CHAR_DELETE;
  omsg: T_SMSG_CHAR_DELETE;
  i: longint;
begin
  i:= msgParse(sender.RBuf, imsg);
  if i <> msg_PARSE_OK then MainLog(NetMsgStr(GetBufOpCode(sender.RBuf))+': ParseResult = ' + ParseResultStr[i]);

  MainLog('CMSG_CHAR_DELETE ['+int64tohex(imsg.CharGUID)+']', 1, 0, 0);

  DB_DeleteChar(imsg.CharGUID);

  omsg.ResponseCode:= CHAR_DELETE_SUCCESS;
  sender.SockSend(msgBuild(sender.SBuf, omsg));
end;
procedure cmd_CMSG_PING(var sender: TWorldUser);
var
  imsg: T_CMSG_PING;
  omsg: T_SMSG_PONG;
  i: longint;
begin
  i:= msgParse(sender.RBuf, imsg);
  if i <> msg_PARSE_OK then MainLog(NetMsgStr(GetBufOpCode(sender.RBuf))+': ParseResult = ' + ParseResultStr[i]);

  omsg.Count:= imsg.Count;
  sender.SockSend(msgBuild(sender.SBuf, omsg));
end;
procedure cmd_CMSG_ITEM_QUERY_SINGLE(var sender: TWorldUser);
var
  imsg: T_CMSG_ITEM_QUERY_SINGLE;
  omsg: T_SMSG_ITEM_QUERY_SINGLE_RESPONSE;
  i: longint;
begin
  i:= msgParse(sender.RBuf, imsg);
  if i <> msg_PARSE_OK then MainLog(NetMsgStr(GetBufOpCode(sender.RBuf))+': ParseResult = ' + ParseResultStr[i]);

  MainLog('CMSG_ITEM_QUERY_SINGLE: entry='+strr(imsg.Entry));

  if imsg.Entry >= Length(ItemTPL) then
  begin
    MainLog('CMSG_ITEM_QUERY_SINGLE: Item ID='+strr(imsg.Entry)+' out of range');
    exit;
  end;

  if ItemTPL[imsg.Entry].Name[0] = '' then
  begin
    MainLog('CMSG_ITEM_QUERY_SINGLE: Item ID='+strr(imsg.Entry)+' is not present');
    exit;
  end;

  omsg:= ItemTPL[imsg.Entry];
  omsg.Entry:= imsg.Entry;
  omsg.BonusCount:= 10;
  sender.SockSend(msgBuild(sender.SBuf, omsg));
end;
procedure cmd_CMSG_CREATURE_QUERY(var sender: TWorldUser);
var
  imsg: T_CMSG_CREATURE_QUERY;
  omsg: T_SMSG_CREATURE_QUERY_RESPONSE;
  i: longint;
begin
  i:= msgParse(sender.RBuf, imsg);
  if i <> msg_PARSE_OK then MainLog(NetMsgStr(GetBufOpCode(sender.RBuf))+': ParseResult = ' + ParseResultStr[i]);

  MainLog('CMSG_CREATURE_QUERY: entry='+strr(imsg.Entry));

  if imsg.Entry >= Length(GameObjectTPL) then
  begin
    MainLog('CMSG_CREATURE_QUERY: Creature ID='+strr(imsg.Entry)+' out of range');
    exit;
  end;

  if CreatureTPL[imsg.Entry].Name[0] = '' then
  begin
    MainLog('CMSG_CREATURE_QUERY: Creature ID='+strr(imsg.Entry)+' is not present',1,0,0);
    exit;
  end;

  omsg:= CreatureTPL[imsg.Entry];
  omsg.Entry:= imsg.Entry;
  sender.SockSend(msgBuild(sender.SBuf, omsg));
end;
procedure cmd_CMSG_GAMEOBJECT_QUERY(var sender: TWorldUser);
var
  imsg: T_CMSG_GAMEOBJECT_QUERY;
  omsg: T_SMSG_GAMEOBJECT_QUERY_RESPONSE;
  i: longint;
begin
  i:= msgParse(sender.RBuf, imsg);
  if i <> msg_PARSE_OK then MainLog(NetMsgStr(GetBufOpCode(sender.RBuf))+': ParseResult = ' + ParseResultStr[i]);

  MainLog('CMSG_GAMEOBJECT_QUERY: entry='+strr(imsg.Entry));

  if imsg.Entry >= Length(GameObjectTPL) then
  begin
    MainLog('CMSG_GAMEOBJECT_QUERY: GameObject ID='+strr(imsg.Entry)+' out of range');
    exit;
  end;

  if GameObjectTPL[imsg.Entry].Name[1] = '' then
  begin
    MainLog('CMSG_GAMEOBJECT_QUERY: GameObject ID='+strr(imsg.Entry)+' is not present',1,0,0);
    exit;
  end;

  omsg:= GameObjectTPL[imsg.Entry];
  omsg.Entry:= imsg.Entry;
  sender.SockSend(msgBuild(sender.SBuf, omsg));
end;
procedure cmd_CMSG_NPC_TEXT_QUERY(var sender: TWorldUser);
var
  imsg: T_CMSG_NPC_TEXT_QUERY;
  omsg: T_SMSG_NPC_TEXT_UPDATE;
  i: longint;
  s: string;
begin
  i:= msgParse(sender.RBuf, imsg);
  if i <> msg_PARSE_OK then MainLog(NetMsgStr(GetBufOpCode(sender.RBuf))+': ParseResult = ' + ParseResultStr[i]);

  MainLog('CMSG_NPC_TEXT_QUERY: entry='+strr(imsg.Entry));

  if imsg.Entry = 1 then
    s:= 'No NPC Text here, $N:'
  else
    s:= strr(imsg.Entry)+' records found, $N';

  omsg.Entry:= imsg.Entry;
  for i:= 0 to 7 do
    begin
      omsg.NPCText[i].Probability:= 0.0;
      omsg.NPCText[i].Text0:= '';
      omsg.NPCText[i].Text1:= '';
      omsg.NPCText[i].Language:= 0;
      omsg.NPCText[i].Emote[0].Delay:= 0;
      omsg.NPCText[i].Emote[0].Emote:= 0;
      omsg.NPCText[i].Emote[1].Delay:= 0;
      omsg.NPCText[i].Emote[1].Emote:= 0;
      omsg.NPCText[i].Emote[2].Delay:= 0;
      omsg.NPCText[i].Emote[2].Emote:= 0;
    end;
  omsg.NPCText[0].Probability:= 1.0;
  omsg.NPCText[0].Text0:= s;
  omsg.NPCText[0].Text1:= s;
  omsg.NPCText[0].Emote[1].Emote:= 1;

  sender.SockSend(msgBuild(sender.SBuf, omsg));
end;
procedure cmd_CMSG_JOIN_CHANNEL(var sender: TWorldUser);
var
  imsg: T_CMSG_JOIN_CHANNEL;
  omsg: T_SMSG_CHANNEL_NOTIFY;
  i: longint;
begin
  i:= msgParse(sender.RBuf, imsg);
  if i <> msg_PARSE_OK then MainLog(NetMsgStr(GetBufOpCode(sender.RBuf))+': ParseResult = ' + ParseResultStr[i]);

  MainLog('CMSG_JOIN_CHANNEL: category='+strr(imsg.CategoryID)+', type='+strr(imsg.TypeID)+', voice='+strr(imsg.VoiceEnabled)+', name=['+imsg.Name+'], voicename=['+imsg.VoiceName+']');

  // channel logic here
                
  // answer     
  omsg.TypeID:= CHAT_NOTIFY_YOU_JOINED;
  omsg.Name:= imsg.Name;
  omsg.CategoryID:= imsg.CategoryID;
  Case imsg.CategoryID of
    Channel_Category_Trade:
    begin
      omsg.VoiceID:= TRADE_CHANNEL;
    end;

    Channel_Category_GuildRecruitment:
    begin
      omsg.VoiceID:= GUILD_REC_CHANNEL;
    end;

    else
    begin
      omsg.VoiceID:= COMMON_CHANNEL;
    end;
  End;
  sender.SockSend(msgBuild(sender.SBuf, omsg));
end;
procedure cmd_CMSG_MESSAGECHAT(var sender: TWorldUser);
var
  imsg: T_CMSG_MESSAGECHAT;
  i: longint;
  U: TWorldUser;
begin
  i:= msgParse(sender.RBuf, imsg);
  if i <> msg_PARSE_OK then MainLog(NetMsgStr(GetBufOpCode(sender.RBuf))+': ParseResult = ' + ParseResultStr[i]);

  if imsg.TypeID in [CHAT_MSG_WHISPER, CHAT_MSG_CHANNEL] then
    MainLog('CMSG_MESSAGECHAT type='+strr(imsg.TypeID)+', lang='+strr(imsg.LangID)+' to ['+wow_unicode866(imsg.ChannelName)+'] > ['+wow_unicode866(imsg.Text)+']', 1,0,0)
  else
    MainLog('CMSG_MESSAGECHAT type='+strr(imsg.TypeID)+', lang='+strr(imsg.LangID)+' ['+wow_unicode866(imsg.Text)+']', 1,0,0);

  // message logic here
  if ParseCommand(sender, imsg.Text) then exit;

  // answer
  case imsg.TypeID of
    CHAT_MSG_SAY,
    CHAT_MSG_YELL:
      ListWorldUsers.Send_Message(sender.CharData.Enum.GUID, imsg.TypeID, imsg.LangID, '', imsg.Text);
    CHAT_MSG_WHISPER:
    begin
      U:= ListWorldUsers.UserByName[imsg.ChannelName];
      if U <> nil then
        U.Send_Message(sender.CharData.Enum.GUID, imsg.TypeID, imsg.LangID, imsg.ChannelName, imsg.Text)
      else
        sender.Send_Message(sender.CharData.Enum.GUID, CHAT_MSG_SYSTEM, 0, '', 'Player ['+imsg.ChannelName+'] is not found in the World');
    end;
    CHAT_MSG_CHANNEL:
      ListWorldUsers.Send_Message(sender.CharData.Enum.GUID, imsg.TypeID, imsg.LangID, imsg.ChannelName, imsg.Text);
    else
      MainLog('CMSG_MESSAGECHAT unsupported msg type='+strr(imsg.TypeID)+', lang='+strr(imsg.LangID)+' ['+wow_unicode866(imsg.Text)+']',1,0,0);
  end;
end;
procedure cmd_CMSG_LOGOUT_REQUEST(var sender: TWorldUser);
var
  OBJ: TWorldRecord;
  omsg: T_SMSG_LOGOUT_COMPLETE;
begin
  MainLog('CMSG_LOGOUT_REQUEST');

  DB_SaveChar(sender.CharData);

  ListWorldUsers.Send_Destroy(sender.CharData.Enum.GUID);

  OBJ.woType:= WO_PLAYER;
  OBJ.woGUID:= sender.CharData.Enum.GUID;
  OBJ.woMap:= sender.CharData.Enum.mapID;
  OBJ.woAddr:= sender;
  World.Del(OBJ);

  sender.SockSend(msgBuild(sender.SBuf, omsg));
end;
procedure cmd_CMSG_DESTROYITEM(var sender: TWorldUser);
var
  OBJ: TWorldRecord;
  VR: CValuesRecord;

  imsg: T_CMSG_DESTROYITEM;
  i: longint;
begin
  i:= msgParse(sender.RBuf, imsg);
  if i <> msg_PARSE_OK then MainLog(NetMsgStr(GetBufOpCode(sender.RBuf))+': ParseResult = ' + ParseResultStr[i]);

  MainLog('CMSG_DESTROYITEM from ['+inttohex(imsg.Bag,2)+':'+strr(imsg.Slot)+'], count='+strr(imsg.Count));

  // destroy item
  sender.Send_Destroy(sender.CharData.inventory_bag[0][imsg.Slot].GUID);
  sender.CharData.inventory_bag[0][imsg.Slot].Entry:= 0;
  sender.CharData.inventory_bag[0][imsg.Slot].GUID:= 0;

  // update self
  VR:= CValuesRecord.Create;
  if imsg.Slot in [0..PLAYER_VISIBLE_ITEMS_COUNT-1] then
    VR.Add(PLAYER_VISIBLE_ITEM_1_ENTRYID + imsg.Slot*(PLAYER_VISIBLE_ITEM_2_ENTRYID - PLAYER_VISIBLE_ITEM_1_ENTRYID));
  VR.Add(PLAYER_FIELD_INV_SLOT_HEAD + imsg.Slot*2);
  sender.Send_UpdateSelf(VR);
  VR.Free;

  // send update to other players
  OBJ.woType:= WO_PLAYER;
  OBJ.woGUID:= sender.CharData.Enum.GUID;
  OBJ.woMap:= sender.CharData.Enum.mapID;
  OBJ.woAddr:= sender;

  VR:= CValuesRecord.Create;
  if imsg.Slot in [0..PLAYER_VISIBLE_ITEMS_COUNT-1] then
    VR.Add(PLAYER_VISIBLE_ITEM_1_ENTRYID + imsg.Slot*(PLAYER_VISIBLE_ITEM_2_ENTRYID - PLAYER_VISIBLE_ITEM_1_ENTRYID));
  ListWorldUsers.Send_UpdateFromPlayer_Values(OBJ, VR);
  VR.Free;
end;
procedure cmd_CMSG_ZONEUPDATE(var sender: TWorldUser);
var
  imsg: T_CMSG_ZONEUPDATE;
  omsg: T_SMSG_EXPLORATION_EXPERIENCE;
  i: longint;
begin
  i:= msgParse(sender.RBuf, imsg);
  if i <> msg_PARSE_OK then MainLog(NetMsgStr(GetBufOpCode(sender.RBuf))+': ParseResult = ' + ParseResultStr[i]);

  mainlog('CMSG_ZONEUPDATE: AreaID='+strr(imsg.AreaID)+'');

  omsg.AreaID:= imsg.AreaID;
  omsg.XP:= 100;
  sender.SockSend(msgBuild(sender.SBuf, omsg));
end;
procedure cmd_CMSG_UI_TIME_REQUEST(var sender: TWorldUser);
var
  omsg: T_SMSG_UI_TIME;
begin
  omsg.DateTimeValue:= DateTimeToUnix(Now);
  sender.SockSend(msgBuild(sender.SBuf, omsg));
end;

end.
