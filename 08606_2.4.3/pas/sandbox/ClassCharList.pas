unit ClassCharList;

interface

uses
  Struct;

type
  TListChars = class
    public
      List: array of TCharData;
      constructor Create;
      procedure Free;
      procedure Add(var CharData: TCharData);
      procedure Del(guid: uInt64);
      function  Count(AccountName: string = ''): longint;
  end;

var
  ListChars: TListChars; // DataBase Emulation

implementation

{ TListChars }
constructor TListChars.Create;
begin
  SetLength(List, 0);
end;
procedure TListChars.Free;
begin
  SetLength(List, 0);
  Destroy;
end;
procedure TListChars.Add(var CharData: TCharData);
var
  i: longint;
begin
  i:= Length(List);
  inc(i);
  SetLength(List, i);
  List[i-1]:= CharData;
end;
procedure TListChars.Del(guid: uInt64);
var
  i, k: longint;
begin
  if Length(List) = 0 then exit;

  for i:= 0 to Length(List)-1 do
    if List[i].Enum.GUID = guid then
    begin
      List[i].Free;

      for k:= i+1 to Length(List)-1 do
        List[k-1]:= List[k];

      k:= Length(List);
      dec(k);
      if k < 0 then k:= 0;
      SetLength(List, k);
    end;
end;
function  TListChars.Count(AccountName: string = ''): longint;
var
  i: longint;
begin
  result:= Length(List);
  if AccountName = '' then exit;

  result:= 0;
  for i:= 0 to Length(List)-1 do
    if List[i].Login = AccountName then
      inc(result);
end;

end.
