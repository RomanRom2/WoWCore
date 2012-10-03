unit TMSGBuilder;

interface

uses
  TMSGStruct,
  ClassConnection;

function msgBuild(var Buf: TBuffer; var m: T_SMSG_AUTH_CHALLENGE): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_AUTH_RESPONSE): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_CHAR_ENUM): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_CHAR_CREATE): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_CHAR_DELETE): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_PONG): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_ITEM_QUERY_SINGLE_RESPONSE): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_CREATURE_QUERY_RESPONSE): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_GAMEOBJECT_QUERY_RESPONSE): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_NPC_TEXT_UPDATE): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_CHANNEL_NOTIFY): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_LOGOUT_COMPLETE): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_CHARACTER_LOGIN_FAILED): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_ACCOUNT_DATA_TIMES): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_UPDATE_ACCOUNT_DATA): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_UPDATE_ACCOUNT_DATA_COMPLETE): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_TUTORIAL_FLAGS): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_INITIAL_SPELLS): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_ACTION_BUTTONS): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_LOGIN_SETTIMESPEED): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_FORCE_RUN_SPEED_CHANGE): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_FORCE_SWIM_SPEED_CHANGE): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_FORCE_FLIGHT_SPEED_CHANGE): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_ATTACKSTART): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_ATTACKSTOP): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_TRANSFER_PENDING): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_NEW_WORLD): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_MSG_MOVE_TELEPORT_ACK): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_MESSAGECHAT): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_SPELL_START): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_SPELL_GO): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_DESTROY_OBJECT): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_MSG_MOVE_STATE): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_NAME_QUERY_RESPONSE): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_QUERY_TIME_RESPONSE): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_INVENTORY_CHANGE_FAILURE): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_QUESTGIVER_STATUS): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_QUESTGIVER_QUEST_LIST): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_STANDSTATE_UPDATE): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_GOSSIP_COMPLETE): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_GOSSIP_MESSAGE): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_EXPLORATION_EXPERIENCE): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_ITEM_PUSH_RESULT): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_TIME_SYNC_REQ): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_MOTD): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_MOVE_SET_CAN_FLY): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_MOVE_UNSET_CAN_FLY): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_ADDON_INFO): longint; overload;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_UI_TIME): longint; overload;

implementation

uses
  Defines,
  NetMessages,
  UpdateFields,
  PacketBuilding;

function msgBuild(var Buf: TBuffer; var m: T_SMSG_AUTH_CHALLENGE): longint; overload;
begin
  pkt.InitCmd(Buf, SMSG_AUTH_CHALLENGE);
  pkt.AddLong(Buf, m.unk);
  pkt.AddLong(Buf, m.ServerSeed);
  pkt.AddLong(Buf, m.Random1);
  pkt.AddLong(Buf, m.Random2);
  pkt.AddLong(Buf, m.Random3);
  pkt.AddLong(Buf, m.Random4);
  pkt.AddLong(Buf, m.Random5);
  pkt.AddLong(Buf, m.Random6);
  pkt.AddLong(Buf, m.Random7);
  pkt.AddLong(Buf, m.Random8);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_AUTH_RESPONSE): longint; overload;
begin
// uint8 unk
// if ((unk==0x0c)||(unk==0x1b))&&(packet_length>5)
// {
// uint32
// uint8
// uint32
// uint8
// }
// if(unk==0x1b)
// {
// uint32
// }
  pkt.InitCmd      (Buf, SMSG_AUTH_RESPONSE);
  pkt.AddByte      (Buf, m.ResponseCode);
  pkt.AddLong      (Buf, m.Unk1);
  pkt.AddByte      (Buf, m.Unk2);
  pkt.AddLong      (Buf, m.Unk3);
  pkt.AddByte      (Buf, m.GameType);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_CHAR_ENUM): longint; overload;
var
  i, k: longint;
