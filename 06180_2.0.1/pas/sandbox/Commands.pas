unit Commands;

interface

uses
  ClassConnection;

function  ParseCommand(var sender: TWorldUser; msg: String): boolean;

implementation

uses
  Logs, Convert,
  Struct, Defines,
  TMSGStruct, TMSGBuilder,
  UpdateFields,
  NetMessages,
  Responses,
  UpdatePacket,
  ClassWorld,
  PacketBuilding,
  SysUtils, Classes;

function GetWord(ST: String; RT: String; NT: byte): string;
var
  sw, s: string;
  wordList: TStringList;
begin
  Result:= '';
  if st = '' then exit;

  wordList:= TStringList.Create;
  if Length(st) < Length(RT) then
    s:= st + rt
  else
    if copy(st,Length(St)-length(RT)+1,Length(RT)) <> RT then
      s:= st + rt
    else
      s:= st;

  while pos(RT, s) > 0 do
    begin
      sw:= Copy(s, 1, pos(rt, s)-1);
      Delete(s, 1, pos(rt, s)+Length(RT)-1);
      WordList.Add(sw);
    end;

  if nt <= WordList.Count
    then result:= WordList.Strings[nt-1];

  WordList.Free;
end;

function cmd_Help(var sender: TWorldUser; p1,p2,p3,p4: string): boolean;
var
  s: string;
begin
  result:= true;

  s:= '';
  s:= s + '[.w]       - Where Am I?'#13;
  s:= s + '[.f]       - Toggle Flight Mode'#13;
  s:= s + '[.s N]     - Set Speed to N'#13;
  s:= s + '[.z N]     - Set Size of Unit to N'#13;
  s:= s + '[.zb]      - Set Size to 1.0f'#13;
  s:= s + '[.m N]     - Morph to model N'#13;
  s:= s + '[.mb]      - Morph back'#13;
  s:= s + '------------'#13;
  s:= s + '[.i N]     - Create Item entry N'#13;
  s:= s + '[.in NAME] - Create Item from list'#13;
  s:= s + '[.u N]     - Create NPC entry N'#13;
  s:= s + '[.un NAME] - Create NPC from list'#13;
  s:= s + '[.d]       - Destroy selected NPC'#13;
  s:= s + '------------'#13;
  s:= s + '[.moe N]   - Mount NPC by entry N'#13;
  s:= s + '[.mom N]   - Mount NPC by model N'#13;
  s:= s + '[.mon NAME] - Mount NPC from list'#13;
  s:= s + '[.dmo]     - Dismount'#13;
  s:= s + '------------'#13;
  s:= s + '[.ho]      - Set selected NPC to Hostile'#13;
  s:= s + '[.fr]      - Set selected NPC to Friend'#13;
  s:= s + '[.go map x y z] - Teleport to (map,x,y,z)'#13;
  s:= s + '[.hgo]     - List of Quick Teleports'#13;

  sender.Send_Message(0, CHAT_MSG_SYSTEM, 0, '', s);
end;
function cmd_HelpGo(var sender: TWorldUser; p1,p2,p3,p4: string): boolean;
var
  s: string;
begin
  result:= true;

  s:='';
  s:= s + '[.human]   - Human Start'#13;
  s:= s + '[.dwarf]   - Dwarf Start'#13;
  s:= s + '[.elf]     - Night Elf Start'#13;
  s:= s + '[.orc]     - Orc Start'#13;
  s:= s + '[.undead]  - Undead Start'#13;
  s:= s + '[.tauren]  - Tauren Start'#13;
  s:= s + '[.dra]     - Draenei Start'#13;
  s:= s + '[.belf]    - Blood Elf Start'#13;
  s:= s + '------------'#13;
  s:= s + '[.gols]    - Goldshire'#13;
  s:= s + '[.storm]   - Stormwind'#13;
  s:= s + '[.iron]    - IronForge'#13;

  sender.Send_Message(0, CHAT_MSG_SYSTEM, 0, '', s);
end;
function cmd_WhereIam(var sender: TWorldUser; p1,p2,p3,p4: string): boolean;
var
  s: string;
begin
  result:= true;

  s:= 'You are in: m='+strr(sender.CharData.Enum.mapID)+', x='+single2str(sender.CharData.Enum.position.x, 2)+', y='+single2str(sender.CharData.Enum.position.y, 2)+', z='+single2str(sender.CharData.Enum.position.z, 2)+'';
  sender.Send_Message(sender.CharData.Enum.GUID, CHAT_MSG_SYSTEM, 0, '', s);
  MainLog('.go '+strr(sender.CharData.Enum.mapID)+' '+single2str(sender.CharData.Enum.position.x,2 )+' '+single2str(sender.CharData.Enum.position.y, 2)+' '+single2str(sender.CharData.Enum.position.z, 2)+'');
