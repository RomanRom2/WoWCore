unit AuthServer;

interface

uses
  SRP6_LockBox, LbClass, LbCipher,
  SysUtils;

const
  AUTH_OK                              = 0;
  AUTH_BANNED                          = 3; // 3 - The World of Warcraft account has been closed and no longer in service
  AUTH_NOT_VALID                       = 4; // 4,5 - The information you have entered is not valid
  AUTH_NOT_VALID5                      = 5;
  AUTH_ALREADY_LOGGED                  = 6; // 6 - This account is already logged into World of Warcraft
  AUTH_NO_PREPAID_TIME                 = 7; // 7 - you have used up your prepaid time for this account. please purchase more to continue playing
  AUTH_TRY_LATER                       = 8; // 8 - could not login into wow at this time. please try again letter
  AUTH_INVALID_VERSION                 = 9; // 9 - invalid version
  AUTH_DOWNLOAD_FILE                   = 10;
  AUTH_SUSPENDED                       = 12; // 12 - this account has been suspended
  AUTH_BLOCKED_BY_PARENT               = 15; // 15 access to this account hase been blocked by parentals control

  TIMEZONE_DEVELOPMENT                 = 1;
  TIMEZONE_UNITED_STATES               = 2;
  TIMEZONE_OCEANIC                     = 3;
  TIMEZONE_LATIN_AMERICA               = 4;
  TIMEZONE_TOURNAMENT                  = 5;
  TIMEZONE_KOREA                       = 6;
  TIMEZONE_TOURNAMENT_2                = 7;
  TIMEZONE_ENGLISH                     = 8;
  TIMEZONE_GERMAN                      = 9;
  TIMEZONE_FRENCH                      = 10;
  TIMEZONE_SPANISH                     = 11;
  TIMEZONE_RUSSIAN                     = 12;
  TIMEZONE_TOURNAMENT_3                = 13;
  TIMEZONE_TAIWAN                      = 14;
  TIMEZONE_TOURNAMENT_4                = 15;
  TIMEZONE_CHINA                       = 16;
  TIMEZONE_CN1                         = 17;
  TIMEZONE_CN2                         = 18;
  TIMEZONE_CN3                         = 19;
  TIMEZONE_CN4                         = 20;
  TIMEZONE_CN5                         = 21;
  TIMEZONE_CN6                         = 22;
  TIMEZONE_CN7                         = 23;
  TIMEZONE_CN8                         = 24;
  TIMEZONE_TOURNAMENT_5                = 25;
  TIMEZONE_TEST_SERVER                 = 26;
  TIMEZONE_TOURNAMENT_6                = 27;
  TIMEZONE_QA_SERVER                   = 28;
  TIMEZONE_CN9                         = 29;

var
  REALM_ADDR: string;

procedure AuthServer_LogonChallenge(p: pointer);
procedure AuthServer_LogonProof(p: pointer);
procedure AuthServer_ReconnectChallenge(p: pointer);
procedure AuthServer_ReconnectProof(p: pointer);
procedure AuthServer_RealmList(p: pointer);

implementation

uses
  convert, logs,
  UpdateFields,
  NetMessages,
  ClassConnection;

var
  pktlen: word;

procedure pktSetLen(var buf: array of byte);
begin
  Buf[1]:= lo(pktLen-3);
  Buf[2]:= hi(pktLen-3);
end;
procedure pktInitCmd(var buf: array of byte; cmd: byte);
begin
  Buf[0]:= cmd;
  pktLen:= 3;
  pktSetLen(buf);
end;
procedure pktAddByte(var buf: array of byte; b: byte);
begin
  Buf[pktLen]:= b;
  pktLen:= pktLen+1;
  pktSetLen(buf);
end;
procedure pktAddWord(var buf: array of byte; w: word);
begin
  Buf[pktLen]:= lo(w); inc(pktLen);
  Buf[pktLen]:= hi(w); inc(pktLen);
  pktSetLen(buf);
end;
procedure pktAddLong(var buf: array of byte; l: longint);
var
  a: array[0..3] of byte;
  i: longint;