begin
  pkt.InitCmd(Buf, SMSG_CHAR_ENUM);
  pkt.AddByte(Buf, m.Count);
  for i:= 0 to m.Count-1 do
  begin
    pkt.AddInt64   (Buf, m.Enum[i].GUID);
    pkt.AddStr     (Buf, m.Enum[i].name + #0);
    pkt.AddByte    (Buf, m.Enum[i].raceID);
    pkt.AddByte    (Buf, m.Enum[i].classID);
    pkt.AddByte    (Buf, m.Enum[i].sexID);
    pkt.AddByte    (Buf, m.Enum[i].skinID);
    pkt.AddByte    (Buf, m.Enum[i].faceID);
    pkt.AddByte    (Buf, m.Enum[i].hairStyleID);
    pkt.AddByte    (Buf, m.Enum[i].hairColorID);
    pkt.AddByte    (Buf, m.Enum[i].facialHairStyleID);
    pkt.AddByte    (Buf, m.Enum[i].experienceLevel);
    pkt.AddLong    (Buf, m.Enum[i].zoneID);
    pkt.AddLong    (Buf, m.Enum[i].mapID);
    pkt.AddFloat   (Buf, m.Enum[i].position.x);
    pkt.AddFloat   (Buf, m.Enum[i].position.y);
    pkt.AddFloat   (Buf, m.Enum[i].position.z);
    pkt.AddLong    (Buf, m.Enum[i].guildID);
    pkt.AddLong    (Buf, m.Enum[i].flags);
    pkt.AddLong    (Buf, m.Enum[i].flags2);
    pkt.AddByte    (Buf, m.Enum[i].restInfo);
    pkt.AddLong    (Buf, m.Enum[i].petDisplayInfoID);
    pkt.AddLong    (Buf, m.Enum[i].petExperienceLevel);
    pkt.AddLong    (Buf, m.Enum[i].petCreatureFamilyID);
    for k:= 0 to ENUM_PLAYER_ITEMS_COUNT-1 do
    begin
      pkt.AddLong  (buf, m.Enum[i].inventory[0][k].displayID);
      pkt.AddByte  (buf, m.Enum[i].inventory[0][k].inventoryType);
      pkt.AddLong  (buf, m.Enum[i].inventory[0][k].auraID);
    end;
    for k:= 0 to ENUM_PLAYER_BAGS_COUNT-1 do
    begin
      pkt.AddLong  (buf, 0); // bag displayID
      pkt.AddByte  (buf, 0); // bag inventoryType
      pkt.AddLong  (buf, 0); // bag auraID
    end;
  end;
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_CHAR_CREATE): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_CHAR_CREATE);
  pkt.AddByte      (Buf, m.ResponseCode);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_CHAR_DELETE): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_CHAR_DELETE);
  pkt.AddByte      (Buf, m.ResponseCode);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_PONG): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_PONG);
  pkt.AddLong      (Buf, m.Count);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_ITEM_QUERY_SINGLE_RESPONSE): longint; overload;
var
  i: longint;
