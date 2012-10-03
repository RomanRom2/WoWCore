unit ClassConnection;

interface

uses
  WinSock, Classes, SysUtils, Windows,
  Struct, Defines,
  TMSGStruct,
  ClassWorld,
  LbCipher,
  SRP6_LockBox, RC4, HMAC;

const
  WS_BUFFER_SIZE = 60*1024;

type
  TBuffer = array[0..WS_BUFFER_SIZE-1] of byte;

// -----------------------------------------------------------------------------

  TLoginUser = class
    Sock: longint;
    Addr: string;
    Port: word;
    RBuf, SBuf: TBuffer;
    recv_len, send_len: longint;
    AccountName: string;
    ClientLang: string;
    ClientBuild: word;

    ReconnectServerSeed: array[0..15] of byte;
    ReconnectClientSeed: array[0..15] of byte;
    ReconnectClientDigest: array[0..19] of byte;
    ReconnectClientCRC: array[0..19] of byte;

    Data: TSRP6;

    constructor Create;
    procedure Free;

    procedure PrintRecvBuf(n: word);
    procedure PrintSendBuf(n: word);

    procedure SockSend(pktLen: longint);
    procedure SockRecv;
    procedure SockDisconnect;
  end;
  LoginUserRecord = record
    sid: longint;
    LoginUser: TLoginUser;
  end;
  TListLoginUsers = class
    private
      List: array of LoginUserRecord;
      function  GetUserByIndex(index: longint): TLoginUser;
      function  GetUserBySocket(sid: longint): TLoginUser;
    public
      constructor Create;
      procedure Free;
      procedure Add(sid: longint; User: TLoginUser);
      procedure Del(sid: longint);
      function  Count: longint;
      property  UserByIndex[sid: longint]: TLoginUser read GetUserByIndex;
      property  UserBySocket[sid: longint]: TLoginUser read GetUserBySocket; default;
  end;

// -----------------------------------------------------------------------------

  TWorldUser = class
    Sock: longint;
    Addr: string;
    Port: word;
    RBuf, SBuf: TBuffer;

    AccountName: string;

    ServerSeed: longint;
    Decoder: TRC4;
    Encoder: TRC4;
    SessionKey: array [0..39] of Byte;
    di, dj, ei, ej: byte;
    d_first, e_first: boolean;

    CharData: TCharData; // Active Character from ListChar

    constructor Create;
    procedure Free;

    procedure InitCryptors;
    procedure Decode;
    procedure Encode;

    procedure PrintRecvBuf(n: word);
    procedure PrintSendBuf(n: word);

    procedure SockSend(pktLen: longint);
    procedure SockRecv;
    procedure SockDisconnect;

    procedure Send_Destroy(guid: uInt64);

    procedure Send_CreateSelf;
    procedure Send_UpdateSelf(VR: CValuesRecord);

    procedure Send_CreateFromItem(var ItemTemplate: TItemTemplate);
    procedure Send_CreateFromUnit(OBJ: TWorldRecord);
    procedure Send_CreateFromPlayer(OBJ: TWorldRecord);
    procedure Send_CreateFromGameObject(OBJ: TWorldRecord);

    procedure Send_UpdateFromPlayer_Move(MR: TMovementRecord);
    procedure Send_UpdateFromPlayer_ForceRunSpeed(guid: uInt64; value: single);
    procedure Send_UpdateFromPlayer_ForceSwimSpeed(guid: uInt64; value: single);
    procedure Send_UpdateFromPlayer_ForceFlightSpeed(guid: uInt64; value: single);
    procedure Send_UpdateFromPlayer_SetCanFly(guid: uInt64);
    procedure Send_UpdateFromPlayer_UnsetCanFly(guid: uInt64);
    procedure Send_UpdateFromPlayer_Values(OBJ: TWorldRecord; VR: CValuesRecord);
    procedure Send_UpdateFromPlayer_AttackStart(guid_attacker, guid_target: uInt64);
    procedure Send_UpdateFromPlayer_AttackStop(guid_attacker, guid_target: uInt64);
    procedure Send_UpdateFromPlayer_SpellStart(SR: TSpellRecord);
    procedure Send_UpdateFromPlayer_SpellGo(SR: TSpellRecord);

    procedure Send_UpdateFromUnit_Values(OBJ: TWorldRecord; VR: CValuesRecord);

    procedure Teleport(NewMap, NewZone: Word; NewPosX, NewPosY, NewPosZ, NewPosF: Single);
    procedure Send_Message(guid:uInt64; MSGType:Byte; Language: LongInt; Channel:String; MSG: string);
  end;

  WorldUserRecord = record
    sid: longint;
    WorldUser: TWorldUser;
  end;

  TListWorldUsers = class
    private
      List: array of WorldUserRecord;
      function  GetUserByName(nm: String): TWorldUser;
      function  GetUserByIndex(index: longint): TWorldUser;
      function  GetUserBySocket(sid: longint): TWorldUser;
    public
      constructor Create;
      procedure Free;
      procedure Add(sid: longint; User: TWorldUser);
      procedure Del(sid: longint);
      function  Count: longint;
      property  UserByName[nm: String]: TWorldUser read GetUserByName;
      property  UserByIndex[sid: longint]: TWorldUser read GetUserByIndex;
      property  UserBySocket[sid: longint]: TWorldUser read GetUserBySocket; default;

      procedure Send_Destroy(guid: uInt64);

      procedure Send_CreateFromUnit(OBJ: TWorldRecord);
      procedure Send_CreateFromPlayer(OBJ: TWorldRecord);

      procedure Send_UpdateFromPlayer_Move(MR: TMovementRecord);
      procedure Send_UpdateFromPlayer_ForceRunSpeed(guid: uInt64; value: single);
      procedure Send_UpdateFromPlayer_ForceSwimSpeed(guid: uInt64; value: single);
      procedure Send_UpdateFromPlayer_ForceFlightSpeed(guid: uInt64; value: single);
      procedure Send_UpdateFromPlayer_SetCanFly(guid: uInt64);
      procedure Send_UpdateFromPlayer_UnsetCanFly(guid: uInt64);
      procedure Send_UpdateFromPlayer_Values(OBJ: TWorldRecord; VR: CValuesRecord);
      procedure Send_UpdateFromPlayer_AttackStart(guid_attacker, guid_target: uInt64);
      procedure Send_UpdateFromPlayer_AttackStop(guid_attacker, guid_target: uInt64);
      procedure Send_UpdateFromPlayer_SpellStart(SR: TSpellRecord);
      procedure Send_UpdateFromPlayer_SpellGo(SR: TSpellRecord);

      procedure Send_UpdateFromUnit_Values(OBJ: TWorldRecord; VR: CValuesRecord);

      procedure Send_Message(guid:uInt64; MSGType:Byte; Language: LongInt; Channel:String; MSG: string);
  end;

var
  ListLoginUsers: TListLoginUsers;
  ListWorldUsers: TListWorldUsers;

  csRecvCriticalSection, csSendCriticalSection: _RTL_CRITICAL_SECTION;
  wsRecvCriticalSection, wsSendCriticalSection: _RTL_CRITICAL_SECTION;

implementation

uses
  Unit1, Sockets,
  AuthServer, CharServer, WorldServer,
  Responses,
  UpdatePacket, UpdateFields,
  TMSGBuilder,
  PacketBuilding, NetMessages, NetMessagesStr, Logs, Convert,
  OpCodesProcTable;

// -----------------------------------------------------------------------------

{ TLogingUser }
constructor TLoginUser.Create;
begin

end;
procedure TLoginUser.Free;
begin
  Destroy;
end;
procedure TLoginUser.PrintRecvBuf(n: word);
var
  s,h: string;
  l,i,i2,m,k: longint;
begin
//  if n>256 then n:=256;
  l:= 0;
  i:= n div 16;
  i2:= n- i*16;
  s:= '';
  h:= '';
  for k:=1 to i do
    begin
      for m:=1 to 16 do
        begin
          s:= s+inttohex(RBuf[l],2)+' ';
          if (RBuf[l]=0)or(RBuf[l]=9)or(RBuf[l]=10)or(RBuf[l]=13)or(RBuf[l]=14) then h:=h+' ' else h:=h+chr(RBuf[l]);
          l:= l+1;
        end;
      MainLog(s+' '+h);
      s:= '';
      h:= '';
    end;
  s:= '';
  h:= '';
  for m:=1 to i2 do
    begin
      s:= s+inttohex(RBuf[l],2)+' ';
      if (RBuf[l]=0)or(RBuf[l]=9)or(RBuf[l]=10)or(RBuf[l]=13)or(RBuf[l]=14) then h:=h+' ' else h:=h+chr(RBuf[l]);
      l:= l+1;
    end;
  for m:=1 to 48-length(s) do s:= s+' ';
  MainLog(s+' '+h);
end;
procedure TLoginUser.PrintSendBuf(n: word);
var
  s,h: string;
  l,i,i2,m,k: longint;
begin
//  if n>256 then n:=256;
  l:= 0;
  i:= n div 16;
  i2:= n- i*16;
  s:= '';
  h:= '';
  for k:=1 to i do
    begin
      for m:=1 to 16 do
        begin
          s:= s+inttohex(SBuf[l],2)+' ';
          if (SBuf[l]=0)or(SBuf[l]=9)or(SBuf[l]=10)or(SBuf[l]=13)or(SBuf[l]=14) then h:=h+' ' else h:=h+chr(SBuf[l]);
          l:= l+1;
        end;
      MainLog(s+' '+h,1,0,0);
      s:= '';
      h:= '';
    end;
  s:= '';
  h:= '';
  for m:=1 to i2 do
    begin
      s:= s+inttohex(SBuf[l],2)+' ';
      if (SBuf[l]=0)or(SBuf[l]=9)or(SBuf[l]=10)or(SBuf[l]=13)or(SBuf[l]=14) then h:=h+' ' else h:=h+chr(SBuf[l]);
      l:= l+1;
    end;
  for m:=1 to 48-length(s) do s:= s+' ';
  MainLog(s+' '+h,1,0,0);
