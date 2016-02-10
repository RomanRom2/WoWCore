unit ClassWorld;

interface

type
  TWorldRecord = record
    woType: byte;
    woGUID: uInt64;
    woMap: word;
    woAddr: pointer;
  end;
  TWorld = class
    private
      List: array of TWorldRecord;
      function  GetObjectByIndex(index: longint): TWorldRecord;
      function  GetObjectByGUID(guid: uInt64): TWorldRecord;
    public
      constructor Create;
      procedure Free;
      procedure Add(OBJ: TWorldRecord);
      procedure Del(OBJ: TWorldRecord);
      function  Count: longint;
      property  ObjectByIndex[idndex: longint]: TWorldRecord read GetObjectByIndex;
      property  ObjectByGUID[guid: uInt64]: TWorldRecord read GetObjectByGUID; default;
  end;

var
  World: TWorld;

implementation

uses
  Defines, Struct;

{ TWorld }
constructor TWorld.Create;
begin
  SetLength(List, 0);
end;
procedure TWorld.Free;
var
  i: longint;
begin
  for i:= 0 to Length(List)-1 do
    if List[i].woAddr <> nil then
      if List[i].woType = WO_UNIT then
        TWorldUnit(List[i].woAddr).Free;
  SetLength(List, 0);
  Destroy;
end;
procedure TWorld.Add(OBJ: TWorldRecord);
var
  count: longint;
begin
  count:= Length(List);
  inc(count);
  SetLength(List, count);

  List[count-1]:= OBJ;
end;
procedure TWorld.Del(OBJ: TWorldRecord);
var
  i, k: longint;
begin
  if Length(List)=0 then exit;

  for i:= 0 to Length(List)-1 do
    begin
      if List[i].woAddr = OBJ.woAddr then
      begin
        for k:= i+1 to Length(List)-1 do
          List[k-1]:= List[k];
        k:= Length(List);
        dec(k);
        if k < 0 then k:= 0;
        SetLength(List, k);
      end;
    end;
end;
function  TWorld.Count: longint;
begin
  result:= Length(List);
end;
function  TWorld.GetObjectByIndex(index: longint): TWorldRecord;
begin
  result.woType:= 0;
  result.woAddr:= nil;

  if index < 0 then exit;
  if Length(List) = 0 then exit;
  if index > Length(List)-1 then exit;

  result:= List[index];
end;
function  TWorld.GetObjectByGUID(guid: uInt64): TWorldRecord;
var
  i: longint;
begin
  result.woType:= 0;
  result.woAddr:= nil;

  if guid = 0 then exit;
  if Length(List) = 0 then exit;

  for i:= 0 to Length(List)-1 do
    if List[i].woGUID = guid then
    begin
      result:= List[i];
      exit;
    end;
end;

end.