begin
  pkt.InitCmd      (Buf, SMSG_ITEM_QUERY_SINGLE_RESPONSE);
  pkt.AddLong      (Buf, m.Entry);
  pkt.AddLong      (Buf, m.ClassID);
  pkt.AddLong      (Buf, m.SubClassID);
  pkt.AddLong      (Buf, m.Unk1);
  for i:= 0 to ITEM_NAMES-1 do
    pkt.AddStr     (Buf, m.Name[i]+#0);
  pkt.AddLong      (Buf, m.DisplayInfoID);
  pkt.AddLong      (Buf, m.OverallQualityID);
  pkt.AddLong      (Buf, m.Flags);
  pkt.AddLong      (Buf, m.Faction);
  pkt.AddLong      (Buf, m.BuyPrice);
  pkt.AddLong      (Buf, m.SellPrice);
  pkt.AddLong      (Buf, m.InventoryTypeID);
  pkt.AddLong      (Buf, m.AllowableClassID);
  pkt.AddLong      (Buf, m.AllowableRaceID);
  pkt.AddLong      (Buf, m.Level);
  pkt.AddLong      (Buf, m.RequiredLevel);
  pkt.AddLong      (Buf, m.RequiredSkill);
  pkt.AddLong      (Buf, m.RequiredSkillRank);
  pkt.AddLong      (Buf, m.RequiredSpell);
  pkt.AddLong      (Buf, m.RequiredHonorRank);
  pkt.AddLong      (Buf, m.RequiredCityRank);
  pkt.AddLong      (Buf, m.RequiredReputationFaction);
  pkt.AddLong      (Buf, m.RequiredReputationRank);
  pkt.AddLong      (Buf, m.Stackable);
  pkt.AddLong      (Buf, m.MaxStackCount);
  pkt.AddLong      (Buf, m.ContainerSlots);
  pkt.AddLong      (Buf, m.BonusCount);
  for i:= 0 to m.BonusCount-1 do
  begin
    pkt.AddLong    (Buf, m.Bonus[i].StatID);
    pkt.AddLong    (Buf, m.Bonus[i].StatCount);
  end;
  pkt.AddLong      (Buf, m.StatScalingDistribution);
  pkt.AddLong      (Buf, m.StatScalingValue);
  for i:= 0 to 1 do // 3.1.0: 5->2
  begin
    pkt.AddFloat   (Buf, m.DamageStat[i].Min);
    pkt.AddFloat   (Buf, m.DamageStat[i].Max);
    pkt.AddLong    (Buf, m.DamageStat[i].TypeID);
  end;
  for i:= 0 to 6 do
    pkt.AddLong    (Buf, m.Resistance[i]);
  pkt.AddLong      (Buf, m.Delay);
  pkt.AddLong      (Buf, m.AmmoType);
  pkt.AddFloat     (Buf, m.ModRanged);
  for i:= 0 to 4 do
  begin
    pkt.AddLong    (Buf, m.SpellStat[i].SpellID);
    pkt.AddLong    (Buf, m.SpellStat[i].TriggerSpellID);
    pkt.AddLong    (Buf, m.SpellStat[i].Charges);
    pkt.AddLong    (Buf, m.SpellStat[i].Cooldown);
    pkt.AddLong    (Buf, m.SpellStat[i].Category);
    pkt.AddLong    (Buf, m.SpellStat[i].CategoryCoolDown);
  end;
  pkt.AddLong      (Buf, m.Bonding);
  pkt.AddStr       (Buf, m.Description+#0);
  pkt.AddLong      (Buf, m.PageTextID);
  pkt.AddLong      (Buf, m.PageLanguageID);
  pkt.AddLong      (Buf, m.PageMaterial);
  pkt.AddLong      (Buf, m.StartQuestID);
  pkt.AddLong      (Buf, m.LockID);
  pkt.AddLong      (Buf, m.LockMaterial);
  pkt.AddLong      (Buf, m.Sheath);
  pkt.AddLong      (Buf, m.Extra); // Random Properties Id
  pkt.AddLong      (Buf, m.Suffix);
  pkt.AddLong      (Buf, m.Block);
  pkt.AddLong      (Buf, m.SetID);
  pkt.AddLong      (Buf, m.MaxDurability);
  pkt.AddLong      (Buf, m.Area);
  pkt.AddLong      (Buf, m.Map);
  pkt.AddLong      (Buf, m.BagFamily);
  pkt.AddLong      (Buf, m.ToolID);
  for i:= 0 to 2 do
  begin
    pkt.AddLong  (Buf, m.Socket[i].ID);
    pkt.AddLong  (Buf, m.Socket[i].Unk);
  end;
  pkt.AddLong      (Buf, m.SocketBonus);
  pkt.AddLong      (Buf, m.GemProperties);
  pkt.AddLong      (Buf, m.RequiredDisenchantSkill);
  pkt.AddFloat     (Buf, m.ArmorDamageModifier);
  pkt.AddLong      (Buf, m.Duration);
  pkt.AddLong      (Buf, m.LimitCategory);
  pkt.AddLong      (Buf, m.HolidayID);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_CREATURE_QUERY_RESPONSE): longint; overload;
var
  i: longint;
begin
  pkt.InitCmd      (Buf, SMSG_CREATURE_QUERY_RESPONSE);
  pkt.AddLong      (Buf, m.Entry);
  for i:=0 to CREATURE_NAMES-1 do
    pkt.AddStr     (Buf, m.Name[i]+#0);
  pkt.AddStr       (Buf, m.GuildName+#0);
  pkt.AddStr       (Buf, m.AssistName+#0);
  pkt.AddLong      (Buf, m.Flags);
  pkt.AddLong      (Buf, m.TypeID);
  pkt.AddLong      (Buf, m.Family);
  pkt.AddLong      (Buf, m.Rank);
  pkt.AddLong      (Buf, m.Unk1);
  pkt.AddLong      (Buf, m.SpellDataID);
  for i:=0 to CREATURE_MODELS-1 do
    pkt.AddLong    (Buf, m.DisplayID[i]);
  pkt.AddFloat     (Buf, m.Unk3);
  pkt.AddFloat     (Buf, m.Unk4);
  pkt.AddByte      (Buf, m.Civilian);
  pkt.AddLong      (Buf, m.Unk5_1);
  pkt.AddLong      (Buf, m.Unk5_2);
  pkt.AddLong      (Buf, m.Unk5_3);
  pkt.AddLong      (Buf, m.Unk5_4);
  pkt.AddLong      (Buf, m.Unk6);
  pkt.AddLong      (Buf, m.Unk7);
  pkt.AddLong      (Buf, m.Unk8);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_GAMEOBJECT_QUERY_RESPONSE): longint; overload;
var
  i: longint;
begin
  pkt.InitCmd      (Buf, SMSG_GAMEOBJECT_QUERY_RESPONSE);
  pkt.AddLong      (Buf, m.Entry);
  pkt.AddLong      (Buf, m.TypeID);
  pkt.AddLong(Buf, m.DisplayID);
  for i:=0 to GAMEOBJECT_NAMES-1 do
    pkt.AddStr     (Buf, m.Name[i]+#0);
  for i:=0 to GAMEOBJECT_PARAMS-1 do
    pkt.AddLong    (Buf, m.Param[i]);
  pkt.AddFloat     (Buf, m.ParamFloat);
  for i:=0 to GAMEOBJECT_ITEMS-1 do
    pkt.AddLong    (Buf, m.Item[i]);

  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_NPC_TEXT_UPDATE): longint; overload;
var
  i, j: longint;
begin
  pkt.InitCmd      (Buf, SMSG_NPC_TEXT_UPDATE);
  pkt.AddLong      (Buf, m.Entry);
  for i:=0 to 7 do
  begin
    pkt.AddFloat   (Buf, m.NPCText[i].Probability);
    pkt.AddStr     (Buf, m.NPCText[i].Text0+#0);
    pkt.AddStr     (Buf, m.NPCText[i].Text0+#0);
    pkt.AddLong    (Buf, m.NPCText[i].Language);
    for j:=0 to 2 do
    begin
      pkt.AddLong  (Buf, m.NPCText[i].Emote[j].Delay);
      pkt.AddLong  (Buf, m.NPCText[i].Emote[j].Emote);
    end;
  end;
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_CHANNEL_NOTIFY): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_CHANNEL_NOTIFY);
  pkt.AddByte      (Buf, m.TypeID);
  pkt.AddStr       (Buf, m.Name+#0);
  Case m.TypeID of
    CHAT_NOTIFY_YOU_JOINED:
    begin
      pkt.AddByte(Buf, m.VoiceID);
      pkt.AddLong(Buf, m.CategoryID);
      pkt.AddLong(Buf, CHAT_NOTIFY_JOINED);
    end;
    CHAT_NOTIFY_YOU_LEFT  :
    begin
      pkt.AddLong(Buf, m.CategoryID);
      pkt.AddByte(Buf, CHAT_NOTIFY_LEAVE);
    end;
  End;
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_LOGOUT_COMPLETE): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_LOGOUT_COMPLETE);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_CHARACTER_LOGIN_FAILED): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_CHARACTER_LOGIN_FAILED);
  pkt.AddByte      (Buf, m.ResponseCode);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_ACCOUNT_DATA_TIMES): longint; overload;
