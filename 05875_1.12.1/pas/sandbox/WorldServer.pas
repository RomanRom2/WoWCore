unit WorldServer;

interface

uses
  Defines,
  ClassConnection;

procedure cmd_CMSG_PLAYER_LOGIN(var sender: TWorldUser);
procedure cmd_MSG_MOVE_WORLDPORT_ACK(var sender: TWorldUser);
procedure cmd_MSG_MOVE_PLAYER(var sender: TWorldUser);
procedure cmd_CMSG_REQUEST_ACCOUNT_DATA(var sender: TWorldUser);
procedure cmd_CMSG_UPDATE_ACCOUNT_DATA(var sender: TWorldUser);
procedure cmd_CMSG_NAME_QUERY(var sender: TWorldUser);
procedure cmd_CMSG_QUERY_TIME(var sender: TWorldUser);
procedure cmd_CMSG_SET_SELECTION(var sender: TWorldUser);
procedure cmd_CMSG_AREATRIGGER(var sender: TWorldUser);
procedure cmd_CMSG_SWAP_INV_ITEM(var sender: TWorldUser);
procedure cmd_CMSG_AUTOEQUIP_ITEM(var sender: TWorldUser);
procedure cmd_CMSG_ATTACKSWING(var sender: TWorldUser);
procedure cmd_CMSG_ATTACKSTOP(var sender: TWorldUser);
procedure cmd_CMSG_QUESTGIVER_STATUS_QUERY(var sender: TWorldUser);
procedure cmd_CMSG_QUESTGIVER_HELLO(var sender: TWorldUser);
procedure cmd_CMSG_STANDSTATECHANGE(var sender: TWorldUser);
procedure cmd_CMSG_SETSHEATHED(var sender: TWorldUser);
procedure cmd_CMSG_CAST_SPELL(var sender: TWorldUser);
procedure cmd_CMSG_GOSSIP_SELECT_OPTION(var sender: TWorldUser);

implementation

uses
  Convert, Logs,
  NetMessages, NetMessagesStr,
  TMSGStruct, TMSGBufGets, TMSGBuilder, TMSGParser,
  Struct,
  ClassWorld,
  CharServer,
  DB,
  OpCodesProcTable,
  Commands,
  Responses,
  UpdatePacket, UpdateFields,
  PacketBuilding,
  SysUtils, DateUtils, Windows;

procedure PlayerEnterWorld(var sender: TWorldUser; logon: boolean);
var
  i: longint;
  year, month, day, hour, minute, sec, msec: word;
  nDayOfWeek: byte;
  s: string;
  OBJ: TWorldRecord;
  imsg: T_CMSG_PLAYER_LOGIN;
  omsg1: T_SMSG_CHARACTER_LOGIN_FAILED;
  omsg2: T_SMSG_ACCOUNT_DATA_MD5;
  omsg3: T_SMSG_TUTORIAL_FLAGS;
  omsg4: T_SMSG_INITIAL_SPELLS;
  omsg5: T_SMSG_ACTION_BUTTONS;
  omsg6: T_SMSG_LOGIN_SETTIMESPEED;
