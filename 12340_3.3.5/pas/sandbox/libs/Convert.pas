unit Convert;

interface

Uses
  SysUtils, Math;

const
  COLOR_BLACK                = 0;
  COLOR_BLUE                 = 1;
  COLOR_GREEN                = 2;
  COLOR_CYAN                 = 3;
  COLOR_RED                  = 4;
  COLOR_MAGENTA              = 5;
  COLOR_YELLOW               = 6;
  COLOR_WHITE                = 7;
  COLOR_GREY                 = 8;
  COLOR_LIGHT_BLUE           = 9;
  COLOR_LIGHT_GREEN          = 10;
  COLOR_LIGHT_CYAN           = 11;
  COLOR_LIGHT_RED            = 12;
  COLOR_LIGHT_MAGENTA        = 13;
  COLOR_LIGHT_YELLOW         = 14;
  COLOR_LIGHT_WHITE          = 15;

// console
procedure SetAttr(attr: word);
function  GetAttr: word;
procedure GotoXY(aX, aY: longint); { zero-based coords }
function  WhereX: longint;
function  WhereY: longint;

// converts
function reverse(s: string): string;
function vall(s: string): longint;
function vall64(s: string): uInt64;
function strr(n: longint): string;
function str2single(s: string): single;
function single2str(f: single; digits: byte =6): string;
function IntToBin(value: longint; digits, spaces: longint): string;
function Int64Hi(i64: int64): longint;
function Int64Lo(i64: int64): longint;
function Int64ToHex(i64: int64): string;
function IntToInt64(i64hi, i64lo: longint): int64;
function StrToInt64(s: string): int64;
function HexToInt(const s: string): longint;
function HexToBinStr(s: string; n: longint): string;
function BinStrToHex(s: string): string;
procedure HexToArray(s:string; n: longint; var a: array of byte);

function NoSp(s: string): string;
function Z(s: string; n: byte): string;
function zsp(s: string; sp_max: longint; side_left: boolean): string;
function str_replace(c: char; s: string): string;
function sql_str(s: string): string;
function Translit(s: string): string;

// wow
function MakeValidCharName(nm: string): string;
function wow_deunicode1251(s: string): string;
function wow_unicode866(s: string): string;
function wow_unicode1251(s: string): string;
function delta2int(dx, dy, dz: single): longint;
function GetAngle(x1, y1, x2, y2: single): single;

implementation

uses
  Windows;

var
  UpperLeft: TCoord = (X:0; Y:0);
  hCon: longint;

// concole
procedure GotoXY(aX, aY: longint);
var
  aCoord: TCoord;
begin
  aCoord.x:=aX;
  aCoord.y:=aY;
  SetConsoleCursorPosition(hCon,aCoord);
end;
procedure SetAttr(attr: word);
begin
  SetConsoleTextAttribute(hCon,attr);
end;
function WhereX: longint;
var
  ScrBufInfo: TConsoleScreenBufferInfo;
begin
  GetConsoleScreenBufferInfo(hCon,ScrBufInfo);
  Result:=ScrBufInfo.dwCursorPosition.x;
end;
function WhereY: longint;
var
  ScrBufInfo: TConsoleScreenBufferInfo;
begin
  GetConsoleScreenBufferInfo(hCon,ScrBufInfo);
  Result:=ScrBufInfo.dwCursorPosition.y;
end;
function GetAttr: word;
var
  ScrBufInfo: TConsoleScreenBufferInfo;
begin
  GetConsoleScreenBufferInfo(hCon,ScrBufInfo);
  Result:=ScrBufInfo.wAttributes;
end;

// convert
function reverse(s: string): string;
var
  i: longint;
begin
  result:= '';
  for i:= length(s) downto 1 do result:= result + s[i];
end;
function vall(s: string): longint;
begin
  try
    result:= StrToInt(s);
  except
    result:= 0;
  end;
end;
function vall64(s: string): uInt64;
begin
  try
    result:= StrToInt64(s);
  except
    result:= 0;
  end;
end;
function strr(n: longint): string;
begin
  try
    result:= IntToStr(n);
  except
    result:= '0';
  end;
end;
function str2single(s: string): single;
begin
  result:= 0.0;
  if s='' then exit;

  s:= StringReplace(s, '.', ',', [rfReplaceAll, rfIgnoreCase]);
  try