begin
  result:= 0;
  exit;
//  pkt.InitCmd      (Buf, SMSG_ACCOUNT_DATA_TIMES);
//  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_UPDATE_ACCOUNT_DATA): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_UPDATE_ACCOUNT_DATA);
  pkt.AddInt64     (Buf, m.GUID);
  pkt.AddLong      (Buf, m.AccountData_Type);
  pkt.AddLong      (Buf, m.AccountData_UnixDateTime);
  pkt.AddLong      (Buf, m.zipLen);
  if m.zipLen > 0 then
    pkt.AddArray   (Buf, @m.zipData[0], m.zipLen);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_UPDATE_ACCOUNT_DATA_COMPLETE): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_UPDATE_ACCOUNT_DATA_COMPLETE);
  pkt.AddLong      (Buf, m.AccountData_Type);
  pkt.AddLong      (Buf, m.AccountData_Unk);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_TUTORIAL_FLAGS): longint; overload;
var
  i: longint;
begin
  pkt.InitCmd      (Buf, SMSG_TUTORIAL_FLAGS);
  for i:= 0 to PLAYER_TUTORIALS_COUNT-1 do
    pkt.AddByte    (Buf, m.tmp[i]);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_INITIAL_SPELLS): longint; overload;
var
  i: longint;
begin
  pkt.InitCmd      (Buf, SMSG_INITIAL_SPELLS);
  pkt.AddByte      (Buf, m.sexID);
  pkt.AddWord      (Buf, m.SpellCount);
  for i:= 0 to m.SpellCount-1 do
  begin
    pkt.AddLong    (Buf, m.Spell[i].ID);
    pkt.AddWord    (Buf, m.Spell[i].Flags);
  end;
  pkt.AddWord      (Buf, m.CooldownCount);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_ACTION_BUTTONS): longint; overload;
var
  i: longint;
