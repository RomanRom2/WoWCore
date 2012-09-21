unit TMSGBufGets;

interface

uses
  ClassConnection;

function GetBufOpcode  (var Buf: TBuffer): word;
function GetBufPktLen  (var Buf: TBuffer): word;
function GetBufStr     (var Buf: TBuffer; var offs: longint): string;
function GetBufInt64   (var Buf: TBuffer; var offs: longint): uInt64;
function GetBufLong    (var Buf: TBuffer; var offs: longint): longint;
function GetBufword    (var Buf: TBuffer; var offs: longint): word;
function GetBufbyte    (var Buf: TBuffer; var offs: longint): byte;
function GetBufSingle  (var Buf: TBuffer; var offs: longint): single;
function GetBufGUID    (var Buf: TBuffer; var offs: longint): uInt64;
function GetBufArray   (var Buf: TBuffer; var offs: longint; OutBuf: pointer; len: longint): boolean;
                                                             
implementation

uses
  Convert;

function GetBufOpcode(var Buf: TBuffer): word;
begin
  result:= Buf[2] + 256 * Buf[3]
end;
function GetBufPktLen(var Buf: TBuffer): word;
begin
  result:= Buf[1] + 256 * Buf[0] + 2
end;
function GetBufStr(var Buf: TBuffer; var offs: longint): string;
var
  str: string;
begin
  str:= '';
  if Buf[offs] <> 0 then
    repeat
       str:= str + chr(Buf[offs]);
       inc(offs);
    until Buf[offs] = 0;
  inc(offs);
  result:= str;
end;
function GetBufInt64(var Buf: TBuffer; var offs: longint): uInt64;
begin
  move(Buf[offs], result, 8); inc(offs, 8);
end;
function GetBufLong(var Buf: TBuffer; var offs: longint): longint;
begin
  move(Buf[offs], result, 4); inc(offs, 4);
end;
function GetBufword(var Buf: TBuffer; var offs: longint): word;
begin
  move(Buf[offs], result, 2); inc(offs, 2);
end;
function GetBufbyte(var Buf: TBuffer; var offs: longint): byte;
begin
  move(Buf[offs], result, 1); inc(offs, 1);
end;
function GetBufSingle(var Buf: TBuffer; var offs: longint): single;
begin
  move(Buf[offs], result, 4); inc(offs, 4);
end;
function GetBufGUID(var Buf: TBuffer; var offs: longint): uInt64;
var
  guid_mask: byte;
  guid_mask_bin: string;
  a: array[0..7] of byte;
  i: longint;
begin
  move(Buf[offs], guid_mask, 1); inc(offs);
  guid_mask_bin:= reverse(IntToBin(guid_mask, 8, 0));
  for i:= 1 to 8 do
    begin
      if guid_mask_bin[i] = '1' then
        begin
          move(Buf[offs], guid_mask, 1); inc(offs);
          a[i-1]:= guid_mask;
        end
      else
        begin
          a[i-1]:= 0;
        end;
    end;
  move(a[0], result, 8);
end;
function GetBufArray(var Buf: TBuffer; var offs: longint; OutBuf: pointer; len: longint): boolean;
begin
  result:= true;
  move(Buf[offs], OutBuf^, len); inc(offs, len);
end;

end.