begin
  if logon then
  begin
    i:= msgParse(sender.RBuf, imsg);
    if i <> msg_PARSE_OK then MainLog(NetMsgStr(GetBufOpCode(sender.RBuf))+': ParseResult = ' + ParseResultStr[i]);

    if not DB_LoadChar(imsg.GUID, sender.CharData) then
    begin
      MainLog('Cant find Character GUID '+int64tohex(imsg.GUID));

      // 1 - world server is down
      // 2 - a char with that name already exists
      // 3 - no instanse server are available
      // 4 - login for that race, class or char is currently disabled
      // 5 - char not found
      // 6 - your char is currently locked as part of the char transfer process
      // 7 - char locked. contact billing for more information
      // 8 and more - login failed
      try
        omsg1.ResponseCode:= 5;
        sender.SockSend(msgBuild(sender.SBuf, omsg1));
      except
        MainLog('Exception while SMSG_CHARACTER_LOGIN_FAILED sending');
        sender.SockDisconnect;
      end;

      exit;
    end;
  end;

  { SMSG_ACCOUNT_DATA_TIMES - mandatory to send !!! }
  for i:= 0 to 31 do
    omsg2.tmp[i]:= 0;
  sender.SockSend(msgBuild(sender.SBuf, omsg2));

  { SMSG_TUTORIAL_FLAGS - mandatory to send !!! }
  for i:= 0 to PLAYER_TUTORIALS_COUNT-1 do
    omsg3.tmp[i]:= $FF;
  sender.SockSend(msgBuild(sender.SBuf, omsg3));

  { SMSG_INITIAL_SPELLS }
  omsg4.sexID:= sender.CharData.Enum.sexID;
  for i:= 0 to Length(sender.CharData.Spells)-1 do
    if sender.CharData.Spells[i].spell_id = 0 then
      break;
  omsg4.SpellCount:= i;
  SetLength(omsg4.Spell, i);
  for i:= 0 to omsg4.SpellCount-1 do
    begin
      omsg4.Spell[i].ID:= sender.CharData.Spells[i].spell_id;
      omsg4.Spell[i].Flags:= $EEEE;
    end;
  omsg4.CooldownCount:= 0;
  SetLength(omsg4.Cooldown, 0);
  sender.SockSend(msgBuild(sender.SBuf, omsg4));

  { SMSG_ACTION_BUTTONS }
  for i:= 0 to PLAYER_ACTION_BUTTONS_COUNT-1 do
  begin
    omsg5.Button[i].SpellID:= sender.CharData.Action_Buttons[i].spell_id;
    omsg5.Button[i].Flags:= sender.CharData.Action_Buttons[i].flags;
  end;
  sender.SockSend(msgBuild(sender.SBuf, omsg5));

  { SMSG_LOGIN_SETTIMESPEED }
  DecodeDateTime(Now, year, month, day, hour, minute, sec, msec);
  nDayOfWeek:= DayOfWeek(Date);
  omsg6.DateTimeVal:= minute or (hour shl 6) or (nDayOfWeek shl 11) or (longword(day) shl 14) or (longword(month) shl 20) or (longword(year) shl 24);
  omsg6.DateTimeMod:= 1.0 / 60.0;
  sender.SockSend(msgBuild(sender.SBuf, omsg6));

  { welcome message }
  if logon then
  begin
    s:= '';
    s:= s + 'Welcome to the World of Warcraft Explore Realms!'#13;
    s:= s + '|c8f20ff20WoWCore SandBox '+UPDATEFIELDS_VERSION+'.'+UPDATEFIELDS_BUILD+'.'+APP_BUILD+'|r'#13;
    s:= s + '|c8fff2020Use [.h] command for help|r'#13;
    sender.Send_Message(0, CHAT_MSG_SYSTEM, 0, '', s);
  end;

  { create items }
  for i:= 0 to Length(sender.CharData.inventory_bag[0])-1 do
    if sender.CharData.inventory_bag[0][i].Entry <> 0 then
      sender.Send_CreateFromItem(sender.CharData.inventory_bag[0][i]);

  { create player self }
  sender.Send_CreateSelf;

  { add active player to World }
  OBJ.woType:= WO_PLAYER;
  OBJ.woGUID:= sender.CharData.Enum.GUID;
  OBJ.woMap:= sender.CharData.Enum.mapID;
  OBJ.woAddr:= sender;
  World.Add(OBJ);

  { update World objects }
  for i:= 0 to World.Count-1 do
    if World.ObjectByIndex[i].woMap = sender.CharData.Enum.mapID then
    begin
      if World.ObjectByIndex[i].woType = WO_UNIT then
        sender.Send_CreateFromUnit(World.ObjectByIndex[i]);

      if World.ObjectByIndex[i].woType = WO_PLAYER then
      begin
        sender.Send_CreateFromPlayer(World.ObjectByIndex[i]);
        TWorldUser(World.ObjectByIndex[i].woAddr).Send_CreateFromPlayer(OBJ);
      end;
    end;

  { restore speeds }
  if not logon then
  begin
    ListWorldUsers.Send_UpdateFromPlayer_ForceRunSpeed(sender.CharData.Enum.GUID, sender.CharData.speed_run);
    ListWorldUsers.Send_UpdateFromPlayer_ForceSwimSpeed(sender.CharData.Enum.GUID, sender.CharData.speed_swim);
  end;
end;

procedure cmd_CMSG_PLAYER_LOGIN(var sender: TWorldUser);
begin
  PlayerEnterWorld(sender, true);
end;
procedure cmd_MSG_MOVE_WORLDPORT_ACK(var sender: TWorldUser);
begin
  PlayerEnterWorld(sender, false);
end;
procedure cmd_MSG_MOVE_PLAYER(var sender: TWorldUser);
var
  i: longint;
  MR: TMovementRecord;
  imsg: T_MSG_MOVE_STATE;
begin
  i:= msgParse(sender.RBuf, imsg);
  if i <> msg_PARSE_OK then MainLog(NetMsgStr(GetBufOpCode(sender.RBuf))+': ParseResult = ' + ParseResultStr[i]);

  MR.GUID:= sender.CharData.Enum.GUID;
  MR.OpCode:= imsg.MovementInfo.m_lastNetMsgID;
  MR.Flags:= imsg.MovementInfo.m_moveFlags;
  MR.StartTime:= imsg.MovementInfo.m_moveStartTime;
  MR.x:= imsg.MovementInfo.m_position.x;
  MR.y:= imsg.MovementInfo.m_position.y;
  MR.z:= imsg.MovementInfo.m_position.z;
  MR.facing:= imsg.MovementInfo.m_facing;
  MR.TransportGUID:= imsg.MovementInfo.Transport.GUID;
  MR.TransportX:= imsg.MovementInfo.Transport.Position.x;
  MR.TransportY:= imsg.MovementInfo.Transport.Position.y;
  MR.TransportZ:= imsg.MovementInfo.Transport.Position.z;
  MR.TransportF:= imsg.MovementInfo.Transport.Facing;
  MR.Pitch:= imsg.MovementInfo.m_pitch;
  MR.FallenTime:= imsg.MovementInfo.m_fallenTime;
  MR.jumpVelocity:= imsg.MovementInfo.m_jumpVelocity;
  MR.cosAnchorPitch:= imsg.MovementInfo.m_cosAnchorPitch;
  MR.sinAnchorPitch:= imsg.MovementInfo.m_sinAnchorPitch;
  MR.currentSpeed:= imsg.MovementInfo.m_currentSpeed;
  MR.fallStartElevation:= imsg.MovementInfo.m_fallStartElevation;

  sender.CharData.Enum.position.x:= MR.x;
  sender.CharData.Enum.position.y:= MR.y;
  sender.CharData.Enum.position.z:= MR.z;
  sender.CharData.facing:= MR.facing;

  ListWorldUsers.Send_UpdateFromPlayer_Move(MR);