begin
  pkt.InitCmd      (Buf, SMSG_ACTION_BUTTONS);
  pkt.AddByte      (Buf, m.Unk);
  for i:= 0 to PLAYER_ACTION_BUTTONS_COUNT-1 do
    if m.Button[i].SpellID <> 0 then
      pkt.AddLong  (Buf, m.Button[i].Flags or m.Button[i].SpellID)
    else
      pkt.AddLong  (Buf, 0);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_LOGIN_SETTIMESPEED): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_LOGIN_SETTIMESPEED);
  pkt.AddLong      (Buf, m.DateTimeVal);
  pkt.AddFloat     (Buf, m.DateTimeMod);
  pkt.AddLong      (Buf, m.Unk);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_FORCE_RUN_SPEED_CHANGE): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_FORCE_RUN_SPEED_CHANGE);
  pkt.AddGUID      (Buf, m.GUID);
  pkt.AddLong      (Buf, m.Count);
  pkt.AddByte      (Buf, m.unk);
  pkt.AddFloat     (Buf, m.Value);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_FORCE_SWIM_SPEED_CHANGE): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_FORCE_SWIM_SPEED_CHANGE);
  pkt.AddGUID      (Buf, m.GUID);
  pkt.AddLong      (Buf, m.Count);
  pkt.AddFloat     (Buf, m.Value);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_FORCE_FLIGHT_SPEED_CHANGE): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_FORCE_FLIGHT_SPEED_CHANGE);
  pkt.AddGUID      (Buf, m.GUID);
  pkt.AddLong      (Buf, m.Count);
  pkt.AddFloat     (Buf, m.Value);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_ATTACKSTART): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_ATTACKSTART);
  pkt.AddInt64     (Buf, m.AttackerGUID);
  pkt.AddInt64     (Buf, m.TargetGUID);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_ATTACKSTOP): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_ATTACKSTOP);
  pkt.AddGUID      (Buf, m.AttackerGUID);
  pkt.AddGUID      (Buf, m.TargetGUID);
  pkt.AddLong      (Buf, m.Following);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_TRANSFER_PENDING): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_TRANSFER_PENDING);
  pkt.AddLong      (Buf, m.WorldID);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_NEW_WORLD): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_NEW_WORLD);
  pkt.AddLong      (Buf, m.MapID);
  pkt.AddFloat     (Buf, m.Position.X);
  pkt.AddFloat     (Buf, m.Position.Y);
  pkt.AddFloat     (Buf, m.Position.Z);
  pkt.AddFloat     (Buf, m.Facing);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_MSG_MOVE_TELEPORT_ACK): longint; overload;