end;
function cmd_SetFlightMode(var sender: TWorldUser; p1,p2,p3,p4: string): boolean;
begin
  result:= true;

  if sender.CharData.flight_mode then
  begin
    ListWorldUsers.Send_UpdateFromPlayer_UnsetCanFly(sender.CharData.Enum.GUID);
    sender.Send_Message(sender.CharData.Enum.GUID, CHAT_MSG_SYSTEM, 0, '', 'Flight Mode is OFF');
    sender.CharData.flight_mode:= false;
  end
  else
  begin
    ListWorldUsers.Send_UpdateFromPlayer_SetCanFly(sender.CharData.Enum.GUID);
    sender.Send_Message(sender.CharData.Enum.GUID, CHAT_MSG_SYSTEM, 0, '', 'Flight Mode is ON');
    sender.CharData.flight_mode:= true;
  end;
end;
function cmd_SetSpeed(var sender: TWorldUser; p1,p2,p3,p4: string): boolean;
begin
  result:= true;

  sender.CharData.speed_run:= str2single(p1);
  sender.CharData.speed_swim:= str2single(p1);
  sender.CharData.speed_flight:= str2single(p1);

  ListWorldUsers.Send_UpdateFromPlayer_ForceRunSpeed(sender.CharData.Enum.GUID, sender.CharData.speed_run);
  ListWorldUsers.Send_UpdateFromPlayer_ForceSwimSpeed(sender.CharData.Enum.GUID, sender.CharData.speed_swim);
  ListWorldUsers.Send_UpdateFromPlayer_ForceFlightSpeed(sender.CharData.Enum.GUID, sender.CharData.speed_flight);

  sender.Send_Message(sender.CharData.Enum.GUID, CHAT_MSG_SYSTEM, 0, '', 'Speed sets to '+single2str(str2single(p1), 2));
end;
function cmd_SetScale(var sender: TWorldUser; p1,p2,p3,p4: string): boolean;
var
  OBJ: TWorldRecord;
  VR: CValuesRecord;
begin
  result:= true;

  if (sender.CharData.Selection <> 0) and (World[sender.CharData.Selection].woType = WO_UNIT) then
  begin
    // selected unit
    OBJ:= World[sender.CharData.Selection];

    TWorldUnit(OBJ.woAddr).woScaleX:= str2single(p1);

    VR:= CValuesRecord.Create;
    VR.Add(OBJECT_FIELD_SCALE_X);
    ListWorldUsers.Send_UpdateFromUnit_Values(OBJ, VR);
    VR.Free;
  end
  else
  begin
    // self
    OBJ:= World[sender.CharData.Enum.GUID];

    TWorldUser(OBJ.woAddr).CharData.scale_x:=str2single(p1);

    VR:= CValuesRecord.Create;
    VR.Add(OBJECT_FIELD_SCALE_X);
    sender.Send_UpdateSelf(VR);
    ListWorldUsers.Send_UpdateFromPlayer_Values(OBJ, VR);
    VR.Free;
  end;
end;
function cmd_SetScaleBack(var sender: TWorldUser; p1,p2,p3,p4: string): boolean;
var
  OBJ: TWorldRecord;
  VR: CValuesRecord;
begin
  result:= true;

  if (sender.CharData.Selection <> 0) and (World[sender.CharData.Selection].woType = WO_UNIT) then
  begin
    OBJ:= World[sender.CharData.Selection];

    TWorldUnit(OBJ.woAddr).woScaleX:= 1.0;

    VR:= CValuesRecord.Create;
    VR.Add(OBJECT_FIELD_SCALE_X);
    ListWorldUsers.Send_UpdateFromUnit_Values(OBJ, VR);
    VR.Free;
  end
  else
  begin
    OBJ:= World[sender.CharData.Enum.GUID];

    TWorldUser(OBJ.woAddr).CharData.scale_x:= 1.0;

    VR:= CValuesRecord.Create;
    VR.Add(OBJECT_FIELD_SCALE_X);
    sender.Send_UpdateSelf(VR);
    ListWorldUsers.Send_UpdateFromPlayer_Values(OBJ, VR);
    VR.Free;
  end;
end;
function cmd_SetModel(var sender: TWorldUser; p1,p2,p3,p4: string): boolean;
var
  OBJ: TWorldRecord;
  VR: CValuesRecord;
