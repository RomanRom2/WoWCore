unit Struct;

interface

uses
  TMSGStruct,
  Defines;

type
  TSpellRecord = record
    caster_guid: uInt64;
    spell_id: longint;
    spell_cast_duration: longint;
    spell_cast_start_time: longint;
    target_flags: longint;
    target_guid: uInt64;
    target_x, target_y, target_z: single;
    target_string: string;
  end;
  TMovementRecord = record
    GUID: uInt64;
    OpCode: word;
    Flags: longint;
    Flags2: byte;
    StartTime: longint;
    x: single;
    y: single;
    z: single;
    facing: single;
    TransportGUID: uInt64;
    TransportX: single;
    TransportY: single;
    TransportZ: single;
    TransportF: single;
    Pitch: single;
    FallenTime: longint;
    jumpVelocity: single;
    cosAnchorPitch: single;
    sinAnchorPitch: single;
    currentSpeed: single;
    fallStartElevation: single;
  end;
  CValuesRecord = class
    Values: array of longint;
    constructor Create;
    procedure Free;
    procedure Init;
    procedure Add(field: longint);
  end;

  TLoc = record
    x, y, z, facing: single;
    Map, Zone: longint;
  end;
  TItemEnchantmentTemplate = record
    spell_id: longint;
    duration: longint;
    charges: longint;
  end;
  TItemTemplate = record
    GUID              : uInt64;
    OwnerGUID         : uInt64;
    Map               : longint;
    Entry             : longint;
    GiftEntry         : longint;
    CreatorGUID       : uInt64;
    GiftCreatorGUID   : uInt64;
    StackCount        : longint;
    Duration          : longint;
    SpellCharges      : array[0..4] of longint;
    Flags             : longint;
    Enchantment       : array[0..6] of TItemEnchantmentTemplate;
    PropertyID        : longint;
    RandomPropertyID  : longint;
    TextID            : longint;
    Durability        : longint;
    MaxDurability     : longint;
    bbSellPrice       : longint;
    bbTimeStamp       : longint;
  end;

  TPlayerSkillInfo = record
    id: word;
    max_level: word;
    current_level: word;
    stat_max_level: word;
    stat_current_level: word;
  end;
  TPlayerActionButtons = record
    spell_id: longword;
    flags: longword;
  end;
  TPlayerSpells = record
    spell_id: longint;
    slot: longint;
  end;
  TPlayerReputations = record
    faction_flag: byte;
    base: longint;
    value: longint;
    status: byte;
  end;
  TCharData = class
    Login: string;
    Enum: TCharEnumInfo;
    facing: single;

    // object fields
    // -------------------------------------------------------------------------
    speed_walk, speed_run, speed_run_back, speed_swim, speed_swim_back, speed_flight, speed_flight_back: single;
    scale_x: single;

    // unit fields
    // -------------------------------------------------------------------------
    health, max_health: longint;
    power_type: longint;
    power, max_power: array[0..6] of longint;
    faction_template: longint;

    // bytes0:

    flags: longint;
    mainhand_attack_time, offhand_attack_time, ranged_attack_time: longint;
    bounding_radius, combat_reach: single;
    enum_model_backup, enum_model, native_model, mount_model: word;
    min_damage, max_damage: single;
    min_offhand_damage, max_offhand_damage: single;

    // bytes1:
    stand_state            : byte;
    stealth_visual_effect  : byte;
    shape_shift_form       : byte;
    shape_shift_stand      : byte;

    dynamic_flags: longint;
    npc_flags: longint;
    stat: array[0..4] of longint;
    // resistances
    base_health, base_mana: longint;

    // bytes2:
    sheathed: longint;

    attack_power, attack_power_mod: longint;
    ranged_attack_power, ranged_attack_power_mod: longint;
    min_ranged_damage, max_ranged_damage: single;
    power_cost_modifier, power_cost_multiplier: single;

    // player fields
    // -------------------------------------------------------------------------
    player_flags: longint;

    // player_bytes:

    // player_bytes_2:

    // player_bytes_3:

    xp, next_level_xp: longint;
    skills: array[0..PLAYER_SKILLS_COUNT-1] of TPlayerSkillInfo;
    points1, professions_left: longint;
    block, dodge, parry, crit, ranged_crit: single;
    rest_state_xp: longint;
    coinage: longint;

    // player_field_bytes:

    ammo_id: longint;

    // player_field_bytes_2:

    // other stuff
    // -------------------------------------------------------------------------
    selection: uInt64;
    flight_mode: boolean;

    VR: CValuesRecord;

    spells: array[0..PLAYER_SPELLS_COUNT] of TPlayerSpells;
    action_buttons: array[0..PLAYER_ACTION_BUTTONS_COUNT] of TPlayerActionButtons;
