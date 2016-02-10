unit PacketBuilding;
 
interface

uses
  Windows;

Const
  WS_BUFFER_SIZE = 1024*64;
  A9_BUFFER_SIZE = 1024*16;

type
  Tpkt=object
    pktLen: word;
    procedure Init(var Buf: array of byte; pkt_len: word);
    procedure InitCmd(var Buf: array of byte; OpCode: word);
    procedure AddCmd(var Buf: array of byte; OpCode: word);
    procedure AddByte(var Buf: array of byte; data: byte);
    procedure AddStr(var Buf: array of byte; s: string);
    procedure AddInt64(var Buf: array of byte; i: int64);
    procedure AddGUID(var Buf: array of byte; i: int64);
    procedure AddWordLoHi(var Buf: array of byte; w: word);
    procedure AddWordHiLo(var Buf: array of byte; w: word);
    procedure AddWord(var Buf: array of byte; w: word);
    procedure AddFloat(var Buf: array of byte; f: single);
    procedure AddLong(var Buf: array of byte; l: longword);
    procedure AddInt(var Buf: array of byte; l: longint);
    procedure AddArrayStr(var Buf: array of byte; s: string; l: longint);
    procedure AddArray(var Buf: array of byte; p: pointer; plen: word);
    procedure AddDumpStr(var Buf: array of byte; s: string);

    procedure Assign(var Buf: array of byte);
    procedure InitA9(var Buf: array of byte; OpCode: word);
    procedure AddA9(var Buf: array of byte; const A9pkt: array of byte; A9Len: longint);
  end;

var
  pkt: Tpkt;

implementation

uses
  Convert;

procedure Tpkt.Init(var Buf: array of byte; pkt_len: word);
begin
  pktLen:= pkt_len;
  Buf[0]:= hi(pktLen);
  Buf[1]:= lo(pktLen);
end;
procedure Tpkt.InitCmd(var Buf: array of byte; OpCode: word);
begin
  pktLen:= 2;
  Buf[0]:= hi(pktLen);
  Buf[1]:= lo(pktLen);
  Buf[2]:= lo(OpCode);
  Buf[3]:= hi(OpCode);
end;
procedure Tpkt.AddCmd(var Buf:  array of byte; OpCode:word);
begin
  pktLen:= pktLen+1;
  Buf[pktLen+1]:= lo(OpCode);
  pktLen:= pktLen+1;
  Buf[pktLen+1]:= hi(OpCode);
  Buf[0]:= hi(pktLen);
  Buf[1]:= lo(pktLen);
end;
procedure Tpkt.AddByte(var Buf: array of byte; data: byte);
begin
  pktLen:= pktLen+1;
  Buf[pktLen+1]:= data;
  Buf[0]:= hi(pktLen);
  Buf[1]:= lo(pktLen);
end;
procedure Tpkt.AddStr(var Buf: array of byte; s: string);
var
  f: longint;
begin
  for f:= 1 to length(s) do
  begin
    pktLen:= pktLen+1;
    Buf[pktLen+1]:= ord(s[f]);
  end;
  Buf[0]:= hi(pktLen);
  Buf[1]:= lo(pktLen);
end;
procedure Tpkt.AddInt64(var Buf: array of byte; i: int64);
var
  k: longint;
  a: array[0..7] of byte;
begin
  Move(i, a, 8);
  for k:= 0 to 7 do
  begin
    pktLen:= pktLen+1;
    Buf[pktLen+1]:= a[k];
  end;
  Buf[0]:= hi(pktLen);
  Buf[1]:= lo(pktLen);
end;
procedure Tpkt.AddGUID(var Buf: array of byte; i: int64);
var
  k, maskpos: longint;
  a: array [0..7] of byte;
  mask: byte;
begin
  pktLen:= pktLen+1;
  maskpos:= pktlen+1;
  mask:= 0;
  move(i, a, 8);
  for k:= 0 to 7 do
    if a[k] <> 0 then
    begin
      pktLen:= pktLen+1;
      Buf[pktlen+1]:= a[k];
      mask:= mask or (1 shl k);
    end;
  Buf[maskpos]:= mask;
  Buf[0]:= hi(pktLen);
  Buf[1]:= lo(pktLen);

//  AddByte(Buf, $ff);
//  AddInt64(Buf, i);
end;
procedure Tpkt.AddWordLoHi(var Buf: array of byte; w: word);
begin
  pktLen:= pktLen+1;
  Buf[pktLen+1]:= lo(w);
  pktLen:= pktLen+1;
  Buf[pktLen+1]:= hi(w);
  Buf[0]:= hi(pktLen);
  Buf[1]:= lo(pktLen);