begin
  pkt.InitCmd      (Buf, MSG_MOVE_TELEPORT_ACK);
  pkt.AddGUID      (Buf, m.GUID);
  pkt.AddLong      (Buf, m.MoveCount);
  pkt.AddLong      (Buf, m.MoveFlags);
  pkt.AddWord      (Buf, m.MoveFlags2);
  pkt.AddLong      (Buf, m.MoveStartTime);
  pkt.AddFloat     (Buf, m.Position.X);
  pkt.AddFloat     (Buf, m.Position.Y);
  pkt.AddFloat     (Buf, m.Position.Z);
  pkt.AddFloat     (Buf, m.Facing);
  pkt.AddLong      (Buf, m.Unk);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_MESSAGECHAT): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_MESSAGECHAT);
  pkt.AddByte      (Buf, m.TypeID);
  pkt.AddLong      (Buf, m.LangID);
  pkt.AddInt64     (Buf, m.OriginatorGUID);
  pkt.AddLong      (Buf, 0); // BC

  Case m.TypeID of
    CHAT_MSG_CHANNEL:
    begin
      pkt.AddStr(Buf, m.TargetName+#0);
      pkt.AddInt64(Buf, m.OriginatorGUID);
      pkt.AddLong(Buf, length(m.Text+#0));
      pkt.AddStr(Buf, m.Text+#0);
      pkt.AddByte(Buf, 0);
    end;

    else
    begin
      pkt.AddInt64     (Buf, m.OriginatorGUID);
      pkt.AddLong      (Buf, length(m.Text+#0));
      pkt.AddStr       (Buf, m.Text+#0);
      pkt.AddByte      (Buf, 0);
    end;
  End;

  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_SPELL_START): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_SPELL_START);
  pkt.AddGUID      (Buf, m.CasterGUID);
  pkt.AddGUID      (Buf, m.CasterLinkedGUID);
  pkt.AddByte      (Buf, m.SpellCastCount);
  pkt.AddLong      (Buf, m.SpellID);
  pkt.AddLong      (Buf, m.CastFlags);
  pkt.AddLong      (Buf, m.Duration);
  pkt.AddLong      (Buf, m.TargetFlags);

  if (m.TargetFlags and SPELL_TARGET_FLAG_UNIT) <> 0 then
    pkt.AddGUID    (Buf, m.TargetGUID);

  if (m.TargetFlags and SPELL_TARGET_FLAG_OBJECT) <> 0 then
    pkt.AddGUID    (Buf, m.TargetGUID);

  if (m.TargetFlags and SPELL_TARGET_FLAG_ITEM) <> 0 then
    pkt.AddGUID    (Buf, m.TargetGUID);

  if (m.TargetFlags and SPELL_TARGET_FLAG_SOURCE_LOCATION) <> 0 then
  begin
    pkt.AddFloat   (Buf, m.TargetPosition.x);
    pkt.AddFloat   (Buf, m.TargetPosition.y);
    pkt.AddFloat   (Buf, m.TargetPosition.z);
  end;

  if (m.TargetFlags and SPELL_TARGET_FLAG_DEST_LOCATION) <> 0 then
  begin
    pkt.AddFloat   (Buf, m.TargetPosition.x);
    pkt.AddFloat   (Buf, m.TargetPosition.y);
    pkt.AddFloat   (Buf, m.TargetPosition.z);
  end;

  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_SPELL_GO): longint; overload;
var
  i, k: longint;
begin
  pkt.InitCmd      (Buf, SMSG_SPELL_GO);
  pkt.AddGUID      (Buf, m.CasterGUID);
  pkt.AddGUID      (Buf, m.CasterLinkedGUID);
  pkt.AddByte      (Buf, m.SpellCastCount);
  pkt.AddLong      (Buf, m.SpellID);
  pkt.AddLong      (Buf, m.CastFlags);
  pkt.AddLong      (Buf, m.CastStartTime);

  k:= Length(m.AffectedTarget);
  pkt.AddByte      (Buf, k);
  for i:= 0 to k-1 do
    pkt.AddInt64   (Buf, m.AffectedTarget[i]);

  k:= Length(m.ResistedTarget);
  pkt.AddByte      (Buf, k);
  for i:= 0 to k-1 do
    pkt.AddInt64   (Buf, m.ResistedTarget[i]);

  if m.TargetFlags = SPELL_TARGET_FLAG_SELF then
    m.TargetFlags:= SPELL_TARGET_FLAG_UNIT;

  pkt.AddLong      (Buf, m.TargetFlags);

  if (m.TargetFlags and SPELL_TARGET_FLAG_UNIT) <> 0 then
  begin
    if m.TargetGUID = m.CasterGUID then
      pkt.AddByte  (Buf, 0)
    else
      pkt.AddGUID  (Buf, m.TargetGUID);
  end;

  if (m.TargetFlags and SPELL_TARGET_FLAG_OBJECT) <> 0 then
    pkt.AddGUID    (Buf, m.TargetGUID);

  if (m.TargetFlags and SPELL_TARGET_FLAG_ITEM) <> 0 then
    pkt.AddGUID    (Buf, m.TargetGUID);

  if (m.TargetFlags and SPELL_TARGET_FLAG_SOURCE_LOCATION) <> 0 then
  begin
    pkt.AddFloat   (Buf, m.TargetPosition.x);
    pkt.AddFloat   (Buf, m.TargetPosition.y);
    pkt.AddFloat   (Buf, m.TargetPosition.z);
  end;

  if (m.TargetFlags and SPELL_TARGET_FLAG_DEST_LOCATION) <> 0 then
  begin
    pkt.AddFloat   (Buf, m.TargetPosition.x);
    pkt.AddFloat   (Buf, m.TargetPosition.y);
    pkt.AddFloat   (Buf, m.TargetPosition.z);
  end;

  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_DESTROY_OBJECT): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_DESTROY_OBJECT);
  pkt.AddInt64     (Buf, m.GUID);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_MSG_MOVE_STATE): longint; overload;
begin
  pkt.InitCmd      (Buf, m.MovementInfo.m_lastNetMsgID);
  pkt.AddGUID      (Buf, m.GUID);
  pkt.AddLong      (Buf, m.MovementInfo.m_moveFlags);
  pkt.AddWord      (Buf, m.MovementInfo.m_moveFlags2);
  pkt.AddLong      (Buf, m.MovementInfo.m_moveStartTime);
  pkt.AddFloat     (Buf, m.MovementInfo.m_position.x);
  pkt.AddFloat     (Buf, m.MovementInfo.m_position.y);
  pkt.AddFloat     (Buf, m.MovementInfo.m_position.z);
  pkt.AddFloat     (Buf, m.MovementInfo.m_facing);

  if (m.MovementInfo.m_moveFlags and MOVEFLAG_ON_TRANSPORT) > 0 then
  begin
    pkt.AddGUID    (Buf, m.MovementInfo.Transport.GUID);
    pkt.AddFloat   (Buf, m.MovementInfo.Transport.Position.x);
    pkt.AddFloat   (Buf, m.MovementInfo.Transport.Position.x);
    pkt.AddFloat   (Buf, m.MovementInfo.Transport.Position.x);
    pkt.AddFloat   (Buf, m.MovementInfo.Transport.Facing);
    pkt.AddLong    (Buf, m.MovementInfo.Transport.Timestamp);
  end;

  if (m.MovementInfo.m_moveFlags and MOVEFLAG_SWIMMING) > 0 then
  begin
    pkt.AddFloat   (Buf, m.MovementInfo.m_pitch);
  end;

  pkt.AddLong      (Buf, m.MovementInfo.m_fallenTime);

  if (m.MovementInfo.m_moveFlags and MOVEFLAG_FALLING) > 0 then
  begin
    pkt.AddFloat   (Buf, m.MovementInfo.m_jumpVelocity);
    pkt.AddFloat   (Buf, m.MovementInfo.m_cosAnchorPitch);
    pkt.AddFloat   (Buf, m.MovementInfo.m_sinAnchorPitch);
    pkt.AddFloat   (Buf, m.MovementInfo.m_currentSpeed);
  end;

  if (m.MovementInfo.m_moveFlags and MOVEFLAG_FALL_START_ELEVATION) > 0 then
  begin
    pkt.AddFloat   (Buf, m.MovementInfo.m_fallStartElevation);
  end;

  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_NAME_QUERY_RESPONSE): longint; overload;
