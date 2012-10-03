unit CharsConsts;

interface

uses
  Struct, Defines;

procedure MakeRaceClassDefaultParams(race, cclass, gender: byte; var c: TCharData);

implementation

uses
  CharsConstsAlliance, CharsConstsHorde,
  Windows;

procedure MakeRaceClassDefaultParams(race, cclass, gender: byte; var c: TCharData);
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
      case cclass of
        CLASS_WARRIOR:     RACE_HUMAN_CLASS_WARRIOR(c);
        CLASS_PALADIN:     RACE_HUMAN_CLASS_PALADIN(c);
        CLASS_ROGUE:       RACE_HUMAN_CLASS_ROGUE(c);
        CLASS_PRIEST:      RACE_HUMAN_CLASS_PRIEST(c);
        CLASS_DEATHKNIGHT: RACE_HUMAN_CLASS_DEATHKNIGHT(c);
        CLASS_MAGE:        RACE_HUMAN_CLASS_MAGE(c);
        CLASS_WARLOCK:     RACE_HUMAN_CLASS_WARLOCK(c);
      end;
    end;

    RACE_DWARF:
    begin
      case cclass of
        CLASS_WARRIOR:     RACE_DWARF_CLASS_WARRIOR(c);
        CLASS_PALADIN:     RACE_DWARF_CLASS_PALADIN(c);
        CLASS_HUNTER:      RACE_DWARF_CLASS_HUNTER(c);
        CLASS_ROGUE:       RACE_DWARF_CLASS_ROGUE(c);
        CLASS_PRIEST:      RACE_DWARF_CLASS_PRIEST(c);
        CLASS_DEATHKNIGHT: RACE_DWARF_CLASS_DEATHKNIGHT(c);
      end;
    end;

    RACE_NIGHT_ELF:
    begin
      case cclass of
        CLASS_WARRIOR:     RACE_NIGHTELF_CLASS_WARRIOR(c);
        CLASS_HUNTER:      RACE_NIGHTELF_CLASS_HUNTER(c);
        CLASS_ROGUE:       RACE_NIGHTELF_CLASS_ROGUE(c);
        CLASS_PRIEST:      RACE_NIGHTELF_CLASS_PRIEST(c);
        CLASS_DEATHKNIGHT: RACE_NIGHTELF_CLASS_DEATHKNIGHT(c);
        CLASS_DRUID:       RACE_NIGHTELF_CLASS_DRUID(c);
      end;
    end;

    RACE_GNOME:
    begin
      case cclass of
        CLASS_WARRIOR:     RACE_GNOME_CLASS_WARRIOR(c);
        CLASS_ROGUE:       RACE_GNOME_CLASS_ROGUE(c);
        CLASS_DEATHKNIGHT: RACE_GNOME_CLASS_DEATHKNIGHT(c);
        CLASS_MAGE:        RACE_GNOME_CLASS_MAGE(c);
        CLASS_WARLOCK:     RACE_GNOME_CLASS_WARLOCK(c);
      end;
    end;

    RACE_DRAENEI:
    begin
      case cclass of
        CLASS_WARRIOR:     RACE_DRAENEI_CLASS_WARRIOR(c);
        CLASS_PALADIN:     RACE_DRAENEI_CLASS_PALADIN(c);
        CLASS_HUNTER:      RACE_DRAENEI_CLASS_HUNTER(c);
        CLASS_PRIEST:      RACE_DRAENEI_CLASS_PRIEST(c);
        CLASS_DEATHKNIGHT: RACE_DRAENEI_CLASS_DEATHKNIGHT(c);
        CLASS_SHAMAN:      RACE_DRAENEI_CLASS_SHAMAN(c);
        CLASS_MAGE:        RACE_DRAENEI_CLASS_MAGE(c);
      end;
    end;

    // -------------------------------------------------------------------------
    // HORDE
    // -------------------------------------------------------------------------
    RACE_ORC:
    begin
      case cclass of
        CLASS_WARRIOR:     RACE_ORC_CLASS_WARRIOR(c);
        CLASS_HUNTER:      RACE_ORC_CLASS_HUNTER(c);
        CLASS_ROGUE:       RACE_ORC_CLASS_ROGUE(c);
        CLASS_DEATHKNIGHT: RACE_ORC_CLASS_DEATHKNIGHT(c);
        CLASS_SHAMAN:      RACE_ORC_CLASS_SHAMAN(c);
        CLASS_WARLOCK:     RACE_ORC_CLASS_WARLOCK(c);
      end;
    end;

    RACE_UNDEAD:
    begin
      case cclass of
        CLASS_WARRIOR:     RACE_UNDEAD_CLASS_WARRIOR(c);
        CLASS_ROGUE:       RACE_UNDEAD_CLASS_ROGUE(c);
        CLASS_PRIEST:      RACE_UNDEAD_CLASS_PRIEST(c);
        CLASS_DEATHKNIGHT: RACE_UNDEAD_CLASS_DEATHKNIGHT(c);
        CLASS_MAGE:        RACE_UNDEAD_CLASS_MAGE(c);
        CLASS_WARLOCK:     RACE_UNDEAD_CLASS_WARLOCK(c);
      end;
    end;

    RACE_TAUREN:
    begin
      case cclass of
        CLASS_WARRIOR:     RACE_TAUREN_CLASS_WARRIOR(c);
        CLASS_HUNTER:      RACE_TAUREN_CLASS_HUNTER(c);
        CLASS_DEATHKNIGHT: RACE_TAUREN_CLASS_DEATHKNIGHT(c);
        CLASS_SHAMAN:      RACE_TAUREN_CLASS_SHAMAN(c);
        CLASS_DRUID:       RACE_TAUREN_CLASS_DRUID(c);
      end;
    end;

    RACE_TROLL:
    begin
      case cclass of
        CLASS_WARRIOR:     RACE_TROLL_CLASS_WARRIOR(c);
        CLASS_HUNTER:      RACE_TROLL_CLASS_HUNTER(c);
        CLASS_ROGUE:       RACE_TROLL_CLASS_ROGUE(c);
        CLASS_PRIEST:      RACE_TROLL_CLASS_PRIEST(c);
        CLASS_DEATHKNIGHT: RACE_TROLL_CLASS_DEATHKNIGHT(c);
        CLASS_SHAMAN:      RACE_TROLL_CLASS_SHAMAN(c);
        CLASS_MAGE:        RACE_TROLL_CLASS_MAGE(c);
      end;
    end;

    RACE_BLOOD_ELF:
    begin
      case cclass of
        CLASS_PALADIN:     RACE_BLOODELF_CLASS_PALADIN(c);
        CLASS_HUNTER:      RACE_BLOODELF_CLASS_HUNTER(c);
        CLASS_ROGUE:       RACE_BLOODELF_CLASS_ROGUE(c);
        CLASS_PRIEST:      RACE_BLOODELF_CLASS_PRIEST(c);
        CLASS_DEATHKNIGHT: RACE_BLOODELF_CLASS_DEATHKNIGHT(c);
        CLASS_MAGE:        RACE_BLOODELF_CLASS_MAGE(c);
        CLASS_WARLOCK:     RACE_BLOODELF_CLASS_WARLOCK(c);
      end;
    end;
  End;

  c.speed_walk             := 2.5;
  c.speed_run              := 7.0;
  c.speed_run_back         := 4.5;
  c.speed_swim             := 4.722222;
  c.speed_swim_back        := 2.5;
  c.speed_flight           := 7.0;
  c.speed_flight_back      := 4.5;

  c.Enum.restInfo          := 2;
  c.Enum.guildID           := 0;
  c.Enum.petDisplayInfoID  := 0;
  c.Enum.petExperienceLevel:= 0;
  c.Enum.petCreatureFamilyID:= 0;
  c.native_model           := c.enum_model;
  c.enum_model_backup      := c.enum_model;
  c.mount_model            := 0;

  c.stand_state:= 0;
  c.sheathed:= 0;
  c.rest_state_xp          := 0;
  c.coinage                := 1000000;
end;

end.