//    reputations: array[0..MAX_PLAYER_REPUTATIONS] of TPlayerReputations;

    // 0 - main pack + 4 bags + 6 bank bags
    inventory_bag: array[0..0, 0..MaxInventorySlot-1] of TItemTemplate;
//    inventory_bag: array[0..InventoryBagSlotsCount+InventoryBankBagSlotsCount, 0..MaxInventorySlot] of TItemTemplate;
//    inventory_bag_items: array[0..InventoryBagSlotsCount+InventoryBankBagSlotsCount] of longint;

    constructor Create;
    procedure Free;
    procedure ItemsInit;
    procedure ItemsAdd(bag,slot, entry,count, item_flags: longword);
    procedure SkillsInit;
    procedure SkillsAdd(skill, max,curr,  stat_max,stat_curr: word);
    procedure SpellsInit;
    procedure SpellsAdd(spell, slot: longint);
    procedure ActionButtonsInit;
    procedure SetActionButtons(button, spell, button_flags: longword);
  end;

  TWorldUnit = class
    woGUID: uInt64;
    woLoc: TLoc;
    woSpeedWalk, woSpeedRun, woSpeedRunBack, woSpeedSwim, woSpeedSwimBack, woSpeedFlight, woSpeedFlightBack: single;
    woScaleX: single;
    woEntry: longint;

    unHealth, unMaxHealth: longint;
    unPower, unMaxPower: array[0..6] of longint;
    unLevel: longint;
    unFactionTemplate: longint;
    unMainhandAttackTime, unOffhandAttackTime: longint;
    unDisplayID, unNativeDisplayID, unMountDisplayID: longint;
    unBoundingRadius, unCombatReach: single;
    unCastSpeed: single;
    unFieldBytes0, unFieldBytes1, unFieldBytes2: longint;
    unFieldFlags, unNPCFlags: longint;

    constructor Create(entry: longint);
    procedure Free;
  end;

  OGOSSIP_TOOL = object
    procedure Init(var MENU: T_SMSG_GOSSIP_MESSAGE);
    procedure AddGossip(var MENU: T_SMSG_GOSSIP_MESSAGE; var m: GossipMenuRecord);
    procedure AddQuest(var MENU: T_SMSG_GOSSIP_MESSAGE; var m: QuestMenuRecord);
  end;

implementation

uses
  Responses,
  Windows;

constructor CValuesRecord.Create;
begin
  SetLength(Values, 0);
end;
procedure CValuesRecord.Free;
begin
  SetLength(Values, 0);
  Destroy;
end;
procedure CValuesRecord.Add(field: longint);
var
  count: longint;
begin
  for count:= 0 to Length(Values)-1 do
    if Values[count] = field then exit;

  count:= Length(Values);
  inc(count);
  SetLength(Values, count);
  Values[count-1]:= field;
end;
procedure CValuesRecord.Init;
begin
  SetLength(Values, 0);
end;

constructor TCharData.Create;
begin
  VR:= CValuesRecord.Create;
  flight_mode:= false;
end;
procedure TCharData.Free;
begin
  VR.Free;
  VR:= nil;

  Destroy;
end;
procedure TCharData.ItemsInit;
var
  f: longint;
begin
  for f:= 0 to MaxInventorySlot-1 do
  begin
    inventory_bag[0][f].GUID:= 0;
    inventory_bag[0][f].Entry:= 0;
    inventory_bag[0][f].StackCount:= 0;
    inventory_bag[0][f].Flags:= 0;
  end;
end;
procedure TCharData.ItemsAdd(bag,slot, entry,count, item_flags: longword);
begin
  if slot < 1 then exit;
  if slot > MaxInventorySlot-1 then exit;
  if inventory_bag[0][slot].Entry <> 0 then exit;

  // bags is not supported
  if bag <> $FF then exit;

  inventory_bag[0][slot].GUID:= GUID_TYPE_ITEM + self.Enum.GUID + GetTickCount + slot;
  inventory_bag[0][slot].Entry:= entry;
  inventory_bag[0][slot].StackCount:= count;
  inventory_bag[0][slot].Flags:= item_flags;

  sleep(20);
end;
procedure TCharData.SkillsInit;
var
  f: longint;
begin
  for f:=0 to PLAYER_SKILLS_COUNT-1 do
  begin
    skills[f].id:= 0;
    skills[f].max_level:= 0;
    skills[f].current_level:= 0;
    skills[f].stat_max_level:= 0;
    skills[f].stat_current_level:= 0;
  end;
end;
procedure TCharData.SkillsAdd(skill, max,curr,  stat_max,stat_curr: word);
var
  f: longint;
  found: boolean;