end;

procedure TLoginUser.SockRecv;
begin
  recv_len:= recv(Sock, RBuf, SizeOf(RBuf), 0);

  Case RBuf[0] of
    AUTH_LOGON_CHALLENGE:
    begin
      AuthServer_LogonChallenge(self);
    end;

    AUTH_LOGON_PROOF:
    begin
      AuthServer_LogonProof(self);
    end;

    AUTH_RECONNECT_CHALLENGE:
    begin
      AuthServer_ReconnectChallenge(self);
    end;

    AUTH_RECONNECT_PROOF:
    begin
      AuthServer_ReconnectProof(self);
    end;

    AUTH_REALM_LIST:
    begin
      AuthServer_RealmList(self);
    end;

    else
    begin
      MainLog('UNKNOWN_COMMAND ['+AccountName+']');
    end;
  End;
end;
procedure TLoginUser.SockSend(pktLen: longint);
begin
  send(Sock, SBuf, pktLen, 0);
end;
procedure TLoginUser.SockDisconnect;
begin
  PostMessage(Mainform.Handle, WM_ASYNC_RS, Sock, FD_CLOSE);
end;

// -----------------------------------------------------------------------------

{ TWorldUser }
constructor TWorldUser.Create;
begin
  di:= 0;
  dj:= 0;
  ei:= 0;
  ej:= 0;

  d_first:= true;
  e_first:= true;

  CharData:= nil;
end;
procedure TWorldUser.Free;
begin
  CharData:= nil;
  Destroy;
end;
procedure TWorldUser.PrintRecvBuf(n: word);
var
  s,h: string;
  l,i,i2,m,k: longint;
begin
//  if n>256 then n:=256;
  l:= 0;
  i:= n div 16;
  i2:= n- i*16;
  s:= '';
  h:= '';
  for k:=1 to i do
    begin
      for m:=1 to 16 do
        begin
          s:= s+inttohex(RBuf[l],2)+' ';
          if (RBuf[l]=0)or(RBuf[l]=9)or(RBuf[l]=10)or(RBuf[l]=13)or(RBuf[l]=14) then h:=h+' ' else h:=h+chr(RBuf[l]);
          l:= l+1;
        end;
      mainlog(s+' '+h,1,0,0);
      s:= '';
      h:= '';
    end;
  s:= '';
  h:= '';
  for m:=1 to i2 do
    begin
      s:= s+inttohex(RBuf[l],2)+' ';
      if (RBuf[l]=0)or(RBuf[l]=9)or(RBuf[l]=10)or(RBuf[l]=13)or(RBuf[l]=14) then h:=h+' ' else h:=h+chr(RBuf[l]);
      l:= l+1;
    end;
  for m:=1 to 48-length(s) do s:= s+' ';
  mainlog(s+' '+h,1,0,0);
end;
procedure TWorldUser.PrintSendBuf(n: word);
var
  s,h: string;
  l,i,i2,m,k: longint;
begin
//  if n>256 then n:=256;
  l:= 0;
  i:= n div 16;
  i2:= n- i*16;
  s:= '';
  h:= '';
  for k:=1 to i do
    begin
      for m:=1 to 16 do
        begin
          s:= s+inttohex(SBuf[l],2)+' ';
          if (SBuf[l]=0)or(SBuf[l]=9)or(SBuf[l]=10)or(SBuf[l]=13)or(SBuf[l]=14) then h:=h+' ' else h:=h+chr(SBuf[l]);
          l:= l+1;
        end;
      mainlog(s+' '+h,1,0,0);
      s:= '';
      h:= '';
    end;
  s:= '';
  h:= '';
  for m:=1 to i2 do
    begin
      s:= s+inttohex(SBuf[l],2)+' ';
      if (SBuf[l]=0)or(SBuf[l]=9)or(SBuf[l]=10)or(SBuf[l]=13)or(SBuf[l]=14) then h:=h+' ' else h:=h+chr(SBuf[l]);
      l:= l+1;
    end;
  for m:=1 to 48-length(s) do s:= s+' ';
  mainlog(s+' '+h,1,0,0);
end;

procedure TWorldUser.SockRecv;
var
  pkt: word;
  i, recv_len: longint;
  opcode: word;
  tmpbuf, tmpbuf2: array[0..1024*128] of byte;
  tail, need: longint;
  time_out: uInt64;
begin
  if Self = nil then Exit;

  EnterCriticalSection(csRecvCriticalSection);
  try
    recv_len:= recv(Sock, RBuf, 6, 0);
    if recv_len < 0 then exit;
//mainlog('header begin, '+strr(recv_len)+' bytes',1,0,0);

    tail:= 6-recv_len;
    if tail > 0 then
    begin
      i:= recv(Sock, tmpbuf, tail, 0);
      if i < 0 then exit;
      move(tmpbuf[0], RBuf[recv_len], i);
//mainlog('header not full, tail='+strr(tail),1,0,0);
    end;

//mainlog('header full, '+strr(recv_len)+' bytes',1,0,0);

    Decode;

    pkt:= RBuf[1]+256*RBuf[0];
    opcode:=RBuf[2]+256*RBuf[3];

    need:= pkt - 4;

//mainlog('opcode '+inttohex(opcode,4),1,1,0);
//printRecvBuf(6);
//mainlog('need to recv '+strr(need),1,0,0);

    if (opcode > 0) and (opcode < TECH_OPCODE) and (pkt < 4096) then
    begin
      if need > 0 then
      begin
        recv_len:= recv(Sock, tmpbuf, need, 0);
        if recv_len<0 then Exit;

////////////////////////////////////////////////////////////////////////////////
        tail:=need-recv_len;
//mainlog('pkt='+strr(pkt)+', need='+strr(need)+', recv='+strr(recv_len)+', tail='+strr(tail),1,0,0);

        time_out:=vall64(FormatDateTime('YYYYMMDDhhnnss', Now));
        while tail>0 do
          begin
            i:= recv(Sock, tmpbuf2, tail, 0);
            if i>0 then
              begin
//mainlog('DEBUG: tail present, starting recieve to buf['+strr(recv_len)+']',1,0,0);
                move(tmpbuf2[0], tmpbuf[recv_len], i);
                inc(recv_len, i);
                dec(tail, i);
//mainlog('DEBUG: '+strr(i)+' tails received. recv_len='+strr(recv_len)+', tail='+strr(tail),1,0,0);
              end;

            if now-time_out>1 then
              begin
//mainlog('DEBUG: time out while receiving tail',1,0,0);
                break;
              end;
          end;
//mainlog('moving '+strr(need)+' bytes from temp buff',1,0,0);
////////////////////////////////////////////////////////////////////////////////

        move(tmpbuf[0], RBuf[6], need);
      end;

      try
        OpCodeProc[opcode](self);
      except
        MainLog('EXCEPTION while call OpCodeProc with OpCode '+NetMsgStr(opcode),1,1,1);
      end;

    end
    else
    begin
//            MainLog('Unknown pkt, OpCode out of range. OpCode='+inttohex(opcode,4)+', pktlen='+strr(pkt),1,0,0);
//            SockDisconnect;
    end;
  finally
    LeaveCriticalSection(csRecvCriticalSection);
  end;

end;
procedure TWorldUser.SockSend(pktLen: longint);
begin
  EnterCriticalSection(csSendCriticalSection);
  try
    Encode;
    send(Sock, SBuf, pktLen+2, 0);
  finally
    LeaveCriticalSection(csSendCriticalSection);
  end;
end;
procedure TWorldUser.SockDisconnect;
begin
  PostMessage(Mainform.Handle, WM_ASYNC_WS, Sock, FD_CLOSE);
end;

procedure TWorldUser.InitCryptors;
const
//  EncoderKey: array [0..15] of byte = ($22, $BE, $E5, $CF, $BB, $07, $64, $D9, $00, $45, $1B, $D0, $24, $B8, $D5, $45);
//  DecoderKey: array [0..15] of byte = ($F4, $66, $31, $59, $FC, $83, $6E, $31, $31, $02, $51, $D5, $44, $31, $67, $98);

  // new cryptors from 3.3.3
  EncoderKey: array [0..15] of byte = ($CC, $98, $AE, $04, $E8, $97, $EA, $CA, $12, $DD, $C0, $93, $42, $91, $53, $57);
  DecoderKey: array [0..15] of byte = ($C2, $B3, $72, $3C, $C6, $AE, $D9, $B5, $34, $3C, $53, $EE, $2F, $43, $67, $CE);
var
  Hasher: THMAC_SHA1;
  EncoderHash: TSHA1Digest;
  DecoderHash: TSHA1Digest;

  ClientEncoder: TRc4;
  ClientDecoder: TRc4;

  SyncBuff : array [0..1023] of Byte;
