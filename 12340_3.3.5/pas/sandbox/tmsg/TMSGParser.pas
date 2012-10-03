unit TMSGParser;

interface

uses
  TMSGStruct,
  ClassConnection;

const
  msg_CLIENT_HEADER_LEN = 6;
  msg_SERVER_HEADER_LEN = 4;
  msg_PARSE_ERROR   = 2;
  msg_PARSE_WARNING = 1;
  msg_PARSE_OK      = 0;

  ParseResultStr: array[0..2] of string = (
    'OK',
    'WARNING',
    'ERROR'
  );
            
function msgParse(var buf: TBuffer; var m: T_CMSG_AUTH_SESSION): longint; overload;
function msgParse(var buf: TBuffer; var m: T_CLIENT_ADDON_INFO): longint; overload;
function msgParse(var buf: TBuffer; var m: T_CMSG_CHAR_CREATE): longint; overload;
function msgParse(var buf: TBuffer; var m: T_CMSG_CHAR_DELETE): longint; overload;
function msgParse(var buf: TBuffer; var m: T_CMSG_PING): longint; overload;
function msgParse(var buf: TBuffer; var m: T_CMSG_ITEM_QUERY_SINGLE): longint; overload;
function msgParse(var buf: TBuffer; var m: T_CMSG_CREATURE_QUERY): longint; overload;
function msgParse(var buf: TBuffer; var m: T_CMSG_GAMEOBJECT_QUERY): longint; overload;
function msgParse(var buf: TBuffer; var m: T_CMSG_NPC_TEXT_QUERY): longint; overload;
function msgParse(var buf: TBuffer; var m: T_CMSG_PLAYER_LOGIN): longint; overload;
function msgParse(var buf: TBuffer; var m: T_CMSG_JOIN_CHANNEL): longint; overload;
function msgParse(var buf: TBuffer; var m: T_CMSG_MESSAGECHAT): longint; overload;
function msgParse(var buf: TBuffer; var m: T_CMSG_DESTROYITEM): longint; overload;
function msgParse(var buf: TBuffer; var m: T_CMSG_REQUEST_ACCOUNT_DATA): longint; overload;
function msgParse(var buf: TBuffer; var m: T_CMSG_UPDATE_ACCOUNT_DATA): longint; overload;
function msgParse(var buf: TBuffer; var m: T_CMSG_NAME_QUERY): longint; overload;
function msgParse(var buf: TBuffer; var m: T_CMSG_SET_SELECTION): longint; overload;
function msgParse(var buf: TBuffer; var m: T_MSG_MOVE_STATE): longint; overload;
function msgParse(var buf: TBuffer; var m: T_CMSG_AREATRIGGER): longint; overload;
function msgParse(var buf: TBuffer; var m: T_CMSG_SWAP_INV_ITEM): longint; overload;
function msgParse(var buf: TBuffer; var m: T_CMSG_AUTOEQUIP_ITEM): longint; overload;
function msgParse(var buf: TBuffer; var m: T_CMSG_QUESTGIVER_STATUS_QUERY): longint; overload;
function msgParse(var buf: TBuffer; var m: T_CMSG_QUESTGIVER_HELLO): longint; overload;
function msgParse(var buf: TBuffer; var m: T_CMSG_STANDSTATECHANGE): longint; overload;
function msgParse(var buf: TBuffer; var m: T_CMSG_SETSHEATHED): longint; overload;
function msgParse(var buf: TBuffer; var m: T_CMSG_CAST_SPELL): longint; overload;
function msgParse(var buf: TBuffer; var m: T_CMSG_GOSSIP_SELECT_OPTION): longint; overload;
function msgParse(var buf: TBuffer; var m: T_CMSG_ZONEUPDATE): longint; overload;

implementation

uses
  Defines,
  UpdateFields,
  TMSGBufGets;

var
  ofs: longint;