begin
  found:= false;

  for f:= 0 to PLAYER_SKILLS_COUNT-1 do
  begin
    if skills[f].id = skill then
    begin
      found:= true;
      break;
    end;
    if skills[f].id = 0 then break;
  end;

  if (not found)and(skills[f].id = 0) then
  begin
    skills[f].id:= skill;
    skills[f].max_level:= max;
    skills[f].current_level:= curr;
    skills[f].stat_max_level:= stat_max;
    skills[f].stat_current_level:= stat_curr;
  end;
end;
procedure TCharData.SpellsInit;
var
  f: longint;
begin
  for f:= 0 to PLAYER_SPELLS_COUNT-1 do
  begin
    spells[f].spell_id:= 0;
    spells[f].slot:= 0;
  end;
end;
procedure TCharData.SpellsAdd(spell, slot: longint);
var
  f: longint;
  found: boolean;
begin
  found:= false;

  for f:= 0 to PLAYER_SPELLS_COUNT-1 do
  begin
    if spells[f].spell_id = spell then
    begin
      found:= true;
      break;
    end;
    if spells[f].spell_id = 0 then break;
  end;

  if (not found)and(spells[f].spell_id = 0) then
  begin
    spells[f].spell_id:= spell;
    spells[f].slot:= slot;
  end;
end;
procedure TCharData.ActionButtonsInit;
var
  f: longint;
begin
  for f:= 0 to PLAYER_ACTION_BUTTONS_COUNT-1 do
  begin
    action_buttons[f].spell_id:= 0;
  end;
end;
procedure TCharData.SetActionButtons(button, spell, button_flags: longword);
begin
  if (button <= PLAYER_ACTION_BUTTONS_COUNT) then
  begin
    action_buttons[button].spell_id:= spell;
    action_buttons[button].flags:= button_flags;
  end;
end;

constructor TWorldUnit.Create(entry: longint);
begin
//  woGUID:= GUID_TYPE_UNIT + $10000000000*entry + GetTickCount;
  woGUID:= GUID_TYPE_UNIT + GetTickCount;
  woLoc.x:=0;
  woLoc.y:=0;
  woLoc.z:=0;
  woLoc.facing:=0;
  woLoc.Map:=0;
  woSpeedWalk:=2.5;
  woSpeedRun:=9.0;
  woSpeedRunBack:=4.5;
  woSpeedSwim:=4.7;
  woSpeedSwimBack:=2.5;
  woSpeedFlight:=9.0;
  woSpeedFlightBack:=4.5;
  woScaleX:=1.0;
  woEntry:=entry;

  unHealth:=100;
  unMaxHealth:=100;
  unPower[POWER_MANA]:=0;
  unPower[POWER_RAGE]:=0;
  unPower[POWER_FOCUS]:=100;
  unPower[POWER_ENERGY]:=100;
  unPower[POWER_HAPPINESS]:=1000;
  unPower[POWER_RUNES]:=8;
  unPower[POWER_RUNIC]:=0;
  unMaxPower[POWER_MANA]:=0;
  unMaxPower[POWER_RAGE]:=0;
  unMaxPower[POWER_FOCUS]:=100;
  unMaxPower[POWER_ENERGY]:=100;
  unMaxPower[POWER_HAPPINESS]:=1000;
  unMaxPower[POWER_RUNES]:=0;
  unMaxPower[POWER_RUNIC]:=0;
  unLevel:=1;
  // 35 - friend, 21 - hostile
  if CreatureTPL[entry].Greetings<>'' then
    unFactionTemplate:=35
  else
    unFactionTemplate:=21;
  unMainhandAttackTime:=2000;
  unOffhandAttackTime:=2000;
  unBoundingRadius:=1.0;
  unCombatReach:=1.0;
  unCastSpeed:=1.0;
  unFieldBytes0:=$01020100; // N/A, Warrior;
  unFieldBytes2:=$00001001;
  unFieldFlags:=0;
  unNPCFlags:=0;

  sleep(100); // pause for next GetTickCount
end;
procedure TWorldUnit.Free;
begin
  Destroy;
end;

procedure OGOSSIP_TOOL.Init(var MENU: T_SMSG_GOSSIP_MESSAGE);
begin
  SetLength(MENU.GossipMenu, 0);
  SetLength(MENU.QuestMenu, 0);
end;
procedure OGOSSIP_TOOL.AddGossip(var MENU: T_SMSG_GOSSIP_MESSAGE; var m: GossipMenuRecord);
var
  count: longint;
begin
  count:= Length(MENU.GossipMenu);
  inc(count);
  SetLength(MENU.GossipMenu, count);
  MENU.GossipMenu[count-1]:= m;
end;
procedure OGOSSIP_TOOL.AddQuest(var MENU: T_SMSG_GOSSIP_MESSAGE; var m: QuestMenuRecord);
var
  count: longint;
begin
  count:= Length(MENU.QuestMenu);
  inc(count);
  SetLength(MENU.QuestMenu, count);
  MENU.QuestMenu[count-1]:= m;
end;

end.