end;
procedure Tpkt.AddWordHiLo(var Buf: array of byte; w: word);
begin
  pktLen:= pktLen+1;
  Buf[pktLen+1]:= hi(w);
  pktLen:= pktLen+1;
  Buf[pktLen+1]:= lo(w);
  Buf[0]:= hi(pktLen);
  Buf[1]:= lo(pktLen);
end;
procedure Tpkt.AddWord(var Buf: array of byte; w: word);
var
  a: array[0..3] of byte;
  i: longint;
begin
  move(w, a, 2);
  for i:= 0 to 1 do
  begin
    pktLen:= pktLen+1;
    Buf[pktLen+1]:= a[i];
  end;
  Buf[0]:= hi(pktLen);
  Buf[1]:= lo(pktLen);
end;
procedure Tpkt.AddFloat(var Buf: array of byte; f: single);
var
  a: array[0..3] of byte;
  i: longint;
begin
  move(f, a, 4);
  for i:= 0 to 3 do
  begin
    pktLen:= pktLen+1;
    Buf[pktLen+1]:= a[i];
  end;
  Buf[0]:= hi(pktLen);
  Buf[1]:= lo(pktLen);
end;
procedure Tpkt.AddLong(var Buf: array of byte; l: longword);
var
  a: array[0..3] of byte;
  i: longint;
begin
  move(l, a, 4);
  for i:= 0 to 3 do
  begin
    pktLen:= pktLen+1;
    Buf[pktLen+1]:= a[i];
  end;
  Buf[0]:= hi(pktLen);
  Buf[1]:= lo(pktLen);
end;
procedure Tpkt.AddInt(var Buf: array of byte; l: longint);
var
  a: array[0..3] of byte;
  i: longint;
begin
  move(l, a, 4);
  for i:= 0 to 3 do
  begin
    pktLen:= pktLen+1;
    Buf[pktLen+1]:= a[i];
  end;
  Buf[0]:= hi(pktLen);
  Buf[1]:= lo(pktLen);
end;
procedure Tpkt.AddArrayStr(var Buf: array of byte; s: string; l: longint);
var
  res: string;
  k, f: longint;
begin
  res:= '';
  k:= 1;
  for f:= 1 to l do
  begin
    pktLen:= pktLen+1;
    Buf[pktLen+1]:= HexToInt(s[k] + s[k+1]);
    k:=k + 2;
  end;
  Buf[0]:= hi(pktLen);
  Buf[1]:= lo(pktLen);
end;
procedure Tpkt.AddArray(var Buf: array of byte; p: pointer; plen: word);
var
  i: word;
  a: array[0..65535] of byte;
begin
//  if plen>65535 then exit;

//  move(a[0], Buf[pktLen+0], plen);
//  inc(pktLen, plen);

  CopyMemory(@a, p, plen);
  for i:= 0 to plen-1 do
  begin
    pktLen:= pktLen+1;
    Buf[pktLen+1]:= a[i];
  end;
{}
  Buf[0]:= hi(pktLen);
  Buf[1]:= lo(pktLen);
end;
procedure Tpkt.AddDumpStr(var Buf: array of byte; s: string);
var
  o: string;
begin
  o:= s;
  if pos(':', o) <> 0 then
    o:= copy(o, pos(':', o)+1, 65535);
  if pos('|', o) <> 0 then
    o:=copy(o, 1, pos('|', o)-1);
  o:= NoSp(o);
  AddArrayStr(Buf, o, length(o) div 2)
end;
procedure Tpkt.Assign(var Buf: array of byte);
begin
  PktLen:= Buf[1]+256*Buf[0];
end;
procedure Tpkt.InitA9(var Buf: array of byte; OpCode: word);
begin
  InitCmd(Buf, OpCode);
  AddByte(Buf, 0);
  AddLong(Buf, 0);
end;
procedure Tpkt.AddA9(var Buf: array of byte; const A9pkt: array of byte; A9Len: longint);
var
  i: longint;
begin
  if PktLen = 0 then exit;
  if A9Len < 10 then exit;
  inc(Buf[4]);
  for i:= 9 to A9Len-1 do
  begin
    pktLen:= pktLen+1;
    Buf[pktLen+1]:= A9pkt[i];
  end;
  Buf[0]:= hi(pktLen);
  Buf[1]:= lo(pktLen);
end;

end.