function msgParse(var buf: TBuffer; var m: T_CMSG_AUTH_SESSION): longint; overload;
begin
  result:= msg_PARSE_OK;
  try
    ofs:= msg_CLIENT_HEADER_LEN;
    m.Build:=                GetBufLong(buf, ofs);
    m.ServerID:=             GetBufLong(buf, ofs);
    m.Login:=                GetBufStr(buf, ofs);
    m.Unk2:=                 GetBufLong(buf, ofs);
    m.ClientSeed:=           GetBufLong(buf, ofs);
    m.Unk5:=                 GetBufLong(buf, ofs);
    m.Unk6:=                 GetBufLong(buf, ofs);
    m.Unk7:=                 GetBufLong(buf, ofs);
    m.Unk3:=                 GetBufLong(buf, ofs);
    m.Unk4:=                 GetBufLong(buf, ofs);
    GetBufArray(buf, ofs, @m.Digest, 20);
    m.ZipLen:=               GetBufLong(buf, ofs);
    GetBufArray(buf, ofs, @m.ZipData, abs(GetBufPktLen(buf) - ofs));

    if GetBufPktLen(buf) <> ofs then result:= msg_PARSE_WARNING;
  except
    result:= msg_PARSE_ERROR;
  end;
end;
function msgParse(var buf: TBuffer; var m: T_CLIENT_ADDON_INFO): longint; overload;
var
  i: longint;
begin
  result:= msg_PARSE_OK;
  try
    ofs:= msg_CLIENT_HEADER_LEN;
    m.Count:=               GetBufLong(buf, ofs);
    SetLength(m.Info, m.Count);
    for i:= 0 to m.Count-1 do
    begin
      m.Info[i].Name:=      GetBufStr(buf, ofs);
      m.Info[i].Enabled:=   GetBufByte(buf, ofs);
      m.Info[i].CRC:=       GetBufLong(buf, ofs);
      m.Info[i].Unk:=       GetBufLong(buf, ofs);
    end;
    m.CRC:=                 GetBufLong(buf, ofs);

    if GetBufPktLen(buf) <> ofs then result:= msg_PARSE_WARNING;
  except
    result:= msg_PARSE_ERROR;
  end;
end;
function msgParse(var buf: TBuffer; var m: T_CMSG_CHAR_CREATE): longint; overload;
begin
  result:= msg_PARSE_OK;
  try
    ofs:= msg_CLIENT_HEADER_LEN;
    m.name:=                 GetBufStr(buf, ofs);
    m.raceID:=               GetBufByte(buf, ofs);
    m.classID:=              GetBufByte(buf, ofs);
    m.sexID:=                GetBufByte(buf, ofs);
    m.skinID:=               GetBufByte(buf, ofs);
    m.faceID:=               GetBufByte(buf, ofs);
    m.hairStyleID:=          GetBufByte(buf, ofs);
    m.hairColorID:=          GetBufByte(buf, ofs);
    m.facialHairStyleID:=    GetBufByte(buf, ofs);
    m.outfitID:=             GetBufByte(buf, ofs);

    if GetBufPktLen(buf) <> ofs then result:= msg_PARSE_WARNING;
  except
    result:= msg_PARSE_ERROR;
  end;
end;
function msgParse(var buf: TBuffer; var m: T_CMSG_CHAR_DELETE): longint; overload;
begin
  result:= msg_PARSE_OK;
  try
    ofs:= msg_CLIENT_HEADER_LEN;
    m.CharGUID:= GetBufInt64(buf, ofs);

    if GetBufPktLen(buf) <> ofs then result:= msg_PARSE_WARNING;
  except
    result:= msg_PARSE_ERROR;
  end;
end;
function msgParse(var buf: TBuffer; var m: T_CMSG_PING): longint; overload;
begin
  result:= msg_PARSE_OK;
  try
    ofs:= msg_CLIENT_HEADER_LEN;
    m.Count:= GetBufLong(buf, ofs);
    m.Ping:= GetBufLong(buf, ofs);

    if GetBufPktLen(buf) <> ofs then result:= msg_PARSE_WARNING;
  except
    result:= msg_PARSE_ERROR;
  end;
end;
function msgParse(var buf: TBuffer; var m: T_CMSG_ITEM_QUERY_SINGLE): longint; overload;
begin
  result:= msg_PARSE_OK;
  try
    ofs:= msg_CLIENT_HEADER_LEN;
    m.Entry:= GetBufLong(buf, ofs);

    if GetBufPktLen(buf) <> ofs then result:= msg_PARSE_WARNING;
  except
    result:= msg_PARSE_ERROR;
  end;