begin
  result:= true;

  if (sender.CharData.Selection <> 0) and (World[sender.CharData.Selection].woType = WO_UNIT) then
  begin
    OBJ:= World[sender.CharData.Selection];

    TWorldUnit(OBJ.woAddr).unDisplayID:= vall(p1);
    TWorldUnit(OBJ.woAddr).unNativeDisplayID:= vall(p1);

    VR:= CValuesRecord.Create;
    VR.Add(UNIT_FIELD_DISPLAYID);
    VR.Add(UNIT_FIELD_NATIVEDISPLAYID);
    ListWorldUsers.Send_UpdateFromUnit_Values(OBJ, VR);
    VR.Free;
  end
  else
  begin
    OBJ:= World[sender.CharData.Enum.GUID];

    TWorldUser(OBJ.woAddr).CharData.enum_model:= vall(p1);
    TWorldUser(OBJ.woAddr).CharData.native_model:= vall(p1);

    VR:= CValuesRecord.Create;
    VR.Add(UNIT_FIELD_DISPLAYID);
    VR.Add(UNIT_FIELD_NATIVEDISPLAYID);
    sender.Send_UpdateSelf(VR);
    ListWorldUsers.Send_UpdateFromPlayer_Values(OBJ, VR);
    VR.Free;
  end;
end;
function cmd_SetModelBack(var sender: TWorldUser; p1,p2,p3,p4: string): boolean;
var
  OBJ: TWorldRecord;
  VR: CValuesRecord;
begin
  result:= true;

  OBJ:= World[sender.CharData.Enum.GUID];

  TWorldUser(OBJ.woAddr).CharData.enum_model:= TWorldUser(OBJ.woAddr).CharData.enum_model_backup;
  TWorldUser(OBJ.woAddr).CharData.native_model:= TWorldUser(OBJ.woAddr).CharData.enum_model_backup;

  VR:= CValuesRecord.Create;
  VR.Add(UNIT_FIELD_DISPLAYID);
  VR.Add(UNIT_FIELD_NATIVEDISPLAYID);
  sender.Send_UpdateSelf(VR);
  ListWorldUsers.Send_UpdateFromPlayer_Values(OBJ, VR);
  VR.Free;
end;
function cmd_CreateItem(var sender: TWorldUser; p1,p2,p3,p4: string): boolean;
var
  s: string;
  i, islot: longint;
  upkt: Tupkt;
  upkt_buf: array[0..65535] of byte;
  omsg1: T_SMSG_ITEM_PUSH_RESULT;
  omsg2: T_SMSG_INVENTORY_CHANGE_FAILURE;
begin
  result:= true;

  if (vall(p1) < 0) or (vall(p1) > Length(ItemTPL)-1) then
  begin
    s:= 'Item ID is out of range';
    sender.Send_Message(sender.CharData.Enum.GUID, CHAT_MSG_SYSTEM, 0, '', s);
  end
  else
  begin
    if ItemTPL[vall(p1)].Name[0] <> '' then
    begin
      with ItemTPL[vall(p1)] do
      begin
        islot:= 0;
        for i:= InventoryPackSlotStart to InventoryPackSlotStart+InventoryPackSlotsCount do // main bag
          if sender.CharData.inventory_bag[0][i].Entry = 0 then
          begin
            islot:=i;
            break;
          end;

        if islot <> 0 then
        begin
          // add item
          sender.CharData.ItemsAdd($FF, islot, vall(p1), ItemTPL[vall(p1)].MaxStackCount, 0);

          s:= 'Item ID '+p1+' was created with GUID '+int64tohex(sender.CharData.inventory_bag[0][islot].GUID)+' at slot '+strr(islot);
          sender.Send_Message(sender.CharData.Enum.GUID, CHAT_MSG_SYSTEM, 0, '', s);
          s:= ItemTPL[vall(p1)].Name[0]+', model '+strr(ItemTPL[vall(p1)].DisplayInfoID);
          sender.Send_Message(sender.CharData.Enum.GUID, CHAT_MSG_SYSTEM, 0, '', s);

          sender.Send_CreateFromItem(sender.CharData.inventory_bag[0][islot]);

          pkt.InitCmd(sender.SBuf, SMSG_UPDATE_OBJECT);
          pkt.AddLong(sender.SBuf, 1);
          pkt.AddByte(sender.SBuf, 0);
          pkt.AddByte(sender.SBuf, 0);
          pkt.AddGUID(sender.SBuf, sender.CharData.Enum.GUID);

            upkt.Init(PLAYER_END);
            if islot in [0..PLAYER_VISIBLE_ITEMS_COUNT-1] then
              upkt.AddLong( PLAYER_VISIBLE_ITEM_1_0 + islot*(PLAYER_VISIBLE_ITEM_2_0 - PLAYER_VISIBLE_ITEM_1_0), sender.CharData.inventory_bag[0][islot].Entry );
            upkt.AddInt64( PLAYER_FIELD_INV_SLOT_HEAD + islot*2, sender.CharData.inventory_bag[0][islot].GUID );
            upkt.MakeUpdateBlock(@upkt_buf);

          pkt.AddByte(sender.SBuf, upkt.blocks);
          pkt.AddArray(sender.SBuf, @upkt_buf, upkt.data_ofs);
          sender.SockSend(pkt.pktLen);

          omsg1.GUID:= sender.CharData.Enum.GUID;
          omsg1.PushFrom:= ITEM_PUSH_FROM_ITEM;
          omsg1.PushType:= ITEM_PUSH_TYPE_RECEIVE;
          omsg1.PushDisplay:= ITEM_PUSH_DISPLAY_ON;
          omsg1.ItemBag:= $FF; // main pack
          omsg1.ItemSlot:= islot;
          omsg1.ItemEntry:= sender.CharData.inventory_bag[0][i].Entry;
          omsg1.ItemTime:= 0;
          omsg1.ItemSuffix:= 0;
          omsg1.ItemCount:= ItemTPL[vall(p1)].MaxStackCount;
          sender.SockSend(msgBuild(sender.SBuf, omsg1));
        end
        else
        begin
          // inventory full
          omsg2.ResponseCode:= EQUIP_ERR_INVENTORY_FULL;
          omsg2.InventoryItemGUID:= 0;
          omsg2.InventoryGUID:= 0;
          omsg2.Unk:= 0;
          sender.SockSend(msgBuild(sender.SBuf, omsg2));
        end;
      end;
    end
    else
    begin
      s:= 'Item ['+p1+'] not found';
      sender.Send_Message(sender.CharData.Enum.GUID, CHAT_MSG_SYSTEM, 0, '', s);
    end;
  end;
