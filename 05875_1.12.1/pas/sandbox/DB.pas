unit DB;

interface

uses
  TMSGStruct,
  Struct;

procedure DB_GetEnumCharList(account_name: string; var m: T_SMSG_CHAR_ENUM);
procedure DB_MakeNewChar(var e: T_CMSG_CHAR_CREATE; var c: TCharData);
procedure DB_AddChar(acc_name: string; var c: TCharData);
function  DB_CharExists(charname: string): boolean;
procedure DB_DeleteChar(guid: uInt64);
function  DB_LoadChar(guid: uInt64; var c: TCharData): boolean;
procedure DB_SaveChar(c: TCharData);

implementation

uses
  Responses,
  Convert, Logs,
  CharsConsts,
  ClassCharList,
  Defines;

procedure DB_GetEnumCharList(account_name: string; var m: T_SMSG_CHAR_ENUM);
var
  i, k, j, e: longint;
begin
  // all chars is here from all accounts
  m.Count:= ListChars.Count(account_name);
  if m.Count = 0 then exit;

  // matching from ListChars[] by AccountName
  k:= 0;
  for i:= 0 to ListChars.Count-1 do
    if ListChars.List[i].Login = account_name then
    begin
      m.Enum[k]:= ListChars.List[i].Enum;

      for j:= 0 to ENUM_PLAYER_ITEMS_COUNT-1 do
      begin
        e:= ListChars.List[i].inventory_bag[0][j].Entry;
        if e > Length(ItemTPL) then
        begin
          m.Enum[k].inventory[0][j].displayID:= 0;
          m.Enum[k].inventory[0][j].inventoryType:= 0;
          mainlog('DB_GetEnumCharList: ItemEntry='+strr(e)+', ItemTPL is nil.');
        end
        else
        begin
          m.Enum[k].inventory[0][j].displayID:= ItemTPL[e].DisplayInfoID;
          m.Enum[k].inventory[0][j].inventoryType:= ItemTPL[e].InventoryTypeID;
        end;
      end;

      inc(k);
      if k > ENUM_CHARS_COUNT then break;
    end;
end;
procedure DB_MakeNewChar(var e: T_CMSG_CHAR_CREATE; var c: TCharData);
begin
  MakeRaceClassDefaultParams(e.raceID, e.classID, e.sexID, c);

  c.Enum.name:=              e.name;
  c.Enum.raceID:=            e.raceID;
  c.Enum.classID:=           e.classID;
  c.Enum.sexID:=             e.sexID;
  c.Enum.skinID:=            e.skinID;
  c.Enum.faceID:=            e.faceID;
  c.Enum.hairStyleID:=       e.hairStyleID;
  c.Enum.hairColorID:=       e.hairColorID;
  c.Enum.facialHairStyleID:= e.facialHairStyleID;
  c.Enum.outfitID:=          e.outfitID;
end;
procedure DB_AddChar(acc_name: string; var c: TCharData);
begin
  c.Login:= acc_name;
  ListChars.Add(c);
end;
function  DB_CharExists(charname: string): boolean;
var
  i: longint;
begin
  result:= false;
  for i:= 0 to ListChars.Count-1 do
    if ListChars.List[i].Enum.name = charname then
    begin
      result:= true;
      exit;
    end;
end;
procedure DB_DeleteChar(guid: uInt64);
begin
  ListChars.Del(guid);
end;
function  DB_LoadChar(guid: uInt64; var c: TCharData): boolean;
var
  i: longint;
begin
  result:= false;
  for i:= 0 to ListChars.Count-1 do
    if ListChars.List[i].Enum.GUID = guid then
    begin
      c:= ListChars.List[i];
      result:= true;
      exit;
    end;
end;
procedure DB_SaveChar(c: TCharData);
var
  i: longint;
begin
  for i:= 0 to ListChars.Count-1 do
    if ListChars.List[i].Enum.GUID = c.Enum.GUID then
    begin
      ListChars.List[i]:= c;
      exit;
    end;
end;

end.