end;
function msgParse(var buf: TBuffer; var m: T_CMSG_CREATURE_QUERY): longint; overload;
begin
  result:= msg_PARSE_OK;
  try
    ofs:= msg_CLIENT_HEADER_LEN;
    m.Entry:= GetBufLong(buf, ofs);
    m.GUID:= GetBufInt64(buf, ofs);

    if GetBufPktLen(buf) <> ofs then result:= msg_PARSE_WARNING;
  except
    result:= msg_PARSE_ERROR;
  end;
end;
function msgParse(var buf: TBuffer; var m: T_CMSG_GAMEOBJECT_QUERY): longint; overload;
begin
  result:= msg_PARSE_OK;
  try
    ofs:= msg_CLIENT_HEADER_LEN;
    m.Entry:= GetBufLong(buf, ofs);
    m.GUID:= GetBufInt64(buf, ofs);

    if GetBufPktLen(buf) <> ofs then result:= msg_PARSE_WARNING;
  except
    result:= msg_PARSE_ERROR;
  end;
end;
function msgParse(var buf: TBuffer; var m: T_CMSG_NPC_TEXT_QUERY): longint; overload;
begin
  result:= msg_PARSE_OK;
  try
    ofs:= msg_CLIENT_HEADER_LEN;
    m.Entry:= GetBufLong(buf, ofs);
    m.GUID:= GetBufInt64(buf, ofs);

    if GetBufPktLen(buf) <> ofs then result:= msg_PARSE_WARNING;
  except
    result:= msg_PARSE_ERROR;
  end;
end;
function msgParse(var buf: TBuffer; var m: T_CMSG_PLAYER_LOGIN): longint; overload;
begin
  result:= msg_PARSE_OK;
  try
    ofs:= msg_CLIENT_HEADER_LEN;
    m.GUID:= GetBufInt64(buf, ofs);

    if GetBufPktLen(buf) <> ofs then result:= msg_PARSE_WARNING;
  except
    result:= msg_PARSE_ERROR;
  end;
end;
function msgParse(var buf: TBuffer; var m: T_CMSG_JOIN_CHANNEL): longint; overload;
begin
  result:= msg_PARSE_OK;
  try
    ofs:= msg_CLIENT_HEADER_LEN;
    m.CategoryID:= GetBufLong(buf, ofs);
    m.TypeID:= GetBufByte(buf, ofs);
    m.VoiceEnabled:= GetBufByte(buf, ofs);
    m.Name:= GetBufStr(buf, ofs);
    m.VoiceName:= GetBufStr(buf, ofs);

    if GetBufPktLen(buf) <> ofs then result:= msg_PARSE_WARNING;
  except
    result:= msg_PARSE_ERROR;
  end;
end;
function msgParse(var buf: TBuffer; var m: T_CMSG_MESSAGECHAT): longint; overload;
begin
  result:= msg_PARSE_OK;
  try
    ofs:= msg_CLIENT_HEADER_LEN;
    m.TypeID:= GetBufLong(buf, ofs);
    m.LangID:= GetBufLong(buf, ofs);
    if m.TypeID in [CHAT_MSG_WHISPER, CHAT_MSG_CHANNEL] then
      m.ChannelName:= GetBufStr(buf, ofs)
    else
      m.ChannelName:= '';
    m.Text:= GetBufStr(buf, ofs);

    if GetBufPktLen(buf) <> ofs then result:= msg_PARSE_WARNING;
  except
    result:= msg_PARSE_ERROR;
  end;
end;
function msgParse(var buf: TBuffer; var m: T_CMSG_DESTROYITEM): longint; overload;
begin
  result:= msg_PARSE_OK;
  try
    ofs:= msg_CLIENT_HEADER_LEN;
    m.Bag:= GetBufByte(buf, ofs);
    m.Slot:= GetBufByte(buf, ofs);
    m.Count:= GetBufLong(buf, ofs);

    if GetBufPktLen(buf) <> ofs then result:= msg_PARSE_WARNING;
  except
    result:= msg_PARSE_ERROR;
  end;