end;
function cmd_CreateItemMenu(var sender: TWorldUser; p1,p2,p3,p4: string): boolean;
var
  i, n: longint;
  GOSSIP_MESSAGE: T_SMSG_GOSSIP_MESSAGE;
  GOSSIP_TOOL: OGOSSIP_TOOL;
  m: GossipMenuRecord;
begin
  result:= true;

  sender.CharData.VR.Init;

  for i:= 0 to Length(ItemTPL)-1 do
    if pos(UpperCase(p1), UpperCase(ItemTPL[i].Name[0])) > 0 then
      sender.CharData.VR.Add(i);

  n:= Length(sender.CharData.VR.Values);
  GOSSIP_TOOL.Init(GOSSIP_MESSAGE);
  GOSSIP_MESSAGE.GUID:= sender.CharData.Enum.GUID;
  GOSSIP_MESSAGE.NPCTextID:= n;

  if n > GOSSIP_MENU_COUNT then
  begin
    for i:= 0 to GOSSIP_MENU_COUNT-1 do
    begin
      m.Option:= $10000000 + sender.CharData.VR.Values[i];
      m.IconID:= GOSSIP_ACTION_INNKEEPER;
      m.InputBox:= 0;
      m.Title:= Trim(ItemTPL[sender.CharData.VR.Values[i]].Name[0] + ' (' + strr(sender.CharData.VR.Values[i]) + ')');

      GOSSIP_TOOL.AddGossip(GOSSIP_MESSAGE, m);
    end;

    m.Option:= $11000000 +2;
    m.IconID:= GOSSIP_ACTION_GOSSIP;
    m.InputBox:= 0;
    m.Title:= '<next page>';

    GOSSIP_TOOL.AddGossip(GOSSIP_MESSAGE, m);
  end
  else
  begin
    for i:= 0 to n-1 do
    begin
      m.Option:= $10000000 + sender.CharData.VR.Values[i];
      m.IconID:= GOSSIP_ACTION_INNKEEPER;
      m.InputBox:= 0;
      m.Title:= Trim(ItemTPL[sender.CharData.VR.Values[i]].Name[0] + ' (' + strr(sender.CharData.VR.Values[i]) + ')');

      GOSSIP_TOOL.AddGossip(GOSSIP_MESSAGE, m);
    end;
  end;

  sender.SockSend(msgBuild(sender.SBuf, GOSSIP_MESSAGE));
end;
function cmd_CreateUnit(var sender: TWorldUser; p1,p2,p3,p4: string): boolean;
var
  OBJ: TWorldRecord;
  s: string;
  woUnit: TWorldUnit;