end;
procedure cmd_CMSG_REQUEST_ACCOUNT_DATA(var sender: TWorldUser);
var
  imsg: T_CMSG_REQUEST_ACCOUNT_DATA;
  i: longint;
begin
  i:= msgParse(sender.RBuf, imsg);
  if i <> msg_PARSE_OK then MainLog(NetMsgStr(GetBufOpCode(sender.RBuf))+': ParseResult = ' + ParseResultStr[i]);

  case imsg.AccountDataType of
    0: MainLog('REQUEST_ACCOUNT_DATA type=0: CONFIG');
    1: MainLog('REQUEST_ACCOUNT_DATA type=1: CONFIG_2');
    2: MainLog('REQUEST_ACCOUNT_DATA type=2: BINDINGS');
    3: MainLog('REQUEST_ACCOUNT_DATA type=3: unk');
    4: MainLog('REQUEST_ACCOUNT_DATA type=4: MACROS');
    5: MainLog('REQUEST_ACCOUNT_DATA type=5: unk');
    6: MainLog('REQUEST_ACCOUNT_DATA type=6: unk');
    7: MainLog('REQUEST_ACCOUNT_DATA type=7: COLORS');
  end;
end;
procedure cmd_CMSG_UPDATE_ACCOUNT_DATA(var sender: TWorldUser);
var
  imsg: T_CMSG_UPDATE_ACCOUNT_DATA;
  omsg: T_SMSG_UPDATE_ACCOUNT_DATA;
  i: longint;
begin
  i:= msgParse(sender.RBuf, imsg);
  if i <> msg_PARSE_OK then MainLog(NetMsgStr(GetBufOpCode(sender.RBuf))+': ParseResult = ' + ParseResultStr[i]);

  case imsg.AccountDataType of
    0: MainLog('UPDATE_ACCOUNT_DATA type=0: CONFIG,   length='+strr(imsg.zipLen));
    1: MainLog('UPDATE_ACCOUNT_DATA type=1: CONFIG_2, length='+strr(imsg.zipLen));
    2: MainLog('UPDATE_ACCOUNT_DATA type=2: BINDINGS, length='+strr(imsg.zipLen));
    3: MainLog('UPDATE_ACCOUNT_DATA type=3: unk,      length='+strr(imsg.zipLen));
    4: MainLog('UPDATE_ACCOUNT_DATA type=4: MACROS,   length='+strr(imsg.zipLen));
    5: MainLog('UPDATE_ACCOUNT_DATA type=5: unk,      length='+strr(imsg.zipLen));
    6: MainLog('UPDATE_ACCOUNT_DATA type=6: unk,      length='+strr(imsg.zipLen));
    7: MainLog('UPDATE_ACCOUNT_DATA type=7: COLORS,   length='+strr(imsg.zipLen));
  end;

  omsg.AccountDataType:= imsg.AccountDataType;
  omsg.AccountDataValue:= 0;
  sender.SockSend(msgBuild(sender.SBuf, omsg));
end;
procedure cmd_CMSG_NAME_QUERY(var sender: TWorldUser);
var
  imsg: T_CMSG_NAME_QUERY;
  omsg: T_SMSG_NAME_QUERY_RESPONSE;
  i: longint;
begin
  i:= msgParse(sender.RBuf, imsg);
  if i <> msg_PARSE_OK then MainLog(NetMsgStr(GetBufOpCode(sender.RBuf))+': ParseResult = ' + ParseResultStr[i]);

  omsg.GUID:= imsg.GUID;
  omsg.Name:= TWorldUser(World[omsg.GUID].woAddr).CharData.Enum.name;
  omsg.GuildName:= '';
  omsg.raceID:= TWorldUser(World[omsg.GUID].woAddr).CharData.Enum.raceID;
  omsg.sexID:= TWorldUser(World[omsg.GUID].woAddr).CharData.Enum.sexID;
  omsg.classID:= TWorldUser(World[omsg.GUID].woAddr).CharData.Enum.classID;
  sender.SockSend(msgBuild(sender.SBuf, omsg));
end;
procedure cmd_CMSG_QUERY_TIME(var sender: TWorldUser);
var
  omsg: T_SMSG_QUERY_TIME_RESPONSE;
begin
  omsg.DateTimeValue:= DateTimeToUnix(Now);
  sender.SockSend(msgBuild(sender.SBuf, omsg));
end;
procedure cmd_CMSG_SET_SELECTION(var sender: TWorldUser);
var
  imsg: T_CMSG_SET_SELECTION;
  i: longint;
begin
  i:= msgParse(sender.RBuf, imsg);
  if i <> msg_PARSE_OK then MainLog(NetMsgStr(GetBufOpCode(sender.RBuf))+': ParseResult = ' + ParseResultStr[i]);

  sender.CharData.Selection:= imsg.GUID;
  MainLog('CMSG_SET_SELECTION: Target GUID='+int64tohex(sender.CharData.Selection), 1,0,0);
end;
procedure cmd_CMSG_AREATRIGGER(var sender: TWorldUser);
var
  imsg: T_CMSG_AREATRIGGER;
  i: longint;