//    val(s, float, err);
    result:= StrToFloat(s);
  except
    result:= 0.0;
  end;
end;
function single2str(f: single; digits: byte =6): string;
var
  s: string;
begin
  try
//    str(f:10:6, s);
    s:= FloatToStr(f);
    s:= StringReplace(s, ',', '.', [rfReplaceAll, rfIgnoreCase]);
    s:= copy(s, 1, pos('.', s) + digits);
  except
    s:= '';
  end;

  result:= trim(s);
end;
function IntToBin(value: longint; digits, spaces: longint): string;
begin
  result:= '';
  if digits > 32 then digits:= 32;
  while digits > 0 do
  begin
//    if (digits mod spaces) = 0 then result:= result + ' ';
    Dec(digits);
    result:= result + IntToStr((value shr digits) and 1);
  end;
end;
function Int64Hi(i64: int64): longint;
var
  a: array[0..7] of byte;
  i: longint;
begin
  move(i64, a, 8);
  move(a[4], i, 4);
  result:= i;
end;
function Int64Lo(i64: int64): longint;
var
  a: array[0..7] of byte;
  i: longint;
begin
  move(i64, a, 8);
  move(a[0], i, 4);
  result:= i;
end;
function Int64ToHex(i64: int64): string;
var
  a: array[0..7] of byte;
  i: longint;
  s: string;
begin
  move(i64, a, 8);

  s:= '';
  for i:= 7 downto 0 do
    s:= s + IntToHex(a[i], 2);

  result:= s;
end;
function IntToInt64(i64hi, i64lo: longint): int64;
var
  a: array[0..7] of byte;
  i64: Int64;
begin
  move(i64lo,a[0],4);
  move(i64hi,a[4],4);
  move(a,i64,8);
  result:=i64;
end;
function StrToInt64(s: string): int64;
var
  a: string;
  m: array[0..7] of byte;
  i: longint;
begin
  a:= HexToBinStr(s, 16);
  for i:=0 to 7 do
    m[7-i]:= Ord(a[i+1]);
  move(m[0], result, 8);
end;
function HexToInt(const s: string): longint;
begin
  if Pos('$', S) = 0 then
    result:= StrToIntDef('$'+s, 0)
  else
    result:= StrToIntDef(s, 0);
end;
function HexToBinStr(s:string; n: longint): string;
var
  r: string;
  k, f: longint;
begin
  r:= '';

  k:= 1;
  for f:= 1 to n do
  begin
    if f > length(s) then break;
    r:= r + chr(HexToInt(s[k] + s[k+1]));
    k:= k + 2;
  end;

  result:= r;
end;
function BinStrToHex(s: string): string;
var
  r: string;
  f: longint;
begin
  r:= '';

  for f:=1 to length(s) do
  begin
    if f > length(s) then break;
    r:= r + IntToHex(Ord(s[f]), 2);
  end;

  result:= r;
end;
procedure HexToArray(s:string; n: longint; var a: array of byte);
var
  k, f: longint;
begin
  k:= 1;
  for f:= 1 to n do
  begin
    if f > length(s) then break;
    a[f-1]:= HexToInt(s[k] + s[k+1]);
    k:= k + 2;
  end;
end;

function NoSp(s: string): string;
var
  o: string;
  f: longint;
begin
  o:= '';
  for f:= 1 to length(s) do
    if s[f] <> ' ' then o:= o + s[f];
  result:= o;
end;
function Z(s: string; n: byte): string;
var
  f: longint;
begin
  if length(s) > n then
    begin
      result:= s;
      exit;
    end;

  result:= '';
  for f:= 1 to n-length(s) do
    result:= result + '0';

  result:= result + s;
end;
function zsp(s: string; sp_max: longint; side_left: boolean): string;
var
  t: string;
  i: longint;
begin
  result:= s;
  if length(s) > sp_max then exit;

  t:= '';
  for i:=1 to sp_max-length(s) do
    t:= t + ' ';

  if side_left then
    result:= t + s
  else
    result:= s + t;
end;
function str_replace(c: char; s: string): string;
var
  i: longint;
  o: string;
begin
  o:='';

  for i:=1 to length(s) do
    if s[i] <> c then
      o:= o + s[i];

  result:= o;