begin
  result:= true;

  if (vall(p1) < 0) or (vall(p1) > Length(CreatureTPL)-1) then
  begin
    s:= 'Creature ID is out of range';
    sender.Send_Message(sender.CharData.Enum.GUID, CHAT_MSG_SYSTEM, 0, '', s);
  end
  else
  begin
    if CreatureTPL[vall(p1)].Name[0] <> '' then
    begin
      with CreatureTPL[vall(p1)] do
        begin
          woUnit:= TWorldUnit.Create(vall(p1));
          woUnit.woLoc.x:=      sender.CharData.Enum.position.x;
          woUnit.woLoc.y:=      sender.CharData.Enum.position.y;
          woUnit.woLoc.z:=      sender.CharData.Enum.position.z;
          woUnit.woLoc.facing:= sender.CharData.facing;
          woUnit.woLoc.Map:=    sender.CharData.Enum.mapID;
          woUnit.woLoc.Zone:=   sender.CharData.Enum.zoneID;

          OBJ.woType:= WO_UNIT;
          OBJ.woGUID:= woUnit.woGUID;
          OBJ.woMap:= woUnit.woLoc.Map;
          OBJ.woAddr:= woUnit;
          World.Add(OBJ);

          ListWorldUsers.Send_CreateFromUnit(OBJ);

          s:= 'Creature ID '+strr(woUnit.woEntry)+' was created with GUID '+int64tohex(OBJ.woGUID);
          sender.Send_Message(sender.CharData.Enum.GUID, CHAT_MSG_SYSTEM, 0, '', s);
          s:= CreatureTPL[woUnit.woEntry].Name[0]+', model '+strr(CreatureTPL[woUnit.woEntry].DisplayID);
          sender.Send_Message(sender.CharData.Enum.GUID, CHAT_MSG_SYSTEM, 0, '', s);
        end;
    end
    else
    begin
      s:= 'Creature ['+p1+'] not found';
      sender.Send_Message(sender.CharData.Enum.GUID, CHAT_MSG_SYSTEM, 0, '', s);
    end;
  end;
end;
function cmd_CreateUnitMenu(var sender: TWorldUser; p1,p2,p3,p4: string): boolean;
var
  i, n: longint;
  GOSSIP_COMPLETE: T_SMSG_GOSSIP_COMPLETE;
  GOSSIP_MESSAGE: T_SMSG_GOSSIP_MESSAGE;
  GOSSIP_TOOL: OGOSSIP_TOOL;
  m: GossipMenuRecord;
begin
  result:= true;

  sender.SockSend(msgBuild(sender.SBuf, GOSSIP_COMPLETE));

  sender.CharData.VR.Init;

  for i:= 0 to Length(CreatureTPL)-1 do
    if pos(UpperCase(p1), UpperCase(CreatureTPL[i].Name[0])) > 0 then
      sender.CharData.VR.Add(i);

  n:= Length(sender.CharData.VR.Values);
  GOSSIP_TOOL.Init(GOSSIP_MESSAGE);
  GOSSIP_MESSAGE.GUID:= sender.CharData.Enum.GUID;
  GOSSIP_MESSAGE.NPCTextID:= n;

  if n > GOSSIP_MENU_COUNT then
  begin
    for i:= 0 to GOSSIP_MENU_COUNT-1 do
    begin
      m.Option:= $20000000 + sender.CharData.VR.Values[i];
      m.IconID:= GOSSIP_ACTION_INNKEEPER;
      m.InputBox:= 0;
      m.Title:= Trim(CreatureTPL[sender.CharData.VR.Values[i]].Name[0] + ' (' + strr(sender.CharData.VR.Values[i]) + ')');

      GOSSIP_TOOL.AddGossip(GOSSIP_MESSAGE, m);
    end;

    m.Option:= $22000000 +2;
    m.IconID:= GOSSIP_ACTION_GOSSIP;
    m.InputBox:= 0;
    m.Title:= '<next page>';

    GOSSIP_TOOL.AddGossip(GOSSIP_MESSAGE, m);
  end
  else
  begin
    for i:= 0 to n-1 do
    begin
      m.Option:= $20000000 + sender.CharData.VR.Values[i];
      m.IconID:= GOSSIP_ACTION_INNKEEPER;
      m.InputBox:= 0;
      m.Title:= Trim(CreatureTPL[sender.CharData.VR.Values[i]].Name[0] + ' (' + strr(sender.CharData.VR.Values[i]) + ')');

      GOSSIP_TOOL.AddGossip(GOSSIP_MESSAGE, m);
    end;
  end;

  sender.SockSend(msgBuild(sender.SBuf, GOSSIP_MESSAGE));
end;
function cmd_DestroyObject(var sender: TWorldUser; p1,p2,p3,p4: string): boolean;
var
  OBJ: TWorldRecord;
  s: string;
begin
  result:= true;

  if sender.CharData.Selection <> 0 then
  begin
    OBJ:= World.ObjectByGUID[sender.CharData.Selection];

    if (OBJ.woType = WO_UNIT) and (OBJ.woAddr <> nil) then
    begin
      ListWorldUsers.Send_Destroy(OBJ.woGUID);

      TWorldUnit(OBJ.woAddr).Free;
      World.Del(OBJ);

      s:= 'Creature destroyed with GUID '+int64tohex(OBJ.woGUID);
      sender.Send_Message(sender.CharData.Enum.GUID, CHAT_MSG_SYSTEM, 0, '', s);

    end
    else
    begin
      s:= 'Can''t delete Object '+int64tohex(sender.CharData.Selection);
      sender.Send_Message(sender.CharData.Enum.GUID, CHAT_MSG_SYSTEM, 0, '', s);
    end;
  end;