begin
  i:= msgParse(sender.RBuf, imsg);
  if i <> msg_PARSE_OK then MainLog(NetMsgStr(GetBufOpCode(sender.RBuf))+': ParseResult = ' + ParseResultStr[i]);

  if AreaTriggerDBC[imsg.TriggerID].target_posx = 0.0 then
  begin
    MainLog('AreaTrigger '+strr(imsg.TriggerID)+' targets is not defined',1,0,0);
    exit;
  end;

  if AreaTriggerDBC[imsg.TriggerID].target_posx <> 0.0 then
    with AreaTriggerDBC[imsg.TriggerID] do
    begin
      MainLog('AreaTrigger '+strr(imsg.TriggerID)+': teleport to ('+strr(target_map)+', '+single2str(target_posx, 2)+', '+single2str(target_posy, 2)+', '+single2str(target_posz, 2)+')');
      sender.Teleport(target_map, target_zone, target_posx, target_posy, target_posz, target_posf);
    end;
end;
procedure cmd_CMSG_SWAP_INV_ITEM(var sender: TWorldUser);
var
  upkt: Tupkt;
  upkt_buf: array[0..65535] of byte;
  imsg: T_CMSG_SWAP_INV_ITEM;
  tmp: TItemTemplate;
  OBJ: TWorldRecord;
  VR: CValuesRecord;
  i: longint;
begin
  i:= msgParse(sender.RBuf, imsg);
  if i <> msg_PARSE_OK then MainLog(NetMsgStr(GetBufOpCode(sender.RBuf))+': ParseResult = ' + ParseResultStr[i]);

  MainLog('CMSG_SWAP_INV_ITEM slots '+strr(imsg.SrcSlot)+' to '+strr(imsg.DstSlot),1,0,0);

  tmp:= sender.CharData.inventory_bag[0][imsg.DstSlot];
  sender.CharData.inventory_bag[0][imsg.DstSlot]:= sender.CharData.inventory_bag[0][imsg.SrcSlot];
  sender.CharData.inventory_bag[0][imsg.SrcSlot]:=tmp;

  pkt.InitCmd(sender.SBuf, SMSG_UPDATE_OBJECT);
  pkt.AddLong(sender.SBuf, 1);
  pkt.AddByte(sender.SBuf, 0);
  pkt.AddByte(sender.SBuf, 0);
  pkt.AddGUID(sender.SBuf, sender.CharData.Enum.GUID);
  upkt.Init(PLAYER_END);

  // need to be ordered correctly in A9
  if imsg.SrcSlot < imsg.DstSlot then
    begin
      if imsg.SrcSlot in [0..PLAYER_VISIBLE_ITEMS_COUNT-1] then
        upkt.AddLong(  PLAYER_VISIBLE_ITEM_1_0 + imsg.SrcSlot*(PLAYER_VISIBLE_ITEM_2_0 - PLAYER_VISIBLE_ITEM_1_0), sender.CharData.inventory_bag[0][imsg.SrcSlot].Entry );
      if imsg.DstSlot in [0..PLAYER_VISIBLE_ITEMS_COUNT-1] then
        upkt.AddLong(  PLAYER_VISIBLE_ITEM_1_0 + imsg.DstSlot*(PLAYER_VISIBLE_ITEM_2_0 - PLAYER_VISIBLE_ITEM_1_0), sender.CharData.inventory_bag[0][imsg.DstSlot].Entry );
      upkt.AddInt64( PLAYER_FIELD_INV_SLOT_HEAD + imsg.SrcSlot*2,      sender.CharData.inventory_bag[0][imsg.SrcSlot].GUID);
      upkt.AddInt64( PLAYER_FIELD_INV_SLOT_HEAD + imsg.DstSlot*2,      sender.CharData.inventory_bag[0][imsg.DstSlot].GUID);
    end
  else
    begin
      if imsg.DstSlot in [0..PLAYER_VISIBLE_ITEMS_COUNT-1] then
        upkt.AddLong(  PLAYER_VISIBLE_ITEM_1_0 + imsg.DstSlot*(PLAYER_VISIBLE_ITEM_2_0 - PLAYER_VISIBLE_ITEM_1_0), sender.CharData.inventory_bag[0][imsg.DstSlot].Entry );
      if imsg.SrcSlot in [0..PLAYER_VISIBLE_ITEMS_COUNT-1] then
        upkt.AddLong(  PLAYER_VISIBLE_ITEM_1_0 + imsg.SrcSlot*(PLAYER_VISIBLE_ITEM_2_0 - PLAYER_VISIBLE_ITEM_1_0), sender.CharData.inventory_bag[0][imsg.SrcSlot].Entry );
      upkt.AddInt64( PLAYER_FIELD_INV_SLOT_HEAD + imsg.DstSlot*2,      sender.CharData.inventory_bag[0][imsg.DstSlot].GUID);
      upkt.AddInt64( PLAYER_FIELD_INV_SLOT_HEAD + imsg.SrcSlot*2,      sender.CharData.inventory_bag[0][imsg.SrcSlot].GUID);
    end;

  upkt.MakeUpdateBlock(@upkt_buf);
  pkt.AddByte(sender.SBuf, upkt.blocks);
  pkt.AddArray(sender.SBuf, @upkt_buf, upkt.data_ofs);
  sender.SockSend(pkt.pktLen);

  OBJ.woType:= WO_PLAYER;
  OBJ.woGUID:= sender.CharData.Enum.GUID;
  OBJ.woMap:= sender.CharData.Enum.mapID;
  OBJ.woAddr:= sender;

  VR:= CValuesRecord.Create;
  if imsg.SrcSlot in [0..PLAYER_VISIBLE_ITEMS_COUNT-1] then
    VR.Add(PLAYER_VISIBLE_ITEM_1_0 + imsg.SrcSlot*(PLAYER_VISIBLE_ITEM_2_0 - PLAYER_VISIBLE_ITEM_1_0));
  if imsg.DstSlot in [0..PLAYER_VISIBLE_ITEMS_COUNT-1] then
    VR.Add(PLAYER_VISIBLE_ITEM_1_0 + imsg.DstSlot*(PLAYER_VISIBLE_ITEM_2_0 - PLAYER_VISIBLE_ITEM_1_0));
  ListWorldUsers.Send_UpdateFromPlayer_Values(OBJ, VR);
  VR.Free;
