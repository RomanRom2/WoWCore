unit SRP6_LockBox;

{$H+}

interface

uses
  LbBigInt, LbClass, LbCipher;

type
  TSRP6 = packed record
    Login: String;
    LP_HASH: array [0..19] of Byte;
    SRP6_N: array [0..31] of Byte;
    SRP6_Salt: array [0..31] of Byte;
    SRP6_sB: array [0..19] of Byte;
    SRP6_B: array [0..31] of Byte;
    SRP6_v: array [0..31] of Byte;
    SRP6_g: Byte;
    SRP6_A: array [0..31] of Byte;
    SRP6_M1: array [0..19] of Byte;
    SRP6_M2: array [0..19] of Byte;
    Session: array [0..39] of Byte;
  end;

procedure SRP6_init();
procedure SRP6_free();
procedure SRP6_start(var P: TSRP6);
function  SRP6_final(var P: TSRP6): Boolean;

implementation

var
  SRP6_N: TLbBigInt;

procedure SetHexStr(var B: TLbBigInt; HEX: String);

  function HexChar(C: Char): Byte;
  begin
    case C of
      '0'..'9': Result := Byte(C) - Byte('0');
      'a'..'f': Result := (Byte(C) - Byte('a')) + 10;
      'A'..'F': Result := (Byte(C) - Byte('A')) + 10;
    else
      Result := 0;
    end;
  end;

var
  Buffer: array of Byte;
  I: longint;
begin
  SetLength(Buffer, Length(HEX) shr 1);
  for I := 0 to High(Buffer) do
    Buffer[I] := (HexChar(HEX[(I shl 1) + 1]) shl 4) + HexChar(HEX[(I shl 1) + 2]);

  B.CopyBuffer(Buffer[0], Length(Buffer));
end;
procedure SRP6_init();
begin
  SRP6_N := TLbBigInt.Create(0);

  SetHexStr(SRP6_N, '894B645E89E1535BBDAD5B8B290650530801B18EBFBF5E8FAB3C82872A3E9BB7');
end;
procedure SRP6_free();
begin
  SRP6_N.Free;
end;
procedure SRP6_start(var P: TSRP6);
var
  Hasher: TLbSHA1;
  Digest: TSHA1Digest;

  SRP6_x: TLbBigInt;
  SRP6_v: TLbBigInt;
  SRP6_sB: TLbBigInt;
  SRP6_g: TLbBigInt;
  SRP6_B: TLbBigInt;

  I: longint;
  ABuf: array of Byte;
begin
  SRP6_N.ToBuffer(P.SRP6_N, 32);

  Randomize;
  for I := 0 to 31 do
    P.SRP6_Salt[I] := Random(255);

  P.SRP6_g := 7;

  SetLength(ABuf, 32 + 20);
  Move(P.SRP6_Salt[0], ABuf[0], 32);
  Move(P.LP_HASH[0], ABuf[32], 20);

  Hasher := TLbSHA1.Create(nil);
  Hasher.HashBuffer(ABuf[0], 32 + 20);
  Hasher.GetDigest(Digest);
  Hasher.Free;

  SetLength(ABuf, 0);

  SRP6_x := TLbBigInt.Create(0);
  SRP6_x.CopyBuffer(Digest, SizeOf(Digest));

  SRP6_v := TLbBigInt.Create(0);
  SRP6_v.CopyByte(7);
  SRP6_v.PowerAndMod(SRP6_x, SRP6_N);
  SRP6_v.ToBuffer(P.SRP6_v, 32);

  SRP6_sB := TLbBigInt.Create(0);
  SRP6_sB.RandomBytes(20);
  SRP6_sB.ToBuffer(P.SRP6_sB, 20);

  SRP6_g := TLbBigInt.Create(0);
  SRP6_g.CopyByte(7);
  SRP6_g.PowerAndMod(SRP6_sB, SRP6_N);

  SRP6_B := TLbBigInt.Create(0);
  SRP6_B.CopyByte(3);
  SRP6_B.Multiply(SRP6_v);
  SRP6_B.Add(SRP6_g);
  SRP6_B.Modulus(SRP6_N);
  SRP6_B.ToBuffer(P.SRP6_B, 32);

  SRP6_B.Free;
  SRP6_g.Free;
  SRP6_sB.Free;
  SRP6_v.Free;
  SRP6_x.Free;