end;
function cmd_MountByCreature(var sender: TWorldUser; p1,p2,p3,p4: string): boolean;
var
  s: string;
begin
  result:= true;

  if (vall(p1) < 0) or (vall(p1) > Length(CreatureTPL)-1) then
  begin
    s:= 'Creature ID is out of range';
    sender.Send_Message(sender.CharData.Enum.GUID, CHAT_MSG_SYSTEM, 0, '', s);
  end
  else
    if CreatureTPL[vall(p1)].Name[0] <> '' then
      ParseCommand(sender, '.mom '+strr(CreatureTPL[vall(p1)].DisplayID));
end;
function cmd_MountByModel(var sender: TWorldUser; p1,p2,p3,p4: string): boolean;
var
  OBJ: TWorldRecord;
  VR: CValuesRecord;
begin
  result:= true;

  OBJ:= World[sender.CharData.Enum.GUID];

  TWorldUser(OBJ.woAddr).CharData.mount_model:= vall(p1);

  VR:= CValuesRecord.Create;
  VR.Add(UNIT_FIELD_MOUNTDISPLAYID);
  sender.Send_UpdateSelf(VR);
  ListWorldUsers.Send_UpdateFromPlayer_Values(OBJ, VR);
  VR.Free;

  ParseCommand(sender, '.s 16');
end;
function cmd_MountMenu(var sender: TWorldUser; p1,p2,p3,p4: string): boolean;
var
  i, n: longint;
  GOSSIP_COMPLETE: T_SMSG_GOSSIP_COMPLETE;
  GOSSIP_MESSAGE: T_SMSG_GOSSIP_MESSAGE;
  GOSSIP_TOOL: OGOSSIP_TOOL;
  m: GossipMenuRecord;
begin
  result:= true;

  sender.SockSend(msgBuild(sender.SBuf, GOSSIP_COMPLETE));

  sender.CharData.VR.Init;

  for i:= 0 to Length(CreatureTPL)-1 do
    if pos(UpperCase(p1), UpperCase(CreatureTPL[i].Name[0])) > 0 then
      sender.CharData.VR.Add(i);

  n:= Length(sender.CharData.VR.Values);
  GOSSIP_TOOL.Init(GOSSIP_MESSAGE);
  GOSSIP_MESSAGE.GUID:= sender.CharData.Enum.GUID;
  GOSSIP_MESSAGE.NPCTextID:= n;

  if n > GOSSIP_MENU_COUNT then
  begin
    for i:= 0 to GOSSIP_MENU_COUNT-1 do
    begin
      m.Option:= $40000000 + sender.CharData.VR.Values[i];
      m.IconID:= GOSSIP_ACTION_INNKEEPER;
      m.InputBox:= 0;
      m.Title:= Trim(CreatureTPL[sender.CharData.VR.Values[i]].Name[0] + ' (' + strr(sender.CharData.VR.Values[i]) + ')');

      GOSSIP_TOOL.AddGossip(GOSSIP_MESSAGE, m);
    end;

    m.Option:= $44000000 +2;
    m.IconID:= GOSSIP_ACTION_GOSSIP;
    m.InputBox:= 0;
    m.Title:= '<next page>';

    GOSSIP_TOOL.AddGossip(GOSSIP_MESSAGE, m);
  end
  else
  begin
    for i:= 0 to n-1 do
    begin
      m.Option:= $40000000 + sender.CharData.VR.Values[i];
      m.IconID:= GOSSIP_ACTION_INNKEEPER;
      m.InputBox:= 0;
      m.Title:= Trim(CreatureTPL[sender.CharData.VR.Values[i]].Name[0] + ' (' + strr(sender.CharData.VR.Values[i]) + ')');

      GOSSIP_TOOL.AddGossip(GOSSIP_MESSAGE, m);
    end;
  end;

  sender.SockSend(msgBuild(sender.SBuf, GOSSIP_MESSAGE));
end;
function cmd_DisMount(var sender: TWorldUser; p1,p2,p3,p4: string): boolean;
var
  OBJ: TWorldRecord;
  VR: CValuesRecord;
