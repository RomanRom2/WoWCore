unit CharsConsts;

interface

uses
  Struct, Defines;

procedure MakeRaceClassDefaultParams(race, cclass, gender: byte; var c:TCharData);

implementation

uses
  CharsConstsAlliance, CharsConstsHorde,
  Windows;

procedure MakeRaceClassDefaultParams(race, cclass, gender: byte; var c:TCharData);
begin
  c.Enum.GUID:= GetTickCount or GUID_TYPE_PLAYER;
  
  c.ItemsInit;
  c.SkillsInit;
  c.SpellsInit;
  c.ActionButtonsInit;
//  c.ReputationsInit(race,cclass);

  Case race of
    // -------------------------------------------------------------------------
    // ALLIANCE
    // -------------------------------------------------------------------------
    RACE_HUMAN:
    begin
      c.scale_x            := 1.0;
      c.Enum.zoneID        := 12;
      c.Enum.mapID         := 0;
      c.Enum.position.x    := -8949.950195;
      c.Enum.position.y    := -132.492996;
      c.Enum.position.z    := 83.531197;
      c.facing             := 0.0;
      c.bounding_radius    := 0.306000;
      c.combat_reach       := 1.500000;
      c.enum_model         := 49+Gender;
      c.faction_template   := RACE_HUMAN; // HUMAN
      case cclass of
        CLASS_WARRIOR:     RACE_HUMAN_CLASS_WARRIOR(c);
        CLASS_PALADIN:     RACE_HUMAN_CLASS_PALADIN(c);
        CLASS_ROGUE:       RACE_HUMAN_CLASS_ROGUE(c);
        CLASS_PRIEST:      RACE_HUMAN_CLASS_PRIEST(c);
        CLASS_MAGE:        RACE_HUMAN_CLASS_MAGE(c);
        CLASS_WARLOCK:     RACE_HUMAN_CLASS_WARLOCK(c);
      end;
    end;

    RACE_DWARF:
    begin
      c.scale_x            := 1.0;
      c.Enum.zoneID        := 1;
      c.Enum.mapID         := 0;
      c.Enum.position.x    := -6240.319824;
      c.Enum.position.y    := 331.032990;
      c.Enum.position.z    := 382.757996;
      c.facing             := 0.0;
      c.bounding_radius    := 0.347000;
      c.combat_reach       := 1.500000;
      c.enum_model         := 53+Gender;
      c.faction_template   := RACE_DWARF; // DWARF
      case cclass of
        CLASS_WARRIOR:     RACE_DWARF_CLASS_WARRIOR(c);
        CLASS_PALADIN:     RACE_DWARF_CLASS_PALADIN(c);
        CLASS_HUNTER:      RACE_DWARF_CLASS_HUNTER(c);
        CLASS_ROGUE:       RACE_DWARF_CLASS_ROGUE(c);
        CLASS_PRIEST:      RACE_DWARF_CLASS_PRIEST(c);
      end;
    end;

    RACE_NIGHT_ELF:
    begin
      c.scale_x            := 1.0;
      c.Enum.zoneID        := 141;
      c.Enum.mapID         := 1;
      c.Enum.position.x    := 10311.299805;
      c.Enum.position.y    := 831.463013;
      c.Enum.position.z    := 1326.410034;
      c.facing             := 5.480334;
      c.bounding_radius    := 0.306;
      c.combat_reach       := 1.500000;
      c.enum_model         := 55+Gender;
      c.faction_template   := RACE_NIGHT_ELF; // NIGHT ELF
      case cclass of
        CLASS_WARRIOR:     RACE_NIGHTELF_CLASS_WARRIOR(c);
        CLASS_HUNTER:      RACE_NIGHTELF_CLASS_HUNTER(c);
        CLASS_ROGUE:       RACE_NIGHTELF_CLASS_ROGUE(c);
        CLASS_PRIEST:      RACE_NIGHTELF_CLASS_PRIEST(c);
        CLASS_DRUID:       RACE_NIGHTELF_CLASS_DRUID(c);
      end;
    end;

    RACE_GNOME:
    begin
      c.scale_x            := 1.15;
      c.Enum.zoneID        := 1;
      c.Enum.mapID         := 0;
      c.Enum.position.x    := -6240.319824;
      c.Enum.position.y    := 331.032990;
      c.Enum.position.z    := 382.757996;
      c.facing             := 0.0;
      c.bounding_radius    := 0.351899;
      c.combat_reach       := 1.724999;
      c.enum_model         := 1563+gender;
      c.faction_template   := 115; // GNOME
      case cclass of
        CLASS_WARRIOR:     RACE_GNOME_CLASS_WARRIOR(c);
        CLASS_ROGUE:       RACE_GNOME_CLASS_ROGUE(c);
        CLASS_MAGE:        RACE_GNOME_CLASS_MAGE(c);
        CLASS_WARLOCK:     RACE_GNOME_CLASS_WARLOCK(c);
      end;
    end;

    RACE_DRAENEI:
    begin
      c.scale_x            := 1.0;
      c.Enum.zoneID        := 3524;
      c.Enum.mapID         := 530;
      c.Enum.position.x    := -3961.639893;
      c.Enum.position.y    := -13931.200195;
      c.Enum.position.z    := 100.614998;
      c.facing             := 2.083644;
      c.bounding_radius    := 1.000000;
      c.combat_reach       := 1.000000;
      c.enum_model         := 16125+Gender;
      c.faction_template   := 1629; // DRAENEI
      case cclass of
        CLASS_WARRIOR:     RACE_DRAENEI_CLASS_WARRIOR(c);
        CLASS_PALADIN:     RACE_DRAENEI_CLASS_PALADIN(c);
        CLASS_HUNTER:      RACE_DRAENEI_CLASS_HUNTER(c);
        CLASS_PRIEST:      RACE_DRAENEI_CLASS_PRIEST(c);
        CLASS_SHAMAN:      RACE_DRAENEI_CLASS_SHAMAN(c);
        CLASS_MAGE:        RACE_DRAENEI_CLASS_MAGE(c);
      end;
    end;

    // -------------------------------------------------------------------------
    // HORDE
    // -------------------------------------------------------------------------
    RACE_ORC:
    begin
      c.scale_x            := 1.0;
      c.Enum.zoneID        := 14;
      c.Enum.mapID         := 1;
      c.Enum.position.x    := -618.518005;
      c.Enum.position.y    := -4251.669922;
      c.Enum.position.z    := 38.717999;
      c.facing             := 0.0;
      c.bounding_radius    := 0.372000;
      c.combat_reach       := 1.500000;
      c.enum_model         := 51+Gender;
      c.faction_template   := RACE_ORC; // ORC
      case cclass of
        CLASS_WARRIOR:     RACE_ORC_CLASS_WARRIOR(c);
        CLASS_HUNTER:      RACE_ORC_CLASS_HUNTER(c);
        CLASS_ROGUE:       RACE_ORC_CLASS_ROGUE(c);
        CLASS_SHAMAN:      RACE_ORC_CLASS_SHAMAN(c);
        CLASS_WARLOCK:     RACE_ORC_CLASS_WARLOCK(c);
      end;
    end;

    RACE_UNDEAD:
    begin
      c.scale_x            := 1.0;
      c.Enum.zoneID        := 85;
      c.Enum.mapID         := 0;
      c.Enum.position.x    := 1676.349976;
      c.Enum.position.y    := 1677.449951;
      c.Enum.position.z    := 121.669998;
      c.facing             := 2.705260;
      c.bounding_radius    := 0.382999;
      c.combat_reach       := 1.500000;
      c.enum_model         := 57+gender;
      c.faction_template   := RACE_UNDEAD; // UNDEAD
      case cclass of
        CLASS_WARRIOR:     RACE_UNDEAD_CLASS_WARRIOR(c);
        CLASS_ROGUE:       RACE_UNDEAD_CLASS_ROGUE(c);
        CLASS_PRIEST:      RACE_UNDEAD_CLASS_PRIEST(c);
        CLASS_MAGE:        RACE_UNDEAD_CLASS_MAGE(c);
        CLASS_WARLOCK:     RACE_UNDEAD_CLASS_WARLOCK(c);
      end;
    end;

    RACE_TAUREN:
    begin
      c.scale_x            := 1.350000;
      c.Enum.zoneID        := 215;
      c.Enum.mapID         := 1;
      c.Enum.position.x    := -2917.580078;
      c.Enum.position.y    := -257.980011;
      c.Enum.position.z    := 60.974525;
      c.facing             := 0.0;
      c.bounding_radius    := 0.974700;
      c.combat_reach       := 4.050000;
      c.enum_model         := 59+Gender;
      c.faction_template   := RACE_TAUREN; // TAUREN
      case cclass of
        CLASS_WARRIOR:     RACE_TAUREN_CLASS_WARRIOR(c);
        CLASS_HUNTER:      RACE_TAUREN_CLASS_HUNTER(c);
        CLASS_SHAMAN:      RACE_TAUREN_CLASS_SHAMAN(c);
        CLASS_DRUID:       RACE_TAUREN_CLASS_DRUID(c);
      end;
    end;

    RACE_TROLL:
    begin
      c.scale_x            := 1.0;
      c.Enum.zoneID        := 14;
      c.Enum.mapID         := 1;
      c.Enum.position.x    := -618.518;
      c.Enum.position.y    := -4251.67;
      c.Enum.position.z    := 38.718;
      c.facing             := 1.0;
      c.bounding_radius    := 0.305999;
      c.combat_reach       := 1.500000;
      c.enum_model         := 1478+Gender;
      c.faction_template   := 116; // TROLL
      case cclass of
        CLASS_WARRIOR:     RACE_TROLL_CLASS_WARRIOR(c);
        CLASS_HUNTER:      RACE_TROLL_CLASS_HUNTER(c);
        CLASS_ROGUE:       RACE_TROLL_CLASS_ROGUE(c);
        CLASS_PRIEST:      RACE_TROLL_CLASS_PRIEST(c);
        CLASS_SHAMAN:      RACE_TROLL_CLASS_SHAMAN(c);
        CLASS_MAGE:        RACE_TROLL_CLASS_MAGE(c);
      end;
    end;

    RACE_BLOOD_ELF:
    begin
      c.scale_x            := 1.0;
      c.Enum.zoneID        := 3430;
      c.Enum.mapID         := 530;
      c.Enum.position.x    := 10349.599609;
      c.Enum.position.y    := -6357.290039;
      c.Enum.position.z    := 33.402599;
      c.facing             := 5.316046;
      c.bounding_radius    := 0.383;
      c.combat_reach       := 1.500000;
      c.enum_model         := 15476-gender;
      c.faction_template   := 1610; // BLOOD_ELF
      case cclass of
        CLASS_PALADIN:     RACE_BLOODELF_CLASS_PALADIN(c);
        CLASS_HUNTER:      RACE_BLOODELF_CLASS_HUNTER(c);
        CLASS_ROGUE:       RACE_BLOODELF_CLASS_ROGUE(c);
        CLASS_PRIEST:      RACE_BLOODELF_CLASS_PRIEST(c);
        CLASS_MAGE:        RACE_BLOODELF_CLASS_MAGE(c);
        CLASS_WARLOCK:     RACE_BLOODELF_CLASS_WARLOCK(c);
      end;
    end;

  End;

  // common
  c.speed_walk             := 2.5;
  c.speed_run              := 7.0;
  c.speed_run_back         := 4.5;
  c.speed_swim             := 4.722222;
  c.speed_swim_back        := 2.5;
  c.speed_flight           := 7.0;
  c.speed_flight_back      := 4.5;

  c.health                 := c.max_health;
  c.power[POWER_MANA]      := c.max_power[POWER_MANA];
  c.power[POWER_RAGE]      := c.max_power[POWER_RAGE];
  c.power[POWER_FOCUS]     := c.max_power[POWER_FOCUS];
  c.power[POWER_ENERGY]    := c.max_power[POWER_ENERGY];
  c.power[POWER_HAPPINESS] := c.max_power[POWER_HAPPINESS];
  c.power[POWER_RUNES]     := c.max_power[POWER_RUNES];
  c.power[POWER_RUNIC]     := c.max_power[POWER_RUNIC];
  if c.power_type=POWER_RAGE then
    c.power[POWER_RAGE]    := 0;

  c.Enum.experienceLevel   := 1;
  c.Enum.flags             := 0;
  c.flags                  := 8;
  c.native_model           := c.enum_model;
  c.mount_model            := 0;
  c.XP                     := 100;
  c.next_level_xp          := 2500;
  c.professions_left       := 2;
  c.coinage                := 1230000;

  c.Enum.restInfo          := 1;
  c.rest_state_xp          := 200;

  c.Enum.guildID           := 0;
  c.Enum.petDisplayInfoID  := 0;
  c.Enum.petExperienceLevel:= 0;
  c.Enum.petCreatureFamilyID:= 0;

  c.enum_model_backup      := c.enum_model;
end;

end.