var
  i: longint;
begin
  pkt.InitCmd      (Buf, SMSG_NAME_QUERY_RESPONSE);
  pkt.AddGUID      (Buf, m.GUID);
  pkt.AddByte      (Buf, m.Unk);
  pkt.AddStr       (Buf, m.Name+#0);
  pkt.AddStr       (Buf, m.GuildName+#0);
  pkt.AddByte      (Buf, m.raceID);
  pkt.AddByte      (Buf, m.sexID);
  pkt.AddByte      (Buf, m.classID);
  pkt.AddByte      (Buf, m.LocaleNamesPresent);
  if m.LocaleNamesPresent <> 0 then
  begin
    for i:= 0 to 4 do
      pkt.AddStr   (Buf, m.LocaleName[i]+#0);
  end;
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_QUERY_TIME_RESPONSE): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_QUERY_TIME_RESPONSE);
  pkt.AddLong      (Buf, m.DateTimeValue);
  pkt.AddLong      (Buf, m.Unk);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_INVENTORY_CHANGE_FAILURE): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_INVENTORY_CHANGE_FAILURE);
  pkt.AddByte      (Buf, m.ResponseCode);
  pkt.AddInt64     (Buf, m.InventoryItemGUID);
  pkt.AddInt64     (Buf, m.InventoryGUID);
  pkt.AddByte      (Buf, m.Unk);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_QUESTGIVER_STATUS): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_QUESTGIVER_STATUS);
  pkt.AddInt64     (Buf, m.GUID);
  pkt.AddByte      (Buf, m.Status);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_QUESTGIVER_QUEST_LIST): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_QUESTGIVER_QUEST_LIST);
  pkt.AddInt64     (Buf, m.GUID);
  pkt.AddStr       (Buf, m.GreetingsText+#0);
  pkt.AddLong      (Buf, m.EmoteID);
  pkt.AddLong      (Buf, m.EmoteDelay);
  pkt.AddByte      (Buf, m.Unk);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_STANDSTATE_UPDATE): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_STANDSTATE_UPDATE);
  pkt.AddByte      (Buf, m.StandStateID);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_GOSSIP_COMPLETE): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_GOSSIP_COMPLETE);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_GOSSIP_MESSAGE): longint; overload;
var
  i: longint;