begin
  result:= true;

  OBJ:= World[sender.CharData.Enum.GUID];

  TWorldUser(OBJ.woAddr).CharData.mount_model:= 0;

  VR:= CValuesRecord.Create;
  VR.Add(UNIT_FIELD_MOUNTDISPLAYID);
  sender.Send_UpdateSelf(VR);
  ListWorldUsers.Send_UpdateFromPlayer_Values(OBJ, VR);
  VR.Free;

  ParseCommand(sender, '.s 7');
end;
function cmd_MakeUnitAsHostile(var sender: TWorldUser; p1,p2,p3,p4: string): boolean;
var
  OBJ: TWorldRecord;
  VR: CValuesRecord;
begin
  result:= true;

  if (sender.CharData.Selection <> 0) and (World[sender.CharData.Selection].woType = WO_UNIT) then
  begin
    OBJ:= World[sender.CharData.Selection];

    TWorldUnit(OBJ.woAddr).unFactionTemplate:= 21;

    VR:= CValuesRecord.Create;
    VR.Init;
    VR.Add(UNIT_FIELD_FACTIONTEMPLATE);
    ListWorldUsers.Send_UpdateFromUnit_Values(OBJ, VR);
    VR.Free;
  end;
end;
function cmd_MakeUnitAsFriend(var sender: TWorldUser; p1,p2,p3,p4: string): boolean;
var
  OBJ: TWorldRecord;
  VR: CValuesRecord;
begin
  result:= true;

  if (sender.CharData.Selection <> 0) and (World[sender.CharData.Selection].woType = WO_UNIT) then
  begin
    OBJ:= World[sender.CharData.Selection];

    TWorldUnit(OBJ.woAddr).unFactionTemplate:= 35;

    VR:= CValuesRecord.Create;
    VR.Init;
    VR.Add(UNIT_FIELD_FACTIONTEMPLATE);
    ListWorldUsers.Send_UpdateFromUnit_Values(OBJ, VR);
    VR.Free;
  end;
end;

function cmd_WorldObjectList(var sender: TWorldUser; p1,p2,p3,p4: string): boolean;
var
  i: longint;
  s: string;
begin
  result:= true;

  s:= strr(World.Count)+' object in Worlds:'#13;
  for i:= 0 to World.Count-1 do
    s:= s + '  '+strr(i)+': map='+strr(World.ObjectByIndex[i].woMap)+', type='+strr(World.ObjectByIndex[i].woType)+', GUID='+int64tohex(World.ObjectByIndex[i].woGUID)+#13;

  sender.Send_Message(0, CHAT_MSG_SYSTEM, 0, '', s);
end;
function cmd_DoTrigger(var sender: TWorldUser; p1,p2,p3,p4: string): boolean;
var
  s: string;
begin
  result:= true;

  if (vall(p1) < 0) or (vall(p1) > Length(AreaTriggerDBC)-1) then
  begin
    s:= 'AreaTrigger ID is out of range';
    sender.Send_Message(sender.CharData.Enum.GUID, CHAT_MSG_SYSTEM, 0, '', s);
  end
  else
  begin
    s:= 'Go to AreaTrigger ['+p1+']';
    sender.Send_Message(sender.CharData.Enum.GUID, CHAT_MSG_SYSTEM, 0, '', s);
    if AreaTriggerDBC[vall(p1)].trigger_posx <> 0.0 then
    begin
      with AreaTriggerDBC[vall(p1)] do
        sender.Teleport(trigger_continent_id, 0, trigger_posx, trigger_posy, trigger_posz, 0.0);
    end
    else
    begin
      s:= 'AreaTrigger ['+p1+'] not found';
      sender.Send_Message(sender.CharData.Enum.GUID, CHAT_MSG_SYSTEM, 0, '', s);
    end;
  end;
end;
function cmd_Test_ShapeShift(var sender: TWorldUser; p1,p2,p3,p4: string): boolean;
var
  OBJ: TWorldRecord;
  VR: CValuesRecord;
begin
  result:= true;

  OBJ:= World[sender.CharData.Enum.GUID];

  TWorldUser(OBJ.woAddr).CharData.stealth_visual_effect:= vall(p1);
  TWorldUser(OBJ.woAddr).CharData.shape_shift_form:= vall(p2);
  TWorldUser(OBJ.woAddr).CharData.shape_shift_stand:= vall(p3);

  VR:= CValuesRecord.Create;
  VR.Add(UNIT_FIELD_BYTES_1);
  sender.Send_UpdateSelf(VR);
  ListWorldUsers.Send_UpdateFromPlayer_Values(OBJ, VR);
  VR.Free;
end;

function ParseCommand(var sender: TWorldUser; msg: String): boolean;
var
  command, p1,p2,p3,p4: string;