end;
function msgParse(var buf: TBuffer; var m: T_CMSG_REQUEST_ACCOUNT_DATA): longint; overload;
begin
  result:= msg_PARSE_OK;
  try
    ofs:= msg_CLIENT_HEADER_LEN;
    m.AccountData_Type:= GetBufLong(buf, ofs);
    m.AccountData_UnixDateTime:= GetBufLong(buf, ofs);
    m.zipLen:= GetBufLong(buf, ofs);
    GetBufArray(buf, ofs, @m.zipData, abs(GetBufPktLen(buf) - ofs));

    if GetBufPktLen(buf) <> ofs then result:= msg_PARSE_WARNING;
  except
    result:= msg_PARSE_ERROR;
  end;
end;
function msgParse(var buf: TBuffer; var m: T_CMSG_UPDATE_ACCOUNT_DATA): longint; overload;
begin
  result:= msg_PARSE_OK;
  try
    ofs:= msg_CLIENT_HEADER_LEN;
    m.AccountData_Type:= GetBufLong(buf, ofs);
    m.AccountData_UnixDateTime:= GetBufLong(buf, ofs);
    m.zipLen:= GetBufLong(buf, ofs);
    GetBufArray(buf, ofs, @m.zipData, abs(GetBufPktLen(buf) - ofs));

    if GetBufPktLen(buf) <> ofs then result:= msg_PARSE_WARNING;
  except
    result:= msg_PARSE_ERROR;
  end;
end;
function msgParse(var buf: TBuffer; var m: T_CMSG_NAME_QUERY): longint; overload;
begin
  result:= msg_PARSE_OK;
  try
    ofs:= msg_CLIENT_HEADER_LEN;
    m.GUID:= GetBufInt64(buf, ofs);

    if GetBufPktLen(buf) <> ofs then result:= msg_PARSE_WARNING;
  except
    result:= msg_PARSE_ERROR;
  end;
end;
function msgParse(var buf: TBuffer; var m: T_CMSG_SET_SELECTION): longint; overload;
begin
  result:= msg_PARSE_OK;
  try
    ofs:= msg_CLIENT_HEADER_LEN;

    m.GUID:= GetBufInt64(buf, ofs);

    if GetBufPktLen(buf) <> ofs then result:= msg_PARSE_WARNING;
  except
    result:= msg_PARSE_ERROR;
  end;
end;

procedure GetMovementInfo(var buf: TBuffer; var __ofs: longint; var m: T_MSG_MOVE_STATE);
begin
  GetBufGUID(buf, __ofs);
  m.MovementInfo.m_moveFlags:= GetBufLong(buf, __ofs);
  m.MovementInfo.m_moveFlags2:= GetBufWord(buf, __ofs);
  m.MovementInfo.m_moveStartTime:= GetBufLong(buf, __ofs);
  m.MovementInfo.m_position.x:= GetBufSingle(buf, __ofs);
  m.MovementInfo.m_position.y:= GetBufSingle(buf, __ofs);
  m.MovementInfo.m_position.z:= GetBufSingle(buf, __ofs);
  m.MovementInfo.m_facing:= GetBufSingle(buf, __ofs);
  if (m.MovementInfo.m_moveFlags and MOVEFLAG_ON_TRANSPORT) > 0 then
  begin
    m.MovementInfo.Transport.GUID:= GetBufInt64(buf, __ofs);
    m.MovementInfo.Transport.Position.x:= GetBufSingle(buf, __ofs);
    m.MovementInfo.Transport.Position.y:= GetBufSingle(buf, __ofs);
    m.MovementInfo.Transport.Position.z:= GetBufSingle(buf, __ofs);
    m.MovementInfo.Transport.Facing:= GetBufSingle(buf, __ofs);
    m.MovementInfo.Transport.Timestamp:= GetBufLong(buf, __ofs);
  end;
  if ( (m.MovementInfo.m_moveFlags and MOVEFLAG_SWIMMING) > 0) or ( (m.MovementInfo.m_moveFlags and MOVEFLAG_FLYING) > 0) then
  begin
    m.MovementInfo.m_pitch:= GetBufSingle(buf, __ofs);
  end;
  m.MovementInfo.m_fallenTime:= GetBufLong(buf, __ofs);
  if (m.MovementInfo.m_moveFlags and MOVEFLAG_FALLING) > 0 then
  begin
    m.MovementInfo.m_jumpVelocity:= GetBufSingle(buf, __ofs);
    m.MovementInfo.m_cosAnchorPitch:= GetBufSingle(buf, __ofs);
    m.MovementInfo.m_sinAnchorPitch:= GetBufSingle(buf, __ofs);
    m.MovementInfo.m_currentSpeed:= GetBufSingle(buf, __ofs);
  end;
  if (m.MovementInfo.m_moveFlags and MOVEFLAG_FALL_START_ELEVATION) > 0 then
  begin
    m.MovementInfo.m_fallStartElevation:= GetBufSingle(buf, __ofs);
  end;