begin
  Hasher := THMAC_SHA1.Create(EncoderKey, 16);
  Hasher.Update(SessionKey, 40);
  EncoderHash := Hasher.Final;

  Hasher.ReInit(DecoderKey, 16);
  Hasher.Update(SessionKey, 40);
  DecoderHash := Hasher.Final;
  Hasher.Free;

  RC4_Init(ClientEncoder,EncoderHash);
  RC4_Init(ClientDecoder,DecoderHash);

  RC4_Init(Encoder, EncoderHash);
  RC4_Init(Decoder, DecoderHash);

  FillChar(SyncBuff,1024,#0);
  RC4_transform(ClientEncoder, SyncBuff, SyncBuff, length(SyncBuff));
  RC4_transform(Encoder, SyncBuff, SyncBuff, length(SyncBuff));

  FillChar(SyncBuff,1024,#0);
  RC4_transform(ClientDecoder, SyncBuff, SyncBuff, length(SyncBuff));
  RC4_transform(Decoder, SyncBuff, SyncBuff, length(SyncBuff));
end;
procedure TWorldUser.Decode;
begin
  if d_first then
  begin
    d_first:= false;
    exit;
  end;

  RC4_transform(Decoder, RBuf[0], RBuf[0], 6)
end;
procedure TWorldUser.Encode;
begin
  if e_first then
  begin
    e_first:= false;
    exit;
  end;

  RC4_transform(Encoder, SBuf[0], SBuf[0], 4)
end;

procedure TWorldUser.Send_Destroy(guid: uInt64);
var
  omsg: T_SMSG_DESTROY_OBJECT;
begin
  if self.CharData.Enum.GUID = guid then exit;

  omsg.GUID:= guid;
  SockSend(msgBuild(SBuf, omsg));
end;

procedure TWorldUser.Send_CreateSelf;
var
  upkt: Tupkt;
  upkt_buf: array[0..65535] of byte;
  i, delta: longint;
begin
  pkt.InitCmd(SBuf, SMSG_UPDATE_OBJECT);
  pkt.AddLong(SBuf, 1); // count of objects
//  pkt.AddByte(SBuf, 0); // removed in 3.0.1
  pkt.AddByte(SBuf, 3); // m.UpdateType + m.ActivePlayer
  pkt.AddGUID(SBuf, CharData.Enum.GUID);

  pkt.AddByte(SBuf, WO_PLAYER);
  pkt.AddWord(SBuf, $61); // m.UpdateFlags + m.ActivePlayer // 3.1.0: byte->word
  pkt.AddLong(SBuf, 0);   // m.Movement.m_moveFlags
  pkt.AddWord(SBuf, 0);   // m.Movement.m_moveFlags2; BC 2.3.0; 3.0.1 (8714): byte->word
  pkt.AddLong(SBuf, GetTickCount); // m.UpdateTime

  pkt.AddFloat(SBuf, CharData.Enum.position.x);
  pkt.AddFloat(SBuf, CharData.Enum.position.y);
  pkt.AddFloat(SBuf, CharData.Enum.position.z);
  pkt.AddFloat(SBuf, CharData.facing);

  // transport

  // swiming

  pkt.AddLong(SBuf, 0); // m.Movement.m_fallenTime

  // falling

  // elevation

  pkt.AddFloat(SBuf, CharData.speed_walk);
  pkt.AddFloat(SBuf, CharData.speed_run);
  pkt.AddFloat(SBuf, CharData.speed_run_back);
  pkt.AddFloat(SBuf, CharData.speed_swim);
  pkt.AddFloat(SBuf, CharData.speed_swim_back);
  pkt.AddFloat(SBuf, CharData.speed_flight); // BC 2.0.1
  pkt.AddFloat(SBuf, CharData.speed_flight_back); // BC 2.0.1
  pkt.AddFloat(SBuf, 3.141593);
  pkt.AddFloat(SBuf, 3.141593); // 3.0.1

  // spline

  // m.UpdateFlags $8
//  pkt.AddLong(SBuf, CharData.Enum.GUID); // part of GUID
  // m.UpdateFlags $10
//  pkt.AddLong(SBuf, CharData.Enum.GUID); // BC 2.0.1.6180 - LOW part of GUID

    upkt.Init(PLAYER_END);
    upkt.AddInt64(     OBJECT_FIELD_GUID,                     CharData.Enum.GUID);
    upkt.AddLong(      OBJECT_FIELD_TYPE,                     TYPE_PLAYER or TYPE_UNIT or TYPE_OBJECT);
    upkt.AddFloat(     OBJECT_FIELD_SCALE_X,                  CharData.scale_x);

    upkt.AddLong(      UNIT_FIELD_BYTES_0,                    CharData.Enum.raceID or (CharData.Enum.classID shl 8) or (CharData.Enum.sexID shl 16) or (CharData.power_type shl 24));
    upkt.AddLong(      UNIT_FIELD_HEALTH,                     CharData.health);
    upkt.AddLong(      UNIT_FIELD_POWER1,                     CharData.power[POWER_MANA]);
    upkt.AddLong(      UNIT_FIELD_POWER2,                     CharData.power[POWER_RAGE]);
    upkt.AddLong(      UNIT_FIELD_POWER3,                     CharData.power[POWER_FOCUS]);
    upkt.AddLong(      UNIT_FIELD_POWER4,                     CharData.power[POWER_ENERGY]);
    upkt.AddLong(      UNIT_FIELD_POWER5,                     CharData.power[POWER_HAPPINESS]);
    upkt.AddLong(      UNIT_FIELD_POWER6,                     CharData.power[POWER_RUNES]);
    upkt.AddLong(      UNIT_FIELD_POWER7,                     CharData.power[POWER_RUNIC]);
    upkt.AddLong(      UNIT_FIELD_MAXHEALTH,                  CharData.max_health);
    upkt.AddLong(      UNIT_FIELD_MAXPOWER1,                  CharData.max_power[POWER_MANA]);
    upkt.AddLong(      UNIT_FIELD_MAXPOWER2,                  CharData.max_power[POWER_RAGE]);
    upkt.AddLong(      UNIT_FIELD_MAXPOWER3,                  CharData.max_power[POWER_FOCUS]);
    upkt.AddLong(      UNIT_FIELD_MAXPOWER4,                  CharData.max_power[POWER_ENERGY]);
    upkt.AddLong(      UNIT_FIELD_MAXPOWER5,                  CharData.max_power[POWER_HAPPINESS]);
    upkt.AddLong(      UNIT_FIELD_MAXPOWER6,                  CharData.max_power[POWER_RUNES]);
    upkt.AddLong(      UNIT_FIELD_MAXPOWER7,                  CharData.max_power[POWER_RUNIC]);
    upkt.AddLong(      UNIT_FIELD_LEVEL,                      CharData.Enum.experienceLevel);
    upkt.AddLong(      UNIT_FIELD_FACTIONTEMPLATE,            CharData.faction_template);
    upkt.AddLong(      UNIT_FIELD_FLAGS,                      CharData.flags);
    upkt.AddLong(      UNIT_FIELD_FLAGS_2,                    CharData.flags2);
    upkt.AddLong(      UNIT_FIELD_BASEATTACKTIME+0,           CharData.mainhand_attack_time);
    upkt.AddLong(      UNIT_FIELD_BASEATTACKTIME+1,           CharData.offhand_attack_time);
    upkt.AddLong(      UNIT_FIELD_RANGEDATTACKTIME,           CharData.ranged_attack_time);
    upkt.AddFloat(     UNIT_FIELD_BOUNDINGRADIUS,             CharData.bounding_radius);
    upkt.AddFloat(     UNIT_FIELD_COMBATREACH,                CharData.combat_reach);
    upkt.AddLong(      UNIT_FIELD_DISPLAYID,                  CharData.enum_model);
    upkt.AddLong(      UNIT_FIELD_NATIVEDISPLAYID,            CharData.native_model);
    upkt.AddLong(      UNIT_FIELD_MOUNTDISPLAYID,             CharData.mount_model);
    upkt.AddFloat(     UNIT_FIELD_MINDAMAGE,                  CharData.min_damage);
    upkt.AddFloat(     UNIT_FIELD_MAXDAMAGE,                  CharData.max_damage);
    upkt.AddFloat(     UNIT_FIELD_MINOFFHANDDAMAGE,           CharData.min_offhand_damage);
    upkt.AddFloat(     UNIT_FIELD_MAXOFFHANDDAMAGE,           CharData.max_offhand_damage);

    upkt.AddLong(      UNIT_FIELD_BYTES_1,                    CharData.stand_state or (0 shl 8) or (0 shl 16) or (0 shl 24));

    upkt.AddFloat(     UNIT_MOD_CAST_SPEED,                   CharData.mod_cast_speed);

    for i:= 0 to STAT_MAX do
      upkt.AddLong(    UNIT_FIELD_STAT0+i,                    CharData.stat[i]);
    for i:= 0 to STAT_MAX do
      upkt.AddInt(     UNIT_FIELD_POSSTAT0+i,                 0);
    for i:= 0 to STAT_MAX do
      upkt.AddInt(     UNIT_FIELD_NEGSTAT0+i,                 0);

    for i:= 0 to RESISTANCE_MAX do
      upkt.AddLong(    UNIT_FIELD_RESISTANCES+i,              CharData.resist[i]);
    for i:= 0 to RESISTANCE_MAX do
      upkt.AddInt(     UNIT_FIELD_RESISTANCEBUFFMODSPOSITIVE+i, 0);
    for i:= 0 to RESISTANCE_MAX do
      upkt.AddInt(     UNIT_FIELD_RESISTANCEBUFFMODSNEGATIVE+i, 0);

    upkt.AddLong(      UNIT_FIELD_BASE_MANA,                  CharData.base_mana);
    upkt.AddLong(      UNIT_FIELD_BASE_HEALTH,                CharData.base_health);

    upkt.AddLong(      UNIT_FIELD_BYTES_2,                    CharData.sheathed or (0 shl 8) or (0 shl 16) or (0 shl 24));

    upkt.AddLong(      UNIT_FIELD_ATTACK_POWER,               CharData.attack_power);
    upkt.AddLong(      UNIT_FIELD_ATTACK_POWER_MODS,          0);
    upkt.AddFloat(     UNIT_FIELD_ATTACK_POWER_MULTIPLIER,    1.0);
    upkt.AddLong(      UNIT_FIELD_RANGED_ATTACK_POWER,        CharData.ranged_attack_power);
    upkt.AddLong(      UNIT_FIELD_RANGED_ATTACK_POWER_MODS,   0);
    upkt.AddFloat(     UNIT_FIELD_RANGED_ATTACK_POWER_MULTIPLIER, 1.0);
    upkt.AddFloat(     UNIT_FIELD_MINRANGEDDAMAGE,            CharData.min_ranged_damage);
    upkt.AddFloat(     UNIT_FIELD_MAXRANGEDDAMAGE,            CharData.max_ranged_damage);
    upkt.AddFloat(     UNIT_FIELD_HOVERHEIGHT,                CharData.hover_height);

    upkt.AddLong(      PLAYER_FLAGS,                          CharData.player_flags);
    upkt.AddLong(      PLAYER_BYTES,                          CharData.Enum.skinID or (CharData.Enum.faceID shl 8) or (CharData.Enum.hairStyleID shl 16) or (CharData.Enum.hairColorID shl 24));
    upkt.AddLong(      PLAYER_BYTES_2,                        CharData.Enum.facialHairStyleID or (0 shl 8) or (0 shl 16) or (CharData.Enum.restInfo shl 24));
    upkt.AddLong(      PLAYER_BYTES_3,                        CharData.Enum.sexID or (0 shl 8)or (0 shl 16) or (0 shl 24));

    delta:= PLAYER_VISIBLE_ITEM_2_ENTRYID - PLAYER_VISIBLE_ITEM_1_ENTRYID;
    for i:= 0 to PLAYER_VISIBLE_ITEMS_COUNT-1 do
      if CharData.inventory_bag[0][i].Entry <> 0 then
        upkt.AddLong(  PLAYER_VISIBLE_ITEM_1_ENTRYID + i*delta, CharData.inventory_bag[0][i].Entry );

    for i:= 0 to Length(CharData.inventory_bag[0])-1 do
      if CharData.inventory_bag[0][i].Entry <> 0 then
        upkt.AddInt64( PLAYER_FIELD_INV_SLOT_HEAD + i*2,      CharData.inventory_bag[0][i].GUID);

    upkt.AddLong(      PLAYER_XP,                             CharData.xp);
    upkt.AddLong(      PLAYER_NEXT_LEVEL_XP,                  CharData.next_level_xp);

    for i:=0 to PLAYER_SKILLS_COUNT-1 do
      if (CharData.Skills[i].id > 0) then
      begin
        upkt.AddLong(  PLAYER_SKILL_INFO_1_1+ i*3,            (CharData.Skills[i].flag shl 16) + CharData.Skills[i].id);
        if CharData.Skills[i].max_level > 0 then
          upkt.AddLong(PLAYER_SKILL_INFO_1_1+ i*3 +1,         (CharData.Skills[i].max_level shl 16) + CharData.Skills[i].current_level);
        if CharData.Skills[i].stat_max_level > 0 then
          upkt.AddLong(PLAYER_SKILL_INFO_1_1+ i*3 +2,         (CharData.Skills[i].stat_max_level shl 16) + CharData.Skills[i].stat_current_level);
      end;

    upkt.AddLong(      PLAYER_CHARACTER_POINTS1,              CharData.points1);
    upkt.AddLong(      PLAYER_CHARACTER_POINTS2,              CharData.professions_left);
    upkt.AddFloat(     PLAYER_BLOCK_PERCENTAGE,               4.0);
    upkt.AddFloat(     PLAYER_DODGE_PERCENTAGE,               4.0);
    upkt.AddFloat(     PLAYER_PARRY_PERCENTAGE,               4.0);
    upkt.AddFloat(     PLAYER_CRIT_PERCENTAGE,                4.0);
    upkt.AddFloat(     PLAYER_RANGED_CRIT_PERCENTAGE,         4.0);
    upkt.AddFloat(     PLAYER_OFFHAND_CRIT_PERCENTAGE,        4.0);

    for i:=0 to 127 do
      upkt.AddLong(    PLAYER_EXPLORED_ZONES_1+i,             $FFFFFFFF);

    upkt.AddInt(       PLAYER_REST_STATE_EXPERIENCE,          CharData.rest_state_xp);
    upkt.AddLong(      PLAYER_FIELD_COINAGE,                  CharData.coinage);

    for i:=0 to RESISTANCE_MAX do
      upkt.AddInt(     PLAYER_FIELD_MOD_DAMAGE_DONE_POS+i,    0);
    for i:=0 to RESISTANCE_MAX do
      upkt.AddInt(     PLAYER_FIELD_MOD_DAMAGE_DONE_NEG+i,    0);
    for i:=0 to RESISTANCE_MAX do
      upkt.AddFloat(   PLAYER_FIELD_MOD_DAMAGE_DONE_PCT+i,    1.0);

    // PLAYER_FIELD_BYTES

    upkt.AddInt(       PLAYER_FIELD_WATCHED_FACTION_INDEX,    -1);
    upkt.AddLong(      PLAYER_FIELD_MAX_LEVEL,                80);

    for i:=0 to 3 do
      upkt.AddFloat(   PLAYER_RUNE_REGEN_1+i,                 0.1);

    for i:=0 to 5 do
      upkt.AddFloat(   PLAYER_FIELD_GLYPH_SLOTS_1+i,          21+i);

    upkt.MakeUpdateBlock(@upkt_buf);
  pkt.AddByte(SBuf, upkt.blocks);
  pkt.AddArray(SBuf, @upkt_buf, upkt.data_ofs);

  SockSend(pkt.pktLen);
end;
procedure TWorldUser.Send_UpdateSelf(VR: CValuesRecord);
var
  upkt: Tupkt;
  upkt_buf: array[0..65535] of byte;
  i: longint;
  FIELD, item_slot: longint;
begin
  if Length(VR.Values) = 0 then exit;

  pkt.InitCmd(SBuf, SMSG_UPDATE_OBJECT);
  pkt.AddLong(SBuf, 1);
  pkt.AddByte(SBuf, 0); // UPDATETYPE_VALUES
  pkt.AddGUID(SBuf, CharData.Enum.GUID);

    upkt.Init(PLAYER_END);

    for i:= 0 to Length(VR.Values)-1 do
    begin
      FIELD:= VR.Values[i];
      Case FIELD of
        OBJECT_FIELD_SCALE_X:       upkt.AddFloat( FIELD,  CharData.scale_x);
        UNIT_FIELD_DISPLAYID:       upkt.AddLong(  FIELD,  CharData.enum_model);
        UNIT_FIELD_NATIVEDISPLAYID: upkt.AddLong(  FIELD,  CharData.native_model);
        UNIT_FIELD_MOUNTDISPLAYID:  upkt.AddLong(  FIELD,  CharData.mount_model);
        UNIT_FIELD_BYTES_1:         upkt.AddLong(  FIELD,  CharData.stand_state or (CharData.stealth_visual_effect shl 8) or (CharData.shape_shift_form shl 16) or (CharData.shape_shift_stand shl 24));
        UNIT_FIELD_BYTES_2:         upkt.AddLong(  FIELD,  CharData.sheathed or (0 shl 8) or (0 shl 16) or (0 shl 24));
        PLAYER_VISIBLE_ITEM_1_ENTRYID..PLAYER_VISIBLE_ITEM_19_ENCHANTMENT:
        begin
          item_slot:= (FIELD - PLAYER_VISIBLE_ITEM_1_ENTRYID) div (PLAYER_VISIBLE_ITEM_2_ENTRYID - PLAYER_VISIBLE_ITEM_1_ENTRYID);
          upkt.AddLong(                            FIELD,  CharData.inventory_bag[0][item_slot].Entry);
        end;
        PLAYER_FIELD_INV_SLOT_HEAD..PLAYER_FARSIGHT-1:
        begin
          item_slot:= (FIELD -PLAYER_FIELD_INV_SLOT_HEAD) div 2;
          upkt.AddInt64(                           FIELD,  CharData.inventory_bag[0][item_slot].GUID)
        end;
      End;
    end;

    if not upkt.MakeUpdateBlock(@upkt_buf) then exit;

  pkt.AddByte(SBuf, upkt.blocks);
  pkt.AddArray(SBuf, @upkt_buf, upkt.data_ofs);

  SockSend(pkt.pktLen);
end;

procedure TWorldUser.Send_CreateFromItem(var ItemTemplate: TItemTemplate);
var
  upkt: Tupkt;
  upkt_buf: array[0..65535] of byte;
begin
  if ItemTemplate.Entry > Length(ItemTPL)-1 then exit;

  pkt.InitCmd(SBuf, SMSG_UPDATE_OBJECT);
  pkt.AddLong(SBuf, 1);
  pkt.AddByte(SBuf, 2); // create type full
  pkt.AddGUID(SBuf, ItemTemplate.GUID);

  pkt.AddByte(SBuf, WO_ITEM);
  pkt.AddWord(SBuf, $10);
  pkt.AddLong(SBuf, GetTickCount);

    upkt.Init(CONTAINER_END);
    upkt.AddInt64(   OBJECT_FIELD_GUID,            ItemTemplate.GUID);
    upkt.AddLong(    OBJECT_FIELD_TYPE,            TYPE_OBJECT + TYPE_ITEM);
    upkt.AddLong(    OBJECT_FIELD_ENTRY,           ItemTemplate.Entry);
    upkt.AddFloat(   OBJECT_FIELD_SCALE_X,         1.0);
    upkt.AddInt64(   ITEM_FIELD_OWNER,             CharData.Enum.GUID);
    upkt.AddInt64(   ITEM_FIELD_CONTAINED,         CharData.Enum.GUID);
    upkt.AddLong(    ITEM_FIELD_STACK_COUNT,       ItemTemplate.StackCount);
    upkt.AddLong(    ITEM_FIELD_DURABILITY,        ItemTPL[ItemTemplate.Entry].MaxDurability);
    upkt.AddLong(    ITEM_FIELD_MAXDURABILITY,     ItemTPL[ItemTemplate.Entry].MaxDurability);
    upkt.MakeUpdateBlock(@upkt_buf);

  pkt.AddByte(SBuf, upkt.blocks);
  pkt.AddArray(SBuf, @upkt_buf, upkt.data_ofs);
  SockSend(pkt.pktLen);
end;
procedure TWorldUser.Send_CreateFromUnit(OBJ: TWorldRecord);
var
  upkt: Tupkt;
  upkt_buf: array[0..65535] of byte;
  U: TWorldUnit;
begin
  U:= TWorldUnit(OBJ.woAddr);

  pkt.InitCmd(SBuf, SMSG_UPDATE_OBJECT);
  pkt.AddLong(SBuf, 1);
  pkt.AddByte(SBuf, 2); // update type full

  pkt.AddGUID(SBuf, U.woGUID);
  pkt.AddByte(SBuf, WO_UNIT);

  pkt.AddWord(SBuf, $60);
  pkt.AddLong(SBuf, 0);
  pkt.AddWord(SBuf, 0);
  pkt.AddLong(SBuf, GetTickCount);
  
  pkt.AddFloat(SBuf, U.woLoc.x);
  pkt.AddFloat(SBuf, U.woLoc.y);
  pkt.AddFloat(SBuf, U.woLoc.z);
  pkt.AddFloat(SBuf, U.woLoc.facing);

  pkt.AddLong(SBuf, 0);

  pkt.AddFloat(SBuf, U.woSpeedWalk);
  pkt.AddFloat(SBuf, U.woSpeedRun);
  pkt.AddFloat(SBuf, U.woSpeedRunBack);
  pkt.AddFloat(SBuf, U.woSpeedSwim);
  pkt.AddFloat(SBuf, U.woSpeedSwimBack);
  pkt.AddFloat(SBuf, CharData.speed_flight);
  pkt.AddFloat(SBuf, CharData.speed_flight_back);
  pkt.AddFloat(SBuf, 3.14);
  pkt.AddFloat(SBuf, 3.14);

    upkt.Init(UNIT_END);
    upkt.AddInt64(   OBJECT_FIELD_GUID,            U.woGUID);
    upkt.AddLong(    OBJECT_FIELD_TYPE,            TYPE_OBJECT + TYPE_UNIT);
    upkt.AddLong(    OBJECT_FIELD_ENTRY,           U.woEntry);
    upkt.AddFloat(   OBJECT_FIELD_SCALE_X,         U.woScaleX);
    upkt.AddLong(    UNIT_FIELD_BYTES_0,           U.unFieldBytes0);
    upkt.AddLong(    UNIT_FIELD_HEALTH,            U.unHealth);
    upkt.zAddLong(   UNIT_FIELD_POWER1,            U.unPower[POWER_MANA]);
    upkt.zAddLong(   UNIT_FIELD_POWER2,            U.unPower[POWER_RAGE]);
    upkt.zAddLong(   UNIT_FIELD_POWER3,            U.unPower[POWER_FOCUS]);
    upkt.zAddLong(   UNIT_FIELD_POWER4,            U.unPower[POWER_ENERGY]);
    upkt.zAddLong(   UNIT_FIELD_POWER5,            U.unPower[POWER_HAPPINESS]);
    upkt.AddLong(    UNIT_FIELD_MAXHEALTH,         U.unMaxHealth);
    upkt.zAddLong(   UNIT_FIELD_MAXPOWER1,         U.unMaxPower[POWER_MANA]);
    upkt.zAddLong(   UNIT_FIELD_MAXPOWER2,         U.unMaxPower[POWER_RAGE]);
    upkt.zAddLong(   UNIT_FIELD_MAXPOWER3,         U.unMaxPower[POWER_FOCUS]);
    upkt.zAddLong(   UNIT_FIELD_MAXPOWER4,         U.unMaxPower[POWER_ENERGY]);
    upkt.zAddLong(   UNIT_FIELD_MAXPOWER5,         U.unMaxPower[POWER_HAPPINESS]);
    upkt.AddLong(    UNIT_FIELD_LEVEL,             U.unLevel);
    upkt.AddLong(    UNIT_FIELD_FACTIONTEMPLATE,   U.unFactionTemplate);
    upkt.zAddLong(   UNIT_FIELD_FLAGS,             U.unFieldFlags);
    upkt.AddLong(    UNIT_FIELD_BASEATTACKTIME+0,  U.unMainhandAttackTime);
    upkt.AddLong(    UNIT_FIELD_BASEATTACKTIME+1,  U.unOffhandAttackTime);
    upkt.AddFloat(   UNIT_FIELD_BOUNDINGRADIUS,    U.unBoundingRadius);
    upkt.AddFloat(   UNIT_FIELD_COMBATREACH,       U.unCombatReach);
    upkt.AddLong(    UNIT_FIELD_DISPLAYID,         CreatureTPL[U.woEntry].DisplayID[0]);
    upkt.AddLong(    UNIT_FIELD_NATIVEDISPLAYID,   CreatureTPL[U.woEntry].DisplayID[0]);
    upkt.AddFloat(   UNIT_MOD_CAST_SPEED,          U.unCastSpeed);
    if CreatureTPL[U.woEntry].Greetings <> '' then
      upkt.zAddLong( UNIT_NPC_FLAGS,               UNIT_NPC_FLAG_QUESTGIVER); // simulation
    upkt.zAddLong(   UNIT_FIELD_BYTES_2,           U.unFieldBytes2);

    upkt.MakeUpdateBlock(@upkt_buf);

  pkt.AddByte(SBuf, upkt.blocks);
  pkt.AddArray(SBuf, @upkt_buf, upkt.data_ofs);
  SockSend(pkt.pktLen);
end;
procedure TWorldUser.Send_CreateFromPlayer(OBJ: TWorldRecord);
var
  upkt: Tupkt;
  upkt_buf: array[0..65535] of byte;
  i, delta: longint;
  P: TWorldUser;
begin
  P:= TWorldUser(OBJ.woAddr);

  // dont send for self
  if self.CharData.Enum.GUID = P.CharData.Enum.GUID then exit;

  pkt.InitCmd(SBuf, SMSG_UPDATE_OBJECT);
  pkt.AddLong(SBuf, 1);
  pkt.AddByte(SBuf, 2); // update type full
  pkt.AddGUID(SBuf, P.CharData.Enum.GUID);
  pkt.AddByte(SBuf, WO_PLAYER);

  pkt.AddWord(SBuf, $60);
  pkt.AddLong(SBuf, 0);
  pkt.AddWord(SBuf, 0);
  pkt.AddLong(SBuf, GetTickCount);

  pkt.AddFloat(SBuf, P.CharData.Enum.position.x);
  pkt.AddFloat(SBuf, P.CharData.Enum.position.y);
  pkt.AddFloat(SBuf, P.CharData.Enum.position.z);
  pkt.AddFloat(SBuf, P.CharData.facing);

  pkt.AddLong(SBuf, 0);

  pkt.AddFloat(SBuf, P.CharData.speed_walk);
  pkt.AddFloat(SBuf, P.CharData.speed_run);
  pkt.AddFloat(SBuf, P.CharData.speed_run_back);
  pkt.AddFloat(SBuf, P.CharData.speed_swim);
  pkt.AddFloat(SBuf, P.CharData.speed_swim_back);
  pkt.AddFloat(SBuf, P.CharData.speed_flight);
  pkt.AddFloat(SBuf, P.CharData.speed_flight_back);
  pkt.AddFloat(SBuf, 3.14);
  pkt.AddFloat(SBuf, 3.14);

    upkt.Init(PLAYER_END);
    upkt.AddInt64(   OBJECT_FIELD_GUID,                       P.CharData.Enum.GUID);
    upkt.AddLong(    OBJECT_FIELD_TYPE,                       TYPE_OBJECT + TYPE_UNIT + TYPE_PLAYER);
    upkt.AddFloat(   OBJECT_FIELD_SCALE_X,                    P.CharData.scale_x);
    upkt.AddLong(    UNIT_FIELD_BYTES_0,                      P.CharData.Enum.raceID or (P.CharData.Enum.classID shl 8) or (P.CharData.Enum.sexID shl 16) or (P.CharData.power_type shl 24));
    upkt.AddLong(    UNIT_FIELD_HEALTH,                       P.CharData.health);
    upkt.AddLong(    UNIT_FIELD_POWER1,                       P.CharData.power[POWER_MANA]);
    upkt.AddLong(    UNIT_FIELD_POWER2,                       P.CharData.power[POWER_RAGE]);
    upkt.AddLong(    UNIT_FIELD_POWER3,                       P.CharData.power[POWER_FOCUS]);
    upkt.AddLong(    UNIT_FIELD_POWER4,                       P.CharData.power[POWER_ENERGY]);
    upkt.AddLong(    UNIT_FIELD_POWER5,                       P.CharData.power[POWER_HAPPINESS]);
    upkt.AddLong(    UNIT_FIELD_POWER6,                       P.CharData.power[POWER_RUNES]);
    upkt.AddLong(    UNIT_FIELD_POWER7,                       P.CharData.power[POWER_RUNIC]);
    upkt.AddLong(    UNIT_FIELD_MAXHEALTH,                    P.CharData.max_health);
    upkt.AddLong(    UNIT_FIELD_MAXPOWER1,                    P.CharData.max_power[POWER_MANA]);
    upkt.AddLong(    UNIT_FIELD_MAXPOWER2,                    P.CharData.max_power[POWER_RAGE]);
    upkt.AddLong(    UNIT_FIELD_MAXPOWER3,                    P.CharData.max_power[POWER_FOCUS]);
    upkt.AddLong(    UNIT_FIELD_MAXPOWER4,                    P.CharData.max_power[POWER_ENERGY]);
    upkt.AddLong(    UNIT_FIELD_MAXPOWER5,                    P.CharData.max_power[POWER_HAPPINESS]);
    upkt.AddLong(    UNIT_FIELD_MAXPOWER6,                    P.CharData.max_power[POWER_RUNES]);
    upkt.AddLong(    UNIT_FIELD_MAXPOWER7,                    P.CharData.max_power[POWER_RUNIC]);
    upkt.AddLong(    UNIT_FIELD_LEVEL,                        P.CharData.Enum.experienceLevel);
    upkt.AddLong(    UNIT_FIELD_FACTIONTEMPLATE,              P.CharData.faction_template);
    upkt.AddLong(    UNIT_FIELD_FLAGS,                        P.CharData.flags);
    upkt.AddLong(    UNIT_FIELD_FLAGS_2,                      P.CharData.flags2);
    upkt.AddLong(    UNIT_FIELD_BASEATTACKTIME+0,             P.CharData.mainhand_attack_time);
    upkt.AddLong(    UNIT_FIELD_BASEATTACKTIME+1,             P.CharData.offhand_attack_time);
    upkt.AddLong(    UNIT_FIELD_RANGEDATTACKTIME,             P.CharData.ranged_attack_time);
    upkt.AddFloat(   UNIT_FIELD_BOUNDINGRADIUS,               P.CharData.bounding_radius);
    upkt.AddFloat(   UNIT_FIELD_COMBATREACH,                  P.CharData.combat_reach);
    upkt.AddLong(    UNIT_FIELD_DISPLAYID,                    P.CharData.enum_model);
    upkt.AddLong(    UNIT_FIELD_NATIVEDISPLAYID,              P.CharData.native_model);
    upkt.AddLong(    UNIT_FIELD_MOUNTDISPLAYID,               P.CharData.mount_model);
    upkt.AddLong(    UNIT_FIELD_BYTES_1,                      P.CharData.stand_state or (0 shl 8) or (0 shl 16) or (0 shl 24));
    upkt.AddFloat(   UNIT_MOD_CAST_SPEED,                     1.0);
    upkt.AddLong(    UNIT_FIELD_BASE_MANA,                    P.CharData.base_mana);
    upkt.AddLong(    UNIT_FIELD_BASE_HEALTH,                  P.CharData.base_health);
    upkt.AddLong(    UNIT_FIELD_BYTES_2,                      P.CharData.sheathed or (0 shl 8) or (0 shl 16) or (0 shl 24));
    upkt.AddFloat(   UNIT_FIELD_HOVERHEIGHT,                  1.0);
    upkt.AddLong(    PLAYER_FLAGS,                            P.CharData.player_flags);
    upkt.AddLong(    PLAYER_BYTES,                            P.CharData.Enum.skinID or (P.CharData.Enum.faceID shl 8) or (P.CharData.Enum.hairStyleID shl 16) or (P.CharData.Enum.hairColorID shl 24));
    upkt.AddLong(    PLAYER_BYTES_2,                          P.CharData.Enum.facialHairStyleID or (0 shl 8) or (0 shl 16) or (P.CharData.Enum.restInfo shl 24));
    upkt.AddLong(    PLAYER_BYTES_3,                          P.CharData.Enum.sexID or (0 shl 8) or (0 shl 16) or (0 shl 24));

    delta:= PLAYER_VISIBLE_ITEM_2_ENTRYID - PLAYER_VISIBLE_ITEM_1_ENTRYID;
    for i:= 0 to PLAYER_VISIBLE_ITEMS_COUNT-1 do
      if P.CharData.inventory_bag[0][i].Entry <> 0 then
        upkt.AddLong(PLAYER_VISIBLE_ITEM_1_ENTRYID + i*delta, P.CharData.inventory_bag[0][i].Entry );

    upkt.MakeUpdateBlock(@upkt_buf);

  pkt.AddByte(SBuf, upkt.blocks);
  pkt.AddArray(SBuf, @upkt_buf, upkt.data_ofs);
  SockSend(pkt.pktLen);
end;
procedure TWorldUser.Send_CreateFromGameObject(OBJ: TWorldRecord);
begin

end;

procedure TWorldUser.Send_UpdateFromPlayer_Move(MR: TMovementRecord);
var
  omsg: T_MSG_MOVE_STATE;
begin
  // dont send for self
  if self.CharData.Enum.GUID = MR.GUID then exit;

  omsg.GUID:= MR.GUID;
  omsg.MovementInfo.m_lastNetMsgID:= MR.OpCode;
  omsg.MovementInfo.m_moveFlags:= MR.Flags;
  omsg.MovementInfo.m_moveStartTime:= MR.StartTime;
  omsg.MovementInfo.m_position.x:= MR.x;
  omsg.MovementInfo.m_position.y:= MR.y;
  omsg.MovementInfo.m_position.z:= MR.z;
  omsg.MovementInfo.m_facing:= MR.facing;
  omsg.MovementInfo.Transport.GUID:= MR.TransportGUID;
  omsg.MovementInfo.Transport.Position.x:= MR.TransportX;
  omsg.MovementInfo.Transport.Position.y:= MR.TransportY;
  omsg.MovementInfo.Transport.Position.z:= MR.TransportZ;
  omsg.MovementInfo.Transport.Facing:= MR.TransportF;
  omsg.MovementInfo.m_pitch:= MR.Pitch;
  omsg.MovementInfo.m_fallenTime:= MR.FallenTime;
  omsg.MovementInfo.m_jumpVelocity:= MR.jumpVelocity;
  omsg.MovementInfo.m_cosAnchorPitch:= MR.cosAnchorPitch;
  omsg.MovementInfo.m_sinAnchorPitch:= MR.sinAnchorPitch;
  omsg.MovementInfo.m_fallStartElevation:= MR.fallStartElevation;
  SockSend(msgBuild(SBuf, omsg));
end;
procedure TWorldUser.Send_UpdateFromPlayer_ForceRunSpeed(guid: uInt64; value: single);
var
  omsg: T_SMSG_FORCE_RUN_SPEED_CHANGE;
begin
  omsg.GUID:= guid;
  omsg.Count:= 0;
  omsg.unk:= 1;
  omsg.Value:= value;
  SockSend(msgBuild(SBuf, omsg));
end;
procedure TWorldUser.Send_UpdateFromPlayer_ForceSwimSpeed(guid: uInt64; value: single);
var
  omsg: T_SMSG_FORCE_SWIM_SPEED_CHANGE;
begin
  omsg.GUID:= guid;
  omsg.Count:= 0;
  omsg.Value:= value;
  SockSend(msgBuild(SBuf, omsg));
end;
procedure TWorldUser.Send_UpdateFromPlayer_ForceFlightSpeed(guid: uInt64; value: single);
var
  omsg: T_SMSG_FORCE_FLIGHT_SPEED_CHANGE;
begin
  omsg.GUID:= guid;
  omsg.Count:= 0;
  omsg.Value:= value;
  SockSend(msgBuild(SBuf, omsg));
end;
procedure TWorldUser.Send_UpdateFromPlayer_SetCanFly(guid: uInt64);
var
  omsg: T_SMSG_MOVE_SET_CAN_FLY;
begin
  omsg.GUID:= guid;
  omsg.Count:= 0;
  SockSend(msgBuild(SBuf, omsg));
end;
procedure TWorldUser.Send_UpdateFromPlayer_UnsetCanFly(guid: uInt64);
var
  omsg: T_SMSG_MOVE_UNSET_CAN_FLY;
begin
  omsg.GUID:= guid;
  omsg.Count:= 0;
  SockSend(msgBuild(SBuf, omsg));
end;
procedure TWorldUser.Send_UpdateFromPlayer_Values(OBJ: TWorldRecord; VR: CValuesRecord);
var
  upkt: Tupkt;
  upkt_buf: array[0..65535] of byte;
  i: longint;
  P: TWorldUser;
  FIELD, item_slot: longint;
begin
  P:= TWorldUser(OBJ.woAddr);

  // dont send for self
  if self.CharData.Enum.GUID = P.CharData.Enum.GUID then exit;

  if Length(VR.Values) = 0 then exit;

  pkt.InitCmd(SBuf, SMSG_UPDATE_OBJECT);
  pkt.AddLong(SBuf, 1);
  pkt.AddByte(SBuf, 0); // values
  pkt.AddGUID(SBuf, P.CharData.Enum.GUID);

    upkt.Init(PLAYER_END);

    for i:= 0 to Length(VR.Values)-1 do
    begin
      FIELD:= VR.Values[i];

      Case FIELD of
        OBJECT_FIELD_SCALE_X:       upkt.AddFloat( FIELD,   P.CharData.scale_x);
        UNIT_FIELD_DISPLAYID:       upkt.AddLong(  FIELD,   P.CharData.enum_model);
        UNIT_FIELD_NATIVEDISPLAYID: upkt.AddLong(  FIELD,   P.CharData.native_model);
        UNIT_FIELD_MOUNTDISPLAYID:  upkt.AddLong(  FIELD,   P.CharData.mount_model);
        UNIT_FIELD_BYTES_1:         upkt.AddLong(  FIELD,   P.CharData.stand_state or (P.CharData.stealth_visual_effect shl 8) or (P.CharData.shape_shift_form shl 16) or (P.CharData.shape_shift_stand shl 24));
        UNIT_FIELD_BYTES_2:         upkt.AddLong(  FIELD,   P.CharData.sheathed or (0 shl 8) or (0 shl 16) or (P.CharData.Enum.restInfo shl 24));
        PLAYER_VISIBLE_ITEM_1_ENTRYID..PLAYER_VISIBLE_ITEM_19_ENCHANTMENT:
        begin
          item_slot:= (FIELD -PLAYER_VISIBLE_ITEM_1_ENTRYID) div (PLAYER_VISIBLE_ITEM_2_ENTRYID - PLAYER_VISIBLE_ITEM_1_ENTRYID);
          upkt.AddLong(                            FIELD,   P.CharData.inventory_bag[0][item_slot].Entry);
        end;
      End;
    end;

    if not upkt.MakeUpdateBlock(@upkt_buf) then exit;

  pkt.AddByte(SBuf, upkt.blocks);
  pkt.AddArray(SBuf, @upkt_buf, upkt.data_ofs);
  SockSend(pkt.pktLen);
end;
procedure TWorldUser.Send_UpdateFromPlayer_AttackStart(guid_attacker, guid_target: uInt64);
var
  omsg: T_SMSG_ATTACKSTART;
begin
  omsg.AttackerGUID:= guid_attacker;
  omsg.TargetGUID:= guid_target;
  SockSend(msgBuild(SBuf, omsg));
end;
procedure TWorldUser.Send_UpdateFromPlayer_AttackStop(guid_attacker, guid_target: uInt64);
var
  omsg: T_SMSG_ATTACKSTOP;
begin
  omsg.AttackerGUID:= guid_attacker;
  omsg.TargetGUID:= guid_target;
  omsg.Following:= 0;
  SockSend(msgBuild(SBuf, omsg));
end;
procedure TWorldUser.Send_UpdateFromPlayer_SpellStart(SR: TSpellRecord);
var
  omsg: T_SMSG_SPELL_START;
begin
  omsg.CasterGUID:= SR.caster_guid;
  omsg.CasterLinkedGUID:= SR.caster_guid;
  omsg.SpellCastCount:= SR.spell_cast_count;
  omsg.SpellID:= SR.spell_id;
  omsg.CastFlags:= 2; // flags [2] [F]
  omsg.Duration:= SR.spell_cast_duration;
  omsg.TargetFlags:= SR.target_flags;
  omsg.TargetGUID:= SR.target_guid;
  omsg.TargetPosition.x:= SR.target_x;
  omsg.TargetPosition.y:= SR.target_y;
  omsg.TargetPosition.z:= SR.target_z;
  SockSend(msgBuild(SBuf, omsg));
end;
procedure TWorldUser.Send_UpdateFromPlayer_SpellGo(SR: TSpellRecord);
var
  omsg: T_SMSG_SPELL_GO;
begin
  omsg.CasterGUID:= SR.caster_guid;
  omsg.CasterLinkedGUID:= SR.caster_guid;
  omsg.SpellCastCount:= SR.spell_cast_count;
  omsg.SpellID:= SR.spell_id;
  omsg.CastFlags:= $100;
  omsg.CastStartTime:= SR.spell_cast_start_time;
  SetLength(omsg.AffectedTarget, 1);
  omsg.AffectedTarget[0]:= SR.target_guid;
  SetLength(omsg.ResistedTarget, 0);
  omsg.TargetFlags:= SR.target_flags;
  omsg.TargetGUID:= SR.target_guid;
  omsg.TargetPosition.x:= SR.target_x;
  omsg.TargetPosition.y:= SR.target_y;
  omsg.TargetPosition.z:= SR.target_z;
  SockSend(msgBuild(SBuf, omsg));
end;

procedure TWorldUser.Send_UpdateFromUnit_Values(OBJ: TWorldRecord; VR: CValuesRecord);
var
  upkt: Tupkt;
  upkt_buf: array[0..65535] of byte;
  i: longint;
  U: TWorldUnit;
  FIELD: longint;
begin
  U:= TWorldUnit(OBJ.woAddr);

  if Length(VR.Values) = 0 then exit;

  pkt.InitCmd(SBuf, SMSG_UPDATE_OBJECT);
  pkt.AddLong(SBuf, 1);
  pkt.AddByte(SBuf, 0); // values
  pkt.AddGUID(SBuf, U.woGUID);

    upkt.Init(UNIT_END);

    for i:= 0 to Length(VR.Values)-1 do
    begin
      FIELD:= VR.Values[i];

      Case FIELD of
        OBJECT_FIELD_SCALE_X:        upkt.AddFloat( FIELD,  U.woScaleX);
        UNIT_FIELD_FACTIONTEMPLATE:  upkt.AddLong(  FIELD,  U.unFactionTemplate);
        UNIT_FIELD_DISPLAYID:        upkt.AddLong(  FIELD,  U.unDisplayID);
        UNIT_FIELD_NATIVEDISPLAYID:  upkt.AddLong(  FIELD,  U.unDisplayID);
        UNIT_FIELD_MOUNTDISPLAYID:   upkt.AddLong(  FIELD,  U.unMountDisplayID);
        UNIT_FIELD_BYTES_1:          upkt.AddLong(  FIELD,  U.unFieldBytes1);
        UNIT_FIELD_BYTES_2:          upkt.AddLong(  FIELD,  U.unFieldBytes2);
      End;
    end;
    if not upkt.MakeUpdateBlock(@upkt_buf) then exit;

  pkt.AddByte(SBuf, upkt.blocks);
  pkt.AddArray(SBuf, @upkt_buf, upkt.data_ofs);

  SockSend(pkt.pktLen);
end;

procedure TWorldUser.Teleport(NewMap, NewZone: Word; NewPosX, NewPosY, NewPosZ, NewPosF: Single);
var
  OBJ: TWorldRecord;
  omsg1: T_SMSG_TRANSFER_PENDING;
  omsg2: T_SMSG_NEW_WORLD;
  omsg3: T_MSG_MOVE_TELEPORT_ACK;
begin
  if NewMap <> CharData.Enum.mapID then
  begin
    // delete from world and other players immediately
    OBJ.woType:= WO_PLAYER;
    OBJ.woGUID:= CharData.Enum.GUID;
    OBJ.woMap:= CharData.Enum.mapID;
    OBJ.woAddr:= self;
    World.Del(OBJ);
    ListWorldUsers.Send_Destroy(CharData.Enum.GUID);

    // start transfer
    omsg1.WorldID:= NewMap;
    SockSend(msgBuild(SBuf, omsg1));

    // worldport
    omsg2.MapID:= NewMap;
    omsg2.Position.X:= NewPosX;
    omsg2.Position.Y:= NewPosY;
    omsg2.Position.Z:= NewPosZ;
    omsg2.Facing:= NewPosF;
    SockSend(msgBuild(SBuf, omsg2));
  end
  else
  begin
    // teleport within World
    omsg3.GUID:= CharData.Enum.GUID;
    omsg3.MoveCount:= 0;
    omsg3.MoveFlags:= 0;
    omsg3.MoveFlags2:= 0;
    omsg3.MoveStartTime:= GetTickCount;
    omsg3.Position.x:= NewPosX;
    omsg3.Position.y:= NewPosY;
    omsg3.Position.z:= NewPosZ;
    omsg3.Facing:= NewPosF;
    omsg3.Unk:= 0;
    SockSend(msgBuild(SBuf, omsg3));
  end;

  CharData.Enum.mapID:= NewMap;
  CharData.Enum.zoneID:= NewZone;
  CharData.Enum.position.x:= NewPosX;
  CharData.Enum.position.y:= NewPosY;
  CharData.Enum.position.z:= NewPosZ;
  CharData.facing:= NewPosF;
end;
procedure TWorldUser.Send_Message(guid: uInt64; MSGType: byte; Language: longint; Channel: String; MSG: string);
var
  omsg: T_SMSG_MESSAGECHAT;
begin
  omsg.TypeID:= MSGType;
  omsg.LangID:= Language;
  omsg.OriginatorGUID:= guid;
  omsg.TargetName:= Channel;
  omsg.Text:= MSG;
  SockSend(msgBuild(SBuf, omsg));
end;

// -----------------------------------------------------------------------------

{ TListLoginUsers }
constructor TListLoginUsers.Create;
begin
  SetLength(List, 0);
end;
procedure TListLoginUsers.Free;
var
  i: longint;
begin
  for i:=0 to Length(List)-1 do
  begin
    Shutdown(List[i].LoginUser.Sock, 1);
    CloseSocket(List[i].LoginUser.Sock);
    List[i].LoginUser.Free;
  end;
  SetLength(List, 0);
  Destroy;
end;
procedure TListLoginUsers.Add(sid: longint; User: TLoginUser);
var
  count: longint;
begin
  count:= Length(List);
  inc(count);
  SetLength(List, count);

  List[count-1].LoginUser:= User;
  List[count-1].sid:= sid;
end;
procedure TListLoginUsers.Del(sid: longint);
var
  i, k: longint;
begin
  if Length(List) = 0 then exit;

  for i:= 0 to Length(List)-1 do
    if List[i].sid = sid then
    begin
      for k:= i+1 to Length(List)-1 do
        List[k-1]:= List[k];
      k:= Length(List);
      dec(k);
      if k < 0 then k:= 0;
      SetLength(List, k);
    end;
end;
function  TListLoginUsers.Count: longint;
begin
  result:= Length(List);
end;
function  TListLoginUsers.GetUserByIndex(index: longint): TLoginUser;
begin
  result:= nil;

  if index < 0 then exit;
  if Length(List) = 0 then exit;
  if index > Length(List)-1 then exit;

  result:= List[index].LoginUser;
end;
function  TListLoginUsers.GetUserBySocket(sid: longint): TLoginUser;
var
  i: longint;
begin
  result:= nil;

  if sid = 0 then exit;
  if Length(List) = 0 then exit;

  for i:= 0 to Length(List)-1 do
    if List[i].sid = sid then
    begin
      result:= List[i].LoginUser;
      exit;
    end;
end;

// -----------------------------------------------------------------------------

{ TListWorldUsers }
constructor TListWorldUsers.Create;
begin
  SetLength(List, 0);
end;
procedure TListWorldUsers.Free;
var
  i: longint;
begin
  for i:= 0 to Length(List)-1 do
  begin
    Shutdown(List[i].WorldUser.Sock, 1);
    CloseSocket(List[i].WorldUser.Sock);
    List[i].WorldUser.Free;
  end;
  SetLength(List, 0);
  Destroy;
end;
procedure TListWorldUsers.Add(sid: longint; User: TWorldUser);
var
  count: longint;
begin
  count:= Length(List);
  inc(count);
  SetLength(List, count);

  List[count-1].WorldUser:= User;
  List[count-1].sid:= sid;
end;
procedure TListWorldUsers.Del(sid: longint);
var
  i, k: longint;
begin
  if Length(List) = 0 then exit;

  for i:= 0 to Length(List)-1 do
    if List[i].sid = sid then
    begin
      for k:= i+1 to Length(List)-1 do
        List[k-1]:= List[k];
      k:= Length(List);
      dec(k);
      if k < 0 then k:= 0;
      SetLength(List, k);
    end;
end;
function  TListWorldUsers.Count: longint;
begin
  result:= Length(List);
end;
function  TListWorldUsers.GetUserByName(nm: String): TWorldUser;
var
  i: longint;
begin
  result:= nil;

  if nm = '' then exit;
  if Length(List) = 0 then exit;

  for i:= 0 to Length(List)-1 do
    if List[i].WorldUser.CharData.Enum.name = nm then
     begin
       result:= List[i].WorldUser;
       exit;
     end;
end;
function  TListWorldUsers.GetUserByIndex(index: longint): TWorldUser;
begin
  result:= nil;

  if index < 0 then exit;
  if Length(List) = 0 then exit;
  if index > Length(List)-1 then exit;

  result:= List[index].WorldUser;
end;
function  TListWorldUsers.GetUserBySocket(sid: longint): TWorldUser;
var
  i: longint;
begin
  result:= nil;

  if sid = 0 then exit;
  if Length(List) = 0 then exit;

  for i:= 0 to Length(List)-1 do
  if List[i].sid = sid then
    begin
      result:= List[i].WorldUser;
      exit;
    end;
end;

procedure TListWorldUsers.Send_Destroy(guid: uInt64);
var
  i: longint;
begin
  for i:= 0 to World.Count-1 do
    if World.ObjectByIndex[i].woType = WO_PLAYER then
      TWorldUser(World.ObjectByIndex[i].woAddr).Send_Destroy(guid);
end;
procedure TListWorldUsers.Send_CreateFromUnit(OBJ: TWorldRecord);
var
  i: longint;
begin
  for i:= 0 to World.Count-1 do
    if World.ObjectByIndex[i].woType = WO_PLAYER then
      TWorldUser(World.ObjectByIndex[i].woAddr).Send_CreateFromUnit(OBJ);
end;
procedure TListWorldUsers.Send_CreateFromPlayer(OBJ: TWorldRecord);
var
  i: longint;
begin
  for i:= 0 to World.Count-1 do
    if World.ObjectByIndex[i].woType = WO_PLAYER then
      TWorldUser(World.ObjectByIndex[i].woAddr).Send_CreateFromPlayer(OBJ);
end;

procedure TListWorldUsers.Send_UpdateFromPlayer_Move(MR: TMovementRecord);
var
  i: longint;
begin
  for i:= 0 to World.Count-1 do
    if World.ObjectByIndex[i].woType = WO_PLAYER then
      TWorldUser(World.ObjectByIndex[i].woAddr).Send_UpdateFromPlayer_Move(MR);
end;
procedure TListWorldUsers.Send_UpdateFromPlayer_ForceRunSpeed(guid: uInt64; value: single);
var
  i: longint;
begin
  for i:= 0 to World.Count-1 do
    if World.ObjectByIndex[i].woType = WO_PLAYER then
      TWorldUser(World.ObjectByIndex[i].woAddr).Send_UpdateFromPlayer_ForceRunSpeed(guid, value);
end;
procedure TListWorldUsers.Send_UpdateFromPlayer_ForceSwimSpeed(guid: uInt64; value: single);
var
  i: longint;
begin
  for i:= 0 to World.Count-1 do
    if World.ObjectByIndex[i].woType = WO_PLAYER then
      TWorldUser(World.ObjectByIndex[i].woAddr).Send_UpdateFromPlayer_ForceSwimSpeed(guid, value);
end;
procedure TListWorldUsers.Send_UpdateFromPlayer_ForceFlightSpeed(guid: uInt64; value: single);
var
  i: longint;
begin
  for i:= 0 to World.Count-1 do
    if World.ObjectByIndex[i].woType = WO_PLAYER then
      TWorldUser(World.ObjectByIndex[i].woAddr).Send_UpdateFromPlayer_ForceFlightSpeed(guid, value);
end;
procedure TListWorldUsers.Send_UpdateFromPlayer_SetCanFly(guid: uInt64);
var
  i: longint;
begin
  for i:= 0 to World.Count-1 do
    if World.ObjectByIndex[i].woType = WO_PLAYER then
      TWorldUser(World.ObjectByIndex[i].woAddr).Send_UpdateFromPlayer_SetCanFly(guid);
end;
procedure TListWorldUsers.Send_UpdateFromPlayer_UnsetCanFly(guid: uInt64);
var
  i: longint;
begin
  for i:= 0 to World.Count-1 do
    if World.ObjectByIndex[i].woType = WO_PLAYER then
      TWorldUser(World.ObjectByIndex[i].woAddr).Send_UpdateFromPlayer_UnsetCanFly(guid);
end;
procedure TListWorldUsers.Send_UpdateFromPlayer_Values(OBJ: TWorldRecord; VR: CValuesRecord);
var
  i: longint;
begin
  for i:= 0 to World.Count-1 do
    if World.ObjectByIndex[i].woType = WO_PLAYER then
      TWorldUser(World.ObjectByIndex[i].woAddr).Send_UpdateFromPlayer_Values(OBJ, VR);
end;
procedure TListWorldUsers.Send_UpdateFromPlayer_AttackStart(guid_attacker, guid_target: uInt64);
var
  i: longint;
begin
  for i:= 0 to World.Count-1 do
    if World.ObjectByIndex[i].woType = WO_PLAYER then
      TWorldUser(World.ObjectByIndex[i].woAddr).Send_UpdateFromPlayer_AttackStart(guid_attacker, guid_target);
end;
procedure TListWorldUsers.Send_UpdateFromPlayer_AttackStop(guid_attacker, guid_target: uInt64);
var
  i: longint;
begin
  for i:= 0 to World.Count-1 do
    if World.ObjectByIndex[i].woType = WO_PLAYER then
      TWorldUser(World.ObjectByIndex[i].woAddr).Send_UpdateFromPlayer_AttackStop(guid_attacker, guid_target);
end;
procedure TListWorldUsers.Send_UpdateFromPlayer_SpellStart(SR: TSpellRecord);
var
  i: longint;
begin
  for i:= 0 to World.Count-1 do
    if World.ObjectByIndex[i].woType = WO_PLAYER then
      TWorldUser(World.ObjectByIndex[i].woAddr).Send_UpdateFromPlayer_SpellStart(SR);
end;
procedure TListWorldUsers.Send_UpdateFromPlayer_SpellGo(SR: TSpellRecord);
var
  i: longint;
begin
  for i:= 0 to World.Count-1 do
    if World.ObjectByIndex[i].woType = WO_PLAYER then
      TWorldUser(World.ObjectByIndex[i].woAddr).Send_UpdateFromPlayer_SpellGo(SR);
end;

procedure TListWorldUsers.Send_UpdateFromUnit_Values(OBJ: TWorldRecord; VR: CValuesRecord);
var
  i: longint;
begin
  for i:= 0 to World.Count-1 do
    if World.ObjectByIndex[i].woType = WO_PLAYER then
      TWorldUser(World.ObjectByIndex[i].woAddr).Send_UpdateFromUnit_Values(OBJ, VR);
end;

procedure TListWorldUsers.Send_Message(guid:uInt64; MSGType:Byte; Language: LongInt; Channel:String; MSG: string);
var
  i: longint;
begin
  for i:= 0 to World.Count-1 do
    if World.ObjectByIndex[i].woType = WO_PLAYER then
      TWorldUser(World.ObjectByIndex[i].woAddr).Send_Message(guid, MSGType, Language, Channel, MSG);
end;

// -----------------------------------------------------------------------------

initialization
  InitializeCriticalSection(csRecvCriticalSection);
  InitializeCriticalSection(csSendCriticalSection);
  InitializeCriticalSection(wsRecvCriticalSection);
  InitializeCriticalSection(wsSendCriticalSection);

finalization
  DeleteCriticalSection(csRecvCriticalSection);
  DeleteCriticalSection(csSendCriticalSection);
  DeleteCriticalSection(wsRecvCriticalSection);
  DeleteCriticalSection(wsSendCriticalSection);

end.