end;
procedure cmd_CMSG_AUTOEQUIP_ITEM(var sender: TWorldUser);
var
  upkt: Tupkt;
  upkt_buf: array[0..65535] of byte;
  imsg: T_CMSG_AUTOEQUIP_ITEM;
  omsg: T_SMSG_INVENTORY_CHANGE_FAILURE;
//  bag: byte;
  found: boolean;
  i: longint;
  src_slot, dst_slot: byte;
  tmp: TItemTemplate;
  OBJ: TWorldRecord;
  VR: CValuesRecord;
begin
  i:= msgParse(sender.RBuf, imsg);
  if i <> msg_PARSE_OK then MainLog(NetMsgStr(GetBufOpCode(sender.RBuf))+': ParseResult = ' + ParseResultStr[i]);

  MainLog('CMSG_AUTOEQUIP_ITEM from ['+inttohex(imsg.Bag,2)+','+inttohex(imsg.Slot,2)+']', 1,0,0);

  // handle only main bag ($FF)

  src_slot:= imsg.Slot;

  if ItemTPL[sender.CharData.inventory_bag[0][src_slot].Entry].InventoryTypeID = INVTYPE_NON_EQUIP then
    begin
      omsg.ResponseCode:= EQUIP_ERR_NO_EQUIPMENT_SLOTS_IS_AVAILABLE;
      omsg.InventoryItemGUID:= sender.CharData.inventory_bag[0][src_slot].GUID;
      omsg.InventoryGUID:= 0;
      omsg.Unk:= 0;
      sender.SockSend(msgBuild(sender.SBuf, omsg));
      exit;
    end;

  // bag do not equip
  if ItemTPL[sender.CharData.inventory_bag[0][src_slot].Entry].InventoryTypeID = INVTYPE_BAG then
    begin
      omsg.ResponseCode:= EQUIP_ERR_CANT_DO_RIGHT_NOW;
      omsg.InventoryItemGUID:= sender.CharData.inventory_bag[0][src_slot].GUID;
      omsg.InventoryGUID:= 0;
      omsg.Unk:= 0;
      sender.SockSend(msgBuild(sender.SBuf, omsg));
      exit;
    end;

  // finding equip slot
  found:= false;
  dst_slot:= 0;
  for i:= InventoryEquipSlotStart to InventoryEquipSlotStart +InventoryEquipSlotsCount -1 do
    if (ItemTPL[sender.CharData.inventory_bag[0][src_slot].Entry].InventoryTypeID in EQUIP_SLOT_TYPE[i]) then
    begin
      found:= true;
      dst_slot:= i;
      break;
    end;

  if found then
  begin
    tmp:=sender.CharData.inventory_bag[0][dst_slot];
    sender.CharData.inventory_bag[0][dst_slot]:= sender.CharData.inventory_bag[0][src_slot];
    sender.CharData.inventory_bag[0][src_slot]:= tmp;

    pkt.InitCmd(sender.SBuf, SMSG_UPDATE_OBJECT);
    pkt.AddLong(sender.SBuf, 1);
    pkt.AddByte(sender.SBuf, 0);
    pkt.AddByte(sender.SBuf, 0);
    pkt.AddGUID(sender.SBuf, sender.CharData.Enum.GUID);
    upkt.Init(PLAYER_END);

    if src_slot<dst_slot then
      begin
        if src_slot in [0..PLAYER_VISIBLE_ITEMS_COUNT-1] then
          upkt.AddLong(  PLAYER_VISIBLE_ITEM_1_0 + src_slot*(PLAYER_VISIBLE_ITEM_2_0 - PLAYER_VISIBLE_ITEM_1_0), sender.CharData.inventory_bag[0][src_slot].Entry );
        if dst_slot in [0..PLAYER_VISIBLE_ITEMS_COUNT-1] then
          upkt.AddLong(  PLAYER_VISIBLE_ITEM_1_0 + dst_slot*(PLAYER_VISIBLE_ITEM_2_0 - PLAYER_VISIBLE_ITEM_1_0), sender.CharData.inventory_bag[0][dst_slot].Entry );
        upkt.AddInt64( PLAYER_FIELD_INV_SLOT_HEAD + src_slot*2,      sender.CharData.inventory_bag[0][src_slot].GUID);
        upkt.AddInt64( PLAYER_FIELD_INV_SLOT_HEAD + dst_slot*2,      sender.CharData.inventory_bag[0][dst_slot].GUID);
      end
    else
      begin
        if dst_slot in [0..PLAYER_VISIBLE_ITEMS_COUNT-1] then
          upkt.AddLong(  PLAYER_VISIBLE_ITEM_1_0 + dst_slot*(PLAYER_VISIBLE_ITEM_2_0 - PLAYER_VISIBLE_ITEM_1_0), sender.CharData.inventory_bag[0][dst_slot].Entry );
        if src_slot in [0..PLAYER_VISIBLE_ITEMS_COUNT-1] then
          upkt.AddLong(  PLAYER_VISIBLE_ITEM_1_0 + src_slot*(PLAYER_VISIBLE_ITEM_2_0 - PLAYER_VISIBLE_ITEM_1_0), sender.CharData.inventory_bag[0][src_slot].Entry );
        upkt.AddInt64( PLAYER_FIELD_INV_SLOT_HEAD + dst_slot*2,      sender.CharData.inventory_bag[0][dst_slot].GUID);
        upkt.AddInt64( PLAYER_FIELD_INV_SLOT_HEAD + src_slot*2,      sender.CharData.inventory_bag[0][src_slot].GUID);
      end;

    upkt.MakeUpdateBlock(@upkt_buf);
    pkt.AddByte(sender.SBuf, upkt.blocks);
    pkt.AddArray(sender.SBuf, @upkt_buf, upkt.data_ofs);
    sender.SockSend(pkt.pktLen);
  end;

  OBJ.woType:= WO_PLAYER;
  OBJ.woGUID:= sender.CharData.Enum.GUID;
  OBJ.woMap:= sender.CharData.Enum.mapID;
  OBJ.woAddr:= sender;

  VR:= CValuesRecord.Create;
  if src_slot in [0..PLAYER_VISIBLE_ITEMS_COUNT-1] then
    VR.Add(PLAYER_VISIBLE_ITEM_1_0 + src_slot*(PLAYER_VISIBLE_ITEM_2_0 - PLAYER_VISIBLE_ITEM_1_0));
  if dst_slot in [0..PLAYER_VISIBLE_ITEMS_COUNT-1] then
    VR.Add(PLAYER_VISIBLE_ITEM_1_0 + dst_slot*(PLAYER_VISIBLE_ITEM_2_0 - PLAYER_VISIBLE_ITEM_1_0));
  ListWorldUsers.Send_UpdateFromPlayer_Values(OBJ, VR);
  VR.Free;
