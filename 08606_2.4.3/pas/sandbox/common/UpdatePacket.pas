unit UpdatePacket;
 
interface

uses
  Windows, Dialogs, SysUtils,
  UpdateFields, logs;

const
  upkt_buf_size = ((PLAYER_END*4)+(PLAYER_END div 8)+1024);

type
  Tupkt=object
    maxBits: word;
    blocks: word;
    data_ofs: longword;
    buf: array[0..upkt_buf_size] of byte;
    procedure Init(pkt_maxBits: word);
    procedure SetBit(FIELD: word);
    procedure AddLong(FIELD: word; valu: longword);
    procedure AddInt(FIELD: word; valu: longint);
    procedure AddFloat(FIELD: word; valu: single);
    procedure AddInt64(FIELD: word; valu: uint64);
    procedure zAddLong(FIELD: word; valu: longword);
    procedure zAddInt(FIELD: word; valu: longint);
    procedure zAddFloat(FIELD: word; valu: single);
    procedure zAddInt64(FIELD: word; valu: uint64);
    function MakeUpdateBlock(dst_addr: pointer): boolean;
  end;

var
  upkt: Tupkt;

implementation

procedure Tupkt.Init(pkt_maxBits: word);
var
  i: word;
begin
  for i:=0 to upkt_buf_size do buf[i]:=0;
  blocks:=pkt_maxBits div 32;
  if (pkt_maxBits mod 32)<>0 then inc(blocks);
  data_ofs:=blocks*4;
end;
procedure Tupkt.SetBit(FIELD: word);
var
  ind,n: word;
begin
  ind:=FIELD div 8;
  n:=FIELD mod 8;
  buf[ind]:=buf[ind] or (1 shl n);
end;
procedure Tupkt.AddLong(FIELD: word; valu: longword);
begin
  SetBit(FIELD);
  move(valu, buf[data_ofs], 4);
  inc(data_ofs,4);
end;
procedure Tupkt.AddInt(FIELD: word; valu: longint);
begin
  SetBit(FIELD);
  move(valu, buf[data_ofs], 4);
  inc(data_ofs,4);
end;
procedure Tupkt.AddFloat(FIELD: word; valu: single);
begin
  SetBit(FIELD);
  move(valu, buf[data_ofs], 4);
  inc(data_ofs,4);
end;
procedure Tupkt.AddInt64(FIELD: word; valu: uint64);
begin
  SetBit(FIELD);
  SetBit(FIELD+1);
  move(valu, buf[data_ofs], 8);
  inc(data_ofs,8);
end;

procedure Tupkt.zAddLong(FIELD: word; valu: longword);
begin
  if valu=0 then exit;
  SetBit(FIELD);
  move(valu, buf[data_ofs], 4);
  inc(data_ofs,4);
end;
procedure Tupkt.zAddInt(FIELD: word; valu: longint);
begin
  if valu=0 then exit;
  SetBit(FIELD);
  move(valu, buf[data_ofs], 4);
  inc(data_ofs,4);
end;
procedure Tupkt.zAddFloat(FIELD: word; valu: single);
begin
  if valu=0.0 then exit;
  SetBit(FIELD);
  move(valu, buf[data_ofs], 4);
  inc(data_ofs,4);
end;
procedure Tupkt.zAddInt64(FIELD: word; valu: uint64);
begin
  if valu=0 then exit;
  SetBit(FIELD);
  SetBit(FIELD+1);
  move(valu, buf[data_ofs], 8);
  inc(data_ofs,8);
end;

function Tupkt.MakeUpdateBlock(dst_addr: pointer): boolean;
var
  i, summ, field: longint;
begin
  result:=false;

  move(buf[0], dst_addr^, data_ofs);

  summ:=0;
  
  for i:=0 to blocks-1 do
    begin
      // чо там
      move(buf[i*4], field, 4);
      inc(summ, field);
    end;
  if summ=0 then
    begin
//      MainLog('ALL UPDATE FIELDS IS EMPTY !!!', 1,0,0);
      exit;
    end;

  result:=true;
end;

end.