begin
  pkt.InitCmd      (Buf, SMSG_GOSSIP_MESSAGE);
  pkt.AddInt64     (Buf, m.GUID);
  pkt.AddLong      (Buf, m.Entry);
  pkt.AddLong      (Buf, m.NPCTextID);

  pkt.AddLong      (Buf, Length(m.GossipMenu));
  for i:=0 to Length(m.GossipMenu)-1 do
  begin
    pkt.AddLong    (Buf, m.GossipMenu[i].Option);
    pkt.AddByte    (Buf, m.GossipMenu[i].IconID);
    pkt.AddByte    (Buf, m.GossipMenu[i].InputBox);
    pkt.AddLong    (Buf, m.GossipMenu[i].PayCost);
    pkt.AddStr     (Buf, m.GossipMenu[i].Title+#0);
    pkt.AddStr     (Buf, m.GossipMenu[i].PayText+#0);
  end;

  pkt.AddLong      (Buf, Length(m.QuestMenu));
  for i:=0 to Length(m.QuestMenu)-1 do
  begin
    pkt.AddLong    (Buf, m.QuestMenu[i].ID);
    pkt.AddLong    (Buf, m.QuestMenu[i].Status);
    pkt.AddLong    (Buf, m.QuestMenu[i].BaseLevel);
    pkt.AddStr     (Buf, m.QuestMenu[i].Title+#0);
  end;

  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_EXPLORATION_EXPERIENCE): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_EXPLORATION_EXPERIENCE);
  pkt.AddLong      (Buf, m.AreaID);
  pkt.AddLong      (Buf, m.XP);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_ITEM_PUSH_RESULT): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_ITEM_PUSH_RESULT);
  pkt.AddInt64     (Buf, m.GUID);
  pkt.AddLong      (Buf, m.PushFrom);
  pkt.AddLong      (Buf, m.PushType);
  pkt.AddLong      (Buf, m.PushDisplay);
  pkt.AddByte      (Buf, m.ItemBag);
  pkt.AddLong      (Buf, m.ItemSlot);
  pkt.AddLong      (Buf, m.ItemEntry);
  pkt.AddLong      (Buf, m.ItemTime);
  pkt.AddLong      (Buf, m.ItemSuffix);
  pkt.AddLong      (Buf, m.ItemCount);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_TIME_SYNC_REQ): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_TIME_SYNC_REQ);
  pkt.AddLong      (Buf, m.Count);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_MOTD): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_MOTD);
  pkt.AddLong      (Buf, m.LinesCount);
  pkt.AddStr       (Buf, m.Lines+#0);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_MOVE_SET_CAN_FLY): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_MOVE_SET_CAN_FLY);
  pkt.AddGUID      (Buf, m.GUID);
  pkt.AddLong      (Buf, m.Count);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_MOVE_UNSET_CAN_FLY): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_MOVE_UNSET_CAN_FLY);
  pkt.AddGUID      (Buf, m.GUID);
  pkt.AddLong      (Buf, m.Count);
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_ADDON_INFO): longint; overload;
var
  i: longint;
begin
  pkt.InitCmd      (Buf, SMSG_ADDON_INFO);
  for i:= 0 to m.Count-1 do
  begin
    pkt.AddByte    (Buf, m.Info[i].TypeID);
    pkt.AddByte    (Buf, m.Info[i].isInfoBlockPresent);
    if m.Info[i].isInfoBlockPresent <> 0 then
    begin
      pkt.AddByte  (Buf, m.Info[i].isPublicKeyPresent);
      if m.Info[i].isPublicKeyPresent <> 0 then
        pkt.AddArray(Buf, @m.Info[i].PublicKeyData[0], 256);
      pkt.AddLong  (Buf, m.Info[i].Flags);
    end;
    pkt.AddByte    (Buf, m.Info[i].isURLPresent);
    if m.Info[i].isURLPresent <> 0 then
      pkt.AddStr   (Buf, m.Info[i].URLText+#0);
  end;
  pkt.AddLong      (Buf, m.BannedCount);
  for i:= 0 to m.BannedCount-1 do
  begin
    pkt.AddLong    (Buf, m.BannedInfo[i].Unk1);
    pkt.AddArray   (Buf, @m.BannedInfo[i].Unk2_1[0], 16);
    pkt.AddArray   (Buf, @m.BannedInfo[i].Unk2_2[0], 16);
    pkt.AddLong    (Buf, m.BannedInfo[i].Unk3);
    pkt.AddLong    (Buf, m.BannedInfo[i].Unk4);
  end;
  result:= pkt.pktLen;
end;
function msgBuild(var Buf: TBuffer; var m: T_SMSG_UI_TIME): longint; overload;
begin
  pkt.InitCmd      (Buf, SMSG_UI_TIME);
  pkt.AddLong      (Buf, m.DateTimeValue);
  result:= pkt.pktLen;
end;

end.