end;
function msgParse(var buf: TBuffer; var m: T_MSG_MOVE_STATE): longint; overload;
begin
  result:= msg_PARSE_OK;
  try
    ofs:= 2;

    m.MovementInfo.m_lastNetMsgID:= GetBufLong(buf, ofs);
    GetMovementInfo(buf, ofs, m);

    if GetBufPktLen(buf) <> ofs then result:= msg_PARSE_WARNING;
  except
    result:= msg_PARSE_ERROR;
  end;
end;

function msgParse(var buf: TBuffer; var m: T_CMSG_AREATRIGGER): longint; overload;
begin
  result:= msg_PARSE_OK;
  try
    ofs:= msg_CLIENT_HEADER_LEN;

    m.TriggerID:= GetBufLong(buf, ofs);

    if GetBufPktLen(buf) <> ofs then result:= msg_PARSE_WARNING;
  except
    result:= msg_PARSE_ERROR;
  end;
end;
function msgParse(var buf: TBuffer; var m: T_CMSG_SWAP_INV_ITEM): longint; overload;
begin
  result:= msg_PARSE_OK;
  try
    ofs:= msg_CLIENT_HEADER_LEN;

    m.DstSlot:= GetBufByte(buf, ofs);
    m.SrcSlot:= GetBufByte(buf, ofs);

    if GetBufPktLen(buf) <> ofs then result:= msg_PARSE_WARNING;
  except
    result:= msg_PARSE_ERROR;
  end;
end;
function msgParse(var buf: TBuffer; var m: T_CMSG_AUTOEQUIP_ITEM): longint; overload;
begin
  result:= msg_PARSE_OK;
  try
    ofs:= msg_CLIENT_HEADER_LEN;

    m.Bag:= GetBufByte(buf, ofs);
    m.Slot:= GetBufByte(buf, ofs);

    if GetBufPktLen(buf) <> ofs then result:= msg_PARSE_WARNING;
  except
    result:= msg_PARSE_ERROR;
  end;
end;
function msgParse(var buf: TBuffer; var m: T_CMSG_QUESTGIVER_STATUS_QUERY): longint; overload;
begin
  result:= msg_PARSE_OK;
  try
    ofs:= msg_CLIENT_HEADER_LEN;

    m.GUID:= GetBufInt64(buf, ofs);

    if GetBufPktLen(buf) <> ofs then result:= msg_PARSE_WARNING;
  except
    result:= msg_PARSE_ERROR;
  end;
end;
function msgParse(var buf: TBuffer; var m: T_CMSG_QUESTGIVER_HELLO): longint; overload;
begin
  result:= msg_PARSE_OK;
  try
    ofs:= msg_CLIENT_HEADER_LEN;

    m.GUID:= GetBufInt64(buf, ofs);

    if GetBufPktLen(buf) <> ofs then result:= msg_PARSE_WARNING;
  except
    result:= msg_PARSE_ERROR;
  end;
end;
function msgParse(var buf: TBuffer; var m: T_CMSG_STANDSTATECHANGE): longint; overload;
begin
  result:= msg_PARSE_OK;
  try
    ofs:= msg_CLIENT_HEADER_LEN;

    m.StandStateID:= GetBufLong(buf, ofs);

    if GetBufPktLen(buf) <> ofs then result:= msg_PARSE_WARNING;
  except
    result:= msg_PARSE_ERROR;
  end;