end;
procedure cmd_CMSG_ATTACKSWING(var sender: TWorldUser);
begin
  ListWorldUsers.Send_UpdateFromPlayer_AttackStart(sender.CharData.Enum.GUID, sender.CharData.Selection);
end;
procedure cmd_CMSG_ATTACKSTOP(var sender: TWorldUser);
begin
  ListWorldUsers.Send_UpdateFromPlayer_AttackStop(sender.CharData.Enum.GUID, sender.CharData.Selection);
end;
procedure cmd_CMSG_QUESTGIVER_STATUS_QUERY(var sender: TWorldUser);
var
  imsg: T_CMSG_SET_SELECTION;
  omsg: T_SMSG_QUESTGIVER_STATUS;
  i: longint;
begin
  i:= msgParse(sender.RBuf, imsg);
  if i <> msg_PARSE_OK then MainLog(NetMsgStr(GetBufOpCode(sender.RBuf))+': ParseResult = ' + ParseResultStr[i]);

  MainLog('CMSG_QUESTGIVER_STATUS_QUERY: GUID='+int64tohex(imsg.GUID));

  omsg.GUID:= imsg.GUID;
  omsg.Status:= 6; // yellow "!"
  sender.SockSend(msgBuild(sender.SBuf, omsg));
end;
procedure cmd_CMSG_QUESTGIVER_HELLO(var sender: TWorldUser);
var
  imsg: T_CMSG_QUESTGIVER_HELLO;
  omsg: T_SMSG_QUESTGIVER_QUEST_LIST;
  i: longint;
  questgiver_entry: longint;
  woUnit: TWorldUnit;
begin
  i:= msgParse(sender.RBuf, imsg);
  if i <> msg_PARSE_OK then MainLog(NetMsgStr(GetBufOpCode(sender.RBuf))+': ParseResult = ' + ParseResultStr[i]);

  mainlog('cmd_CMSG_QUESTGIVER_HELLO: GUID='+int64tohex(imsg.GUID));

  woUnit:= TWorldUnit(World[imsg.GUID].woAddr);
  if woUnit = nil then
  begin
    mainlog('cmd_CMSG_QUESTGIVER_HELLO: woUnit=nil');
    exit;
  end;
  questgiver_entry:= woUnit.woEntry;

  if questgiver_entry < 0 then exit;
  if questgiver_entry > Length(CreatureTPL) then exit;

  if CreatureTPL[questgiver_entry].Name[0] <> '' then
  begin
    omsg.GUID:= imsg.GUID;
    omsg.GreetingsText:= CreatureTPL[questgiver_entry].Greetings;
    omsg.EmoteID:= CreatureTPL[questgiver_entry].EmoteID;
    omsg.EmoteDelay:= CreatureTPL[questgiver_entry].EmoteDelay;
    omsg.Unk:= 0;
    sender.SockSend(msgBuild(sender.SBuf, omsg));
  end;
end;
procedure cmd_CMSG_STANDSTATECHANGE(var sender: TWorldUser);
var
  i: longint;
  imsg: T_CMSG_STANDSTATECHANGE;
  omsg: T_SMSG_STANDSTATE_CHANGE_ACK;
  OBJ: TWorldRecord;
  VR: CValuesRecord;
begin
  i:= msgParse(sender.RBuf, imsg);
  if i <> msg_PARSE_OK then MainLog(NetMsgStr(GetBufOpCode(sender.RBuf))+': ParseResult = ' + ParseResultStr[i]);

  mainlog('CMSG_STANDSTATECHANGE: value='+strr(imsg.StandStateID));

  sender.CharData.stand_state:= imsg.StandStateID;

  omsg.StandStateID:= imsg.StandStateID;
  sender.SockSend(msgBuild(sender.SBuf, omsg));

  OBJ.woType:= WO_PLAYER;
  OBJ.woGUID:= sender.CharData.Enum.GUID;
  OBJ.woMap:= sender.CharData.Enum.mapID;
  OBJ.woAddr:= sender;

  VR:= CValuesRecord.Create;
  VR.Add(UNIT_FIELD_BYTES_1);
  sender.Send_UpdateSelf(VR);
  ListWorldUsers.Send_UpdateFromPlayer_Values(OBJ, VR);
  VR.Free;