end;
function  SRP6_final(var P: TSRP6): Boolean;
var
  Hasher: TLbSHA1;
  Digest: TSHA1Digest;

  SRP6_v: TLbBigInt;
  SRP6_sB: TLbBigInt;
  SRP6_B: TLbBigInt;
  SRP6_A: TLbBigInt;
  SRP6_U: TLbBigInt;
  SRP6_S: TLbBigInt;

  S: array [0..31] of Byte;
  S1: array [0..15] of Byte;
  S2: array [0..15] of Byte;

  I: longint;

  N_Hash: TSHA1Digest;
  G_Hash: TSHA1Digest;
  User_Hash: TSHA1Digest;
  NG_Hash: TSHA1Digest;

  ABuf: array of Byte;
  int_login: AnsiString;
begin
  SRP6_v := TLbBigInt.Create(0);
  SRP6_v.CopyBuffer(P.SRP6_v, 32);

  SRP6_sB := TLbBigInt.Create(0);
  SRP6_sB.CopyBuffer(P.SRP6_sB, 20);

  SRP6_B := TLbBigInt.Create(0);
  SRP6_B.CopyBuffer(P.SRP6_B, 32);

  SRP6_A := TLbBigInt.Create(0);
  SRP6_A.CopyBuffer(P.SRP6_A, 32);

  Hasher := TLbSHA1.Create(nil);

  SetLength(ABuf, 32 + 32);
  Move(P.SRP6_A[0], ABuf[0], 32);
  Move(P.SRP6_B[0], ABuf[32], 32);

  Hasher.HashBuffer(ABuf[0], 32 + 32);
  Hasher.GetDigest(Digest);

  SRP6_U := TLbBigInt.Create(0);
  SRP6_U.CopyBuffer(Digest, SizeOf(Digest));

  SRP6_S := TLbBigInt.Create(0);
  SRP6_S.Copy(SRP6_v);
  SRP6_S.PowerAndMod(SRP6_U, SRP6_N);
  SRP6_S.Multiply(SRP6_A);
  SRP6_S.PowerAndMod(SRP6_sB, SRP6_N);
  SRP6_S.ToBuffer(S, 32);

  SRP6_S.Free;
  SRP6_U.Free;
  SRP6_A.Free;
  SRP6_B.Free;
  SRP6_sB.Free;
  SRP6_v.Free;

  for I := 0 to 15 do
    S1[I] := S[I shl 1];

  for I := 0 to 15 do
    S2[I] := S[(I shl 1) + 1];

  Hasher.HashBuffer(S1, 16);
  Hasher.GetDigest(Digest);

  for I := 0 to 19 do P.Session[I shl 1] := Digest[I];

  Hasher.HashBuffer(S2, 16);
  Hasher.GetDigest(Digest);

  for I := 0 to 19 do P.Session[(I shl 1) + 1] := Digest[I];

  Hasher.HashBuffer(P.SRP6_N, 32);
  Hasher.GetDigest(N_Hash);

  Hasher.HashBuffer(P.SRP6_g, 1);
  Hasher.GetDigest(G_Hash);

  int_login:= AnsiString(P.Login);
  Hasher.HashBuffer((@int_login[1])^, Length(int_login));
  Hasher.GetDigest(User_Hash);

  for I := 0 to 19 do NG_Hash[I] := N_Hash[I] xor G_Hash[I];

  SetLength(ABuf, 20 + 20 + 32 + 32 + 32 + 40);
  Move(NG_Hash[0], ABuf[0], 20);
  Move(User_Hash[0], ABuf[20], 20);
  Move(P.SRP6_Salt[0], ABuf[20 + 20], 32);
  Move(P.SRP6_A[0], ABuf[20 + 20 + 32], 32);
  Move(P.SRP6_B[0], ABuf[20 + 20 + 32 + 32], 32);
  Move(P.Session[0], ABuf[20 + 20 + 32 + 32 + 32], 40);

  Hasher.HashBuffer(ABuf[0], 20 + 20 + 32 + 32 + 32 + 40);
  Hasher.GetDigest(Digest);

  Result := True;
  for I := 0 to 19 do
    if P.SRP6_M1[I] <> Digest[I] then
    begin
      Result := False;
      Break;
    end;

  if Result then
  begin
    SetLength(ABuf, 32 + 20 + 40);
    Move(P.SRP6_A[0], ABuf[0], 32);
    Move(P.SRP6_M1[0], ABuf[32], 20);
    Move(P.Session[0], ABuf[20 + 32], 40);

    Hasher.HashBuffer(ABuf[0], 32 + 20 + 40);
    Hasher.GetDigest(Digest);

    Move(Digest, P.SRP6_M2, 20);
  end;

  Hasher.Free;
  SetLength(ABuf, 0);
end;

end.