begin
  result:= false;

  if msg = '' then exit;

  if msg[1] = '.' then
  begin
    command:= AnsiLowerCase(GetWord(msg,' ',1));
    p1:= GetWord(msg,' ',2);
    p2:= GetWord(msg,' ',3);
    p3:= GetWord(msg,' ',4);
    p4:= GetWord(msg,' ',5);

    if command='.h' then result:=     cmd_Help(              sender, p1,p2,p3,p4);
    if command='.hgo' then result:=   cmd_HelpGo(            sender, p1,p2,p3,p4);

    if command='.w' then result:=     cmd_WhereIam(          sender, p1,p2,p3,p4);
    if command='.f' then result:=     cmd_SetFlightMode(     sender, p1,p2,p3,p4);
    if command='.s' then result:=     cmd_SetSpeed(          sender, p1,p2,p3,p4);
    if command='.z' then result:=     cmd_SetScale(          sender, p1,p2,p3,p4);
    if command='.zb' then result:=    cmd_SetScaleBack(      sender, p1,p2,p3,p4);
    if command='.m' then result:=     cmd_SetModel(          sender, p1,p2,p3,p4);
    if command='.mb' then result:=    cmd_SetModelBack(      sender, p1,p2,p3,p4);
    if command='.i' then result:=     cmd_CreateItem(        sender, p1,p2,p3,p4);
    if command='.in' then result:=    cmd_CreateItemMenu(    sender, p1,p2,p3,p4);
    if command='.u' then result:=     cmd_CreateUnit(        sender, p1,p2,p3,p4);
    if command='.un' then result:=    cmd_CreateUnitMenu(    sender, p1,p2,p3,p4);
    if command='.d' then result:=     cmd_DestroyObject(     sender, p1,p2,p3,p4);
    if command='.moe' then result:=   cmd_MountByCreature(   sender, p1,p2,p3,p4);
    if command='.mom' then result:=   cmd_MountByModel(      sender, p1,p2,p3,p4);
    if command='.mon' then result:=   cmd_MountMenu(         sender, p1,p2,p3,p4);
    if command='.dmo' then result:=   cmd_DisMount(          sender, p1,p2,p3,p4);
    if command='.ho' then result:=    cmd_MakeUnitAsHostile( sender, p1,p2,p3,p4);
    if command='.fr' then result:=    cmd_MakeUnitAsFriend(  sender, p1,p2,p3,p4);

    if command='.wo' then result:=    cmd_WorldObjectList(   sender, p1,p2,p3,p4);
    if command='.t' then result:=     cmd_DoTrigger(         sender, p1,p2,p3,p4);
    if command='.ss' then result:=    cmd_Test_ShapeShift(   sender, p1,p2,p3,p4);

    if command='.go' then      begin result:=true; sender.Teleport(vall(p1), 0, str2single(p2), str2single(p3), str2single(p4), 0.0); end;

    if command='.human' then   begin result:=true; sender.Teleport( 0,   12,   -8949.950195, -132.492996,   83.531197,   0.0); end;
    if command='.dwarf' then   begin result:=true; sender.Teleport( 0,   01,   -6240.319824, 331.032990,    382.757996,  0.0); end;
    if command='.elf' then     begin result:=true; sender.Teleport( 1,   141,  10311.299805, 831.463013,    1326.410034, 0.0); end;
    if command='.orc' then     begin result:=true; sender.Teleport( 1,   14,   -618.518005,  -4251.669922,  38.717999,   0.0); end;
    if command='.undead' then  begin result:=true; sender.Teleport( 0,   85,   1676.349976,  1677.449951,   121.669998,  2.705260); end;
    if command='.tauren' then  begin result:=true; sender.Teleport( 1,   215,  -2917.580078, -257.980011,   52.996799,   0.0); end;

    if command='.dra' then
    begin
      p1:= 'Drainei location is still not active in this build';
      sender.Send_Message(sender.CharData.Enum.GUID, CHAT_MSG_SYSTEM, 0, '', p1);
//      result:=true; sender.Teleport( 530, 3524, -3961.639893, -13931.200195, 100.614998,  2.083644);
    end;

    if command='.belf' then
    begin
      p1:= 'BloodElf location is still not active in this build';
      sender.Send_Message(sender.CharData.Enum.GUID, CHAT_MSG_SYSTEM, 0, '', p1);
//      result:=true; sender.Teleport( 530, 3430, 10349.599609, -6357.290039,  33.402599,   5.316046);
    end;

    if command='.golds' then   begin result:=true; sender.Teleport( 0, 12, -9457.468750, 54.702946, 56.208504, 2.192810); end;  // .go 0 -9457 54 57
    if command='.storm' then   begin result:=true; sender.Teleport( 0, 12, -9125.579102, 396.515106, 91.941780, 0.612589); end;
    if command='.iron' then    begin result:=true; sender.Teleport( 0, 1, -5049.721191, -778.815369, 494.001740, 5.106645); end;
  end;
end;

end.