end;
procedure cmd_CMSG_SETSHEATHED(var sender: TWorldUser);
var
  i: longint;
  imsg: T_CMSG_SETSHEATHED;
  OBJ: TWorldRecord;
  VR: CValuesRecord;
begin
  i:= msgParse(sender.RBuf, imsg);
  if i <> msg_PARSE_OK then MainLog(NetMsgStr(GetBufOpCode(sender.RBuf))+': ParseResult = ' + ParseResultStr[i]);

  mainlog('CMSG_SETSHEATHED: value='+strr(imsg.SheathedID));

  sender.CharData.sheathed:= imsg.SheathedID;

  OBJ.woType:= WO_PLAYER;
  OBJ.woGUID:= sender.CharData.Enum.GUID;
  OBJ.woMap:= sender.CharData.Enum.mapID;
  OBJ.woAddr:= sender;

  VR:= CValuesRecord.Create;
  VR.Add(UNIT_FIELD_BYTES_2);
  ListWorldUsers.Send_UpdateFromPlayer_Values(OBJ, VR);
  VR.Free;
end;
procedure cmd_CMSG_CAST_SPELL(var sender: TWorldUser);
var
  i: longint;
  imsg: T_CMSG_CAST_SPELL;
  SR: TSpellRecord;
begin
  i:= msgParse(sender.RBuf, imsg);
  if i <> msg_PARSE_OK then MainLog(NetMsgStr(GetBufOpCode(sender.RBuf))+': ParseResult = ' + ParseResultStr[i]);

  SR.caster_guid:= sender.CharData.Enum.GUID;

  SR.spell_cast_time:= 1000;
  SR.spell_id:= imsg.SpellID;
  SR.target_flags:= imsg.TargetFlags;
  SR.target_guid:= imsg.TargetGUID;
  SR.target_x:= imsg.TargetPosition.x;
  SR.target_y:= imsg.TargetPosition.y;
  SR.target_z:= imsg.TargetPosition.z;
  SR.target_string:= '';

  if SR.target_flags = 0 then
    SR.target_guid:= sender.CharData.Enum.GUID;

  MainLog('CMSG_CAST_SPELL: spell='+strr(SR.spell_id)+', flags='+IntToHex(SR.target_flags, 4), 1,0,0);

  ListWorldUsers.Send_UpdateFromPlayer_SpellStart(SR);
  sleep(SR.spell_cast_time); // for actual animation
  ListWorldUsers.Send_UpdateFromPlayer_SpellGo(SR);
end;
procedure cmd_CMSG_GOSSIP_SELECT_OPTION(var sender: TWorldUser);
var
  imsg: T_CMSG_GOSSIP_SELECT_OPTION;
  GOSSIP_COMPLETE: T_SMSG_GOSSIP_COMPLETE;
  GOSSIP_MESSAGE: T_SMSG_GOSSIP_MESSAGE;
  GOSSIP_TOOL: OGOSSIP_TOOL;
  g: GossipMenuRecord;
  p, pages, n, i, k: longint;