end;
function msgParse(var buf: TBuffer; var m: T_CMSG_SETSHEATHED): longint; overload;
begin
  result:= msg_PARSE_OK;
  try
    ofs:= msg_CLIENT_HEADER_LEN;

    m.SheathedID:= GetBufLong(buf, ofs);

    if GetBufPktLen(buf) <> ofs then result:= msg_PARSE_WARNING;
  except
    result:= msg_PARSE_ERROR;
  end;
end;
function msgParse(var buf: TBuffer; var m: T_CMSG_CAST_SPELL): longint; overload;
var
  target_flag_code: byte;
begin
  result:= msg_PARSE_OK;
  try
    ofs:= msg_CLIENT_HEADER_LEN;

    m.SpellCastCount:= GetBufByte(buf, ofs);
    m.SpellID:= GetBufLong(buf, ofs);
    m.Unk:= GetBufByte(buf, ofs);
    m.TargetFlags:= GetBufLong(buf, ofs);

    target_flag_code:= 0;
    if (m.TargetFlags and SPELL_TARGET_FLAG_SELF) > 0            then target_flag_code:= 0;
    if (m.TargetFlags and SPELL_TARGET_FLAG_UNIT) > 0            then target_flag_code:= 1;
    if (m.TargetFlags and SPELL_TARGET_FLAG_ITEM) > 0            then target_flag_code:= 2;
    if (m.TargetFlags and SPELL_TARGET_FLAG_PVP_CORPSE) > 0      then target_flag_code:= 3;
    if (m.TargetFlags and SPELL_TARGET_FLAG_OBJECT) > 0          then target_flag_code:= 4;
    if (m.TargetFlags and SPELL_TARGET_FLAG_TRADE_ITEM) > 0      then target_flag_code:= 5;
    if (m.TargetFlags and SPELL_TARGET_FLAG_SOURCE_LOCATION) > 0 then target_flag_code:= 6;
    if (m.TargetFlags and SPELL_TARGET_FLAG_DEST_LOCATION) > 0   then target_flag_code:= 7;
    if (m.TargetFlags and SPELL_TARGET_FLAG_STRING) > 0          then target_flag_code:= 8;
    if (m.TargetFlags and SPELL_TARGET_FLAG_UNKNOWN) > 0         then target_flag_code:= 9;
    if (m.TargetFlags and SPELL_TARGET_FLAG_CORPSE) > 0          then target_flag_code:= 10;

    Case target_flag_code of
      1,2,3,4,5,10:
      begin
        m.TargetGUID:= GetBufGUID(buf, ofs);
      end;
      6,7:
      begin
        m.TargetPosition.x:= GetBufSingle(buf, ofs);
        m.TargetPosition.y:= GetBufSingle(buf, ofs);
        m.TargetPosition.z:= GetBufSingle(buf, ofs);
      end;
    End;

    if GetBufPktLen(buf) <> ofs then result:= msg_PARSE_WARNING;
  except
    result:= msg_PARSE_ERROR;
  end;
end;
function msgParse(var buf: TBuffer; var m: T_CMSG_GOSSIP_SELECT_OPTION): longint; overload;
begin
  result:= msg_PARSE_OK;
  try
    ofs:= msg_CLIENT_HEADER_LEN;

    m.GUID:= GetBufInt64(buf, ofs);
    m.Entry:= GetBufLong(buf, ofs);
    m.Option:= GetBufLong(buf, ofs);

    if GetBufPktLen(buf) <> ofs then result:= msg_PARSE_WARNING;
  except
    result:= msg_PARSE_ERROR;
  end;
end;
function msgParse(var buf: TBuffer; var m: T_CMSG_ZONEUPDATE): longint; overload;
begin
  result:= msg_PARSE_OK;
  try
    ofs:= msg_CLIENT_HEADER_LEN;

    m.AreaID:= GetBufLong(buf, ofs);

    if GetBufPktLen(buf) <> ofs then result:= msg_PARSE_WARNING;
  except
    result:= msg_PARSE_ERROR;
  end;
end;

end.