begin
  move(l, a, 4);
  for i:= 0 to 3 do
  begin
    Buf[pktLen]:= a[i];
    inc(pktLen);
  end;
  pktSetLen(buf);
end;
procedure pktAddFloat(var buf: array of byte; f:single);
var
  a: array[0..3] of byte;
  i: longint;
begin
  move(f, a, 4);
  for i:= 0 to 3 do
  begin
    Buf[pktLen]:=a[i];
    inc(pktLen);
  end;
  pktSetLen(buf);
end;
procedure pktAddStr(var buf: array of byte; s:string);
var
  i: longint;
begin
  for i:= 1 to length(s) do
  begin
    Buf[pktLen]:= ord(s[i]);
    inc(pktLen);
  end;
  pktSetLen(buf);
end;

procedure AuthServer_LogonChallenge(p: pointer);
var
  LoginUser: TLoginUser;
  i: longint;
  s: string;
  Hasher: TLbSHA1;
  LP: AnsiString;
begin
  LoginUser:= TLoginUser(p);

  s:= '';
  for i:= 1 to LoginUser.RBuf[33] do
    s:= s + chr(LoginUser.RBuf[34+i-1]);

  LoginUser.ClientLang:= chr(LoginUser.RBuf[24])+chr(LoginUser.RBuf[23])+chr(LoginUser.RBuf[22])+chr(LoginUser.RBuf[21]);
  LoginUser.ClientBuild:= LoginUser.RBuf[11]+256*LoginUser.RBuf[12];

  MainLog('AUTH_LOGON_CHALLENGE ['+s+'] ['+LoginUser.ClientLang+'] ['+strr(LoginUser.ClientBuild)+']');

  // check Client Build
  if vall(UPDATEFIELDS_BUILD) <> LoginUser.ClientBuild then
  begin
    MainLog('Version mismatch. Upgrade the SandBox.',1,0,0);

    LoginUser.SBuf[0]:= AUTH_LOGON_CHALLENGE;
    LoginUser.SBuf[1]:= 0;
    LoginUser.SBuf[2]:= AUTH_INVALID_VERSION;
    LoginUser.SBuf[3]:= 0;
    LoginUser.SockSend(4);

    exit;
  end;

  // check Account logged
  // 1 - logon list
  for i:= 0 to ListLoginUsers.Count-1 do
  begin
    if ListLoginUsers.UserByIndex[i].AccountName = s then
    begin
      MainLog('['+s+'] Already Logged to Realm', 1,0,0);

      LoginUser.SBuf[0]:= AUTH_LOGON_CHALLENGE;
      LoginUser.SBuf[1]:= 0;
      LoginUser.SBuf[2]:= AUTH_ALREADY_LOGGED;
      LoginUser.SBuf[3]:= 0;
      LoginUser.SockSend(4);

      exit;
    end;
  end;

  // 2 - world list
  for i:= 0 to ListWorldUsers.Count-1 do
    if ListWorldUsers.UserByIndex[i].AccountName = s then
    begin
      MainLog('['+s+'] Already Logged to World', 1,0,0);

      LoginUser.SBuf[0]:= AUTH_LOGON_CHALLENGE;
      LoginUser.SBuf[1]:= 0;
      LoginUser.SBuf[2]:= AUTH_ALREADY_LOGGED;
      LoginUser.SBuf[3]:= 0;
      LoginUser.SockSend(4);

      exit;
    end;

  LoginUser.AccountName:= s;

  LoginUser.Data.Login:= LoginUser.AccountName;

  Hasher:= TLbSHA1.Create(nil);
  LP:= AnsiString(LoginUser.Data.Login + ':' + LoginUser.Data.Login); // LOGIN = PASSW
  Hasher.HashBuffer((@LP[1])^, Length(LP));
  Hasher.GetDigest(TSHA1Digest(LoginUser.Data.LP_HASH));
  Hasher.Free;

  SRP6_start(LoginUser.Data);

  // clear send buffer
  for i:= 0 to 119 do
    LoginUser.SBuf[i]:= 0;

  // header
  LoginUser.SBuf[0]:= AUTH_LOGON_CHALLENGE;
  LoginUser.SBuf[1]:= AUTH_OK;

  // unk
  LoginUser.SBuf[2]:= 0;

  // [3..34] B
  Move(LoginUser.Data.SRP6_B[0], LoginUser.SBuf[3], 32);
  // [35..37] consts
  LoginUser.SBuf[35]:= 1;
  LoginUser.SBuf[36]:= 7;
  // [37, 38..69] modN
  LoginUser.SBuf[37]:= 32;
  Move(LoginUser.Data.SRP6_N[0], LoginUser.SBuf[38], 32);
  // [70..101] salt
  Move(LoginUser.Data.SRP6_Salt[0], LoginUser.SBuf[70], 32);
  // [102..117] crc
  for i:= 0 to 15 do
    LoginUser.SBuf[102 + i]:= 0;

  LoginUser.SockSend(119);