begin
  i:= msgParse(sender.RBuf, imsg);
  if i <> msg_PARSE_OK then MainLog(NetMsgStr(GetBufOpCode(sender.RBuf))+': ParseResult = ' + ParseResultStr[i]);

  mainlog('CMSG_GOSSIP_SELECT_OPTION: GUID='+int64tohex(imsg.GUID)+', option='+IntToHex(imsg.Option, 8));

  // ---------------------------------------------------------------------------
  if imsg.Option and $10000000 > 0 then
  begin
    // item
    if imsg.Option and $01000000 > 0 then
    begin
      // nav option
      p:= imsg.Option and not $11000000;
      pages:= (Length(sender.CharData.VR.Values) div GOSSIP_MENU_COUNT) +1;
      if (Length(sender.CharData.VR.Values) mod GOSSIP_MENU_COUNT) = 0 then dec(pages);

      i:= (p-1)*12;
      n:= Length(sender.CharData.VR.Values) -i;
      if n > GOSSIP_MENU_COUNT then n:= GOSSIP_MENU_COUNT;

      GOSSIP_TOOL.Init(GOSSIP_MESSAGE);
      GOSSIP_MESSAGE.GUID:= sender.CharData.Enum.GUID;
      GOSSIP_MESSAGE.NPCTextID:= Length(sender.CharData.VR.Values);

      if p > 1 then
      begin
        g.Option:= $11000000 +p-1;
        g.IconID:= GOSSIP_ACTION_GOSSIP;
        g.InputBox:= 0;
        g.Title:= '<previuos page>';

        GOSSIP_TOOL.AddGossip(GOSSIP_MESSAGE, g);
      end;

      for k:= i to i+n-1 do
      begin
        g.Option:= $10000000 + sender.CharData.VR.Values[k];
        g.IconID:= GOSSIP_ACTION_INNKEEPER;
        g.InputBox:= 0;
        g.Title:= Trim(ItemTPL[sender.CharData.VR.Values[k]].Name[0] + ' (' + strr(sender.CharData.VR.Values[k]) + ')');

        GOSSIP_TOOL.AddGossip(GOSSIP_MESSAGE, g);
      end;

      if p < pages then
      begin
        g.Option:= $11000000 +p+1;
        g.IconID:= GOSSIP_ACTION_GOSSIP;
        g.InputBox:= 0;
        g.Title:= '<next page>';

        GOSSIP_TOOL.AddGossip(GOSSIP_MESSAGE, g);
      end;

      sender.SockSend(msgBuild(sender.SBuf, GOSSIP_MESSAGE));
      exit;
    end
    else
    begin
      // create item
      sender.SockSend(msgBuild(sender.SBuf, GOSSIP_COMPLETE));
      ParseCommand(sender, '.i '+strr(imsg.Option and not $10000000));
      exit;
    end;
  end;

  // ---------------------------------------------------------------------------
  if imsg.Option and $20000000 > 0 then
  begin
    // creature
    if imsg.Option and $02000000 > 0 then
    begin
      // nav option
      p:= imsg.Option and not $22000000;
      pages:= (Length(sender.CharData.VR.Values) div GOSSIP_MENU_COUNT) +1;
      if (Length(sender.CharData.VR.Values) mod GOSSIP_MENU_COUNT) = 0 then dec(pages);

      i:= (p-1)*12;
      n:= Length(sender.CharData.VR.Values) -i;
      if n > GOSSIP_MENU_COUNT then n:= GOSSIP_MENU_COUNT;

      GOSSIP_TOOL.Init(GOSSIP_MESSAGE);
      GOSSIP_MESSAGE.GUID:= sender.CharData.Enum.GUID;
      GOSSIP_MESSAGE.NPCTextID:= Length(sender.CharData.VR.Values);

      if p > 1 then
      begin
        g.Option:= $22000000 +p-1;
        g.IconID:= GOSSIP_ACTION_GOSSIP;
        g.InputBox:= 0;
        g.Title:= '<previuos page>';

        GOSSIP_TOOL.AddGossip(GOSSIP_MESSAGE, g);
      end;

      for k:= i to i+n-1 do
      begin
        g.Option:= $20000000 + sender.CharData.VR.Values[k];
        g.IconID:= GOSSIP_ACTION_INNKEEPER;
        g.InputBox:= 0;
        g.Title:= Trim(CreatureTPL[sender.CharData.VR.Values[k]].Name[0] + ' (' + strr(sender.CharData.VR.Values[k]) + ')');

        GOSSIP_TOOL.AddGossip(GOSSIP_MESSAGE, g);
      end;

      if p < pages then
      begin
        g.Option:= $22000000 +p+1;
        g.IconID:= GOSSIP_ACTION_GOSSIP;
        g.InputBox:= 0;
        g.Title:= '<next page>';

        GOSSIP_TOOL.AddGossip(GOSSIP_MESSAGE, g);
      end;

      sender.SockSend(msgBuild(sender.SBuf, GOSSIP_MESSAGE));
      exit;
    end
    else
    begin
      // create creature
      sender.SockSend(msgBuild(sender.SBuf, GOSSIP_COMPLETE));
      ParseCommand(sender, '.u '+strr(imsg.Option and not $20000000));
      exit;
    end;
  end;

  // ---------------------------------------------------------------------------
  if imsg.Option and $40000000 > 0 then
  begin
    // mount
    if imsg.Option and $04000000 > 0 then
    begin
      // nav option
      p:= imsg.Option and not $44000000;
      pages:= (Length(sender.CharData.VR.Values) div GOSSIP_MENU_COUNT) +1;
      if (Length(sender.CharData.VR.Values) mod GOSSIP_MENU_COUNT) = 0 then dec(pages);

      i:= (p-1)*12;
      n:= Length(sender.CharData.VR.Values) -i;
      if n > GOSSIP_MENU_COUNT then n:= GOSSIP_MENU_COUNT;

      GOSSIP_TOOL.Init(GOSSIP_MESSAGE);
      GOSSIP_MESSAGE.GUID:= sender.CharData.Enum.GUID;
      GOSSIP_MESSAGE.NPCTextID:= Length(sender.CharData.VR.Values);

      if p > 1 then
      begin
        g.Option:= $44000000 +p-1;
        g.IconID:= GOSSIP_ACTION_GOSSIP;
        g.InputBox:= 0;
        g.Title:= '<previuos page>';

        GOSSIP_TOOL.AddGossip(GOSSIP_MESSAGE, g);
      end;

      for k:= i to i+n-1 do
      begin
        g.Option:= $40000000 + sender.CharData.VR.Values[k];
        g.IconID:= GOSSIP_ACTION_INNKEEPER;
        g.InputBox:= 0;
        g.Title:= Trim(CreatureTPL[sender.CharData.VR.Values[k]].Name[0] + ' (' + strr(sender.CharData.VR.Values[k]) + ')');

        GOSSIP_TOOL.AddGossip(GOSSIP_MESSAGE, g);
      end;

      if p < pages then
      begin
        g.Option:= $44000000 +p+1;
        g.IconID:= GOSSIP_ACTION_GOSSIP;
        g.InputBox:= 0;
        g.Title:= '<next page>';

        GOSSIP_TOOL.AddGossip(GOSSIP_MESSAGE, g);
      end;

      sender.SockSend(msgBuild(sender.SBuf, GOSSIP_MESSAGE));
      exit;
    end
    else
    begin
      // mount creature
      sender.SockSend(msgBuild(sender.SBuf, GOSSIP_COMPLETE));
      ParseCommand(sender, '.mom '+strr(CreatureTPL[imsg.Option and not $40000000].DisplayID));
      exit;
    end;
  end;

end;

end.