end;
function sql_str(s: string): string;
var
  t: string;
begin
  t:= s;
  t:= StringReplace(t, '"', '\"', [rfReplaceAll, rfIgnoreCase]);
  t:= StringReplace(t, '''', '\''', [rfReplaceAll, rfIgnoreCase]);
  result:= t;
end;
function Translit(s: string): string;
const
  rus: string = 'àáâãäå¸æçèéêëìíîïğñòóôõö÷øùüûúışÿÀÁÂÃÄÅ¨ÆÇÈÉÊËÌÍÎÏĞÑÒÓÔÕÖ×ØÙÜÛÚİŞß';
  lat: array[1..66] of string = ('a', 'b', 'v', 'g', 'd', 'e', 'yo', 'zh', 'z', 'i', 'y', 'k', 'l', 'm', 'n', 'o', 'p', 'r', 's', 't', 'u', 'f', 'kh', 'ts', 'ch', 'sh', 'shch', '''', 'y', '''', 'e', 'yu', 'ya', 'A', 'B', 'V', 'G', 'D', 'E', 'Yo', 'Zh', 'Z', 'I', 'Y', 'K', 'L', 'M', 'N', 'O', 'P', 'R', 'S', 'T', 'U', 'F', 'Kh', 'Ts', 'Ch', 'Sh', 'Shch', '''', 'Y', '''', 'E', 'Yu', 'Ya');
var
  p, i, l: longint;
begin
  Result:= '';
  l:= Length(s);
  for i:= 1 to l do
  begin
    p:= Pos(s[i], rus);
    if p < 1 then Result:= Result + s[i] else Result:= Result + lat[p];
  end;
end;

// wow
function MakeValidCharName(nm: string): string;
begin
  result:=UpperCase(copy(nm,1,1))+LowerCase(copy(nm,2,15));
end;
function wow_deunicode1251(s: string): string;
var
  ofs: longint;
  c: byte;
begin
  ofs:=1;
  result:='';
  while ofs<=length(s) do
    begin
      c:=ord(s[ofs]);
      if (c in [192..239])or(c in [240..255]) then
        begin
          if (c in [192..239]) then result:=result+chr(208)+chr(c-48);
          if (c in [240..255]) then result:=result+chr(209)+chr(c-112);
        end
      else
        result:=result+s[ofs];

      inc(ofs);
    end;
end;
function wow_unicode866(s: string): string;
var
  ofs: longint;
  c: byte;
begin
  ofs:=1;
  result:='';
  while ofs<=length(s) do
    begin
      c:=ord(s[ofs]);
      if c in [208,209] then
        begin
          inc(ofs);
          c:=ord(s[ofs]);
          if (c in [128..143]) then result:=result+chr(c+96);
          if (c in [144..191]) then result:=result+chr(c-16);
        end
      else
        result:=result+s[ofs];
      inc(ofs);
    end;
end;
function wow_unicode1251(s: string): string;
var
  ofs: longint;
  c: byte;
begin
  ofs:=1;
  result:='';
  while ofs<=length(s) do
    begin
      c:=ord(s[ofs]);
      if c in [208,209] then
        begin
          inc(ofs);
          c:=ord(s[ofs]);
          if (c in [128..143]) then result:=result+chr(c+112);
          if (c in [144..191]) then result:=result+chr(c+48);
        end
      else
        result:=result+s[ofs];
      inc(ofs);
    end;
end;
function delta2int(dx,dy,dz:single):integer;
var
  ix,iy,iz: longint;
const
  _10Bit=$3FF;
  _11Bit=$7FF;
begin
  ix:=Smallint(round(dx*4));
  iy:=Smallint(round(dy*4));
  iz:=Smallint(round(dz*4));
  result:=((iz and _10Bit) shl 22) or ((iy and _11Bit) shl 11) or (ix and _11Bit);
end;
function GetAngle(x1,y1,x2,y2:single): single;
var
  angle: single;
begin
  angle:=ArcTan2((y2-y1),(x2-x1));
  if angle>=0 then result:=angle else result:=2*PI+angle;
  if angle>=2*Pi then result:=angle-2*Pi;
end;

initialization
  hCon := GetStdHandle(STD_OUTPUT_HANDLE);

end.