end;
procedure AuthServer_LogonProof(p: pointer);
var
  LoginUser: TLoginUser;
  i: longint;
begin
  LoginUser:= TLoginUser(p);

  MainLog('AUTH_LOGON_PROOF ['+LoginUser.AccountName+']');

  Move(LoginUser.RBuf[1], LoginUser.Data.SRP6_A, 32);
  Move(LoginUser.RBuf[33], LoginUser.Data.SRP6_M1, 20);

  if SRP6_final(LoginUser.Data) then
  begin
    // logon ok
    for i:= 0 to 32 do
      LoginUser.SBuf[i]:= 0;

    LoginUser.SBuf[0]:= AUTH_LOGON_PROOF;
    LoginUser.SBuf[1]:= AUTH_OK;
    Move(LoginUser.Data.SRP6_M2[0], LoginUser.SBuf[2], 20);
    LoginUser.SockSend(2+20+4 +6); // BK: +6 bytes
  end
  else
  begin
    MainLog('Password is incorrect', 1,0,0);

    LoginUser.SBuf[0]:= AUTH_LOGON_PROOF;
    LoginUser.SBuf[1]:= AUTH_NOT_VALID;
    LoginUser.SBuf[2]:= 0;
    LoginUser.SBuf[3]:= 0;
    LoginUser.SockSend(4)
  end;
end;
procedure AuthServer_ReconnectChallenge(p: pointer);
var
  LoginUser: TLoginUser;
  i: longint;
  s: string;
begin
  LoginUser:= TLoginUser(p);

  s:= '';
  for i:= 1 to LoginUser.RBuf[33] do
    s:= s + chr(LoginUser.RBuf[34+i-1]);

  LoginUser.AccountName:= s;
  LoginUser.ClientLang:= chr(LoginUser.RBuf[24])+chr(LoginUser.RBuf[23])+chr(LoginUser.RBuf[22])+chr(LoginUser.RBuf[21]);
  LoginUser.ClientBuild:= LoginUser.RBuf[11]+256*LoginUser.RBuf[12];

  MainLog('AUTH_RECONNECT_CHALLENGE ['+LoginUser.AccountName+'] ['+LoginUser.ClientLang+'] ['+strr(LoginUser.ClientBuild)+']');

  // check
  // - is account enabled
  // - is version matched
  // ...

  LoginUser.SBuf[0]:= AUTH_RECONNECT_CHALLENGE;
  LoginUser.SBuf[1]:= AUTH_OK;

  // reconnect server seed
  randomize;
  for i:= 0 to 15 do
  begin
    LoginUser.ReconnectServerSeed[i]:= random(254);
    LoginUser.SBuf[2+i]:= LoginUser.ReconnectServerSeed[i];
  end;

  // reconnect server zero
  for i:= 0 to 15 do
    LoginUser.SBuf[18+i]:= 0;

  LoginUser.SockSend(2+16+16);
end;
procedure AuthServer_ReconnectProof(p: pointer);
var
  LoginUser: TLoginUser;
  i: longint;
  Hasher: TLbSHA1;
  LP: AnsiString;
  ReconnectServerDigest: TSHA1Digest;
  ABuf: array of Byte;
  found: boolean;
