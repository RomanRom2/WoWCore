unit HMAC;

interface

uses
  LbClass, LbCipher;

type
  PByteArray = ^TByteArray;
  TByteArray = array[0..32767] of Byte;

  THMAC_SHA = class (TObject)
  public
    constructor Create(const Key: array of Byte; KeyLen: Cardinal);
    procedure ReInit(const Key: array of Byte; KeyLen: Cardinal);
    procedure Update(const Buffer; BufLen: Cardinal);
    function Final(): TSHA1Digest;
  private
    opad : array [0..63] of byte;
    ipad : array [0..63] of byte;

    Context: TSHA1Context;
  end;
  THMAC_SHA1 = THMAC_SHA;

implementation

constructor THMAC_SHA.Create(const Key: array of Byte; KeyLen: Cardinal);
begin
  ReInit(Key, KeyLen);
end;
procedure THMAC_SHA.ReInit(const Key: array of Byte; KeyLen: Cardinal);
var
  I: Integer;
begin
  InitSHA1(Context);

  FillChar(ipad, 64, $36);
  FillChar(opad, 64, $5C);

  if KeyLen > 63 then KeyLen := 63;

  for I := 0 to KeyLen - 1 do
    begin
      ipad[I] := ipad[I] xor key[I];
      opad[I] := opad[I] xor key[I];
    end;

  UpdateSHA1(Context, ipad, 64);
end;
procedure THMAC_SHA.Update(const Buffer; BufLen: Cardinal);
begin
  UpdateSHA1(Context, Buffer, BufLen);
end;
function THMAC_SHA.Final(): TSHA1Digest;
var
  Hasher: TSHA1Context;
  Digest: TSHA1Digest;
begin
  FinalizeSHA1(Context, Digest);

  InitSHA1(Hasher);
  UpdateSHA1(Hasher, opad, 64);
  UpdateSHA1(Hasher, Digest, 20);
  FinalizeSHA1(Hasher, Result);
end;

end.