begin
  LoginUser:= TLoginUser(p);

  MainLog('AUTH_RECONNECT_PROOF ['+LoginUser.AccountName+']');

  move(LoginUser.RBuf[1], LoginUser.ReconnectClientSeed[0], 16);
  move(LoginUser.RBuf[17], LoginUser.ReconnectClientDigest[0], 20);
  move(LoginUser.RBuf[27], LoginUser.ReconnectClientCRC[0], 20);

  // search logged account
  found:= false;
  for i:= 0 to ListWorldUsers.Count-1 do
    if ListWorldUsers.UserByIndex[i].AccountName = LoginUser.AccountName then
    begin
      MainLog('['+LoginUser.AccountName+'] found in the World', 1,0,0);
      found:= true;
      move(ListWorldUsers.UserByIndex[i].SessionKey[0], LoginUser.Data.Session[0], 40);
    end;

  if not found then
  begin
    // session expired
    MainLog('['+LoginUser.AccountName+'] is not found in the World', 1,0,0);
    LoginUser.SBuf[0]:= AUTH_RECONNECT_PROOF;
    LoginUser.SBuf[1]:= 1;
    LoginUser.SBuf[2]:= 0;
    LoginUser.SBuf[3]:= 0;
    LoginUser.SockSend(4);

    exit;
  end;

  LP:= AnsiString(LoginUser.AccountName);

  // server digest: sha1(login + client_seed + server_seed + session_key)
  Hasher:= TLbSHA1.Create(nil);
  SetLength(ABuf, Length(LP) + 16 + 16 + 40 + 100);
  Move((@LP[1])^, ABuf[0], Length(LP));
  Move(LoginUser.ReconnectClientSeed[0], ABuf[Length(LP)],       16);
  Move(LoginUser.ReconnectServerSeed[0], ABuf[Length(LP)+16],    16);
  Move(LoginUser.Data.Session[0],        ABuf[Length(LP)+16+16], 40);
  Hasher.HashBuffer(ABuf[0], Length(LP) + 16 + 16 + 40);
  Hasher.GetDigest(ReconnectServerDigest);
  Hasher.Free;

  // check digests
  for i:= 0 to 15 do
    if LoginUser.ReconnectClientDigest[i] <> ReconnectServerDigest[i] then
    begin
      MainLog('Session is expired');

      LoginUser.SBuf[0]:= AUTH_RECONNECT_PROOF;
      LoginUser.SBuf[1]:= 1;
      LoginUser.SBuf[2]:= 0;
      LoginUser.SBuf[3]:= 0;
      LoginUser.SockSend(4);
      exit;
    end;

  LoginUser.SBuf[0]:= AUTH_RECONNECT_PROOF;
  LoginUser.SBuf[1]:= AUTH_OK;
  LoginUser.SBuf[2]:= 0;
  LoginUser.SBuf[3]:= 0;
  LoginUser.SockSend(4);
end;
procedure AuthServer_RealmList(p: pointer);
var
  i: longint;
  LoginUser: TLoginUser;
begin
  LoginUser:= TLoginUser(p);

  MainLog('AUTH_REALM_LIST ['+LoginUser.AccountName+']');

  pktInitCmd(LoginUser.SBuf, AUTH_REALM_LIST);
  pktAddLong(LoginUser.SBuf, 0);

  pktAddWord(LoginUser.SBuf, 1); // 2.0.8 byte->word
  for i:= 1 to 1 do
  begin
    pktAddByte(LoginUser.SBuf, 0); // role
    pktAddByte(LoginUser.SBuf, 0); // lock
    pktAddByte(LoginUser.SBuf, 0); // status
    pktAddStr(LoginUser.SBuf, 'WoWCore SandBox 2.4.3'+#0);
    pktAddStr(LoginUser.SBuf, REALM_ADDR+':7000'+#0);
    pktAddFloat(LoginUser.SBuf, 0); // load
    pktAddByte(LoginUser.SBuf, 0); // chars
    pktAddByte(LoginUser.SBuf, 1); // locale
    pktAddByte(LoginUser.SBuf, 0); // unk
  end;

  pktAddByte(LoginUser.SBuf, 0);
  pktAddByte(LoginUser.SBuf, 2);

  LoginUser.SBuf[1]:= lo(pktlen-3);
  LoginUser.SBuf[2]:= hi(pktlen-3);

  LoginUser.SockSend(pktlen);
end;

end.
