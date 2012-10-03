unit CharsConstsAlliance;

interface

uses
  Struct, Defines;

procedure RACE_HUMAN_CLASS_WARRIOR(var c:TCharData);
procedure RACE_HUMAN_CLASS_PALADIN(var c:TCharData);
procedure RACE_HUMAN_CLASS_ROGUE(var c:TCharData);
procedure RACE_HUMAN_CLASS_PRIEST(var c:TCharData);
procedure RACE_HUMAN_CLASS_DEATHKNIGHT(var c:TCharData);
procedure RACE_HUMAN_CLASS_MAGE(var c:TCharData);
procedure RACE_HUMAN_CLASS_WARLOCK(var c:TCharData); // WARNING: 2.0.6 DATA!

procedure RACE_DWARF_CLASS_WARRIOR(var c:TCharData);
procedure RACE_DWARF_CLASS_PALADIN(var c:TCharData);
procedure RACE_DWARF_CLASS_HUNTER(var c:TCharData);
procedure RACE_DWARF_CLASS_ROGUE(var c:TCharData);
procedure RACE_DWARF_CLASS_PRIEST(var c:TCharData);
procedure RACE_DWARF_CLASS_DEATHKNIGHT(var c:TCharData);

procedure RACE_NIGHTELF_CLASS_WARRIOR(var c:TCharData);
procedure RACE_NIGHTELF_CLASS_HUNTER(var c:TCharData);
procedure RACE_NIGHTELF_CLASS_ROGUE(var c:TCharData);
procedure RACE_NIGHTELF_CLASS_PRIEST(var c:TCharData);
procedure RACE_NIGHTELF_CLASS_DEATHKNIGHT(var c:TCharData);
procedure RACE_NIGHTELF_CLASS_DRUID(var c:TCharData);

procedure RACE_GNOME_CLASS_WARRIOR(var c:TCharData);
procedure RACE_GNOME_CLASS_ROGUE(var c:TCharData);
procedure RACE_GNOME_CLASS_DEATHKNIGHT(var c:TCharData);
procedure RACE_GNOME_CLASS_MAGE(var c:TCharData);
procedure RACE_GNOME_CLASS_WARLOCK(var c:TCharData);

procedure RACE_DRAENEI_CLASS_WARRIOR(var c:TCharData);
procedure RACE_DRAENEI_CLASS_PALADIN(var c:TCharData);
procedure RACE_DRAENEI_CLASS_HUNTER(var c:TCharData);
procedure RACE_DRAENEI_CLASS_PRIEST(var c:TCharData);
procedure RACE_DRAENEI_CLASS_DEATHKNIGHT(var c:TCharData);
procedure RACE_DRAENEI_CLASS_SHAMAN(var c:TCharData);
procedure RACE_DRAENEI_CLASS_MAGE(var c:TCharData);

implementation

procedure RACE_HUMAN_CLASS_WARRIOR(var c:TCharData);
begin
  c.Enum.zoneID                := 0;
  c.Enum.mapID                 := 0;
  c.Enum.position.x            := -8949.950195;
  c.Enum.position.y            := -132.492996;
  c.Enum.position.z            := 83.531196;
  c.facing                     := 0;

  c.scale_x                    := 1;
  c.power_type                 := 1;
  c.max_health                 := 60;
  c.max_power[POWER_MANA]      := 0;
  c.max_power[POWER_RAGE]      := 1000;
  c.max_power[POWER_FOCUS]     := 100;
  c.max_power[POWER_ENERGY]    := 100;
  c.max_power[POWER_HAPPINESS] := 0;
  c.max_power[POWER_RUNES]     := 8;
  c.max_power[POWER_RUNIC]     := 1000;
  c.health                     := 60;
  c.power[POWER_MANA]          := 0;
  c.power[POWER_RAGE]          := 0;
  c.power[POWER_FOCUS]         := 100;
  c.power[POWER_ENERGY]        := 100;
  c.power[POWER_HAPPINESS]     := 0;
  c.power[POWER_RUNES]         := 8;
  c.power[POWER_RUNIC]         := 0;
  c.Enum.experienceLevel       := 1;
  c.faction_template           := 1;
  c.flags                      := $00000008;
  c.flags2                     := $00000800;
  c.mainhand_attack_time       := 2900;
  c.offhand_attack_time        := 2000;
  c.ranged_attack_time         := 0;
  c.bounding_radius            := 0.208000;
  c.combat_reach               := 1.5;
  c.enum_model                 := 49+c.Enum.sexID;
  c.native_model               := 49+c.Enum.sexID;
  c.mount_model                := 0;
  c.min_damage                 := 9.007143;
  c.max_damage                 := 11.007143;
  c.min_offhand_damage         := 0;
  c.max_offhand_damage         := 0;
  c.mod_cast_speed             := 1;
  c.stat[0]                    := 23;
  c.stat[1]                    := 20;
  c.stat[2]                    := 22;
  c.stat[3]                    := 20;
  c.stat[4]                    := 20;
  c.resist[0]                  := 42;
  c.resist[1]                  := 0;
  c.resist[2]                  := 0;
  c.resist[3]                  := 0;
  c.resist[4]                  := 0;
  c.resist[5]                  := 0;
  c.resist[6]                  := 0;
  c.base_mana                  := 0;
  c.base_health                := 20;
  c.attack_power               := 29;
  c.ranged_attack_time         := 0;
  c.min_ranged_damage          := 0;
  c.max_ranged_damage          := 0;
  c.hover_height               := 1;

  c.player_flags               := $00000000;
  c.xp                         := 0;
  c.next_level_xp              := 400;
  c.points1                    := 0;
  c.professions_left           := 2;
  c.ammo_id                    := 0;

  c.ItemsAdd($FF,3, 38,1, $00010000);             // Recruit's Shirt
  c.ItemsAdd($FF,6, 39,1, $00010000);             // Recruit's Pants
  c.ItemsAdd($FF,7, 40,1, $00010000);             // Recruit's Boots
  c.ItemsAdd($FF,15, 49778,1, $00010000);         //
  c.ItemsAdd($FF,23, 6948,1, $00010001);          // Hearthstone

  c.SkillsAdd($0000,473, 1,0, 0,0);               // Fist Weapons
  c.SkillsAdd($0000,44, 5,1, 0,0);                // Axes
  c.SkillsAdd($0000,164, 0,0, 0,0);               // Blacksmithing
  c.SkillsAdd($0000,202, 0,0, 0,0);               // Engineering
  c.SkillsAdd($0000,762, 0,0, 0,0);               // Riding
  c.SkillsAdd($0000,257, 5,0, 0,0);               // Protection
  c.SkillsAdd($0000,46, 5,0, 0,0);                // Guns
  c.SkillsAdd($0000,769, 5,0, 0,0);               // Internal
  c.SkillsAdd($0000,755, 0,0, 0,0);               // Jewelcrafting
  c.SkillsAdd($0000,98, 300,300, 0,0);            // Language: Common
  c.SkillsAdd($0000,136, 5,0, 0,0);               // Staves
  c.SkillsAdd($0000,54, 5,1, 0,0);                // Maces
  c.SkillsAdd($0000,533, 0,0, 0,0);               // Raptor Riding
  c.SkillsAdd($0000,554, 0,0, 0,0);               // Undead Horsemanship
  c.SkillsAdd($0000,771, 1,0, 0,0);               // Frost
  c.SkillsAdd($0000,186, 0,0, 0,0);               // Mining
  c.SkillsAdd($0000,197, 0,0, 0,0);               // Tailoring
  c.SkillsAdd($0000,333, 0,0, 0,0);               // Enchanting
  c.SkillsAdd($0000,185, 0,0, 0,0);               // Cooking
  c.SkillsAdd($0000,229, 0,0, 0,0);               // Polearms
  c.SkillsAdd($0000,777, 1,1, 0,0);               // Mounts
  c.SkillsAdd($0000,393, 0,0, 0,0);               // Skinning
  c.SkillsAdd($0000,137, 0,0, 0,0);               // Language: Thalassian
  c.SkillsAdd($0000,759, 0,0, 0,0);               // Language: Draenei
  c.SkillsAdd($0000,182, 0,0, 0,0);               // Herbalism
  c.SkillsAdd($0000,226, 5,0, 0,0);               // Crossbows
  c.SkillsAdd($0000,754, 5,5, 0,0);               // Racial - Human
  c.SkillsAdd($0000,109, 0,0, 0,0);               // Language: Orcish
  c.SkillsAdd($0000,433, 1,1, 0,0);               // Shield
  c.SkillsAdd($0000,140, 300,0, 0,0);             // Language: Titan
  c.SkillsAdd($0000,149, 0,0, 0,0);               // Wolf Riding
  c.SkillsAdd($0000,313, 0,0, 0,0);               // Language: Gnomish
  c.SkillsAdd($0000,45, 5,0, 0,0);                // Bows
  c.SkillsAdd($0000,55, 5,1, 0,0);                // Two-Handed Swords
  c.SkillsAdd($0000,713, 0,0, 0,0);               // Kodo Riding
  c.SkillsAdd($0000,773, 0,0, 0,0);               // Inscription
  c.SkillsAdd($0000,129, 0,0, 0,0);               // First Aid
  c.SkillsAdd($0000,162, 5,1, 0,0);               // Unarmed
  c.SkillsAdd($0000,111, 0,0, 0,0);               // Language: Dwarven
  c.SkillsAdd($0000,113, 0,0, 0,0);               // Language: Darnassian
  c.SkillsAdd($0000,115, 0,0, 0,0);               // Language: Taurahe
  c.SkillsAdd($0000,315, 0,0, 0,0);               // Language: Troll
  c.SkillsAdd($0000,139, 0,0, 0,0);               // Language: Demon Tongue
  c.SkillsAdd($0000,152, 0,0, 0,0);               // Ram Riding
  c.SkillsAdd($0000,673, 0,0, 0,0);               // Language: Gutterspeak
  c.SkillsAdd($0000,293, 0,0, 0,0);               // Plate Mail
  c.SkillsAdd($0000,118, 0,0, 0,0);               // Dual Wield
  c.SkillsAdd($0000,138, 300,0, 0,0);             // Language: Draconic
  c.SkillsAdd($0000,141, 0,0, 0,0);               // Language: Old Tongue
  c.SkillsAdd($0000,142, 1,0, 0,0);               // Survival
  c.SkillsAdd($0000,148, 0,0, 0,0);               // Horse Riding
  c.SkillsAdd($0000,150, 0,0, 0,0);               // Tiger Riding
  c.SkillsAdd($0000,173, 5,0, 0,0);               // Daggers
  c.SkillsAdd($0000,183, 5,5, 0,0);               // GENERIC (DND)
  c.SkillsAdd($0000,95, 5,1, 0,0);                // Defense
  c.SkillsAdd($0000,176, 5,0, 0,0);               // Thrown
  c.SkillsAdd($0000,415, 1,1, 0,0);               // Cloth
  c.SkillsAdd($0000,256, 5,0, 0,0);               // Fury
  c.SkillsAdd($0000,413, 1,1, 0,0);               // Mail
  c.SkillsAdd($0000,414, 1,1, 0,0);               // Leather
  c.SkillsAdd($0000,356, 0,0, 0,0);               // Fishing
  c.SkillsAdd($0000,171, 0,0, 0,0);               // Alchemy
  c.SkillsAdd($0000,172, 5,0, 0,0);               // Two-Handed Axes
  c.SkillsAdd($0000,43, 5,1, 0,0);                // Swords
  c.SkillsAdd($0000,26, 5,5, 0,0);                // Arms
  c.SkillsAdd($0000,778, 1,0, 0,0);               // Companions
  c.SkillsAdd($0000,160, 5,0, 0,0);               // Two-Handed Maces
  c.SkillsAdd($0000,165, 0,0, 0,0);               // Leatherworking

  c.SpellsAdd(196, 0);                            // One-Handed Axes
  c.SpellsAdd(668, 0);                            // Language Common
  c.SpellsAdd(198, 0);                            // One-Handed Maces
  c.SpellsAdd(58985, 0);                          // Perception
  c.SpellsAdd(20599, 0);                          // Diplomacy
  c.SpellsAdd(20597, 0);                          // Sword Specialization
  c.SpellsAdd(20598, 0);                          // The Human Spirit
  c.SpellsAdd(59752, 0);                          // Every Man for Himself
  c.SpellsAdd(20864, 0);                          // Mace Specialization
  c.SpellsAdd(9116, 0);                           // Shield
  c.SpellsAdd(202, 0);                            // Two-Handed Swords
  c.SpellsAdd(203, 0);                            // Unarmed
  c.SpellsAdd(21651, 0);                          // Opening
  c.SpellsAdd(21652, 0);                          // Closing
  c.SpellsAdd(22810, 0);                          // Opening - No Text
  c.SpellsAdd(8386, 0);                           // Attacking
  c.SpellsAdd(3365, 0);                           // Opening
  c.SpellsAdd(3050, 0);                           // Detect
  c.SpellsAdd(9125, 0);                           // Generic
  c.SpellsAdd(7266, 0);                           // Duel
  c.SpellsAdd(7267, 0);                           // Grovel
  c.SpellsAdd(7355, 0);                           // Stuck
  c.SpellsAdd(6478, 0);                           // Opening
  c.SpellsAdd(6603, 0);                           // Auto Attack
  c.SpellsAdd(6233, 0);                           // Closing
  c.SpellsAdd(6246, 0);                           // Closing
  c.SpellsAdd(6247, 0);                           // Opening
  c.SpellsAdd(6477, 0);                           // Opening
  c.SpellsAdd(2479, 0);                           // Honorless Target
  c.SpellsAdd(45927, 0);                          // Summon Friend
  c.SpellsAdd(2382, 0);                           // Generic
  c.SpellsAdd(22027, 0);                          // Remove Insignia
  c.SpellsAdd(61437, 0);                          // Opening
  c.SpellsAdd(68398, 0);                          // Opening
  c.SpellsAdd(204, 0);                            // Defense
  c.SpellsAdd(107, 0);                            // Block
  c.SpellsAdd(81, 0);                             // Dodge
  c.SpellsAdd(32215, 0);                          // Victorious State
  c.SpellsAdd(522, 0);                            // SPELLDEFENSE (DND)
  c.SpellsAdd(5301, 0);                           // Defensive State (DND)
  c.SpellsAdd(9078, 0);                           // Cloth
  c.SpellsAdd(8737, 0);                           // Mail
  c.SpellsAdd(9077, 0);                           // Leather
  c.SpellsAdd(201, 0);                            // One-Handed Swords
  c.SpellsAdd(78, 0);                             // Heroic Strike
  c.SpellsAdd(2457, 0);                           // Battle Stance

  c.SetActionButtons(0, 6603, $00000000);         // Spell: Auto Attack
  c.SetActionButtons(1, 78, $00000000);           // Spell: Heroic Strike
  c.SetActionButtons(9, 59752, $00000000);        // Spell: Every Man for Himself
  c.SetActionButtons(72, 6603, $00000000);        // Spell: Auto Attack
  c.SetActionButtons(73, 78, $00000000);          // Spell: Heroic Strike
  c.SetActionButtons(82, 59752, $00000000);       // Spell: Every Man for Himself
  c.SetActionButtons(84, 6603, $00000000);        // Spell: Auto Attack
  c.SetActionButtons(96, 6603, $00000000);        // Spell: Auto Attack
  c.SetActionButtons(108, 6603, $00000000);       // Spell: Auto Attack
end;
procedure RACE_HUMAN_CLASS_PALADIN(var c:TCharData);
begin
  c.Enum.zoneID                := 0;
  c.Enum.mapID                 := 0;
  c.Enum.position.x            := -8949.950195;
  c.Enum.position.y            := -132.492996;
  c.Enum.position.z            := 83.531196;
  c.facing                     := 0;

  c.scale_x                    := 1;
  c.power_type                 := 0;
  c.max_health                 := 58;
  c.max_power[POWER_MANA]      := 80;
  c.max_power[POWER_RAGE]      := 1000;
  c.max_power[POWER_FOCUS]     := 100;
  c.max_power[POWER_ENERGY]    := 100;
  c.max_power[POWER_HAPPINESS] := 0;
  c.max_power[POWER_RUNES]     := 8;
  c.max_power[POWER_RUNIC]     := 1000;
  c.health                     := 58;
  c.power[POWER_MANA]          := 80;
  c.power[POWER_RAGE]          := 1000;
  c.power[POWER_FOCUS]         := 100;
  c.power[POWER_ENERGY]        := 100;
  c.power[POWER_HAPPINESS]     := 0;
  c.power[POWER_RUNES]         := 8;
  c.power[POWER_RUNIC]         := 0;
  c.Enum.experienceLevel       := 1;
  c.faction_template           := 1;
  c.flags                      := $00000008;
  c.flags2                     := $00000800;
  c.mainhand_attack_time       := 2900;
  c.offhand_attack_time        := 2000;
  c.ranged_attack_time         := 0;
  c.bounding_radius            := 0.208000;
  c.combat_reach               := 1.5;
  c.enum_model                 := 49+c.Enum.sexID;
  c.native_model               := 49+c.Enum.sexID;
  c.mount_model                := 0;
  c.min_damage                 := 8.592857;
  c.max_damage                 := 10.592857;
  c.min_offhand_damage         := 0;
  c.max_offhand_damage         := 0;
  c.mod_cast_speed             := 1;
  c.stat[0]                    := 22;
  c.stat[1]                    := 20;
  c.stat[2]                    := 22;
  c.stat[3]                    := 20;
  c.stat[4]                    := 21;
  c.resist[0]                  := 42;
  c.resist[1]                  := 0;
  c.resist[2]                  := 0;
  c.resist[3]                  := 0;
  c.resist[4]                  := 0;
  c.resist[5]                  := 0;
  c.resist[6]                  := 0;
  c.base_mana                  := 60;
  c.base_health                := 18;
  c.attack_power               := 27;
  c.ranged_attack_time         := 0;
  c.min_ranged_damage          := 0;
  c.max_ranged_damage          := 0;
  c.hover_height               := 1;

  c.player_flags               := $00000000;
  c.xp                         := 0;
  c.next_level_xp              := 400;
  c.points1                    := 0;
  c.professions_left           := 2;
  c.ammo_id                    := 0;

  c.ItemsAdd($FF,3, 45,1, $00010000);             // Squire's Shirt
  c.ItemsAdd($FF,6, 44,1, $00010000);             // Squire's Pants
  c.ItemsAdd($FF,7, 43,1, $00010000);             // Squire's Boots
  c.ItemsAdd($FF,15, 2361,1, $00010000);          // Battleworn Hammer
  c.ItemsAdd($FF,23, 6948,1, $00010001);          // Hearthstone

  c.SkillsAdd($0000,44, 5,0, 0,0);                // Axes
  c.SkillsAdd($0000,164, 0,0, 0,0);               // Blacksmithing
  c.SkillsAdd($0000,202, 0,0, 0,0);               // Engineering
  c.SkillsAdd($0000,762, 0,0, 0,0);               // Riding
  c.SkillsAdd($0000,769, 5,0, 0,0);               // Internal
  c.SkillsAdd($0000,755, 0,0, 0,0);               // Jewelcrafting
  c.SkillsAdd($0000,98, 300,300, 0,0);            // Language: Common
  c.SkillsAdd($0000,54, 5,1, 0,0);                // Maces
  c.SkillsAdd($0000,533, 0,0, 0,0);               // Raptor Riding
  c.SkillsAdd($0000,554, 0,0, 0,0);               // Undead Horsemanship
  c.SkillsAdd($0000,771, 1,0, 0,0);               // Frost
  c.SkillsAdd($0000,186, 0,0, 0,0);               // Mining
  c.SkillsAdd($0000,197, 0,0, 0,0);               // Tailoring
  c.SkillsAdd($0000,333, 0,0, 0,0);               // Enchanting
  c.SkillsAdd($0000,185, 0,0, 0,0);               // Cooking
  c.SkillsAdd($0000,229, 0,0, 0,0);               // Polearms
  c.SkillsAdd($0000,777, 1,1, 0,0);               // Mounts
  c.SkillsAdd($0000,393, 0,0, 0,0);               // Skinning
  c.SkillsAdd($0000,137, 0,0, 0,0);               // Language: Thalassian
  c.SkillsAdd($0000,759, 0,0, 0,0);               // Language: Draenei
  c.SkillsAdd($0000,182, 0,0, 0,0);               // Herbalism
  c.SkillsAdd($0000,754, 5,5, 0,0);               // Racial - Human
  c.SkillsAdd($0000,109, 0,0, 0,0);               // Language: Orcish
  c.SkillsAdd($0000,433, 1,1, 0,0);               // Shield
  c.SkillsAdd($0000,140, 300,0, 0,0);             // Language: Titan
  c.SkillsAdd($0000,149, 0,0, 0,0);               // Wolf Riding
  c.SkillsAdd($0000,313, 0,0, 0,0);               // Language: Gnomish
  c.SkillsAdd($0000,55, 5,0, 0,0);                // Two-Handed Swords
  c.SkillsAdd($0000,713, 0,0, 0,0);               // Kodo Riding
  c.SkillsAdd($0000,773, 0,0, 0,0);               // Inscription
  c.SkillsAdd($0000,129, 0,0, 0,0);               // First Aid
  c.SkillsAdd($0000,267, 5,0, 0,0);               // Protection
  c.SkillsAdd($0000,162, 5,1, 0,0);               // Unarmed
  c.SkillsAdd($0000,111, 0,0, 0,0);               // Language: Dwarven
  c.SkillsAdd($0000,113, 0,0, 0,0);               // Language: Darnassian
  c.SkillsAdd($0000,115, 0,0, 0,0);               // Language: Taurahe
  c.SkillsAdd($0000,315, 0,0, 0,0);               // Language: Troll
  c.SkillsAdd($0000,139, 0,0, 0,0);               // Language: Demon Tongue
  c.SkillsAdd($0000,152, 0,0, 0,0);               // Ram Riding
  c.SkillsAdd($0000,673, 0,0, 0,0);               // Language: Gutterspeak
  c.SkillsAdd($0000,293, 0,0, 0,0);               // Plate Mail
  c.SkillsAdd($0000,138, 300,0, 0,0);             // Language: Draconic
  c.SkillsAdd($0000,141, 0,0, 0,0);               // Language: Old Tongue
  c.SkillsAdd($0000,142, 1,0, 0,0);               // Survival
  c.SkillsAdd($0000,148, 0,0, 0,0);               // Horse Riding
  c.SkillsAdd($0000,150, 0,0, 0,0);               // Tiger Riding
  c.SkillsAdd($0000,183, 5,5, 0,0);               // GENERIC (DND)
  c.SkillsAdd($0000,184, 5,0, 0,0);               // Retribution
  c.SkillsAdd($0000,95, 5,1, 0,0);                // Defense
  c.SkillsAdd($0000,415, 1,1, 0,0);               // Cloth
  c.SkillsAdd($0000,594, 5,5, 0,0);               // Holy
  c.SkillsAdd($0000,413, 1,1, 0,0);               // Mail
  c.SkillsAdd($0000,414, 1,1, 0,0);               // Leather
  c.SkillsAdd($0000,356, 0,0, 0,0);               // Fishing
  c.SkillsAdd($0000,171, 0,0, 0,0);               // Alchemy
  c.SkillsAdd($0000,172, 5,0, 0,0);               // Two-Handed Axes
  c.SkillsAdd($0000,43, 5,0, 0,0);                // Swords
  c.SkillsAdd($0000,778, 1,0, 0,0);               // Companions
  c.SkillsAdd($0000,160, 5,1, 0,0);               // Two-Handed Maces
  c.SkillsAdd($0000,165, 0,0, 0,0);               // Leatherworking

  c.SpellsAdd(668, 0);                            // Language Common
  c.SpellsAdd(198, 0);                            // One-Handed Maces
  c.SpellsAdd(58985, 0);                          // Perception
  c.SpellsAdd(20599, 0);                          // Diplomacy
  c.SpellsAdd(20597, 0);                          // Sword Specialization
  c.SpellsAdd(20598, 0);                          // The Human Spirit
  c.SpellsAdd(59752, 0);                          // Every Man for Himself
  c.SpellsAdd(20864, 0);                          // Mace Specialization
  c.SpellsAdd(9116, 0);                           // Shield
  c.SpellsAdd(203, 0);                            // Unarmed
  c.SpellsAdd(21651, 0);                          // Opening
  c.SpellsAdd(21652, 0);                          // Closing
  c.SpellsAdd(22810, 0);                          // Opening - No Text
  c.SpellsAdd(8386, 0);                           // Attacking
  c.SpellsAdd(27762, 0);                          // Libram
  c.SpellsAdd(3365, 0);                           // Opening
  c.SpellsAdd(3050, 0);                           // Detect
  c.SpellsAdd(9125, 0);                           // Generic
  c.SpellsAdd(7266, 0);                           // Duel
  c.SpellsAdd(7267, 0);                           // Grovel
  c.SpellsAdd(7355, 0);                           // Stuck
  c.SpellsAdd(6478, 0);                           // Opening
  c.SpellsAdd(6603, 0);                           // Auto Attack
  c.SpellsAdd(6233, 0);                           // Closing
  c.SpellsAdd(6246, 0);                           // Closing
  c.SpellsAdd(6247, 0);                           // Opening
  c.SpellsAdd(6477, 0);                           // Opening
  c.SpellsAdd(2479, 0);                           // Honorless Target
  c.SpellsAdd(45927, 0);                          // Summon Friend
  c.SpellsAdd(2382, 0);                           // Generic
  c.SpellsAdd(22027, 0);                          // Remove Insignia
  c.SpellsAdd(61437, 0);                          // Opening
  c.SpellsAdd(68398, 0);                          // Opening
  c.SpellsAdd(204, 0);                            // Defense
  c.SpellsAdd(107, 0);                            // Block
  c.SpellsAdd(81, 0);                             // Dodge
  c.SpellsAdd(522, 0);                            // SPELLDEFENSE (DND)
  c.SpellsAdd(9078, 0);                           // Cloth
  c.SpellsAdd(20154, 0);                          // Seal of Righteousness
  c.SpellsAdd(635, 0);                            // Holy Light
  c.SpellsAdd(8737, 0);                           // Mail
  c.SpellsAdd(9077, 0);                           // Leather
  c.SpellsAdd(199, 0);                            // Two-Handed Maces

  c.SetActionButtons(0, 6603, $00000000);         // Spell: Auto Attack
  c.SetActionButtons(1, 20154, $00000000);        // Spell: Seal of Righteousness
  c.SetActionButtons(2, 635, $00000000);          // Spell: Holy Light
  c.SetActionButtons(9, 59752, $00000000);        // Spell: Every Man for Himself
end;
procedure RACE_HUMAN_CLASS_ROGUE(var c:TCharData);
begin
  c.Enum.zoneID                := 0;
  c.Enum.mapID                 := 0;
  c.Enum.position.x            := -8949.950195;
  c.Enum.position.y            := -132.492996;
  c.Enum.position.z            := 83.531196;
  c.facing                     := 0;

  c.scale_x                    := 1;
  c.power_type                 := 3;
  c.max_health                 := 55;
  c.max_power[POWER_MANA]      := 0;
  c.max_power[POWER_RAGE]      := 1000;
  c.max_power[POWER_FOCUS]     := 100;
  c.max_power[POWER_ENERGY]    := 100;
  c.max_power[POWER_HAPPINESS] := 0;
  c.max_power[POWER_RUNES]     := 8;
  c.max_power[POWER_RUNIC]     := 1000;
  c.health                     := 55;
  c.power[POWER_MANA]          := 0;
  c.power[POWER_RAGE]          := 1000;
  c.power[POWER_FOCUS]         := 100;
  c.power[POWER_ENERGY]        := 100;
  c.power[POWER_HAPPINESS]     := 0;
  c.power[POWER_RUNES]         := 8;
  c.power[POWER_RUNIC]         := 0;
  c.Enum.experienceLevel       := 1;
  c.faction_template           := 1;
  c.flags                      := $00000008;
  c.flags2                     := $00000800;
  c.mainhand_attack_time       := 1600;
  c.offhand_attack_time        := 1600;
  c.ranged_attack_time         := 1600;
  c.bounding_radius            := 0.208000;
  c.combat_reach               := 1.5;
  c.enum_model                 := 49+c.Enum.sexID;
  c.native_model               := 49+c.Enum.sexID;
  c.mount_model                := 0;
  c.min_damage                 := 3.971428;
  c.max_damage                 := 4.971428;
  c.min_offhand_damage         := 1.985714;
  c.max_offhand_damage         := 2.485714;
  c.mod_cast_speed             := 1;
  c.stat[0]                    := 21;
  c.stat[1]                    := 23;
  c.stat[2]                    := 21;
  c.stat[3]                    := 20;
  c.stat[4]                    := 20;
  c.resist[0]                  := 48;
  c.resist[1]                  := 0;
  c.resist[2]                  := 0;
  c.resist[3]                  := 0;
  c.resist[4]                  := 0;
  c.resist[5]                  := 0;
  c.resist[6]                  := 0;
  c.base_mana                  := 0;
  c.base_health                := 25;
  c.attack_power               := 26;
  c.ranged_attack_time         := 1600;
  c.min_ranged_damage          := 2.599999;
  c.max_ranged_damage          := 4.599999;
  c.hover_height               := 1;

  c.player_flags               := $00000000;
  c.xp                         := 0;
  c.next_level_xp              := 400;
  c.points1                    := 0;
  c.professions_left           := 2;
  c.ammo_id                    := 0;

  c.ItemsAdd($FF,3, 49,1, $00010000);             // Footpad's Shirt
  c.ItemsAdd($FF,6, 48,1, $00010000);             // Footpad's Pants
  c.ItemsAdd($FF,7, 47,1, $00010000);             // Footpad's Shoes
  c.ItemsAdd($FF,15, 2092,1, $00010000);          // Worn Dagger
  c.ItemsAdd($FF,16, 50055,1, $00010000);         //
  c.ItemsAdd($FF,17, 28979,1, $00010000);         // Light Throwing Knife
  c.ItemsAdd($FF,23, 6948,1, $00010001);          // Hearthstone

  c.SkillsAdd($0000,473, 1,0, 0,0);               // Fist Weapons
  c.SkillsAdd($0000,44, 5,0, 0,0);                // Axes
  c.SkillsAdd($0000,164, 0,0, 0,0);               // Blacksmithing
  c.SkillsAdd($0000,202, 0,0, 0,0);               // Engineering
  c.SkillsAdd($0000,762, 0,0, 0,0);               // Riding
  c.SkillsAdd($0000,46, 5,0, 0,0);                // Guns
  c.SkillsAdd($0000,769, 5,0, 0,0);               // Internal
  c.SkillsAdd($0000,755, 0,0, 0,0);               // Jewelcrafting
  c.SkillsAdd($0000,98, 300,300, 0,0);            // Language: Common
  c.SkillsAdd($0000,54, 5,0, 0,0);                // Maces
  c.SkillsAdd($0000,533, 0,0, 0,0);               // Raptor Riding
  c.SkillsAdd($0000,554, 0,0, 0,0);               // Undead Horsemanship
  c.SkillsAdd($0000,771, 1,0, 0,0);               // Frost
  c.SkillsAdd($0000,186, 0,0, 0,0);               // Mining
  c.SkillsAdd($0000,197, 0,0, 0,0);               // Tailoring
  c.SkillsAdd($0000,333, 0,0, 0,0);               // Enchanting
  c.SkillsAdd($0000,185, 0,0, 0,0);               // Cooking
  c.SkillsAdd($0000,777, 1,1, 0,0);               // Mounts
  c.SkillsAdd($0000,393, 0,0, 0,0);               // Skinning
  c.SkillsAdd($0000,137, 0,0, 0,0);               // Language: Thalassian
  c.SkillsAdd($0000,759, 0,0, 0,0);               // Language: Draenei
  c.SkillsAdd($0000,182, 0,0, 0,0);               // Herbalism
  c.SkillsAdd($0000,226, 5,0, 0,0);               // Crossbows
  c.SkillsAdd($0000,754, 5,5, 0,0);               // Racial - Human
  c.SkillsAdd($0000,109, 0,0, 0,0);               // Language: Orcish
  c.SkillsAdd($0000,140, 300,0, 0,0);             // Language: Titan
  c.SkillsAdd($0000,149, 0,0, 0,0);               // Wolf Riding
  c.SkillsAdd($0000,253, 5,5, 0,0);               // Assassination
  c.SkillsAdd($0000,313, 0,0, 0,0);               // Language: Gnomish
  c.SkillsAdd($0000,45, 5,0, 0,0);                // Bows
  c.SkillsAdd($0000,713, 0,0, 0,0);               // Kodo Riding
  c.SkillsAdd($0000,773, 0,0, 0,0);               // Inscription
  c.SkillsAdd($0000,38, 5,5, 0,0);                // Combat
  c.SkillsAdd($0000,39, 5,0, 0,0);                // Subtlety
  c.SkillsAdd($0000,129, 0,0, 0,0);               // First Aid
  c.SkillsAdd($0000,162, 5,1, 0,0);               // Unarmed
  c.SkillsAdd($0000,111, 0,0, 0,0);               // Language: Dwarven
  c.SkillsAdd($0000,113, 0,0, 0,0);               // Language: Darnassian
  c.SkillsAdd($0000,115, 0,0, 0,0);               // Language: Taurahe
  c.SkillsAdd($0000,315, 0,0, 0,0);               // Language: Troll
  c.SkillsAdd($0000,139, 0,0, 0,0);               // Language: Demon Tongue
  c.SkillsAdd($0000,152, 0,0, 0,0);               // Ram Riding
  c.SkillsAdd($0000,673, 0,0, 0,0);               // Language: Gutterspeak
  c.SkillsAdd($0000,118, 5,5, 0,0);               // Dual Wield
  c.SkillsAdd($0000,138, 300,0, 0,0);             // Language: Draconic
  c.SkillsAdd($0000,141, 0,0, 0,0);               // Language: Old Tongue
  c.SkillsAdd($0000,142, 1,0, 0,0);               // Survival
  c.SkillsAdd($0000,148, 0,0, 0,0);               // Horse Riding
  c.SkillsAdd($0000,150, 0,0, 0,0);               // Tiger Riding
  c.SkillsAdd($0000,173, 5,1, 0,0);               // Daggers
  c.SkillsAdd($0000,183, 5,5, 0,0);               // GENERIC (DND)
  c.SkillsAdd($0000,95, 5,1, 0,0);                // Defense
  c.SkillsAdd($0000,176, 5,1, 0,0);               // Thrown
  c.SkillsAdd($0000,415, 1,1, 0,0);               // Cloth
  c.SkillsAdd($0000,633, 5,0, 0,0);               // Lockpicking
  c.SkillsAdd($0000,414, 1,1, 0,0);               // Leather
  c.SkillsAdd($0000,356, 0,0, 0,0);               // Fishing
  c.SkillsAdd($0000,171, 0,0, 0,0);               // Alchemy
  c.SkillsAdd($0000,43, 5,0, 0,0);                // Swords
  c.SkillsAdd($0000,778, 1,0, 0,0);               // Companions
  c.SkillsAdd($0000,165, 0,0, 0,0);               // Leatherworking

  c.SpellsAdd(668, 0);                            // Language Common
  c.SpellsAdd(58985, 0);                          // Perception
  c.SpellsAdd(20599, 0);                          // Diplomacy
  c.SpellsAdd(20597, 0);                          // Sword Specialization
  c.SpellsAdd(20598, 0);                          // The Human Spirit
  c.SpellsAdd(59752, 0);                          // Every Man for Himself
  c.SpellsAdd(20864, 0);                          // Mace Specialization
  c.SpellsAdd(2098, 0);                           // Eviscerate
  c.SpellsAdd(75460, 0);                          // Unknown
  c.SpellsAdd(21184, 0);                          // Rogue Passive (DND)
  c.SpellsAdd(1752, 0);                           // Sinister Strike
  c.SpellsAdd(203, 0);                            // Unarmed
  c.SpellsAdd(674, 0);                            // Dual Wield
  c.SpellsAdd(1180, 0);                           // Daggers
  c.SpellsAdd(21651, 0);                          // Opening
  c.SpellsAdd(21652, 0);                          // Closing
  c.SpellsAdd(22810, 0);                          // Opening - No Text
  c.SpellsAdd(8386, 0);                           // Attacking
  c.SpellsAdd(3365, 0);                           // Opening
  c.SpellsAdd(3050, 0);                           // Detect
  c.SpellsAdd(9125, 0);                           // Generic
  c.SpellsAdd(7266, 0);                           // Duel
  c.SpellsAdd(7267, 0);                           // Grovel
  c.SpellsAdd(7355, 0);                           // Stuck
  c.SpellsAdd(6478, 0);                           // Opening
  c.SpellsAdd(6603, 0);                           // Auto Attack
  c.SpellsAdd(6233, 0);                           // Closing
  c.SpellsAdd(6246, 0);                           // Closing
  c.SpellsAdd(6247, 0);                           // Opening
  c.SpellsAdd(6477, 0);                           // Opening
  c.SpellsAdd(2479, 0);                           // Honorless Target
  c.SpellsAdd(45927, 0);                          // Summon Friend
  c.SpellsAdd(2382, 0);                           // Generic
  c.SpellsAdd(22027, 0);                          // Remove Insignia
  c.SpellsAdd(61437, 0);                          // Opening
  c.SpellsAdd(68398, 0);                          // Opening
  c.SpellsAdd(204, 0);                            // Defense
  c.SpellsAdd(16092, 0);                          // Defensive State (DND)
  c.SpellsAdd(81, 0);                             // Dodge
  c.SpellsAdd(522, 0);                            // SPELLDEFENSE (DND)
  c.SpellsAdd(2764, 0);                           // Throw
  c.SpellsAdd(2567, 0);                           // Thrown
  c.SpellsAdd(9078, 0);                           // Cloth
  c.SpellsAdd(9077, 0);                           // Leather

  c.SetActionButtons(0, 6603, $00000000);         // Spell: Auto Attack
  c.SetActionButtons(1, 1752, $00000000);         // Spell: Sinister Strike
  c.SetActionButtons(2, 2098, $00000000);         // Spell: Eviscerate
  c.SetActionButtons(3, 2764, $00000000);         // Spell: Throw
  c.SetActionButtons(10, 59752, $00000000);       // Spell: Every Man for Himself
end;
procedure RACE_HUMAN_CLASS_DEATHKNIGHT(var c:TCharData);
begin
  c.Enum.zoneID                := 0;
  c.Enum.mapID                 := 609;
  c.Enum.position.x            := 2355.840087;
  c.Enum.position.y            := -5664.770019;
  c.Enum.position.z            := 426.028015;
  c.facing                     := 3.659972;

  c.scale_x                    := 1;
  c.power_type                 := 6;
  c.max_health                 := 3169;
  c.max_power[POWER_MANA]      := 0;
  c.max_power[POWER_RAGE]      := 1000;
  c.max_power[POWER_FOCUS]     := 100;
  c.max_power[POWER_ENERGY]    := 100;
  c.max_power[POWER_HAPPINESS] := 0;
  c.max_power[POWER_RUNES]     := 8;
  c.max_power[POWER_RUNIC]     := 1000;
  c.health                     := 3169;
  c.power[POWER_MANA]          := 0;
  c.power[POWER_RAGE]          := 1000;
  c.power[POWER_FOCUS]         := 100;
  c.power[POWER_ENERGY]        := 100;
  c.power[POWER_HAPPINESS]     := 0;
  c.power[POWER_RUNES]         := 8;
  c.power[POWER_RUNIC]         := 0;
  c.Enum.experienceLevel       := 55;
  c.faction_template           := 1;
  c.flags                      := $00000008;
  c.flags2                     := $00000800;
  c.mainhand_attack_time       := 2000;
  c.offhand_attack_time        := 2000;
  c.ranged_attack_time         := 0;
  c.bounding_radius            := 0.208000;
  c.combat_reach               := 1.5;
  c.enum_model                 := 49+c.Enum.sexID;
  c.native_model               := 49+c.Enum.sexID;
  c.mount_model                := 0;
  c.min_damage                 := 107.771438;
  c.max_damage                 := 107.771438;
  c.min_offhand_damage         := 0;
  c.max_offhand_damage         := 0;
  c.mod_cast_speed             := 1;
  c.stat[0]                    := 252;
  c.stat[1]                    := 111;
  c.stat[2]                    := 199;
  c.stat[3]                    := 29;
  c.stat[4]                    := 43;
  c.resist[0]                  := 3537;
  c.resist[1]                  := 0;
  c.resist[2]                  := 0;
  c.resist[3]                  := 0;
  c.resist[4]                  := 0;
  c.resist[5]                  := 0;
  c.resist[6]                  := 0;
  c.base_mana                  := 0;
  c.base_health                := 1359;
  c.attack_power               := 649;
  c.ranged_attack_time         := 0;
  c.min_ranged_damage          := 0;
  c.max_ranged_damage          := 0;
  c.hover_height               := 1;

  c.player_flags               := $00000020;
  c.xp                         := 815;
  c.next_level_xp              := 148200;
  c.points1                    := 0;
  c.professions_left           := 2;
  c.ammo_id                    := 0;

  c.ItemsAdd($FF,0, 34652,1, $00010001);          // Acherus Knight's Hood
  c.ItemsAdd($FF,1, 34657,1, $00010001);          // Choker of Damnation
  c.ItemsAdd($FF,2, 34655,1, $00010001);          // Acherus Knight's Pauldrons
  c.ItemsAdd($FF,4, 34650,1, $00010001);          // Acherus Knight's Tunic
  c.ItemsAdd($FF,5, 34651,1, $00010001);          // Acherus Knight's Girdle
  c.ItemsAdd($FF,6, 34656,1, $00010001);          // Acherus Knight's Cover
  c.ItemsAdd($FF,7, 34648,1, $00010001);          // Acherus Knight's Greaves
  c.ItemsAdd($FF,8, 34653,1, $00010001);          // Acherus Knight's Wristguard
  c.ItemsAdd($FF,9, 34649,1, $00010001);          // Acherus Knight's Gauntlets
  c.ItemsAdd($FF,10, 34658,1, $00010001);         // Plague Band
  c.ItemsAdd($FF,11, 38147,1, $00010001);         // Corrupted Band
  c.ItemsAdd($FF,14, 34659,1, $00010001);         // Acherus Knight's Shroud
  c.ItemsAdd($FF,23, 41751,10, $00010000);        // Black Mushroom

  c.SkillsAdd($0000,333, 0,0, 0,0);               // Enchanting
  c.SkillsAdd($0000,185, 0,0, 0,0);               // Cooking
  c.SkillsAdd($0000,229, 275,270, 0,0);           // Polearms
  c.SkillsAdd($0000,777, 1,1, 0,0);               // Mounts
  c.SkillsAdd($0000,755, 0,0, 0,0);               // Jewelcrafting
  c.SkillsAdd($0000,98, 300,300, 0,0);            // Language: Common
  c.SkillsAdd($0000,54, 275,0, 0,0);              // Maces
  c.SkillsAdd($0000,554, 0,0, 0,0);               // Undead Horsemanship
  c.SkillsAdd($0000,44, 275,270, 0,0);            // Axes
  c.SkillsAdd($0000,164, 0,0, 0,0);               // Blacksmithing
  c.SkillsAdd($0000,202, 0,0, 0,0);               // Engineering
  c.SkillsAdd($0002,762, 150,150, 0,0);           // Riding
  c.SkillsAdd($0000,769, 275,0, 0,0);             // Internal
  c.SkillsAdd($0000,770, 275,275, 0,0);           // Blood
  c.SkillsAdd($0000,771, 275,275, 0,0);           // Frost
  c.SkillsAdd($0000,772, 275,275, 0,0);           // Unholy
  c.SkillsAdd($0000,186, 0,0, 0,0);               // Mining
  c.SkillsAdd($0000,197, 0,0, 0,0);               // Tailoring
  c.SkillsAdd($0000,776, 1,0, 0,0);               // Runeforging
  c.SkillsAdd($0000,356, 0,0, 0,0);               // Fishing
  c.SkillsAdd($0000,171, 0,0, 0,0);               // Alchemy
  c.SkillsAdd($0000,172, 275,270, 0,0);           // Two-Handed Axes
  c.SkillsAdd($0000,393, 0,0, 0,0);               // Skinning
  c.SkillsAdd($0000,759, 0,0, 0,0);               // Language: Draenei
  c.SkillsAdd($0000,182, 0,0, 0,0);               // Herbalism
  c.SkillsAdd($0000,754, 275,275, 0,0);           // Racial - Human
  c.SkillsAdd($0000,140, 300,0, 0,0);             // Language: Titan
  c.SkillsAdd($0000,149, 0,0, 0,0);               // Wolf Riding
  c.SkillsAdd($0000,55, 275,270, 0,0);            // Two-Handed Swords
  c.SkillsAdd($0000,713, 0,0, 0,0);               // Kodo Riding
  c.SkillsAdd($0000,773, 0,0, 0,0);               // Inscription
  c.SkillsAdd($0004,129, 300,270, 0,0);           // First Aid
  c.SkillsAdd($0000,162, 275,270, 0,0);           // Unarmed
  c.SkillsAdd($0000,139, 0,0, 0,0);               // Language: Demon Tongue
  c.SkillsAdd($0000,152, 0,0, 0,0);               // Ram Riding
  c.SkillsAdd($0000,293, 1,1, 0,0);               // Plate Mail
  c.SkillsAdd($0000,118, 275,275, 0,0);           // Dual Wield
  c.SkillsAdd($0000,138, 300,0, 0,0);             // Language: Draconic
  c.SkillsAdd($0000,141, 0,0, 0,0);               // Language: Old Tongue
  c.SkillsAdd($0000,142, 1,0, 0,0);               // Survival
  c.SkillsAdd($0000,150, 0,0, 0,0);               // Tiger Riding
  c.SkillsAdd($0000,183, 275,275, 0,0);           // GENERIC (DND)
  c.SkillsAdd($0000,95, 275,270, 0,0);            // Defense
  c.SkillsAdd($0000,415, 1,1, 0,0);               // Cloth
  c.SkillsAdd($0000,413, 1,1, 0,0);               // Mail
  c.SkillsAdd($0000,414, 1,1, 0,0);               // Leather
  c.SkillsAdd($0000,43, 275,270, 0,0);            // Swords
  c.SkillsAdd($0000,778, 1,0, 0,0);               // Companions
  c.SkillsAdd($0000,160, 275,0, 0,0);             // Two-Handed Maces
  c.SkillsAdd($0000,165, 0,0, 0,0);               // Leatherworking

  c.SpellsAdd(200, 0);                            // Polearms
  c.SpellsAdd(668, 0);                            // Language Common
  c.SpellsAdd(196, 0);                            // One-Handed Axes
  c.SpellsAdd(33391, 0);                          // Journeyman Riding
  c.SpellsAdd(45902, 0);                          // Blood Strike
  c.SpellsAdd(48266, 0);                          // Blood Presence
  c.SpellsAdd(49410, 0);                          // Forceful Deflection
  c.SpellsAdd(45477, 0);                          // Icy Touch
  c.SpellsAdd(59921, 0);                          // Frost Fever
  c.SpellsAdd(61455, 0);                          // Runic Focus
  c.SpellsAdd(45462, 0);                          // Plague Strike
  c.SpellsAdd(47541, 0);                          // Death Coil
  c.SpellsAdd(49576, 0);                          // Death Grip
  c.SpellsAdd(59879, 0);                          // Blood Plague
  c.SpellsAdd(197, 0);                            // Two-Handed Axes
  c.SpellsAdd(58985, 0);                          // Perception
  c.SpellsAdd(20599, 0);                          // Diplomacy
  c.SpellsAdd(20597, 0);                          // Sword Specialization
  c.SpellsAdd(20598, 0);                          // The Human Spirit
  c.SpellsAdd(59752, 0);                          // Every Man for Himself
  c.SpellsAdd(20864, 0);                          // Mace Specialization
  c.SpellsAdd(202, 0);                            // Two-Handed Swords
  c.SpellsAdd(3275, 0);                           // Linen Bandage
  c.SpellsAdd(10846, 0);                          // First Aid
  c.SpellsAdd(7934, 0);                           // Anti-Venom
  c.SpellsAdd(3276, 0);                           // Heavy Linen Bandage
  c.SpellsAdd(3277, 0);                           // Wool Bandage
  c.SpellsAdd(3278, 0);                           // Heavy Wool Bandage
  c.SpellsAdd(7928, 0);                           // Silk Bandage
  c.SpellsAdd(7929, 0);                           // Heavy Silk Bandage
  c.SpellsAdd(10840, 0);                          // Mageweave Bandage
  c.SpellsAdd(10841, 0);                          // Heavy Mageweave Bandage
  c.SpellsAdd(18629, 0);                          // Runecloth Bandage
  c.SpellsAdd(18630, 0);                          // Heavy Runecloth Bandage
  c.SpellsAdd(203, 0);                            // Unarmed
  c.SpellsAdd(750, 0);                            // Plate Mail
  c.SpellsAdd(674, 0);                            // Dual Wield
  c.SpellsAdd(22810, 0);                          // Opening - No Text
  c.SpellsAdd(21651, 0);                          // Opening
  c.SpellsAdd(21652, 0);                          // Closing
  c.SpellsAdd(8386, 0);                           // Attacking
  c.SpellsAdd(7266, 0);                           // Duel
  c.SpellsAdd(7267, 0);                           // Grovel
  c.SpellsAdd(7355, 0);                           // Stuck
  c.SpellsAdd(3365, 0);                           // Opening
  c.SpellsAdd(3050, 0);                           // Detect
  c.SpellsAdd(9125, 0);                           // Generic
  c.SpellsAdd(6478, 0);                           // Opening
  c.SpellsAdd(6603, 0);                           // Auto Attack
  c.SpellsAdd(6233, 0);                           // Closing
  c.SpellsAdd(6246, 0);                           // Closing
  c.SpellsAdd(6247, 0);                           // Opening
  c.SpellsAdd(6477, 0);                           // Opening
  c.SpellsAdd(45927, 0);                          // Summon Friend
  c.SpellsAdd(2479, 0);                           // Honorless Target
  c.SpellsAdd(2382, 0);                           // Generic
  c.SpellsAdd(22027, 0);                          // Remove Insignia
  c.SpellsAdd(52665, 0);                          // Sigil
  c.SpellsAdd(61437, 0);                          // Opening
  c.SpellsAdd(63645, 0);                          // Activate Primary Spec
  c.SpellsAdd(63644, 0);                          // Activate Secondary Spec
  c.SpellsAdd(68398, 0);                          // Opening
  c.SpellsAdd(204, 0);                            // Defense
  c.SpellsAdd(45903, 0);                          // Offensive State (DND)
  c.SpellsAdd(81, 0);                             // Dodge
  c.SpellsAdd(522, 0);                            // SPELLDEFENSE (DND)
  c.SpellsAdd(3127, 0);                           // Parry
  c.SpellsAdd(9078, 0);                           // Cloth
  c.SpellsAdd(8737, 0);                           // Mail
  c.SpellsAdd(9077, 0);                           // Leather
  c.SpellsAdd(201, 0);                            // One-Handed Swords

  c.SetActionButtons(0, 6603, $00000000);         // Spell: Auto Attack
  c.SetActionButtons(1, 49576, $00000000);        // Spell: Death Grip
  c.SetActionButtons(2, 45477, $00000000);        // Spell: Icy Touch
  c.SetActionButtons(3, 45462, $00000000);        // Spell: Plague Strike
  c.SetActionButtons(4, 45902, $00000000);        // Spell: Blood Strike
  c.SetActionButtons(5, 47541, $00000000);        // Spell: Death Coil
  c.SetActionButtons(11, 59752, $00000000);       // Spell: Every Man for Himself
end;
procedure RACE_HUMAN_CLASS_PRIEST(var c:TCharData);
begin
  c.Enum.zoneID                := 0;
  c.Enum.mapID                 := 0;
  c.Enum.position.x            := -8949.950195;
  c.Enum.position.y            := -132.492996;
  c.Enum.position.z            := 83.531196;
  c.facing                     := 0;

  c.scale_x                    := 1;
  c.power_type                 := 0;
  c.max_health                 := 52;
  c.max_power[POWER_MANA]      := 160;
  c.max_power[POWER_RAGE]      := 1000;
  c.max_power[POWER_FOCUS]     := 100;
  c.max_power[POWER_ENERGY]    := 100;
  c.max_power[POWER_HAPPINESS] := 0;
  c.max_power[POWER_RUNES]     := 8;
  c.max_power[POWER_RUNIC]     := 1000;
  c.health                     := 52;
  c.power[POWER_MANA]          := 160;
  c.power[POWER_RAGE]          := 1000;
  c.power[POWER_FOCUS]         := 100;
  c.power[POWER_ENERGY]        := 100;
  c.power[POWER_HAPPINESS]     := 0;
  c.power[POWER_RUNES]         := 8;
  c.power[POWER_RUNIC]         := 0;
  c.Enum.experienceLevel       := 1;
  c.faction_template           := 1;
  c.flags                      := $00000008;
  c.flags2                     := $00000800;
  c.mainhand_attack_time       := 2900;
  c.offhand_attack_time        := 2000;
  c.ranged_attack_time         := 0;
  c.bounding_radius            := 0.305999;
  c.combat_reach               := 1.5;
  c.enum_model                 := 49+c.Enum.sexID;
  c.native_model               := 49+c.Enum.sexID;
  c.mount_model                := 0;
  c.min_damage                 := 7.142857;
  c.max_damage                 := 9.142857;
  c.min_offhand_damage         := 0;
  c.max_offhand_damage         := 0;
  c.mod_cast_speed             := 1;
  c.stat[0]                    := 20;
  c.stat[1]                    := 20;
  c.stat[2]                    := 20;
  c.stat[3]                    := 22;
  c.stat[4]                    := 23;
  c.resist[0]                  := 45;
  c.resist[1]                  := 0;
  c.resist[2]                  := 0;
  c.resist[3]                  := 0;
  c.resist[4]                  := 0;
  c.resist[5]                  := 0;
  c.resist[6]                  := 0;
  c.base_mana                  := 110;
  c.base_health                := 32;
  c.attack_power               := 20;
  c.ranged_attack_time         := 0;
  c.min_ranged_damage          := 0;
  c.max_ranged_damage          := 0;
  c.hover_height               := 1;

  c.player_flags               := $00000000;
  c.xp                         := 0;
  c.next_level_xp              := 400;
  c.points1                    := 0;
  c.professions_left           := 2;
  c.ammo_id                    := 0;

  c.ItemsAdd($FF,3, 53,1, $00010000);             // Neophyte's Shirt
  c.ItemsAdd($FF,4, 6098,1, $00010000);           // Neophyte's Robe
  c.ItemsAdd($FF,6, 52,1, $00010000);             // Neophyte's Pants
  c.ItemsAdd($FF,7, 51,1, $00010000);             // Neophyte's Boots
  c.ItemsAdd($FF,15, 35,1, $00010000);            // Bent Staff
  c.ItemsAdd($FF,23, 6948,1, $00010001);          // Hearthstone

  c.SkillsAdd($0000,164, 0,0, 0,0);               // Blacksmithing
  c.SkillsAdd($0000,202, 0,0, 0,0);               // Engineering
  c.SkillsAdd($0000,762, 0,0, 0,0);               // Riding
  c.SkillsAdd($0000,769, 5,0, 0,0);               // Internal
  c.SkillsAdd($0000,755, 0,0, 0,0);               // Jewelcrafting
  c.SkillsAdd($0000,98, 300,300, 0,0);            // Language: Common
  c.SkillsAdd($0000,136, 5,1, 0,0);               // Staves
  c.SkillsAdd($0000,54, 5,1, 0,0);                // Maces
  c.SkillsAdd($0000,533, 0,0, 0,0);               // Raptor Riding
  c.SkillsAdd($0000,554, 0,0, 0,0);               // Undead Horsemanship
  c.SkillsAdd($0000,771, 1,0, 0,0);               // Frost
  c.SkillsAdd($0000,186, 0,0, 0,0);               // Mining
  c.SkillsAdd($0000,197, 0,0, 0,0);               // Tailoring
  c.SkillsAdd($0000,333, 0,0, 0,0);               // Enchanting
  c.SkillsAdd($0000,185, 0,0, 0,0);               // Cooking
  c.SkillsAdd($0000,777, 1,1, 0,0);               // Mounts
  c.SkillsAdd($0000,393, 0,0, 0,0);               // Skinning
  c.SkillsAdd($0000,137, 0,0, 0,0);               // Language: Thalassian
  c.SkillsAdd($0000,759, 0,0, 0,0);               // Language: Draenei
  c.SkillsAdd($0000,182, 0,0, 0,0);               // Herbalism
  c.SkillsAdd($0000,228, 5,1, 0,0);               // Wands
  c.SkillsAdd($0000,754, 5,5, 0,0);               // Racial - Human
  c.SkillsAdd($0000,109, 0,0, 0,0);               // Language: Orcish
  c.SkillsAdd($0000,140, 300,0, 0,0);             // Language: Titan
  c.SkillsAdd($0000,149, 0,0, 0,0);               // Wolf Riding
  c.SkillsAdd($0000,313, 0,0, 0,0);               // Language: Gnomish
  c.SkillsAdd($0000,613, 5,0, 0,0);               // Discipline
  c.SkillsAdd($0000,713, 0,0, 0,0);               // Kodo Riding
  c.SkillsAdd($0000,773, 0,0, 0,0);               // Inscription
  c.SkillsAdd($0000,129, 0,0, 0,0);               // First Aid
  c.SkillsAdd($0000,162, 5,1, 0,0);               // Unarmed
  c.SkillsAdd($0000,56, 5,5, 0,0);                // Holy
  c.SkillsAdd($0000,111, 0,0, 0,0);               // Language: Dwarven
  c.SkillsAdd($0000,113, 0,0, 0,0);               // Language: Darnassian
  c.SkillsAdd($0000,115, 0,0, 0,0);               // Language: Taurahe
  c.SkillsAdd($0000,315, 0,0, 0,0);               // Language: Troll
  c.SkillsAdd($0000,139, 0,0, 0,0);               // Language: Demon Tongue
  c.SkillsAdd($0000,152, 0,0, 0,0);               // Ram Riding
  c.SkillsAdd($0000,673, 0,0, 0,0);               // Language: Gutterspeak
  c.SkillsAdd($0000,138, 300,0, 0,0);             // Language: Draconic
  c.SkillsAdd($0000,141, 0,0, 0,0);               // Language: Old Tongue
  c.SkillsAdd($0000,142, 1,0, 0,0);               // Survival
  c.SkillsAdd($0000,148, 0,0, 0,0);               // Horse Riding
  c.SkillsAdd($0000,150, 0,0, 0,0);               // Tiger Riding
  c.SkillsAdd($0000,173, 5,0, 0,0);               // Daggers
  c.SkillsAdd($0000,183, 5,5, 0,0);               // GENERIC (DND)
  c.SkillsAdd($0000,95, 5,1, 0,0);                // Defense
  c.SkillsAdd($0000,415, 1,1, 0,0);               // Cloth
  c.SkillsAdd($0000,356, 0,0, 0,0);               // Fishing
  c.SkillsAdd($0000,171, 0,0, 0,0);               // Alchemy
  c.SkillsAdd($0000,78, 5,0, 0,0);                // Shadow Magic
  c.SkillsAdd($0000,778, 1,0, 0,0);               // Companions
  c.SkillsAdd($0000,165, 0,0, 0,0);               // Leatherworking

  c.SpellsAdd(668, 0);                            // Language Common
  c.SpellsAdd(227, 0);                            // Staves
  c.SpellsAdd(198, 0);                            // One-Handed Maces
  c.SpellsAdd(5009, 0);                           // Wands
  c.SpellsAdd(5019, 0);                           // Shoot
  c.SpellsAdd(58985, 0);                          // Perception
  c.SpellsAdd(20599, 0);                          // Diplomacy
  c.SpellsAdd(20597, 0);                          // Sword Specialization
  c.SpellsAdd(20598, 0);                          // The Human Spirit
  c.SpellsAdd(59752, 0);                          // Every Man for Himself
  c.SpellsAdd(20864, 0);                          // Mace Specialization
  c.SpellsAdd(203, 0);                            // Unarmed
  c.SpellsAdd(2050, 0);                           // Lesser Heal
  c.SpellsAdd(585, 0);                            // Smite
  c.SpellsAdd(21651, 0);                          // Opening
  c.SpellsAdd(21652, 0);                          // Closing
  c.SpellsAdd(22810, 0);                          // Opening - No Text
  c.SpellsAdd(8386, 0);                           // Attacking
  c.SpellsAdd(3365, 0);                           // Opening
  c.SpellsAdd(3050, 0);                           // Detect
  c.SpellsAdd(9125, 0);                           // Generic
  c.SpellsAdd(7266, 0);                           // Duel
  c.SpellsAdd(7267, 0);                           // Grovel
  c.SpellsAdd(7355, 0);                           // Stuck
  c.SpellsAdd(6478, 0);                           // Opening
  c.SpellsAdd(6603, 0);                           // Auto Attack
  c.SpellsAdd(6233, 0);                           // Closing
  c.SpellsAdd(6246, 0);                           // Closing
  c.SpellsAdd(6247, 0);                           // Opening
  c.SpellsAdd(6477, 0);                           // Opening
  c.SpellsAdd(2479, 0);                           // Honorless Target
  c.SpellsAdd(45927, 0);                          // Summon Friend
  c.SpellsAdd(2382, 0);                           // Generic
  c.SpellsAdd(22027, 0);                          // Remove Insignia
  c.SpellsAdd(61437, 0);                          // Opening
  c.SpellsAdd(68398, 0);                          // Opening
  c.SpellsAdd(204, 0);                            // Defense
  c.SpellsAdd(81, 0);                             // Dodge
  c.SpellsAdd(522, 0);                            // SPELLDEFENSE (DND)
  c.SpellsAdd(9078, 0);                           // Cloth

  c.SetActionButtons(0, 585, $00000000);          // Spell: Smite
  c.SetActionButtons(1, 2050, $00000000);         // Spell: Lesser Heal
  c.SetActionButtons(9, 59752, $00000000);        // Spell: Every Man for Himself
end;
procedure RACE_HUMAN_CLASS_MAGE(var c:TCharData);
begin
  c.Enum.zoneID                := 0;
  c.Enum.mapID                 := 0;
  c.Enum.position.x            := -8949.950195;
  c.Enum.position.y            := -132.492996;
  c.Enum.position.z            := 83.531196;
  c.facing                     := 0;

  c.scale_x                    := 1;
  c.power_type                 := 0;
  c.max_health                 := 52;
  c.max_power[POWER_MANA]      := 165;
  c.max_power[POWER_RAGE]      := 1000;
  c.max_power[POWER_FOCUS]     := 100;
  c.max_power[POWER_ENERGY]    := 100;
  c.max_power[POWER_HAPPINESS] := 0;
  c.max_power[POWER_RUNES]     := 8;
  c.max_power[POWER_RUNIC]     := 1000;
  c.health                     := 52;
  c.power[POWER_MANA]          := 165;
  c.power[POWER_RAGE]          := 1000;
  c.power[POWER_FOCUS]         := 100;
  c.power[POWER_ENERGY]        := 100;
  c.power[POWER_HAPPINESS]     := 0;
  c.power[POWER_RUNES]         := 8;
  c.power[POWER_RUNIC]         := 0;
  c.Enum.experienceLevel       := 1;
  c.faction_template           := 1;
  c.flags                      := $00000008;
  c.flags2                     := $00000800;
  c.mainhand_attack_time       := 2900;
  c.offhand_attack_time        := 2000;
  c.ranged_attack_time         := 0;
  c.bounding_radius            := 0.305999;
  c.combat_reach               := 1.5;
  c.enum_model                 := 49+c.Enum.sexID;
  c.native_model               := 49+c.Enum.sexID;
  c.mount_model                := 0;
  c.min_damage                 := 7.142857;
  c.max_damage                 := 9.142857;
  c.min_offhand_damage         := 0;
  c.max_offhand_damage         := 0;
  c.mod_cast_speed             := 1;
  c.stat[0]                    := 20;
  c.stat[1]                    := 20;
  c.stat[2]                    := 20;
  c.stat[3]                    := 23;
  c.stat[4]                    := 22;
  c.resist[0]                  := 45;
  c.resist[1]                  := 0;
  c.resist[2]                  := 0;
  c.resist[3]                  := 0;
  c.resist[4]                  := 0;
  c.resist[5]                  := 0;
  c.resist[6]                  := 0;
  c.base_mana                  := 100;
  c.base_health                := 32;
  c.attack_power               := 20;
  c.ranged_attack_time         := 0;
  c.min_ranged_damage          := 0;
  c.max_ranged_damage          := 0;
  c.hover_height               := 1;

  c.player_flags               := $00000000;
  c.xp                         := 0;
  c.next_level_xp              := 400;
  c.points1                    := 0;
  c.professions_left           := 2;
  c.ammo_id                    := 0;

  c.ItemsAdd($FF,3, 6096,1, $00010000);           // Apprentice's Shirt
  c.ItemsAdd($FF,4, 56,1, $00010000);             // Apprentice's Robe
  c.ItemsAdd($FF,6, 1395,1, $00010000);           // Apprentice's Pants
  c.ItemsAdd($FF,7, 55,1, $00010000);             // Apprentice's Boots
  c.ItemsAdd($FF,15, 35,1, $00010000);            // Bent Staff
  c.ItemsAdd($FF,23, 6948,1, $00010001);          // Hearthstone

  c.SkillsAdd($0000,164, 0,0, 0,0);               // Blacksmithing
  c.SkillsAdd($0000,202, 0,0, 0,0);               // Engineering
  c.SkillsAdd($0000,762, 0,0, 0,0);               // Riding
  c.SkillsAdd($0000,769, 5,0, 0,0);               // Internal
  c.SkillsAdd($0000,755, 0,0, 0,0);               // Jewelcrafting
  c.SkillsAdd($0000,98, 300,300, 0,0);            // Language: Common
  c.SkillsAdd($0000,136, 5,1, 0,0);               // Staves
  c.SkillsAdd($0000,533, 0,0, 0,0);               // Raptor Riding
  c.SkillsAdd($0000,554, 0,0, 0,0);               // Undead Horsemanship
  c.SkillsAdd($0000,771, 1,0, 0,0);               // Frost
  c.SkillsAdd($0000,186, 0,0, 0,0);               // Mining
  c.SkillsAdd($0000,197, 0,0, 0,0);               // Tailoring
  c.SkillsAdd($0000,333, 0,0, 0,0);               // Enchanting
  c.SkillsAdd($0000,185, 0,0, 0,0);               // Cooking
  c.SkillsAdd($0000,777, 1,1, 0,0);               // Mounts
  c.SkillsAdd($0000,393, 0,0, 0,0);               // Skinning
  c.SkillsAdd($0000,137, 0,0, 0,0);               // Language: Thalassian
  c.SkillsAdd($0000,759, 0,0, 0,0);               // Language: Draenei
  c.SkillsAdd($0000,182, 0,0, 0,0);               // Herbalism
  c.SkillsAdd($0000,228, 5,1, 0,0);               // Wands
  c.SkillsAdd($0000,754, 5,5, 0,0);               // Racial - Human
  c.SkillsAdd($0000,109, 0,0, 0,0);               // Language: Orcish
  c.SkillsAdd($0000,140, 300,0, 0,0);             // Language: Titan
  c.SkillsAdd($0000,149, 0,0, 0,0);               // Wolf Riding
  c.SkillsAdd($0000,313, 0,0, 0,0);               // Language: Gnomish
  c.SkillsAdd($0000,713, 0,0, 0,0);               // Kodo Riding
  c.SkillsAdd($0000,773, 0,0, 0,0);               // Inscription
  c.SkillsAdd($0000,6, 5,5, 0,0);                 // Frost
  c.SkillsAdd($0000,129, 0,0, 0,0);               // First Aid
  c.SkillsAdd($0000,237, 5,0, 0,0);               // Arcane
  c.SkillsAdd($0000,162, 5,1, 0,0);               // Unarmed
  c.SkillsAdd($0000,111, 0,0, 0,0);               // Language: Dwarven
  c.SkillsAdd($0000,113, 0,0, 0,0);               // Language: Darnassian
  c.SkillsAdd($0000,115, 0,0, 0,0);               // Language: Taurahe
  c.SkillsAdd($0000,315, 0,0, 0,0);               // Language: Troll
  c.SkillsAdd($0000,139, 0,0, 0,0);               // Language: Demon Tongue
  c.SkillsAdd($0000,152, 0,0, 0,0);               // Ram Riding
  c.SkillsAdd($0000,8, 5,5, 0,0);                 // Fire
  c.SkillsAdd($0000,673, 0,0, 0,0);               // Language: Gutterspeak
  c.SkillsAdd($0000,138, 300,0, 0,0);             // Language: Draconic
  c.SkillsAdd($0000,141, 0,0, 0,0);               // Language: Old Tongue
  c.SkillsAdd($0000,142, 1,0, 0,0);               // Survival
  c.SkillsAdd($0000,148, 0,0, 0,0);               // Horse Riding
  c.SkillsAdd($0000,150, 0,0, 0,0);               // Tiger Riding
  c.SkillsAdd($0000,173, 5,0, 0,0);               // Daggers
  c.SkillsAdd($0000,183, 5,5, 0,0);               // GENERIC (DND)
  c.SkillsAdd($0000,205, 1,0, 0,0);               // Pet - Succubus
  c.SkillsAdd($0000,95, 5,1, 0,0);                // Defense
  c.SkillsAdd($0000,415, 1,1, 0,0);               // Cloth
  c.SkillsAdd($0000,356, 0,0, 0,0);               // Fishing
  c.SkillsAdd($0000,171, 0,0, 0,0);               // Alchemy
  c.SkillsAdd($0000,43, 5,0, 0,0);                // Swords
  c.SkillsAdd($0000,778, 1,0, 0,0);               // Companions
  c.SkillsAdd($0000,165, 0,0, 0,0);               // Leatherworking

  c.SpellsAdd(668, 0);                            // Language Common
  c.SpellsAdd(227, 0);                            // Staves
  c.SpellsAdd(5009, 0);                           // Wands
  c.SpellsAdd(5019, 0);                           // Shoot
  c.SpellsAdd(58985, 0);                          // Perception
  c.SpellsAdd(20599, 0);                          // Diplomacy
  c.SpellsAdd(20597, 0);                          // Sword Specialization
  c.SpellsAdd(20598, 0);                          // The Human Spirit
  c.SpellsAdd(59752, 0);                          // Every Man for Himself
  c.SpellsAdd(20864, 0);                          // Mace Specialization
  c.SpellsAdd(71761, 0);                          // Deep Freeze Immunity State
  c.SpellsAdd(168, 0);                            // Frost Armor
  c.SpellsAdd(203, 0);                            // Unarmed
  c.SpellsAdd(133, 0);                            // Fireball
  c.SpellsAdd(21651, 0);                          // Opening
  c.SpellsAdd(21652, 0);                          // Closing
  c.SpellsAdd(22810, 0);                          // Opening - No Text
  c.SpellsAdd(8386, 0);                           // Attacking
  c.SpellsAdd(3365, 0);                           // Opening
  c.SpellsAdd(3050, 0);                           // Detect
  c.SpellsAdd(9125, 0);                           // Generic
  c.SpellsAdd(7266, 0);                           // Duel
  c.SpellsAdd(7267, 0);                           // Grovel
  c.SpellsAdd(7355, 0);                           // Stuck
  c.SpellsAdd(6478, 0);                           // Opening
  c.SpellsAdd(6603, 0);                           // Auto Attack
  c.SpellsAdd(6233, 0);                           // Closing
  c.SpellsAdd(6246, 0);                           // Closing
  c.SpellsAdd(6247, 0);                           // Opening
  c.SpellsAdd(6477, 0);                           // Opening
  c.SpellsAdd(2479, 0);                           // Honorless Target
  c.SpellsAdd(45927, 0);                          // Summon Friend
  c.SpellsAdd(2382, 0);                           // Generic
  c.SpellsAdd(22027, 0);                          // Remove Insignia
  c.SpellsAdd(61437, 0);                          // Opening
  c.SpellsAdd(68398, 0);                          // Opening
  c.SpellsAdd(204, 0);                            // Defense
  c.SpellsAdd(81, 0);                             // Dodge
  c.SpellsAdd(522, 0);                            // SPELLDEFENSE (DND)
  c.SpellsAdd(9078, 0);                           // Cloth

  c.SetActionButtons(0, 133, $00000000);          // Spell: Fireball
  c.SetActionButtons(1, 168, $00000000);          // Spell: Frost Armor
  c.SetActionButtons(9, 59752, $00000000);        // Spell: Every Man for Himself
end;
procedure RACE_HUMAN_CLASS_WARLOCK(var c:TCharData);
begin
  // WARNING: 2.0.6 DATA!

  c.Enum.zoneID                := 0;
  c.Enum.mapID                 := 0;
  c.Enum.position.x            := -8949.950195;
  c.Enum.position.y            := -132.492996;
  c.Enum.position.z            := 83.531196;
  c.facing                     := 0;

  c.scale_x                    := 1;
  c.power_type                 := 0;
  c.max_health                 := 53;
  c.max_power[POWER_MANA]      := 140;
  c.max_power[POWER_RAGE]      := 1000;
  c.max_power[POWER_FOCUS]     := 100;
  c.max_power[POWER_ENERGY]    := 100;
  c.max_power[POWER_HAPPINESS] := 0;
  c.health                     := 50;
  c.power[POWER_MANA]          := 50;
  c.power[POWER_RAGE]          := 1000;
  c.power[POWER_FOCUS]         := 100;
  c.power[POWER_ENERGY]        := 100;
  c.power[POWER_HAPPINESS]     := 0;
  c.Enum.experienceLevel       := 1;
  c.faction_template           := 1;
  c.flags                      := $00000008;
  c.flags2                     := $00000000;
  c.mainhand_attack_time       := 1600;
  c.offhand_attack_time        := 2000;
  c.ranged_attack_time         := 0;
  c.bounding_radius            := 0.208000;
  c.combat_reach               := 1.5;
  c.enum_model                 := 49+c.Enum.sexID;
  c.native_model               := 49+c.Enum.sexID;
  c.mount_model                := 0;
  c.min_damage                 := 2.142857;
  c.max_damage                 := 3.142857;
  c.min_offhand_damage         := 0;
  c.max_offhand_damage         := 0;
  c.mod_cast_speed             := 1;
  c.stat[0]                    := 20;
  c.stat[1]                    := 20;
  c.stat[2]                    := 21;
  c.stat[3]                    := 22;
  c.stat[4]                    := 24;
  c.resist[0]                  := 45;
  c.resist[1]                  := 0;
  c.resist[2]                  := 0;
  c.resist[3]                  := 0;
  c.resist[4]                  := 0;
  c.resist[5]                  := 0;
  c.resist[6]                  := 0;
  c.base_mana                  := 90;
  c.base_health                := 23;
  c.attack_power               := 10;
  c.ranged_attack_time         := 0;
  c.min_ranged_damage          := 0;
  c.max_ranged_damage          := 0;

  c.player_flags               := $00000000;
  c.xp                         := 0;
  c.next_level_xp              := 400;
  c.points1                    := 0;
  c.professions_left           := 2;
  c.ammo_id                    := 0;

  c.ItemsAdd($FF,3, 6097,1, $00000000);           // Acolyte's Shirt
  c.ItemsAdd($FF,4, 57,1, $00000000);             // Acolyte's Robe
  c.ItemsAdd($FF,6, 1396,1, $00000000);           // Acolyte's Pants
  c.ItemsAdd($FF,7, 59,1, $00000000);             // Acolyte's Shoes
  c.ItemsAdd($FF,15, 2092,1, $00000000);          // Worn Dagger
  c.ItemsAdd($FF,23, 4604,4, $00000000);          // Forest Mushroom Cap
  c.ItemsAdd($FF,24, 159,2, $00000000);           // Refreshing Spring Water
  c.ItemsAdd($FF,25, 6948,1, $00000001);          // Hearthstone

  c.SkillsAdd($0000,355, 5,0, 0,0);               // Affliction
  c.SkillsAdd($0000,415, 1,1, 0,0);               // Cloth
  c.SkillsAdd($0000,202, 0,0, 0,0);               // Engineering
  c.SkillsAdd($0000,356, 0,0, 0,0);               // Fishing
  c.SkillsAdd($0000,171, 0,0, 0,0);               // Alchemy
  c.SkillsAdd($0000,182, 0,0, 0,0);               // Herbalism
  c.SkillsAdd($0000,673, 0,0, 0,0);               // Language: Gutterspeak
  c.SkillsAdd($0000,95, 5,1, 0,0);                // Defense
  c.SkillsAdd($0000,333, 0,0, 0,0);               // Enchanting
  c.SkillsAdd($0000,713, 0,0, 0,0);               // Kodo Riding
  c.SkillsAdd($0000,129, 0,0, 0,0);               // First Aid
  c.SkillsAdd($0000,185, 0,0, 0,0);               // Cooking
  c.SkillsAdd($0000,162, 5,1, 0,0);               // Unarmed
  c.SkillsAdd($0000,165, 0,0, 0,0);               // Leatherworking
  c.SkillsAdd($0000,43, 5,0, 5,0);                // Swords
  c.SkillsAdd($0000,186, 0,0, 0,0);               // Mining
  c.SkillsAdd($0000,98, 300,300, 0,0);            // Language: Common
  c.SkillsAdd($0000,136, 5,0, 0,0);               // Staves
  c.SkillsAdd($0000,533, 0,0, 0,0);               // Raptor Riding
  c.SkillsAdd($0000,554, 0,0, 0,0);               // Undead Horsemanship
  c.SkillsAdd($0000,762, 0,0, 0,0);               // Riding
  c.SkillsAdd($0000,769, 5,0, 0,0);               // Internal
  c.SkillsAdd($0000,315, 0,0, 0,0);               // Language: Troll
  c.SkillsAdd($0000,139, 0,0, 0,0);               // Language: Demon Tongue
  c.SkillsAdd($0000,152, 0,0, 0,0);               // Ram Riding
  c.SkillsAdd($0000,354, 5,5, 0,0);               // Demonology
  c.SkillsAdd($0000,173, 5,1, 0,0);               // Daggers
  c.SkillsAdd($0000,183, 5,5, 0,0);               // GENERIC (DND)
  c.SkillsAdd($0000,228, 5,1, 0,0);               // Wands
  c.SkillsAdd($0000,754, 5,5, 0,0);               // Racial - Human
  c.SkillsAdd($0000,755, 0,0, 0,0);               // Jewelcrafting
  c.SkillsAdd($0000,393, 0,0, 0,0);               // Skinning
  c.SkillsAdd($0000,109, 0,0, 0,0);               // Language: Orcish
  c.SkillsAdd($0000,137, 0,0, 0,0);               // Language: Thalassian
  c.SkillsAdd($0000,140, 0,0, 0,0);               // Language: Titan
  c.SkillsAdd($0000,149, 0,0, 0,0);               // Wolf Riding
  c.SkillsAdd($0000,313, 0,0, 0,0);               // Language: Gnomish
  c.SkillsAdd($0000,593, 5,5, 0,0);               // Destruction
  c.SkillsAdd($0000,759, 0,0, 0,0);               // Language: Draenei
  c.SkillsAdd($0000,197, 0,0, 0,0);               // Tailoring
  c.SkillsAdd($0000,111, 0,0, 0,0);               // Language: Dwarven
  c.SkillsAdd($0000,113, 0,0, 0,0);               // Language: Darnassian
  c.SkillsAdd($0000,115, 0,0, 0,0);               // Language: Taurahe
  c.SkillsAdd($0000,138, 0,0, 0,0);               // Language: Draconic
  c.SkillsAdd($0000,141, 0,0, 0,0);               // Language: Old Tongue
  c.SkillsAdd($0000,142, 1,0, 0,0);               // Survival
  c.SkillsAdd($0000,148, 0,0, 0,0);               // Horse Riding
  c.SkillsAdd($0000,150, 0,0, 0,0);               // Tiger Riding
  c.SkillsAdd($0000,164, 0,0, 0,0);               // Blacksmithing

  c.SpellsAdd(9078, 0);                           // Cloth
  c.SpellsAdd(204, 0);                            // Defense
  c.SpellsAdd(81, 0);                             // Dodge
  c.SpellsAdd(522, 0);                            // SPELLDEFENSE (DND)
  c.SpellsAdd(203, 0);                            // Unarmed
  c.SpellsAdd(668, 0);                            // Language Common
  c.SpellsAdd(687, 0);                            // Demon Skin
  c.SpellsAdd(1180, 0);                           // Daggers
  c.SpellsAdd(21651, 0);                          // Opening
  c.SpellsAdd(21652, 0);                          // Closing
  c.SpellsAdd(8386, 0);                           // Attacking
  c.SpellsAdd(9125, 0);                           // Generic
  c.SpellsAdd(7266, 0);                           // Duel
  c.SpellsAdd(7267, 0);                           // Grovel
  c.SpellsAdd(7355, 0);                           // Stuck
  c.SpellsAdd(22027, 0);                          // Remove Insignia
  c.SpellsAdd(22810, 0);                          // Opening - No Text
  c.SpellsAdd(2479, 0);                           // Honorless Target
  c.SpellsAdd(2382, 0);                           // Generic
  c.SpellsAdd(3365, 0);                           // Opening
  c.SpellsAdd(3050, 0);                           // Detect
  c.SpellsAdd(6477, 0);                           // Opening
  c.SpellsAdd(6478, 0);                           // Opening
  c.SpellsAdd(6603, 0);                           // Auto Attack
  c.SpellsAdd(6233, 0);                           // Closing
  c.SpellsAdd(6246, 0);                           // Closing
  c.SpellsAdd(6247, 0);                           // Opening
  c.SpellsAdd(5009, 0);                           // Wands
  c.SpellsAdd(5019, 0);                           // Shoot
  c.SpellsAdd(20599, 0);                          // Diplomacy
  c.SpellsAdd(20600, 0);                          // Perception
  c.SpellsAdd(20597, 0);                          // Sword Specialization
  c.SpellsAdd(20598, 0);                          // The Human Spirit
  c.SpellsAdd(20864, 0);                          // Mace Specialization
  c.SpellsAdd(686, 0);                            // Shadow Bolt
  c.SetActionButtons(0, 6603, $00000000);         // Spell: Auto Attack
  c.SetActionButtons(1, 686, $00000000);          // Spell: Shadow Bolt
  c.SetActionButtons(2, 687, $00000000);          // Spell: Demon Skin
  c.SetActionButtons(10, 159, $80000000);         // Item: Refreshing Spring Water
  c.SetActionButtons(11, 4604, $80000000);        // Item: Forest Mushroom Cap
end;

procedure RACE_DWARF_CLASS_WARRIOR(var c:TCharData);
begin
  c.Enum.zoneID                := 0;
  c.Enum.mapID                 := 0;
  c.Enum.position.x            := -6241.25;
  c.Enum.position.y            := 331.640014;
  c.Enum.position.z            := 382.747985;
  c.facing                     := 6.149668;

  c.scale_x                    := 1;
  c.power_type                 := 1;
  c.max_health                 := 70;
  c.max_power[POWER_MANA]      := 0;
  c.max_power[POWER_RAGE]      := 1000;
  c.max_power[POWER_FOCUS]     := 100;
  c.max_power[POWER_ENERGY]    := 100;
  c.max_power[POWER_HAPPINESS] := 0;
  c.max_power[POWER_RUNES]     := 8;
  c.max_power[POWER_RUNIC]     := 1000;
  c.health                     := 70;
  c.power[POWER_MANA]          := 0;
  c.power[POWER_RAGE]          := 0;
  c.power[POWER_FOCUS]         := 100;
  c.power[POWER_ENERGY]        := 100;
  c.power[POWER_HAPPINESS]     := 0;
  c.power[POWER_RUNES]         := 8;
  c.power[POWER_RUNIC]         := 0;
  c.Enum.experienceLevel       := 1;
  c.faction_template           := 3;
  c.flags                      := $00000008;
  c.flags2                     := $00000800;
  c.mainhand_attack_time       := 2900;
  c.offhand_attack_time        := 2000;
  c.ranged_attack_time         := 0;
  c.bounding_radius            := 0.347000;
  c.combat_reach               := 1.5;
  c.enum_model                 := 53+c.Enum.sexID;
  c.native_model               := 53+c.Enum.sexID;
  c.mount_model                := 0;
  c.min_damage                 := 11.078572;
  c.max_damage                 := 13.078572;
  c.min_offhand_damage         := 0;
  c.max_offhand_damage         := 0;
  c.mod_cast_speed             := 1;
  c.stat[0]                    := 28;
  c.stat[1]                    := 16;
  c.stat[2]                    := 23;
  c.stat[3]                    := 19;
  c.stat[4]                    := 19;
  c.resist[0]                  := 34;
  c.resist[1]                  := 0;
  c.resist[2]                  := 0;
  c.resist[3]                  := 0;
  c.resist[4]                  := 0;
  c.resist[5]                  := 0;
  c.resist[6]                  := 0;
  c.base_mana                  := 0;
  c.base_health                := 20;
  c.attack_power               := 39;
  c.ranged_attack_time         := 0;
  c.min_ranged_damage          := 0;
  c.max_ranged_damage          := 0;
  c.hover_height               := 1;

  c.player_flags               := $00000000;
  c.xp                         := 0;
  c.next_level_xp              := 400;
  c.points1                    := 0;
  c.professions_left           := 2;
  c.ammo_id                    := 0;

  c.ItemsAdd($FF,3, 38,1, $00010000);             // Recruit's Shirt
  c.ItemsAdd($FF,6, 39,1, $00010000);             // Recruit's Pants
  c.ItemsAdd($FF,7, 40,1, $00010000);             // Recruit's Boots
  c.ItemsAdd($FF,15, 12282,1, $00010000);         // Worn Battleaxe
  c.ItemsAdd($FF,23, 6948,1, $00010001);          // Hearthstone

  c.SkillsAdd($0000,473, 1,0, 0,0);               // Fist Weapons
  c.SkillsAdd($0000,44, 5,1, 0,0);                // Axes
  c.SkillsAdd($0000,164, 0,0, 0,0);               // Blacksmithing
  c.SkillsAdd($0000,202, 0,0, 0,0);               // Engineering
  c.SkillsAdd($0000,762, 0,0, 0,0);               // Riding
  c.SkillsAdd($0000,257, 5,0, 0,0);               // Protection
  c.SkillsAdd($0000,46, 5,0, 0,0);                // Guns
  c.SkillsAdd($0000,769, 5,0, 0,0);               // Internal
  c.SkillsAdd($0000,755, 0,0, 0,0);               // Jewelcrafting
  c.SkillsAdd($0000,98, 300,300, 0,0);            // Language: Common
  c.SkillsAdd($0000,136, 5,0, 0,0);               // Staves
  c.SkillsAdd($0000,54, 5,1, 0,0);                // Maces
  c.SkillsAdd($0000,533, 0,0, 0,0);               // Raptor Riding
  c.SkillsAdd($0000,554, 0,0, 0,0);               // Undead Horsemanship
  c.SkillsAdd($0000,771, 1,0, 0,0);               // Frost
  c.SkillsAdd($0000,186, 0,0, 0,0);               // Mining
  c.SkillsAdd($0000,197, 0,0, 0,0);               // Tailoring
  c.SkillsAdd($0000,333, 0,0, 0,0);               // Enchanting
  c.SkillsAdd($0000,185, 0,0, 0,0);               // Cooking
  c.SkillsAdd($0000,229, 0,0, 0,0);               // Polearms
  c.SkillsAdd($0000,777, 1,1, 0,0);               // Mounts
  c.SkillsAdd($0000,393, 0,0, 0,0);               // Skinning
  c.SkillsAdd($0000,137, 0,0, 0,0);               // Language: Thalassian
  c.SkillsAdd($0000,759, 0,0, 0,0);               // Language: Draenei
  c.SkillsAdd($0000,182, 0,0, 0,0);               // Herbalism
  c.SkillsAdd($0000,226, 5,0, 0,0);               // Crossbows
  c.SkillsAdd($0000,109, 0,0, 0,0);               // Language: Orcish
  c.SkillsAdd($0000,433, 1,1, 0,0);               // Shield
  c.SkillsAdd($0000,140, 300,0, 0,0);             // Language: Titan
  c.SkillsAdd($0000,149, 0,0, 0,0);               // Wolf Riding
  c.SkillsAdd($0000,313, 0,0, 0,0);               // Language: Gnomish
  c.SkillsAdd($0000,45, 5,0, 0,0);                // Bows
  c.SkillsAdd($0000,55, 5,1, 0,0);                // Two-Handed Swords
  c.SkillsAdd($0000,713, 0,0, 0,0);               // Kodo Riding
  c.SkillsAdd($0000,773, 0,0, 0,0);               // Inscription
  c.SkillsAdd($0000,129, 0,0, 0,0);               // First Aid
  c.SkillsAdd($0000,162, 5,1, 0,0);               // Unarmed
  c.SkillsAdd($0000,101, 5,5, 0,0);               // Dwarven Racial
  c.SkillsAdd($0000,111, 300,300, 0,0);           // Language: Dwarven
  c.SkillsAdd($0000,113, 0,0, 0,0);               // Language: Darnassian
  c.SkillsAdd($0000,115, 0,0, 0,0);               // Language: Taurahe
  c.SkillsAdd($0000,315, 0,0, 0,0);               // Language: Troll
  c.SkillsAdd($0000,139, 0,0, 0,0);               // Language: Demon Tongue
  c.SkillsAdd($0000,152, 0,0, 0,0);               // Ram Riding
  c.SkillsAdd($0000,553, 0,0, 0,0);               // Mechanostrider Piloting
  c.SkillsAdd($0000,673, 0,0, 0,0);               // Language: Gutterspeak
  c.SkillsAdd($0000,293, 0,0, 0,0);               // Plate Mail
  c.SkillsAdd($0000,118, 0,0, 0,0);               // Dual Wield
  c.SkillsAdd($0000,138, 300,0, 0,0);             // Language: Draconic
  c.SkillsAdd($0000,141, 0,0, 0,0);               // Language: Old Tongue
  c.SkillsAdd($0000,142, 1,0, 0,0);               // Survival
  c.SkillsAdd($0000,148, 0,0, 0,0);               // Horse Riding
  c.SkillsAdd($0000,150, 0,0, 0,0);               // Tiger Riding
  c.SkillsAdd($0000,173, 5,0, 0,0);               // Daggers
  c.SkillsAdd($0000,183, 5,5, 0,0);               // GENERIC (DND)
  c.SkillsAdd($0000,95, 5,1, 0,0);                // Defense
  c.SkillsAdd($0000,176, 5,0, 0,0);               // Thrown
  c.SkillsAdd($0000,415, 1,1, 0,0);               // Cloth
  c.SkillsAdd($0000,256, 5,0, 0,0);               // Fury
  c.SkillsAdd($0000,413, 1,1, 0,0);               // Mail
  c.SkillsAdd($0000,414, 1,1, 0,0);               // Leather
  c.SkillsAdd($0000,356, 0,0, 0,0);               // Fishing
  c.SkillsAdd($0000,171, 0,0, 0,0);               // Alchemy
  c.SkillsAdd($0000,172, 5,1, 0,0);               // Two-Handed Axes
  c.SkillsAdd($0000,43, 5,0, 0,0);                // Swords
  c.SkillsAdd($0000,26, 5,5, 0,0);                // Arms
  c.SkillsAdd($0000,778, 1,0, 0,0);               // Companions
  c.SkillsAdd($0000,160, 5,0, 0,0);               // Two-Handed Maces
  c.SkillsAdd($0000,165, 0,0, 0,0);               // Leatherworking

  c.SpellsAdd(196, 0);                            // One-Handed Axes
  c.SpellsAdd(668, 0);                            // Language Common
  c.SpellsAdd(198, 0);                            // One-Handed Maces
  c.SpellsAdd(9116, 0);                           // Shield
  c.SpellsAdd(202, 0);                            // Two-Handed Swords
  c.SpellsAdd(203, 0);                            // Unarmed
  c.SpellsAdd(2481, 0);                           // Find Treasure
  c.SpellsAdd(20596, 0);                          // Frost Resistance
  c.SpellsAdd(20595, 0);                          // Gun Specialization
  c.SpellsAdd(20594, 0);                          // Stoneform
  c.SpellsAdd(59224, 0);                          // Mace Specialization
  c.SpellsAdd(672, 0);                            // Language Dwarven
  c.SpellsAdd(21651, 0);                          // Opening
  c.SpellsAdd(21652, 0);                          // Closing
  c.SpellsAdd(22810, 0);                          // Opening - No Text
  c.SpellsAdd(8386, 0);                           // Attacking
  c.SpellsAdd(3365, 0);                           // Opening
  c.SpellsAdd(3050, 0);                           // Detect
  c.SpellsAdd(9125, 0);                           // Generic
  c.SpellsAdd(7266, 0);                           // Duel
  c.SpellsAdd(7267, 0);                           // Grovel
  c.SpellsAdd(7355, 0);                           // Stuck
  c.SpellsAdd(6478, 0);                           // Opening
  c.SpellsAdd(6603, 0);                           // Auto Attack
  c.SpellsAdd(6233, 0);                           // Closing
  c.SpellsAdd(6246, 0);                           // Closing
  c.SpellsAdd(6247, 0);                           // Opening
  c.SpellsAdd(6477, 0);                           // Opening
  c.SpellsAdd(2479, 0);                           // Honorless Target
  c.SpellsAdd(45927, 0);                          // Summon Friend
  c.SpellsAdd(2382, 0);                           // Generic
  c.SpellsAdd(22027, 0);                          // Remove Insignia
  c.SpellsAdd(61437, 0);                          // Opening
  c.SpellsAdd(68398, 0);                          // Opening
  c.SpellsAdd(204, 0);                            // Defense
  c.SpellsAdd(107, 0);                            // Block
  c.SpellsAdd(81, 0);                             // Dodge
  c.SpellsAdd(32215, 0);                          // Victorious State
  c.SpellsAdd(522, 0);                            // SPELLDEFENSE (DND)
  c.SpellsAdd(5301, 0);                           // Defensive State (DND)
  c.SpellsAdd(9078, 0);                           // Cloth
  c.SpellsAdd(8737, 0);                           // Mail
  c.SpellsAdd(9077, 0);                           // Leather
  c.SpellsAdd(197, 0);                            // Two-Handed Axes
  c.SpellsAdd(78, 0);                             // Heroic Strike
  c.SpellsAdd(2457, 0);                           // Battle Stance

  c.SetActionButtons(0, 6603, $00000000);         // Spell: Auto Attack
  c.SetActionButtons(1, 78, $00000000);           // Spell: Heroic Strike
  c.SetActionButtons(2, 20594, $00000000);        // Spell: Stoneform
  c.SetActionButtons(3, 2481, $00000000);         // Spell: Find Treasure
  c.SetActionButtons(72, 6603, $00000000);        // Spell: Auto Attack
  c.SetActionButtons(73, 78, $00000000);          // Spell: Heroic Strike
  c.SetActionButtons(74, 20594, $00000000);       // Spell: Stoneform
  c.SetActionButtons(75, 2481, $00000000);        // Spell: Find Treasure
  c.SetActionButtons(84, 6603, $00000000);        // Spell: Auto Attack
  c.SetActionButtons(96, 6603, $00000000);        // Spell: Auto Attack
  c.SetActionButtons(108, 6603, $00000000);       // Spell: Auto Attack
end;
procedure RACE_DWARF_CLASS_PALADIN(var c:TCharData);
begin
  c.Enum.zoneID                := 0;
  c.Enum.mapID                 := 0;
  c.Enum.position.x            := -6238.299804;
  c.Enum.position.y            := 328.75;
  c.Enum.position.z            := 382.572998;
  c.facing                     := 0.962113;

  c.scale_x                    := 1;
  c.power_type                 := 0;
  c.max_health                 := 68;
  c.max_power[POWER_MANA]      := 79;
  c.max_power[POWER_RAGE]      := 1000;
  c.max_power[POWER_FOCUS]     := 100;
  c.max_power[POWER_ENERGY]    := 100;
  c.max_power[POWER_HAPPINESS] := 0;
  c.max_power[POWER_RUNES]     := 8;
  c.max_power[POWER_RUNIC]     := 1000;
  c.health                     := 68;
  c.power[POWER_MANA]          := 79;
  c.power[POWER_RAGE]          := 1000;
  c.power[POWER_FOCUS]         := 100;
  c.power[POWER_ENERGY]        := 100;
  c.power[POWER_HAPPINESS]     := 0;
  c.power[POWER_RUNES]         := 8;
  c.power[POWER_RUNIC]         := 0;
  c.Enum.experienceLevel       := 1;
  c.faction_template           := 3;
  c.flags                      := $00000008;
  c.flags2                     := $00000800;
  c.mainhand_attack_time       := 2900;
  c.offhand_attack_time        := 2000;
  c.ranged_attack_time         := 0;
  c.bounding_radius            := 0.347000;
  c.combat_reach               := 1.5;
  c.enum_model                 := 53+c.Enum.sexID;
  c.native_model               := 53+c.Enum.sexID;
  c.mount_model                := 0;
  c.min_damage                 := 10.664286;
  c.max_damage                 := 12.664286;
  c.min_offhand_damage         := 0;
  c.max_offhand_damage         := 0;
  c.mod_cast_speed             := 1;
  c.stat[0]                    := 27;
  c.stat[1]                    := 16;
  c.stat[2]                    := 23;
  c.stat[3]                    := 19;
  c.stat[4]                    := 20;
  c.resist[0]                  := 34;
  c.resist[1]                  := 0;
  c.resist[2]                  := 0;
  c.resist[3]                  := 0;
  c.resist[4]                  := 0;
  c.resist[5]                  := 0;
  c.resist[6]                  := 0;
  c.base_mana                  := 60;
  c.base_health                := 18;
  c.attack_power               := 37;
  c.ranged_attack_time         := 0;
  c.min_ranged_damage          := 0;
  c.max_ranged_damage          := 0;
  c.hover_height               := 1;

  c.player_flags               := $00000000;
  c.xp                         := 0;
  c.next_level_xp              := 400;
  c.points1                    := 0;
  c.professions_left           := 2;
  c.ammo_id                    := 0;

  c.ItemsAdd($FF,3, 6117,1, $00010000);           // Squire's Shirt
  c.ItemsAdd($FF,6, 6118,1, $00010000);           // Squire's Pants
  c.ItemsAdd($FF,7, 43,1, $00010000);             // Squire's Boots
  c.ItemsAdd($FF,15, 2361,1, $00010000);          // Battleworn Hammer
  c.ItemsAdd($FF,23, 6948,1, $00010001);          // Hearthstone

  c.SkillsAdd($0000,44, 5,0, 0,0);                // Axes
  c.SkillsAdd($0000,164, 0,0, 0,0);               // Blacksmithing
  c.SkillsAdd($0000,202, 0,0, 0,0);               // Engineering
  c.SkillsAdd($0000,762, 0,0, 0,0);               // Riding
  c.SkillsAdd($0000,769, 5,0, 0,0);               // Internal
  c.SkillsAdd($0000,755, 0,0, 0,0);               // Jewelcrafting
  c.SkillsAdd($0000,98, 300,300, 0,0);            // Language: Common
  c.SkillsAdd($0000,54, 5,1, 0,0);                // Maces
  c.SkillsAdd($0000,533, 0,0, 0,0);               // Raptor Riding
  c.SkillsAdd($0000,554, 0,0, 0,0);               // Undead Horsemanship
  c.SkillsAdd($0000,771, 1,0, 0,0);               // Frost
  c.SkillsAdd($0000,186, 0,0, 0,0);               // Mining
  c.SkillsAdd($0000,197, 0,0, 0,0);               // Tailoring
  c.SkillsAdd($0000,333, 0,0, 0,0);               // Enchanting
  c.SkillsAdd($0000,185, 0,0, 0,0);               // Cooking
  c.SkillsAdd($0000,229, 0,0, 0,0);               // Polearms
  c.SkillsAdd($0000,777, 1,1, 0,0);               // Mounts
  c.SkillsAdd($0000,393, 0,0, 0,0);               // Skinning
  c.SkillsAdd($0000,137, 0,0, 0,0);               // Language: Thalassian
  c.SkillsAdd($0000,759, 0,0, 0,0);               // Language: Draenei
  c.SkillsAdd($0000,182, 0,0, 0,0);               // Herbalism
  c.SkillsAdd($0000,109, 0,0, 0,0);               // Language: Orcish
  c.SkillsAdd($0000,433, 1,1, 0,0);               // Shield
  c.SkillsAdd($0000,140, 300,0, 0,0);             // Language: Titan
  c.SkillsAdd($0000,149, 0,0, 0,0);               // Wolf Riding
  c.SkillsAdd($0000,313, 0,0, 0,0);               // Language: Gnomish
  c.SkillsAdd($0000,55, 5,0, 0,0);                // Two-Handed Swords
  c.SkillsAdd($0000,713, 0,0, 0,0);               // Kodo Riding
  c.SkillsAdd($0000,773, 0,0, 0,0);               // Inscription
  c.SkillsAdd($0000,129, 0,0, 0,0);               // First Aid
  c.SkillsAdd($0000,267, 5,0, 0,0);               // Protection
  c.SkillsAdd($0000,162, 5,1, 0,0);               // Unarmed
  c.SkillsAdd($0000,101, 5,5, 0,0);               // Dwarven Racial
  c.SkillsAdd($0000,111, 300,300, 0,0);           // Language: Dwarven
  c.SkillsAdd($0000,113, 0,0, 0,0);               // Language: Darnassian
  c.SkillsAdd($0000,115, 0,0, 0,0);               // Language: Taurahe
  c.SkillsAdd($0000,315, 0,0, 0,0);               // Language: Troll
  c.SkillsAdd($0000,139, 0,0, 0,0);               // Language: Demon Tongue
  c.SkillsAdd($0000,152, 0,0, 0,0);               // Ram Riding
  c.SkillsAdd($0000,553, 0,0, 0,0);               // Mechanostrider Piloting
  c.SkillsAdd($0000,673, 0,0, 0,0);               // Language: Gutterspeak
  c.SkillsAdd($0000,293, 0,0, 0,0);               // Plate Mail
  c.SkillsAdd($0000,138, 300,0, 0,0);             // Language: Draconic
  c.SkillsAdd($0000,141, 0,0, 0,0);               // Language: Old Tongue
  c.SkillsAdd($0000,142, 1,0, 0,0);               // Survival
  c.SkillsAdd($0000,148, 0,0, 0,0);               // Horse Riding
  c.SkillsAdd($0000,150, 0,0, 0,0);               // Tiger Riding
  c.SkillsAdd($0000,183, 5,5, 0,0);               // GENERIC (DND)
  c.SkillsAdd($0000,184, 5,0, 0,0);               // Retribution
  c.SkillsAdd($0000,95, 5,1, 0,0);                // Defense
  c.SkillsAdd($0000,415, 1,1, 0,0);               // Cloth
  c.SkillsAdd($0000,594, 5,5, 0,0);               // Holy
  c.SkillsAdd($0000,413, 1,1, 0,0);               // Mail
  c.SkillsAdd($0000,414, 1,1, 0,0);               // Leather
  c.SkillsAdd($0000,356, 0,0, 0,0);               // Fishing
  c.SkillsAdd($0000,171, 0,0, 0,0);               // Alchemy
  c.SkillsAdd($0000,172, 5,0, 0,0);               // Two-Handed Axes
  c.SkillsAdd($0000,43, 5,0, 0,0);                // Swords
  c.SkillsAdd($0000,778, 1,0, 0,0);               // Companions
  c.SkillsAdd($0000,160, 5,1, 0,0);               // Two-Handed Maces
  c.SkillsAdd($0000,165, 0,0, 0,0);               // Leatherworking

  c.SpellsAdd(668, 0);                            // Language Common
  c.SpellsAdd(198, 0);                            // One-Handed Maces
  c.SpellsAdd(9116, 0);                           // Shield
  c.SpellsAdd(203, 0);                            // Unarmed
  c.SpellsAdd(2481, 0);                           // Find Treasure
  c.SpellsAdd(20596, 0);                          // Frost Resistance
  c.SpellsAdd(20595, 0);                          // Gun Specialization
  c.SpellsAdd(20594, 0);                          // Stoneform
  c.SpellsAdd(59224, 0);                          // Mace Specialization
  c.SpellsAdd(672, 0);                            // Language Dwarven
  c.SpellsAdd(21651, 0);                          // Opening
  c.SpellsAdd(21652, 0);                          // Closing
  c.SpellsAdd(22810, 0);                          // Opening - No Text
  c.SpellsAdd(8386, 0);                           // Attacking
  c.SpellsAdd(27762, 0);                          // Libram
  c.SpellsAdd(3365, 0);                           // Opening
  c.SpellsAdd(3050, 0);                           // Detect
  c.SpellsAdd(9125, 0);                           // Generic
  c.SpellsAdd(7266, 0);                           // Duel
  c.SpellsAdd(7267, 0);                           // Grovel
  c.SpellsAdd(7355, 0);                           // Stuck
  c.SpellsAdd(6478, 0);                           // Opening
  c.SpellsAdd(6603, 0);                           // Auto Attack
  c.SpellsAdd(6233, 0);                           // Closing
  c.SpellsAdd(6246, 0);                           // Closing
  c.SpellsAdd(6247, 0);                           // Opening
  c.SpellsAdd(6477, 0);                           // Opening
  c.SpellsAdd(2479, 0);                           // Honorless Target
  c.SpellsAdd(45927, 0);                          // Summon Friend
  c.SpellsAdd(2382, 0);                           // Generic
  c.SpellsAdd(22027, 0);                          // Remove Insignia
  c.SpellsAdd(61437, 0);                          // Opening
  c.SpellsAdd(68398, 0);                          // Opening
  c.SpellsAdd(204, 0);                            // Defense
  c.SpellsAdd(107, 0);                            // Block
  c.SpellsAdd(81, 0);                             // Dodge
  c.SpellsAdd(522, 0);                            // SPELLDEFENSE (DND)
  c.SpellsAdd(9078, 0);                           // Cloth
  c.SpellsAdd(20154, 0);                          // Seal of Righteousness
  c.SpellsAdd(635, 0);                            // Holy Light
  c.SpellsAdd(8737, 0);                           // Mail
  c.SpellsAdd(9077, 0);                           // Leather
  c.SpellsAdd(199, 0);                            // Two-Handed Maces

  c.SetActionButtons(0, 6603, $00000000);         // Spell: Auto Attack
  c.SetActionButtons(1, 20154, $00000000);        // Spell: Seal of Righteousness
  c.SetActionButtons(2, 635, $00000000);          // Spell: Holy Light
  c.SetActionButtons(3, 20594, $00000000);        // Spell: Stoneform
  c.SetActionButtons(4, 2481, $00000000);         // Spell: Find Treasure
end;
procedure RACE_DWARF_CLASS_HUNTER(var c:TCharData);
begin
  c.Enum.zoneID                := 0;
  c.Enum.mapID                 := 0;
  c.Enum.position.x            := -6240.319824;
  c.Enum.position.y            := 331.032989;
  c.Enum.position.z            := 382.757995;
  c.facing                     := 6.177155;

  c.scale_x                    := 1;
  c.power_type                 := 0;
  c.max_health                 := 66;
  c.max_power[POWER_MANA]      := 84;
  c.max_power[POWER_RAGE]      := 1000;
  c.max_power[POWER_FOCUS]     := 100;
  c.max_power[POWER_ENERGY]    := 100;
  c.max_power[POWER_HAPPINESS] := 0;
  c.max_power[POWER_RUNES]     := 8;
  c.max_power[POWER_RUNIC]     := 1000;
  c.health                     := 66;
  c.power[POWER_MANA]          := 84;
  c.power[POWER_RAGE]          := 1000;
  c.power[POWER_FOCUS]         := 100;
  c.power[POWER_ENERGY]        := 100;
  c.power[POWER_HAPPINESS]     := 0;
  c.power[POWER_RUNES]         := 8;
  c.power[POWER_RUNIC]         := 0;
  c.Enum.experienceLevel       := 1;
  c.faction_template           := 3;
  c.flags                      := $00000008;
  c.flags2                     := $00000800;
  c.mainhand_attack_time       := 2900;
  c.offhand_attack_time        := 2000;
  c.ranged_attack_time         := 2300;
  c.bounding_radius            := 0.347000;
  c.combat_reach               := 1.5;
  c.enum_model                 := 53+c.Enum.sexID;
  c.native_model               := 53+c.Enum.sexID;
  c.mount_model                := 0;
  c.min_damage                 := 8.385714;
  c.max_damage                 := 10.385714;
  c.min_offhand_damage         := 2.357142;
  c.max_offhand_damage         := 2.357142;
  c.mod_cast_speed             := 1;
  c.stat[0]                    := 25;
  c.stat[1]                    := 19;
  c.stat[2]                    := 22;
  c.stat[3]                    := 19;
  c.stat[4]                    := 20;
  c.resist[0]                  := 40;
  c.resist[1]                  := 0;
  c.resist[2]                  := 0;
  c.resist[3]                  := 0;
  c.resist[4]                  := 0;
  c.resist[5]                  := 0;
  c.resist[6]                  := 0;
  c.base_mana                  := 65;
  c.base_health                := 26;
  c.attack_power               := 26;
  c.ranged_attack_time         := 2300;
  c.min_ranged_damage          := 6.807143;
  c.max_ranged_damage          := 11.807143;
  c.hover_height               := 1;

  c.player_flags               := $00000000;
  c.xp                         := 0;
  c.next_level_xp              := 400;
  c.points1                    := 0;
  c.professions_left           := 2;
  c.ammo_id                    := 2516;

  c.ItemsAdd($FF,3, 148,1, $00010000);            // Rugged Trapper's Shirt
  c.ItemsAdd($FF,6, 147,1, $00010000);            // Rugged Trapper's Pants
  c.ItemsAdd($FF,7, 129,1, $00010000);            // Rugged Trapper's Boots
  c.ItemsAdd($FF,15, 12282,1, $00010000);         // Worn Battleaxe
  c.ItemsAdd($FF,17, 2508,1, $00010000);          // Old Blunderbuss
  c.ItemsAdd($FF,23, 6948,1, $00010001);          // Hearthstone
  c.ItemsAdd(19,0, 2516,200, $00010000);

  c.SkillsAdd($0000,473, 1,0, 0,0);               // Fist Weapons
  c.SkillsAdd($0000,44, 5,1, 0,0);                // Axes
  c.SkillsAdd($0000,163, 5,5, 0,0);               // Marksmanship
  c.SkillsAdd($0000,164, 0,0, 0,0);               // Blacksmithing
  c.SkillsAdd($0000,202, 0,0, 0,0);               // Engineering
  c.SkillsAdd($0000,762, 0,0, 0,0);               // Riding
  c.SkillsAdd($0000,46, 5,1, 0,0);                // Guns
  c.SkillsAdd($0000,769, 5,0, 0,0);               // Internal
  c.SkillsAdd($0000,755, 0,0, 0,0);               // Jewelcrafting
  c.SkillsAdd($0000,51, 5,5, 0,0);                // Survival
  c.SkillsAdd($0000,98, 300,300, 0,0);            // Language: Common
  c.SkillsAdd($0000,136, 5,0, 0,0);               // Staves
  c.SkillsAdd($0000,533, 0,0, 0,0);               // Raptor Riding
  c.SkillsAdd($0000,554, 0,0, 0,0);               // Undead Horsemanship
  c.SkillsAdd($0000,771, 1,0, 0,0);               // Frost
  c.SkillsAdd($0000,186, 0,0, 0,0);               // Mining
  c.SkillsAdd($0000,197, 0,0, 0,0);               // Tailoring
  c.SkillsAdd($0000,333, 0,0, 0,0);               // Enchanting
  c.SkillsAdd($0000,185, 0,0, 0,0);               // Cooking
  c.SkillsAdd($0000,229, 0,0, 0,0);               // Polearms
  c.SkillsAdd($0000,777, 1,1, 0,0);               // Mounts
  c.SkillsAdd($0000,393, 0,0, 0,0);               // Skinning
  c.SkillsAdd($0000,137, 0,0, 0,0);               // Language: Thalassian
  c.SkillsAdd($0000,759, 0,0, 0,0);               // Language: Draenei
  c.SkillsAdd($0000,182, 0,0, 0,0);               // Herbalism
  c.SkillsAdd($0000,226, 5,0, 0,0);               // Crossbows
  c.SkillsAdd($0000,109, 0,0, 0,0);               // Language: Orcish
  c.SkillsAdd($0000,140, 300,0, 0,0);             // Language: Titan
  c.SkillsAdd($0000,149, 0,0, 0,0);               // Wolf Riding
  c.SkillsAdd($0000,313, 0,0, 0,0);               // Language: Gnomish
  c.SkillsAdd($0000,45, 5,0, 0,0);                // Bows
  c.SkillsAdd($0000,55, 5,0, 0,0);                // Two-Handed Swords
  c.SkillsAdd($0000,713, 0,0, 0,0);               // Kodo Riding
  c.SkillsAdd($0000,773, 0,0, 0,0);               // Inscription
  c.SkillsAdd($0000,129, 0,0, 0,0);               // First Aid
  c.SkillsAdd($0000,162, 5,1, 0,0);               // Unarmed
  c.SkillsAdd($0000,50, 5,0, 0,0);                // Beast Mastery
  c.SkillsAdd($0000,101, 5,5, 0,0);               // Dwarven Racial
  c.SkillsAdd($0000,111, 300,300, 0,0);           // Language: Dwarven
  c.SkillsAdd($0000,113, 0,0, 0,0);               // Language: Darnassian
  c.SkillsAdd($0000,115, 0,0, 0,0);               // Language: Taurahe
  c.SkillsAdd($0000,315, 0,0, 0,0);               // Language: Troll
  c.SkillsAdd($0000,139, 0,0, 0,0);               // Language: Demon Tongue
  c.SkillsAdd($0000,152, 0,0, 0,0);               // Ram Riding
  c.SkillsAdd($0000,553, 0,0, 0,0);               // Mechanostrider Piloting
  c.SkillsAdd($0000,673, 0,0, 0,0);               // Language: Gutterspeak
  c.SkillsAdd($0000,118, 0,0, 0,0);               // Dual Wield
  c.SkillsAdd($0000,138, 300,0, 0,0);             // Language: Draconic
  c.SkillsAdd($0000,141, 0,0, 0,0);               // Language: Old Tongue
  c.SkillsAdd($0000,142, 1,0, 0,0);               // Survival
  c.SkillsAdd($0000,148, 0,0, 0,0);               // Horse Riding
  c.SkillsAdd($0000,150, 0,0, 0,0);               // Tiger Riding
  c.SkillsAdd($0000,173, 5,0, 0,0);               // Daggers
  c.SkillsAdd($0000,183, 5,5, 0,0);               // GENERIC (DND)
  c.SkillsAdd($0000,95, 5,1, 0,0);                // Defense
  c.SkillsAdd($0000,176, 5,0, 0,0);               // Thrown
  c.SkillsAdd($0000,415, 1,1, 0,0);               // Cloth
  c.SkillsAdd($0000,413, 0,0, 0,0);               // Mail
  c.SkillsAdd($0000,414, 1,1, 0,0);               // Leather
  c.SkillsAdd($0000,356, 0,0, 0,0);               // Fishing
  c.SkillsAdd($0000,171, 0,0, 0,0);               // Alchemy
  c.SkillsAdd($0000,172, 5,1, 0,0);               // Two-Handed Axes
  c.SkillsAdd($0000,43, 5,0, 0,0);                // Swords
  c.SkillsAdd($0000,778, 1,0, 0,0);               // Companions
  c.SkillsAdd($0000,165, 0,0, 0,0);               // Leatherworking

  c.SpellsAdd(196, 0);                            // One-Handed Axes
  c.SpellsAdd(75, 0);                             // Auto Shot
  c.SpellsAdd(266, 0);                            // Guns
  c.SpellsAdd(2973, 0);                           // Raptor Strike
  c.SpellsAdd(668, 0);                            // Language Common
  c.SpellsAdd(203, 0);                            // Unarmed
  c.SpellsAdd(2481, 0);                           // Find Treasure
  c.SpellsAdd(20596, 0);                          // Frost Resistance
  c.SpellsAdd(20595, 0);                          // Gun Specialization
  c.SpellsAdd(20594, 0);                          // Stoneform
  c.SpellsAdd(59224, 0);                          // Mace Specialization
  c.SpellsAdd(672, 0);                            // Language Dwarven
  c.SpellsAdd(21651, 0);                          // Opening
  c.SpellsAdd(21652, 0);                          // Closing
  c.SpellsAdd(22810, 0);                          // Opening - No Text
  c.SpellsAdd(8386, 0);                           // Attacking
  c.SpellsAdd(3365, 0);                           // Opening
  c.SpellsAdd(3050, 0);                           // Detect
  c.SpellsAdd(9125, 0);                           // Generic
  c.SpellsAdd(7266, 0);                           // Duel
  c.SpellsAdd(7267, 0);                           // Grovel
  c.SpellsAdd(7355, 0);                           // Stuck
  c.SpellsAdd(6478, 0);                           // Opening
  c.SpellsAdd(6603, 0);                           // Auto Attack
  c.SpellsAdd(6233, 0);                           // Closing
  c.SpellsAdd(6246, 0);                           // Closing
  c.SpellsAdd(6247, 0);                           // Opening
  c.SpellsAdd(6477, 0);                           // Opening
  c.SpellsAdd(2479, 0);                           // Honorless Target
  c.SpellsAdd(45927, 0);                          // Summon Friend
  c.SpellsAdd(2382, 0);                           // Generic
  c.SpellsAdd(22027, 0);                          // Remove Insignia
  c.SpellsAdd(34082, 0);                          // Advantaged State (DND)
  c.SpellsAdd(61437, 0);                          // Opening
  c.SpellsAdd(68398, 0);                          // Opening
  c.SpellsAdd(204, 0);                            // Defense
  c.SpellsAdd(24949, 0);                          // Defensive State 2 (DND)
  c.SpellsAdd(13358, 0);                          // Defensive State (DND)
  c.SpellsAdd(81, 0);                             // Dodge
  c.SpellsAdd(522, 0);                            // SPELLDEFENSE (DND)
  c.SpellsAdd(9078, 0);                           // Cloth
  c.SpellsAdd(9077, 0);                           // Leather
  c.SpellsAdd(197, 0);                            // Two-Handed Axes

  c.SetActionButtons(0, 6603, $00000000);         // Spell: Auto Attack
  c.SetActionButtons(1, 2973, $00000000);         // Spell: Raptor Strike
  c.SetActionButtons(2, 75, $00000000);           // Spell: Auto Shot
  c.SetActionButtons(3, 20594, $00000000);        // Spell: Stoneform
  c.SetActionButtons(4, 2481, $00000000);         // Spell: Find Treasure
  c.SetActionButtons(75, 20594, $00000000);       // Spell: Stoneform
  c.SetActionButtons(76, 2481, $00000000);        // Spell: Find Treasure
end;
procedure RACE_DWARF_CLASS_ROGUE(var c:TCharData);
begin
  c.Enum.zoneID                := 0;
  c.Enum.mapID                 := 0;
  c.Enum.position.x            := -6238.799804;
  c.Enum.position.y            := 330.610992;
  c.Enum.position.z            := 382.782012;
  c.facing                     := 0.219891;

  c.scale_x                    := 1;
  c.power_type                 := 3;
  c.max_health                 := 65;
  c.max_power[POWER_MANA]      := 0;
  c.max_power[POWER_RAGE]      := 1000;
  c.max_power[POWER_FOCUS]     := 100;
  c.max_power[POWER_ENERGY]    := 100;
  c.max_power[POWER_HAPPINESS] := 0;
  c.max_power[POWER_RUNES]     := 8;
  c.max_power[POWER_RUNIC]     := 1000;
  c.health                     := 65;
  c.power[POWER_MANA]          := 0;
  c.power[POWER_RAGE]          := 1000;
  c.power[POWER_FOCUS]         := 100;
  c.power[POWER_ENERGY]        := 100;
  c.power[POWER_HAPPINESS]     := 0;
  c.power[POWER_RUNES]         := 8;
  c.power[POWER_RUNIC]         := 0;
  c.Enum.experienceLevel       := 1;
  c.faction_template           := 3;
  c.flags                      := $00000008;
  c.flags2                     := $00000800;
  c.mainhand_attack_time       := 1600;
  c.offhand_attack_time        := 1600;
  c.ranged_attack_time         := 1800;
  c.bounding_radius            := 0.347000;
  c.combat_reach               := 1.5;
  c.enum_model                 := 53+c.Enum.sexID;
  c.native_model               := 53+c.Enum.sexID;
  c.mount_model                := 0;
  c.min_damage                 := 4.085714;
  c.max_damage                 := 5.085714;
  c.min_offhand_damage         := 1.985714;
  c.max_offhand_damage         := 2.485714;
  c.mod_cast_speed             := 1;
  c.stat[0]                    := 26;
  c.stat[1]                    := 19;
  c.stat[2]                    := 22;
  c.stat[3]                    := 19;
  c.stat[4]                    := 19;
  c.resist[0]                  := 40;
  c.resist[1]                  := 0;
  c.resist[2]                  := 0;
  c.resist[3]                  := 0;
  c.resist[4]                  := 0;
  c.resist[5]                  := 0;
  c.resist[6]                  := 0;
  c.base_mana                  := 0;
  c.base_health                := 25;
  c.attack_power               := 27;
  c.ranged_attack_time         := 1800;
  c.min_ranged_damage          := 3.285714;
  c.max_ranged_damage          := 5.285714;
  c.hover_height               := 1;

  c.player_flags               := $00000000;
  c.xp                         := 0;
  c.next_level_xp              := 400;
  c.points1                    := 0;
  c.professions_left           := 2;
  c.ammo_id                    := 0;

  c.ItemsAdd($FF,3, 49,1, $00010000);             // Footpad's Shirt
  c.ItemsAdd($FF,6, 48,1, $00010000);             // Footpad's Pants
  c.ItemsAdd($FF,7, 47,1, $00010000);             // Footpad's Shoes
  c.ItemsAdd($FF,15, 2092,1, $00010000);          // Worn Dagger
  c.ItemsAdd($FF,16, 50055,1, $00010000);         //
  c.ItemsAdd($FF,17, 25861,1, $00010000);         // Crude Throwing Axe
  c.ItemsAdd($FF,23, 6948,1, $00010001);          // Hearthstone

  c.SkillsAdd($0000,473, 1,0, 0,0);               // Fist Weapons
  c.SkillsAdd($0000,44, 5,0, 0,0);                // Axes
  c.SkillsAdd($0000,164, 0,0, 0,0);               // Blacksmithing
  c.SkillsAdd($0000,202, 0,0, 0,0);               // Engineering
  c.SkillsAdd($0000,762, 0,0, 0,0);               // Riding
  c.SkillsAdd($0000,46, 5,0, 0,0);                // Guns
  c.SkillsAdd($0000,769, 5,0, 0,0);               // Internal
  c.SkillsAdd($0000,755, 0,0, 0,0);               // Jewelcrafting
  c.SkillsAdd($0000,98, 300,300, 0,0);            // Language: Common
  c.SkillsAdd($0000,54, 5,0, 0,0);                // Maces
  c.SkillsAdd($0000,533, 0,0, 0,0);               // Raptor Riding
  c.SkillsAdd($0000,554, 0,0, 0,0);               // Undead Horsemanship
  c.SkillsAdd($0000,771, 1,0, 0,0);               // Frost
  c.SkillsAdd($0000,186, 0,0, 0,0);               // Mining
  c.SkillsAdd($0000,197, 0,0, 0,0);               // Tailoring
  c.SkillsAdd($0000,333, 0,0, 0,0);               // Enchanting
  c.SkillsAdd($0000,185, 0,0, 0,0);               // Cooking
  c.SkillsAdd($0000,777, 1,1, 0,0);               // Mounts
  c.SkillsAdd($0000,393, 0,0, 0,0);               // Skinning
  c.SkillsAdd($0000,137, 0,0, 0,0);               // Language: Thalassian
  c.SkillsAdd($0000,759, 0,0, 0,0);               // Language: Draenei
  c.SkillsAdd($0000,182, 0,0, 0,0);               // Herbalism
  c.SkillsAdd($0000,226, 5,0, 0,0);               // Crossbows
  c.SkillsAdd($0000,109, 0,0, 0,0);               // Language: Orcish
  c.SkillsAdd($0000,140, 300,0, 0,0);             // Language: Titan
  c.SkillsAdd($0000,149, 0,0, 0,0);               // Wolf Riding
  c.SkillsAdd($0000,253, 5,5, 0,0);               // Assassination
  c.SkillsAdd($0000,313, 0,0, 0,0);               // Language: Gnomish
  c.SkillsAdd($0000,45, 5,0, 0,0);                // Bows
  c.SkillsAdd($0000,713, 0,0, 0,0);               // Kodo Riding
  c.SkillsAdd($0000,773, 0,0, 0,0);               // Inscription
  c.SkillsAdd($0000,38, 5,5, 0,0);                // Combat
  c.SkillsAdd($0000,39, 5,0, 0,0);                // Subtlety
  c.SkillsAdd($0000,129, 0,0, 0,0);               // First Aid
  c.SkillsAdd($0000,162, 5,1, 0,0);               // Unarmed
  c.SkillsAdd($0000,101, 5,5, 0,0);               // Dwarven Racial
  c.SkillsAdd($0000,111, 300,300, 0,0);           // Language: Dwarven
  c.SkillsAdd($0000,113, 0,0, 0,0);               // Language: Darnassian
  c.SkillsAdd($0000,115, 0,0, 0,0);               // Language: Taurahe
  c.SkillsAdd($0000,315, 0,0, 0,0);               // Language: Troll
  c.SkillsAdd($0000,139, 0,0, 0,0);               // Language: Demon Tongue
  c.SkillsAdd($0000,152, 0,0, 0,0);               // Ram Riding
  c.SkillsAdd($0000,553, 0,0, 0,0);               // Mechanostrider Piloting
  c.SkillsAdd($0000,673, 0,0, 0,0);               // Language: Gutterspeak
  c.SkillsAdd($0000,118, 5,5, 0,0);               // Dual Wield
  c.SkillsAdd($0000,138, 300,0, 0,0);             // Language: Draconic
  c.SkillsAdd($0000,141, 0,0, 0,0);               // Language: Old Tongue
  c.SkillsAdd($0000,142, 1,0, 0,0);               // Survival
  c.SkillsAdd($0000,148, 0,0, 0,0);               // Horse Riding
  c.SkillsAdd($0000,150, 0,0, 0,0);               // Tiger Riding
  c.SkillsAdd($0000,173, 5,1, 0,0);               // Daggers
  c.SkillsAdd($0000,183, 5,5, 0,0);               // GENERIC (DND)
  c.SkillsAdd($0000,95, 5,1, 0,0);                // Defense
  c.SkillsAdd($0000,176, 5,1, 0,0);               // Thrown
  c.SkillsAdd($0000,415, 1,1, 0,0);               // Cloth
  c.SkillsAdd($0000,633, 5,0, 0,0);               // Lockpicking
  c.SkillsAdd($0000,414, 1,1, 0,0);               // Leather
  c.SkillsAdd($0000,356, 0,0, 0,0);               // Fishing
  c.SkillsAdd($0000,171, 0,0, 0,0);               // Alchemy
  c.SkillsAdd($0000,43, 5,0, 0,0);                // Swords
  c.SkillsAdd($0000,778, 1,0, 0,0);               // Companions
  c.SkillsAdd($0000,165, 0,0, 0,0);               // Leatherworking

  c.SpellsAdd(668, 0);                            // Language Common
  c.SpellsAdd(2098, 0);                           // Eviscerate
  c.SpellsAdd(75460, 0);                          // Unknown
  c.SpellsAdd(21184, 0);                          // Rogue Passive (DND)
  c.SpellsAdd(1752, 0);                           // Sinister Strike
  c.SpellsAdd(203, 0);                            // Unarmed
  c.SpellsAdd(2481, 0);                           // Find Treasure
  c.SpellsAdd(20596, 0);                          // Frost Resistance
  c.SpellsAdd(20595, 0);                          // Gun Specialization
  c.SpellsAdd(20594, 0);                          // Stoneform
  c.SpellsAdd(59224, 0);                          // Mace Specialization
  c.SpellsAdd(672, 0);                            // Language Dwarven
  c.SpellsAdd(674, 0);                            // Dual Wield
  c.SpellsAdd(1180, 0);                           // Daggers
  c.SpellsAdd(21651, 0);                          // Opening
  c.SpellsAdd(21652, 0);                          // Closing
  c.SpellsAdd(22810, 0);                          // Opening - No Text
  c.SpellsAdd(8386, 0);                           // Attacking
  c.SpellsAdd(3365, 0);                           // Opening
  c.SpellsAdd(3050, 0);                           // Detect
  c.SpellsAdd(9125, 0);                           // Generic
  c.SpellsAdd(7266, 0);                           // Duel
  c.SpellsAdd(7267, 0);                           // Grovel
  c.SpellsAdd(7355, 0);                           // Stuck
  c.SpellsAdd(6478, 0);                           // Opening
  c.SpellsAdd(6603, 0);                           // Auto Attack
  c.SpellsAdd(6233, 0);                           // Closing
  c.SpellsAdd(6246, 0);                           // Closing
  c.SpellsAdd(6247, 0);                           // Opening
  c.SpellsAdd(6477, 0);                           // Opening
  c.SpellsAdd(2479, 0);                           // Honorless Target
  c.SpellsAdd(45927, 0);                          // Summon Friend
  c.SpellsAdd(2382, 0);                           // Generic
  c.SpellsAdd(22027, 0);                          // Remove Insignia
  c.SpellsAdd(61437, 0);                          // Opening
  c.SpellsAdd(68398, 0);                          // Opening
  c.SpellsAdd(204, 0);                            // Defense
  c.SpellsAdd(16092, 0);                          // Defensive State (DND)
  c.SpellsAdd(81, 0);                             // Dodge
  c.SpellsAdd(522, 0);                            // SPELLDEFENSE (DND)
  c.SpellsAdd(2764, 0);                           // Throw
  c.SpellsAdd(2567, 0);                           // Thrown
  c.SpellsAdd(9078, 0);                           // Cloth
  c.SpellsAdd(9077, 0);                           // Leather

  c.SetActionButtons(0, 6603, $00000000);         // Spell: Auto Attack
  c.SetActionButtons(1, 1752, $00000000);         // Spell: Sinister Strike
  c.SetActionButtons(2, 2098, $00000000);         // Spell: Eviscerate
  c.SetActionButtons(3, 2764, $00000000);         // Spell: Throw
  c.SetActionButtons(4, 20594, $00000000);        // Spell: Stoneform
  c.SetActionButtons(5, 2481, $00000000);         // Spell: Find Treasure
end;
procedure RACE_DWARF_CLASS_PRIEST(var c:TCharData);
begin
  c.Enum.zoneID                := 0;
  c.Enum.mapID                 := 0;
  c.Enum.position.x            := -6238.799804;
  c.Enum.position.y            := 330.610992;
  c.Enum.position.z            := 382.782012;
  c.facing                     := 0.223820;

  c.scale_x                    := 1;
  c.power_type                 := 0;
  c.max_health                 := 62;
  c.max_power[POWER_MANA]      := 145;
  c.max_power[POWER_RAGE]      := 1000;
  c.max_power[POWER_FOCUS]     := 100;
  c.max_power[POWER_ENERGY]    := 100;
  c.max_power[POWER_HAPPINESS] := 0;
  c.max_power[POWER_RUNES]     := 8;
  c.max_power[POWER_RUNIC]     := 1000;
  c.health                     := 62;
  c.power[POWER_MANA]          := 145;
  c.power[POWER_RAGE]          := 1000;
  c.power[POWER_FOCUS]         := 100;
  c.power[POWER_ENERGY]        := 100;
  c.power[POWER_HAPPINESS]     := 0;
  c.power[POWER_RUNES]         := 8;
  c.power[POWER_RUNIC]         := 0;
  c.Enum.experienceLevel       := 1;
  c.faction_template           := 3;
  c.flags                      := $00000008;
  c.flags2                     := $00000800;
  c.mainhand_attack_time       := 2900;
  c.offhand_attack_time        := 2000;
  c.ranged_attack_time         := 0;
  c.bounding_radius            := 0.347000;
  c.combat_reach               := 1.5;
  c.enum_model                 := 53+c.Enum.sexID;
  c.native_model               := 53+c.Enum.sexID;
  c.mount_model                := 0;
  c.min_damage                 := 9.214286;
  c.max_damage                 := 11.214286;
  c.min_offhand_damage         := 0;
  c.max_offhand_damage         := 0;
  c.mod_cast_speed             := 1;
  c.stat[0]                    := 25;
  c.stat[1]                    := 16;
  c.stat[2]                    := 21;
  c.stat[3]                    := 21;
  c.stat[4]                    := 22;
  c.resist[0]                  := 37;
  c.resist[1]                  := 0;
  c.resist[2]                  := 0;
  c.resist[3]                  := 0;
  c.resist[4]                  := 0;
  c.resist[5]                  := 0;
  c.resist[6]                  := 0;
  c.base_mana                  := 110;
  c.base_health                := 32;
  c.attack_power               := 30;
  c.ranged_attack_time         := 0;
  c.min_ranged_damage          := 0;
  c.max_ranged_damage          := 0;
  c.hover_height               := 1;

  c.player_flags               := $00000000;
  c.xp                         := 0;
  c.next_level_xp              := 400;
  c.points1                    := 0;
  c.professions_left           := 2;
  c.ammo_id                    := 0;

  c.ItemsAdd($FF,3, 53,1, $00010000);             // Neophyte's Shirt
  c.ItemsAdd($FF,4, 6098,1, $00010000);           // Neophyte's Robe
  c.ItemsAdd($FF,6, 52,1, $00010000);             // Neophyte's Pants
  c.ItemsAdd($FF,7, 51,1, $00010000);             // Neophyte's Boots
  c.ItemsAdd($FF,15, 35,1, $00010000);            // Bent Staff
  c.ItemsAdd($FF,23, 6948,1, $00010001);          // Hearthstone

  c.SkillsAdd($0000,164, 0,0, 0,0);               // Blacksmithing
  c.SkillsAdd($0000,202, 0,0, 0,0);               // Engineering
  c.SkillsAdd($0000,762, 0,0, 0,0);               // Riding
  c.SkillsAdd($0000,769, 5,0, 0,0);               // Internal
  c.SkillsAdd($0000,755, 0,0, 0,0);               // Jewelcrafting
  c.SkillsAdd($0000,98, 300,300, 0,0);            // Language: Common
  c.SkillsAdd($0000,136, 5,1, 0,0);               // Staves
  c.SkillsAdd($0000,54, 5,1, 0,0);                // Maces
  c.SkillsAdd($0000,533, 0,0, 0,0);               // Raptor Riding
  c.SkillsAdd($0000,554, 0,0, 0,0);               // Undead Horsemanship
  c.SkillsAdd($0000,771, 1,0, 0,0);               // Frost
  c.SkillsAdd($0000,186, 0,0, 0,0);               // Mining
  c.SkillsAdd($0000,197, 0,0, 0,0);               // Tailoring
  c.SkillsAdd($0000,333, 0,0, 0,0);               // Enchanting
  c.SkillsAdd($0000,185, 0,0, 0,0);               // Cooking
  c.SkillsAdd($0000,777, 1,1, 0,0);               // Mounts
  c.SkillsAdd($0000,393, 0,0, 0,0);               // Skinning
  c.SkillsAdd($0000,137, 0,0, 0,0);               // Language: Thalassian
  c.SkillsAdd($0000,759, 0,0, 0,0);               // Language: Draenei
  c.SkillsAdd($0000,182, 0,0, 0,0);               // Herbalism
  c.SkillsAdd($0000,228, 5,1, 0,0);               // Wands
  c.SkillsAdd($0000,109, 0,0, 0,0);               // Language: Orcish
  c.SkillsAdd($0000,140, 300,0, 0,0);             // Language: Titan
  c.SkillsAdd($0000,149, 0,0, 0,0);               // Wolf Riding
  c.SkillsAdd($0000,313, 0,0, 0,0);               // Language: Gnomish
  c.SkillsAdd($0000,613, 5,0, 0,0);               // Discipline
  c.SkillsAdd($0000,713, 0,0, 0,0);               // Kodo Riding
  c.SkillsAdd($0000,773, 0,0, 0,0);               // Inscription
  c.SkillsAdd($0000,129, 0,0, 0,0);               // First Aid
  c.SkillsAdd($0000,162, 5,1, 0,0);               // Unarmed
  c.SkillsAdd($0000,56, 5,5, 0,0);                // Holy
  c.SkillsAdd($0000,101, 5,5, 0,0);               // Dwarven Racial
  c.SkillsAdd($0000,111, 300,300, 0,0);           // Language: Dwarven
  c.SkillsAdd($0000,113, 0,0, 0,0);               // Language: Darnassian
  c.SkillsAdd($0000,115, 0,0, 0,0);               // Language: Taurahe
  c.SkillsAdd($0000,315, 0,0, 0,0);               // Language: Troll
  c.SkillsAdd($0000,139, 0,0, 0,0);               // Language: Demon Tongue
  c.SkillsAdd($0000,152, 0,0, 0,0);               // Ram Riding
  c.SkillsAdd($0000,553, 0,0, 0,0);               // Mechanostrider Piloting
  c.SkillsAdd($0000,673, 0,0, 0,0);               // Language: Gutterspeak
  c.SkillsAdd($0000,138, 300,0, 0,0);             // Language: Draconic
  c.SkillsAdd($0000,141, 0,0, 0,0);               // Language: Old Tongue
  c.SkillsAdd($0000,142, 1,0, 0,0);               // Survival
  c.SkillsAdd($0000,148, 0,0, 0,0);               // Horse Riding
  c.SkillsAdd($0000,150, 0,0, 0,0);               // Tiger Riding
  c.SkillsAdd($0000,173, 5,0, 0,0);               // Daggers
  c.SkillsAdd($0000,183, 5,5, 0,0);               // GENERIC (DND)
  c.SkillsAdd($0000,95, 5,1, 0,0);                // Defense
  c.SkillsAdd($0000,415, 1,1, 0,0);               // Cloth
  c.SkillsAdd($0000,356, 0,0, 0,0);               // Fishing
  c.SkillsAdd($0000,171, 0,0, 0,0);               // Alchemy
  c.SkillsAdd($0000,78, 5,0, 0,0);                // Shadow Magic
  c.SkillsAdd($0000,778, 1,0, 0,0);               // Companions
  c.SkillsAdd($0000,165, 0,0, 0,0);               // Leatherworking

  c.SpellsAdd(668, 0);                            // Language Common
  c.SpellsAdd(227, 0);                            // Staves
  c.SpellsAdd(198, 0);                            // One-Handed Maces
  c.SpellsAdd(5009, 0);                           // Wands
  c.SpellsAdd(5019, 0);                           // Shoot
  c.SpellsAdd(203, 0);                            // Unarmed
  c.SpellsAdd(2050, 0);                           // Lesser Heal
  c.SpellsAdd(585, 0);                            // Smite
  c.SpellsAdd(2481, 0);                           // Find Treasure
  c.SpellsAdd(20596, 0);                          // Frost Resistance
  c.SpellsAdd(20595, 0);                          // Gun Specialization
  c.SpellsAdd(20594, 0);                          // Stoneform
  c.SpellsAdd(59224, 0);                          // Mace Specialization
  c.SpellsAdd(672, 0);                            // Language Dwarven
  c.SpellsAdd(21651, 0);                          // Opening
  c.SpellsAdd(21652, 0);                          // Closing
  c.SpellsAdd(22810, 0);                          // Opening - No Text
  c.SpellsAdd(8386, 0);                           // Attacking
  c.SpellsAdd(3365, 0);                           // Opening
  c.SpellsAdd(3050, 0);                           // Detect
  c.SpellsAdd(9125, 0);                           // Generic
  c.SpellsAdd(7266, 0);                           // Duel
  c.SpellsAdd(7267, 0);                           // Grovel
  c.SpellsAdd(7355, 0);                           // Stuck
  c.SpellsAdd(6478, 0);                           // Opening
  c.SpellsAdd(6603, 0);                           // Auto Attack
  c.SpellsAdd(6233, 0);                           // Closing
  c.SpellsAdd(6246, 0);                           // Closing
  c.SpellsAdd(6247, 0);                           // Opening
  c.SpellsAdd(6477, 0);                           // Opening
  c.SpellsAdd(2479, 0);                           // Honorless Target
  c.SpellsAdd(45927, 0);                          // Summon Friend
  c.SpellsAdd(2382, 0);                           // Generic
  c.SpellsAdd(22027, 0);                          // Remove Insignia
  c.SpellsAdd(61437, 0);                          // Opening
  c.SpellsAdd(68398, 0);                          // Opening
  c.SpellsAdd(204, 0);                            // Defense
  c.SpellsAdd(81, 0);                             // Dodge
  c.SpellsAdd(522, 0);                            // SPELLDEFENSE (DND)
  c.SpellsAdd(9078, 0);                           // Cloth

  c.SetActionButtons(0, 585, $00000000);          // Spell: Smite
  c.SetActionButtons(1, 2050, $00000000);         // Spell: Lesser Heal
  c.SetActionButtons(2, 20594, $00000000);        // Spell: Stoneform
  c.SetActionButtons(3, 2481, $00000000);         // Spell: Find Treasure
end;
procedure RACE_DWARF_CLASS_DEATHKNIGHT(var c:TCharData);
begin
  c.Enum.zoneID                := 0;
  c.Enum.mapID                 := 609;
  c.Enum.position.x            := 2358.439941;
  c.Enum.position.y            := -5666.899902;
  c.Enum.position.z            := 426.023010;
  c.facing                     := 3.514673;

  c.scale_x                    := 1;
  c.power_type                 := 6;
  c.max_health                 := 3179;
  c.max_power[POWER_MANA]      := 0;
  c.max_power[POWER_RAGE]      := 1000;
  c.max_power[POWER_FOCUS]     := 100;
  c.max_power[POWER_ENERGY]    := 100;
  c.max_power[POWER_HAPPINESS] := 0;
  c.max_power[POWER_RUNES]     := 8;
  c.max_power[POWER_RUNIC]     := 1000;
  c.health                     := 3179;
  c.power[POWER_MANA]          := 0;
  c.power[POWER_RAGE]          := 1000;
  c.power[POWER_FOCUS]         := 100;
  c.power[POWER_ENERGY]        := 100;
  c.power[POWER_HAPPINESS]     := 0;
  c.power[POWER_RUNES]         := 8;
  c.power[POWER_RUNIC]         := 0;
  c.Enum.experienceLevel       := 55;
  c.faction_template           := 3;
  c.flags                      := $00000008;
  c.flags2                     := $00000800;
  c.mainhand_attack_time       := 2000;
  c.offhand_attack_time        := 2000;
  c.ranged_attack_time         := 0;
  c.bounding_radius            := 0.347000;
  c.combat_reach               := 1.5;
  c.enum_model                 := 53+c.Enum.sexID;
  c.native_model               := 53+c.Enum.sexID;
  c.mount_model                := 0;
  c.min_damage                 := 109.414299;
  c.max_damage                 := 109.414299;
  c.min_offhand_damage         := 0;
  c.max_offhand_damage         := 0;
  c.mod_cast_speed             := 1;
  c.stat[0]                    := 257;
  c.stat[1]                    := 107;
  c.stat[2]                    := 200;
  c.stat[3]                    := 28;
  c.stat[4]                    := 41;
  c.resist[0]                  := 3529;
  c.resist[1]                  := 0;
  c.resist[2]                  := 0;
  c.resist[3]                  := 0;
  c.resist[4]                  := 0;
  c.resist[5]                  := 0;
  c.resist[6]                  := 0;
  c.base_mana                  := 0;
  c.base_health                := 1359;
  c.attack_power               := 659;
  c.ranged_attack_time         := 0;
  c.min_ranged_damage          := 0;
  c.max_ranged_damage          := 0;
  c.hover_height               := 1;

  c.player_flags               := $00000020;
  c.xp                         := 815;
  c.next_level_xp              := 148200;
  c.points1                    := 0;
  c.professions_left           := 2;
  c.ammo_id                    := 0;

  c.ItemsAdd($FF,0, 34652,1, $00010001);          // Acherus Knight's Hood
  c.ItemsAdd($FF,1, 34657,1, $00010001);          // Choker of Damnation
  c.ItemsAdd($FF,2, 34655,1, $00010001);          // Acherus Knight's Pauldrons
  c.ItemsAdd($FF,4, 34650,1, $00010001);          // Acherus Knight's Tunic
  c.ItemsAdd($FF,5, 34651,1, $00010001);          // Acherus Knight's Girdle
  c.ItemsAdd($FF,6, 34656,1, $00010001);          // Acherus Knight's Cover
  c.ItemsAdd($FF,7, 34648,1, $00010001);          // Acherus Knight's Greaves
  c.ItemsAdd($FF,8, 34653,1, $00010001);          // Acherus Knight's Wristguard
  c.ItemsAdd($FF,9, 34649,1, $00010001);          // Acherus Knight's Gauntlets
  c.ItemsAdd($FF,10, 34658,1, $00010001);         // Plague Band
  c.ItemsAdd($FF,11, 38147,1, $00010001);         // Corrupted Band
  c.ItemsAdd($FF,14, 34659,1, $00010001);         // Acherus Knight's Shroud
  c.ItemsAdd($FF,23, 41751,10, $00010000);        // Black Mushroom

  c.SkillsAdd($0000,44, 275,270, 0,0);            // Axes
  c.SkillsAdd($0000,164, 0,0, 0,0);               // Blacksmithing
  c.SkillsAdd($0000,202, 0,0, 0,0);               // Engineering
  c.SkillsAdd($0002,762, 150,150, 0,0);           // Riding
  c.SkillsAdd($0000,769, 275,0, 0,0);             // Internal
  c.SkillsAdd($0000,755, 0,0, 0,0);               // Jewelcrafting
  c.SkillsAdd($0000,98, 300,300, 0,0);            // Language: Common
  c.SkillsAdd($0000,54, 275,0, 0,0);              // Maces
  c.SkillsAdd($0000,554, 0,0, 0,0);               // Undead Horsemanship
  c.SkillsAdd($0000,770, 275,275, 0,0);           // Blood
  c.SkillsAdd($0000,771, 275,275, 0,0);           // Frost
  c.SkillsAdd($0000,772, 275,275, 0,0);           // Unholy
  c.SkillsAdd($0000,186, 0,0, 0,0);               // Mining
  c.SkillsAdd($0000,197, 0,0, 0,0);               // Tailoring
  c.SkillsAdd($0000,776, 1,0, 0,0);               // Runeforging
  c.SkillsAdd($0000,333, 0,0, 0,0);               // Enchanting
  c.SkillsAdd($0000,185, 0,0, 0,0);               // Cooking
  c.SkillsAdd($0000,229, 275,270, 0,0);           // Polearms
  c.SkillsAdd($0000,777, 1,1, 0,0);               // Mounts
  c.SkillsAdd($0000,393, 0,0, 0,0);               // Skinning
  c.SkillsAdd($0000,759, 0,0, 0,0);               // Language: Draenei
  c.SkillsAdd($0000,182, 0,0, 0,0);               // Herbalism
  c.SkillsAdd($0000,140, 300,0, 0,0);             // Language: Titan
  c.SkillsAdd($0000,149, 0,0, 0,0);               // Wolf Riding
  c.SkillsAdd($0000,55, 275,270, 0,0);            // Two-Handed Swords
  c.SkillsAdd($0000,713, 0,0, 0,0);               // Kodo Riding
  c.SkillsAdd($0000,773, 0,0, 0,0);               // Inscription
  c.SkillsAdd($0004,129, 300,270, 0,0);           // First Aid
  c.SkillsAdd($0000,162, 275,270, 0,0);           // Unarmed
  c.SkillsAdd($0000,101, 275,275, 0,0);           // Dwarven Racial
  c.SkillsAdd($0000,111, 300,300, 0,0);           // Language: Dwarven
  c.SkillsAdd($0000,139, 0,0, 0,0);               // Language: Demon Tongue
  c.SkillsAdd($0000,553, 0,0, 0,0);               // Mechanostrider Piloting
  c.SkillsAdd($0000,293, 1,1, 0,0);               // Plate Mail
  c.SkillsAdd($0000,118, 275,275, 0,0);           // Dual Wield
  c.SkillsAdd($0000,138, 300,0, 0,0);             // Language: Draconic
  c.SkillsAdd($0000,141, 0,0, 0,0);               // Language: Old Tongue
  c.SkillsAdd($0000,142, 1,0, 0,0);               // Survival
  c.SkillsAdd($0000,148, 0,0, 0,0);               // Horse Riding
  c.SkillsAdd($0000,150, 0,0, 0,0);               // Tiger Riding
  c.SkillsAdd($0000,183, 275,275, 0,0);           // GENERIC (DND)
  c.SkillsAdd($0000,95, 275,270, 0,0);            // Defense
  c.SkillsAdd($0000,415, 1,1, 0,0);               // Cloth
  c.SkillsAdd($0000,413, 1,1, 0,0);               // Mail
  c.SkillsAdd($0000,414, 1,1, 0,0);               // Leather
  c.SkillsAdd($0000,356, 0,0, 0,0);               // Fishing
  c.SkillsAdd($0000,171, 0,0, 0,0);               // Alchemy
  c.SkillsAdd($0000,172, 275,270, 0,0);           // Two-Handed Axes
  c.SkillsAdd($0000,43, 275,270, 0,0);            // Swords
  c.SkillsAdd($0000,778, 1,0, 0,0);               // Companions
  c.SkillsAdd($0000,160, 275,0, 0,0);             // Two-Handed Maces
  c.SkillsAdd($0000,165, 0,0, 0,0);               // Leatherworking

  c.SpellsAdd(196, 0);                            // One-Handed Axes
  c.SpellsAdd(33391, 0);                          // Journeyman Riding
  c.SpellsAdd(668, 0);                            // Language Common
  c.SpellsAdd(48266, 0);                          // Blood Presence
  c.SpellsAdd(45902, 0);                          // Blood Strike
  c.SpellsAdd(49410, 0);                          // Forceful Deflection
  c.SpellsAdd(45477, 0);                          // Icy Touch
  c.SpellsAdd(59921, 0);                          // Frost Fever
  c.SpellsAdd(61455, 0);                          // Runic Focus
  c.SpellsAdd(47541, 0);                          // Death Coil
  c.SpellsAdd(49576, 0);                          // Death Grip
  c.SpellsAdd(45462, 0);                          // Plague Strike
  c.SpellsAdd(59879, 0);                          // Blood Plague
  c.SpellsAdd(200, 0);                            // Polearms
  c.SpellsAdd(202, 0);                            // Two-Handed Swords
  c.SpellsAdd(3275, 0);                           // Linen Bandage
  c.SpellsAdd(10846, 0);                          // First Aid
  c.SpellsAdd(7934, 0);                           // Anti-Venom
  c.SpellsAdd(3276, 0);                           // Heavy Linen Bandage
  c.SpellsAdd(3277, 0);                           // Wool Bandage
  c.SpellsAdd(3278, 0);                           // Heavy Wool Bandage
  c.SpellsAdd(7928, 0);                           // Silk Bandage
  c.SpellsAdd(7929, 0);                           // Heavy Silk Bandage
  c.SpellsAdd(10840, 0);                          // Mageweave Bandage
  c.SpellsAdd(10841, 0);                          // Heavy Mageweave Bandage
  c.SpellsAdd(18629, 0);                          // Runecloth Bandage
  c.SpellsAdd(18630, 0);                          // Heavy Runecloth Bandage
  c.SpellsAdd(203, 0);                            // Unarmed
  c.SpellsAdd(2481, 0);                           // Find Treasure
  c.SpellsAdd(20596, 0);                          // Frost Resistance
  c.SpellsAdd(20595, 0);                          // Gun Specialization
  c.SpellsAdd(20594, 0);                          // Stoneform
  c.SpellsAdd(59224, 0);                          // Mace Specialization
  c.SpellsAdd(672, 0);                            // Language Dwarven
  c.SpellsAdd(750, 0);                            // Plate Mail
  c.SpellsAdd(674, 0);                            // Dual Wield
  c.SpellsAdd(21651, 0);                          // Opening
  c.SpellsAdd(21652, 0);                          // Closing
  c.SpellsAdd(22810, 0);                          // Opening - No Text
  c.SpellsAdd(8386, 0);                           // Attacking
  c.SpellsAdd(3365, 0);                           // Opening
  c.SpellsAdd(3050, 0);                           // Detect
  c.SpellsAdd(9125, 0);                           // Generic
  c.SpellsAdd(7266, 0);                           // Duel
  c.SpellsAdd(7267, 0);                           // Grovel
  c.SpellsAdd(7355, 0);                           // Stuck
  c.SpellsAdd(6478, 0);                           // Opening
  c.SpellsAdd(6603, 0);                           // Auto Attack
  c.SpellsAdd(6233, 0);                           // Closing
  c.SpellsAdd(6246, 0);                           // Closing
  c.SpellsAdd(6247, 0);                           // Opening
  c.SpellsAdd(6477, 0);                           // Opening
  c.SpellsAdd(2479, 0);                           // Honorless Target
  c.SpellsAdd(45927, 0);                          // Summon Friend
  c.SpellsAdd(2382, 0);                           // Generic
  c.SpellsAdd(22027, 0);                          // Remove Insignia
  c.SpellsAdd(52665, 0);                          // Sigil
  c.SpellsAdd(61437, 0);                          // Opening
  c.SpellsAdd(68398, 0);                          // Opening
  c.SpellsAdd(63645, 0);                          // Activate Primary Spec
  c.SpellsAdd(63644, 0);                          // Activate Secondary Spec
  c.SpellsAdd(204, 0);                            // Defense
  c.SpellsAdd(45903, 0);                          // Offensive State (DND)
  c.SpellsAdd(81, 0);                             // Dodge
  c.SpellsAdd(522, 0);                            // SPELLDEFENSE (DND)
  c.SpellsAdd(3127, 0);                           // Parry
  c.SpellsAdd(9078, 0);                           // Cloth
  c.SpellsAdd(8737, 0);                           // Mail
  c.SpellsAdd(9077, 0);                           // Leather
  c.SpellsAdd(197, 0);                            // Two-Handed Axes
  c.SpellsAdd(201, 0);                            // One-Handed Swords

  c.SetActionButtons(0, 6603, $00000000);         // Spell: Auto Attack
  c.SetActionButtons(1, 49576, $00000000);        // Spell: Death Grip
  c.SetActionButtons(2, 45477, $00000000);        // Spell: Icy Touch
  c.SetActionButtons(3, 45462, $00000000);        // Spell: Plague Strike
  c.SetActionButtons(4, 45902, $00000000);        // Spell: Blood Strike
  c.SetActionButtons(5, 47541, $00000000);        // Spell: Death Coil
  c.SetActionButtons(10, 2481, $00000000);        // Spell: Find Treasure
end;

procedure RACE_NIGHTELF_CLASS_WARRIOR(var c:TCharData);
begin
  c.Enum.zoneID                := 0;
  c.Enum.mapID                 := 1;
  c.Enum.position.x            := 10311.299804;
  c.Enum.position.y            := 831.463012;
  c.Enum.position.z            := 1326.410034;
  c.facing                     := 5.480333;

  c.scale_x                    := 1;
  c.power_type                 := 1;
  c.max_health                 := 60;
  c.max_power[POWER_MANA]      := 0;
  c.max_power[POWER_RAGE]      := 1000;
  c.max_power[POWER_FOCUS]     := 100;
  c.max_power[POWER_ENERGY]    := 100;
  c.max_power[POWER_HAPPINESS] := 0;
  c.max_power[POWER_RUNES]     := 8;
  c.max_power[POWER_RUNIC]     := 1000;
  c.health                     := 60;
  c.power[POWER_MANA]          := 0;
  c.power[POWER_RAGE]          := 0;
  c.power[POWER_FOCUS]         := 100;
  c.power[POWER_ENERGY]        := 100;
  c.power[POWER_HAPPINESS]     := 0;
  c.power[POWER_RUNES]         := 8;
  c.power[POWER_RUNIC]         := 0;
  c.Enum.experienceLevel       := 1;
  c.faction_template           := 4;
  c.flags                      := $00000008;
  c.flags2                     := $00000800;
  c.mainhand_attack_time       := 2900;
  c.offhand_attack_time        := 2000;
  c.ranged_attack_time         := 0;
  c.bounding_radius            := 0.388999;
  c.combat_reach               := 1.5;
  c.enum_model                 := 55+c.Enum.sexID;
  c.native_model               := 55+c.Enum.sexID;
  c.mount_model                := 0;
  c.min_damage                 := 7.350000;
  c.max_damage                 := 9.350000;
  c.min_offhand_damage         := 0;
  c.max_offhand_damage         := 0;
  c.mod_cast_speed             := 1;
  c.stat[0]                    := 19;
  c.stat[1]                    := 24;
  c.stat[2]                    := 22;
  c.stat[3]                    := 20;
  c.stat[4]                    := 20;
  c.resist[0]                  := 50;
  c.resist[1]                  := 0;
  c.resist[2]                  := 0;
  c.resist[3]                  := 0;
  c.resist[4]                  := 0;
  c.resist[5]                  := 0;
  c.resist[6]                  := 0;
  c.base_mana                  := 0;
  c.base_health                := 20;
  c.attack_power               := 21;
  c.ranged_attack_time         := 0;
  c.min_ranged_damage          := 0;
  c.max_ranged_damage          := 0;
  c.hover_height               := 1;

  c.player_flags               := $00000000;
  c.xp                         := 0;
  c.next_level_xp              := 400;
  c.points1                    := 0;
  c.professions_left           := 2;
  c.ammo_id                    := 0;

  c.ItemsAdd($FF,3, 6120,1, $00010000);           // Recruit's Shirt
  c.ItemsAdd($FF,6, 6121,1, $00010000);           // Recruit's Pants
  c.ItemsAdd($FF,7, 6122,1, $00010000);           // Recruit's Boots
  c.ItemsAdd($FF,15, 49778,1, $00010000);         //
  c.ItemsAdd($FF,23, 6948,1, $00010001);          // Hearthstone

  c.SkillsAdd($0000,473, 1,0, 0,0);               // Fist Weapons
  c.SkillsAdd($0000,44, 5,0, 0,0);                // Axes
  c.SkillsAdd($0000,164, 0,0, 0,0);               // Blacksmithing
  c.SkillsAdd($0000,202, 0,0, 0,0);               // Engineering
  c.SkillsAdd($0000,762, 0,0, 0,0);               // Riding
  c.SkillsAdd($0000,257, 5,0, 0,0);               // Protection
  c.SkillsAdd($0000,46, 5,0, 0,0);                // Guns
  c.SkillsAdd($0000,769, 5,0, 0,0);               // Internal
  c.SkillsAdd($0000,755, 0,0, 0,0);               // Jewelcrafting
  c.SkillsAdd($0000,98, 300,300, 0,0);            // Language: Common
  c.SkillsAdd($0000,136, 5,0, 0,0);               // Staves
  c.SkillsAdd($0000,54, 5,1, 0,0);                // Maces
  c.SkillsAdd($0000,533, 0,0, 0,0);               // Raptor Riding
  c.SkillsAdd($0000,554, 0,0, 0,0);               // Undead Horsemanship
  c.SkillsAdd($0000,771, 1,0, 0,0);               // Frost
  c.SkillsAdd($0000,186, 0,0, 0,0);               // Mining
  c.SkillsAdd($0000,197, 0,0, 0,0);               // Tailoring
  c.SkillsAdd($0000,333, 0,0, 0,0);               // Enchanting
  c.SkillsAdd($0000,185, 0,0, 0,0);               // Cooking
  c.SkillsAdd($0000,229, 0,0, 0,0);               // Polearms
  c.SkillsAdd($0000,777, 1,1, 0,0);               // Mounts
  c.SkillsAdd($0000,393, 0,0, 0,0);               // Skinning
  c.SkillsAdd($0000,137, 0,0, 0,0);               // Language: Thalassian
  c.SkillsAdd($0000,759, 0,0, 0,0);               // Language: Draenei
  c.SkillsAdd($0000,182, 0,0, 0,0);               // Herbalism
  c.SkillsAdd($0000,226, 5,0, 0,0);               // Crossbows
  c.SkillsAdd($0000,109, 0,0, 0,0);               // Language: Orcish
  c.SkillsAdd($0000,433, 1,1, 0,0);               // Shield
  c.SkillsAdd($0000,140, 300,0, 0,0);             // Language: Titan
  c.SkillsAdd($0000,149, 0,0, 0,0);               // Wolf Riding
  c.SkillsAdd($0000,313, 0,0, 0,0);               // Language: Gnomish
  c.SkillsAdd($0000,45, 5,0, 0,0);                // Bows
  c.SkillsAdd($0000,55, 5,1, 0,0);                // Two-Handed Swords
  c.SkillsAdd($0000,713, 0,0, 0,0);               // Kodo Riding
  c.SkillsAdd($0000,773, 0,0, 0,0);               // Inscription
  c.SkillsAdd($0000,129, 0,0, 0,0);               // First Aid
  c.SkillsAdd($0000,126, 5,5, 0,0);               // Night Elf Racial
  c.SkillsAdd($0000,162, 5,1, 0,0);               // Unarmed
  c.SkillsAdd($0000,111, 0,0, 0,0);               // Language: Dwarven
  c.SkillsAdd($0000,113, 300,300, 0,0);           // Language: Darnassian
  c.SkillsAdd($0000,115, 0,0, 0,0);               // Language: Taurahe
  c.SkillsAdd($0000,315, 0,0, 0,0);               // Language: Troll
  c.SkillsAdd($0000,139, 0,0, 0,0);               // Language: Demon Tongue
  c.SkillsAdd($0000,152, 0,0, 0,0);               // Ram Riding
  c.SkillsAdd($0000,673, 0,0, 0,0);               // Language: Gutterspeak
  c.SkillsAdd($0000,293, 0,0, 0,0);               // Plate Mail
  c.SkillsAdd($0000,118, 0,0, 0,0);               // Dual Wield
  c.SkillsAdd($0000,138, 300,0, 0,0);             // Language: Draconic
  c.SkillsAdd($0000,141, 0,0, 0,0);               // Language: Old Tongue
  c.SkillsAdd($0000,142, 1,0, 0,0);               // Survival
  c.SkillsAdd($0000,148, 0,0, 0,0);               // Horse Riding
  c.SkillsAdd($0000,150, 0,0, 0,0);               // Tiger Riding
  c.SkillsAdd($0000,173, 5,1, 0,0);               // Daggers
  c.SkillsAdd($0000,183, 5,5, 0,0);               // GENERIC (DND)
  c.SkillsAdd($0000,95, 5,1, 0,0);                // Defense
  c.SkillsAdd($0000,176, 5,0, 0,0);               // Thrown
  c.SkillsAdd($0000,415, 1,1, 0,0);               // Cloth
  c.SkillsAdd($0000,256, 5,0, 0,0);               // Fury
  c.SkillsAdd($0000,413, 1,1, 0,0);               // Mail
  c.SkillsAdd($0000,414, 1,1, 0,0);               // Leather
  c.SkillsAdd($0000,356, 0,0, 0,0);               // Fishing
  c.SkillsAdd($0000,171, 0,0, 0,0);               // Alchemy
  c.SkillsAdd($0000,172, 5,0, 0,0);               // Two-Handed Axes
  c.SkillsAdd($0000,43, 5,1, 0,0);                // Swords
  c.SkillsAdd($0000,26, 5,5, 0,0);                // Arms
  c.SkillsAdd($0000,778, 1,0, 0,0);               // Companions
  c.SkillsAdd($0000,160, 5,0, 0,0);               // Two-Handed Maces
  c.SkillsAdd($0000,165, 0,0, 0,0);               // Leatherworking

  c.SpellsAdd(668, 0);                            // Language Common
  c.SpellsAdd(198, 0);                            // One-Handed Maces
  c.SpellsAdd(9116, 0);                           // Shield
  c.SpellsAdd(202, 0);                            // Two-Handed Swords
  c.SpellsAdd(20583, 0);                          // Nature Resistance
  c.SpellsAdd(20582, 0);                          // Quickness
  c.SpellsAdd(20585, 0);                          // Wisp Spirit
  c.SpellsAdd(58984, 0);                          // Shadowmeld
  c.SpellsAdd(21009, 0);                          // Elusiveness
  c.SpellsAdd(203, 0);                            // Unarmed
  c.SpellsAdd(671, 0);                            // Language Darnassian
  c.SpellsAdd(1180, 0);                           // Daggers
  c.SpellsAdd(21651, 0);                          // Opening
  c.SpellsAdd(21652, 0);                          // Closing
  c.SpellsAdd(22810, 0);                          // Opening - No Text
  c.SpellsAdd(8386, 0);                           // Attacking
  c.SpellsAdd(3365, 0);                           // Opening
  c.SpellsAdd(3050, 0);                           // Detect
  c.SpellsAdd(9125, 0);                           // Generic
  c.SpellsAdd(7266, 0);                           // Duel
  c.SpellsAdd(7267, 0);                           // Grovel
  c.SpellsAdd(7355, 0);                           // Stuck
  c.SpellsAdd(6478, 0);                           // Opening
  c.SpellsAdd(6603, 0);                           // Auto Attack
  c.SpellsAdd(6233, 0);                           // Closing
  c.SpellsAdd(6246, 0);                           // Closing
  c.SpellsAdd(6247, 0);                           // Opening
  c.SpellsAdd(6477, 0);                           // Opening
  c.SpellsAdd(2479, 0);                           // Honorless Target
  c.SpellsAdd(45927, 0);                          // Summon Friend
  c.SpellsAdd(2382, 0);                           // Generic
  c.SpellsAdd(22027, 0);                          // Remove Insignia
  c.SpellsAdd(61437, 0);                          // Opening
  c.SpellsAdd(68398, 0);                          // Opening
  c.SpellsAdd(204, 0);                            // Defense
  c.SpellsAdd(107, 0);                            // Block
  c.SpellsAdd(81, 0);                             // Dodge
  c.SpellsAdd(32215, 0);                          // Victorious State
  c.SpellsAdd(522, 0);                            // SPELLDEFENSE (DND)
  c.SpellsAdd(5301, 0);                           // Defensive State (DND)
  c.SpellsAdd(9078, 0);                           // Cloth
  c.SpellsAdd(8737, 0);                           // Mail
  c.SpellsAdd(9077, 0);                           // Leather
  c.SpellsAdd(201, 0);                            // One-Handed Swords
  c.SpellsAdd(78, 0);                             // Heroic Strike
  c.SpellsAdd(2457, 0);                           // Battle Stance

  c.SetActionButtons(0, 6603, $00000000);         // Spell: Auto Attack
  c.SetActionButtons(1, 78, $00000000);           // Spell: Heroic Strike
  c.SetActionButtons(2, 58984, $00000000);        // Spell: Shadowmeld
  c.SetActionButtons(72, 6603, $00000000);        // Spell: Auto Attack
  c.SetActionButtons(73, 78, $00000000);          // Spell: Heroic Strike
  c.SetActionButtons(74, 58984, $00000000);       // Spell: Shadowmeld
  c.SetActionButtons(84, 6603, $00000000);        // Spell: Auto Attack
  c.SetActionButtons(96, 6603, $00000000);        // Spell: Auto Attack
  c.SetActionButtons(108, 6603, $00000000);       // Spell: Auto Attack
end;
procedure RACE_NIGHTELF_CLASS_HUNTER(var c:TCharData);
begin
  c.Enum.zoneID                := 0;
  c.Enum.mapID                 := 1;
  c.Enum.position.x            := 10311.299804;
  c.Enum.position.y            := 831.463012;
  c.Enum.position.z            := 1326.410034;
  c.facing                     := 5.480333;

  c.scale_x                    := 1;
  c.power_type                 := 0;
  c.max_health                 := 56;
  c.max_power[POWER_MANA]      := 85;
  c.max_power[POWER_RAGE]      := 1000;
  c.max_power[POWER_FOCUS]     := 100;
  c.max_power[POWER_ENERGY]    := 100;
  c.max_power[POWER_HAPPINESS] := 0;
  c.max_power[POWER_RUNES]     := 8;
  c.max_power[POWER_RUNIC]     := 1000;
  c.health                     := 56;
  c.power[POWER_MANA]          := 85;
  c.power[POWER_RAGE]          := 1000;
  c.power[POWER_FOCUS]         := 100;
  c.power[POWER_ENERGY]        := 100;
  c.power[POWER_HAPPINESS]     := 0;
  c.power[POWER_RUNES]         := 8;
  c.power[POWER_RUNIC]         := 0;
  c.Enum.experienceLevel       := 1;
  c.faction_template           := 4;
  c.flags                      := $00000008;
  c.flags2                     := $00000800;
  c.mainhand_attack_time       := 2900;
  c.offhand_attack_time        := 2000;
  c.ranged_attack_time         := 2000;
  c.bounding_radius            := 0.388999;
  c.combat_reach               := 1.5;
  c.enum_model                 := 55+c.Enum.sexID;
  c.native_model               := 55+c.Enum.sexID;
  c.mount_model                := 0;
  c.min_damage                 := 8.178571;
  c.max_damage                 := 10.178571;
  c.min_offhand_damage         := 2.214285;
  c.max_offhand_damage         := 2.214285;
  c.mod_cast_speed             := 1;
  c.stat[0]                    := 16;
  c.stat[1]                    := 27;
  c.stat[2]                    := 21;
  c.stat[3]                    := 20;
  c.stat[4]                    := 21;
  c.resist[0]                  := 56;
  c.resist[1]                  := 0;
  c.resist[2]                  := 0;
  c.resist[3]                  := 0;
  c.resist[4]                  := 0;
  c.resist[5]                  := 0;
  c.resist[6]                  := 0;
  c.base_mana                  := 65;
  c.base_health                := 26;
  c.attack_power               := 25;
  c.ranged_attack_time         := 2000;
  c.min_ranged_damage          := 10.421428;
  c.max_ranged_damage          := 17.721429;
  c.hover_height               := 1;

  c.player_flags               := $00000000;
  c.xp                         := 0;
  c.next_level_xp              := 400;
  c.points1                    := 0;
  c.professions_left           := 2;
  c.ammo_id                    := 2512;

  c.ItemsAdd($FF,3, 148,1, $00010000);            // Rugged Trapper's Shirt
  c.ItemsAdd($FF,6, 147,1, $00010000);            // Rugged Trapper's Pants
  c.ItemsAdd($FF,7, 129,1, $00010000);            // Rugged Trapper's Boots
  c.ItemsAdd($FF,15, 12282,1, $00010000);         // Worn Battleaxe
  c.ItemsAdd($FF,17, 2504,1, $00010000);          // Worn Shortbow
  c.ItemsAdd($FF,23, 6948,1, $00010001);          // Hearthstone

  c.SkillsAdd($0000,473, 1,0, 0,0);               // Fist Weapons
  c.SkillsAdd($0000,44, 5,0, 0,0);                // Axes
  c.SkillsAdd($0000,163, 5,5, 0,0);               // Marksmanship
  c.SkillsAdd($0000,164, 0,0, 0,0);               // Blacksmithing
  c.SkillsAdd($0000,202, 0,0, 0,0);               // Engineering
  c.SkillsAdd($0000,762, 0,0, 0,0);               // Riding
  c.SkillsAdd($0000,46, 5,0, 0,0);                // Guns
  c.SkillsAdd($0000,769, 5,0, 0,0);               // Internal
  c.SkillsAdd($0000,755, 0,0, 0,0);               // Jewelcrafting
  c.SkillsAdd($0000,51, 5,5, 0,0);                // Survival
  c.SkillsAdd($0000,98, 300,300, 0,0);            // Language: Common
  c.SkillsAdd($0000,136, 5,0, 0,0);               // Staves
  c.SkillsAdd($0000,533, 0,0, 0,0);               // Raptor Riding
  c.SkillsAdd($0000,554, 0,0, 0,0);               // Undead Horsemanship
  c.SkillsAdd($0000,771, 1,0, 0,0);               // Frost
  c.SkillsAdd($0000,186, 0,0, 0,0);               // Mining
  c.SkillsAdd($0000,197, 0,0, 0,0);               // Tailoring
  c.SkillsAdd($0000,333, 0,0, 0,0);               // Enchanting
  c.SkillsAdd($0000,185, 0,0, 0,0);               // Cooking
  c.SkillsAdd($0000,229, 0,0, 0,0);               // Polearms
  c.SkillsAdd($0000,777, 1,1, 0,0);               // Mounts
  c.SkillsAdd($0000,393, 0,0, 0,0);               // Skinning
  c.SkillsAdd($0000,137, 0,0, 0,0);               // Language: Thalassian
  c.SkillsAdd($0000,759, 0,0, 0,0);               // Language: Draenei
  c.SkillsAdd($0000,182, 0,0, 0,0);               // Herbalism
  c.SkillsAdd($0000,226, 5,0, 0,0);               // Crossbows
  c.SkillsAdd($0000,109, 0,0, 0,0);               // Language: Orcish
  c.SkillsAdd($0000,140, 300,0, 0,0);             // Language: Titan
  c.SkillsAdd($0000,149, 0,0, 0,0);               // Wolf Riding
  c.SkillsAdd($0000,313, 0,0, 0,0);               // Language: Gnomish
  c.SkillsAdd($0000,45, 5,1, 0,0);                // Bows
  c.SkillsAdd($0000,55, 5,0, 0,0);                // Two-Handed Swords
  c.SkillsAdd($0000,713, 0,0, 0,0);               // Kodo Riding
  c.SkillsAdd($0000,773, 0,0, 0,0);               // Inscription
  c.SkillsAdd($0000,129, 0,0, 0,0);               // First Aid
  c.SkillsAdd($0000,126, 5,5, 0,0);               // Night Elf Racial
  c.SkillsAdd($0000,162, 5,1, 0,0);               // Unarmed
  c.SkillsAdd($0000,50, 5,0, 0,0);                // Beast Mastery
  c.SkillsAdd($0000,111, 0,0, 0,0);               // Language: Dwarven
  c.SkillsAdd($0000,113, 300,300, 0,0);           // Language: Darnassian
  c.SkillsAdd($0000,115, 0,0, 0,0);               // Language: Taurahe
  c.SkillsAdd($0000,315, 0,0, 0,0);               // Language: Troll
  c.SkillsAdd($0000,139, 0,0, 0,0);               // Language: Demon Tongue
  c.SkillsAdd($0000,152, 0,0, 0,0);               // Ram Riding
  c.SkillsAdd($0000,673, 0,0, 0,0);               // Language: Gutterspeak
  c.SkillsAdd($0000,118, 0,0, 0,0);               // Dual Wield
  c.SkillsAdd($0000,138, 300,0, 0,0);             // Language: Draconic
  c.SkillsAdd($0000,141, 0,0, 0,0);               // Language: Old Tongue
  c.SkillsAdd($0000,142, 1,0, 0,0);               // Survival
  c.SkillsAdd($0000,148, 0,0, 0,0);               // Horse Riding
  c.SkillsAdd($0000,150, 0,0, 0,0);               // Tiger Riding
  c.SkillsAdd($0000,173, 5,1, 0,0);               // Daggers
  c.SkillsAdd($0000,183, 5,5, 0,0);               // GENERIC (DND)
  c.SkillsAdd($0000,95, 5,1, 0,0);                // Defense
  c.SkillsAdd($0000,176, 5,0, 0,0);               // Thrown
  c.SkillsAdd($0000,415, 1,1, 0,0);               // Cloth
  c.SkillsAdd($0000,413, 0,0, 0,0);               // Mail
  c.SkillsAdd($0000,414, 1,1, 0,0);               // Leather
  c.SkillsAdd($0000,356, 0,0, 0,0);               // Fishing
  c.SkillsAdd($0000,171, 0,0, 0,0);               // Alchemy
  c.SkillsAdd($0000,172, 5,1, 0,0);               // Two-Handed Axes
  c.SkillsAdd($0000,43, 5,0, 0,0);                // Swords
  c.SkillsAdd($0000,778, 1,0, 0,0);               // Companions
  c.SkillsAdd($0000,165, 0,0, 0,0);               // Leatherworking

  c.SpellsAdd(75, 0);                             // Auto Shot
  c.SpellsAdd(2973, 0);                           // Raptor Strike
  c.SpellsAdd(668, 0);                            // Language Common
  c.SpellsAdd(264, 0);                            // Bows
  c.SpellsAdd(20583, 0);                          // Nature Resistance
  c.SpellsAdd(20582, 0);                          // Quickness
  c.SpellsAdd(20585, 0);                          // Wisp Spirit
  c.SpellsAdd(58984, 0);                          // Shadowmeld
  c.SpellsAdd(21009, 0);                          // Elusiveness
  c.SpellsAdd(203, 0);                            // Unarmed
  c.SpellsAdd(671, 0);                            // Language Darnassian
  c.SpellsAdd(1180, 0);                           // Daggers
  c.SpellsAdd(21651, 0);                          // Opening
  c.SpellsAdd(21652, 0);                          // Closing
  c.SpellsAdd(22810, 0);                          // Opening - No Text
  c.SpellsAdd(8386, 0);                           // Attacking
  c.SpellsAdd(3365, 0);                           // Opening
  c.SpellsAdd(3050, 0);                           // Detect
  c.SpellsAdd(9125, 0);                           // Generic
  c.SpellsAdd(7266, 0);                           // Duel
  c.SpellsAdd(7267, 0);                           // Grovel
  c.SpellsAdd(7355, 0);                           // Stuck
  c.SpellsAdd(6478, 0);                           // Opening
  c.SpellsAdd(6603, 0);                           // Auto Attack
  c.SpellsAdd(6233, 0);                           // Closing
  c.SpellsAdd(6246, 0);                           // Closing
  c.SpellsAdd(6247, 0);                           // Opening
  c.SpellsAdd(6477, 0);                           // Opening
  c.SpellsAdd(2479, 0);                           // Honorless Target
  c.SpellsAdd(45927, 0);                          // Summon Friend
  c.SpellsAdd(2382, 0);                           // Generic
  c.SpellsAdd(22027, 0);                          // Remove Insignia
  c.SpellsAdd(34082, 0);                          // Advantaged State (DND)
  c.SpellsAdd(61437, 0);                          // Opening
  c.SpellsAdd(68398, 0);                          // Opening
  c.SpellsAdd(204, 0);                            // Defense
  c.SpellsAdd(24949, 0);                          // Defensive State 2 (DND)
  c.SpellsAdd(13358, 0);                          // Defensive State (DND)
  c.SpellsAdd(81, 0);                             // Dodge
  c.SpellsAdd(522, 0);                            // SPELLDEFENSE (DND)
  c.SpellsAdd(9078, 0);                           // Cloth
  c.SpellsAdd(9077, 0);                           // Leather
  c.SpellsAdd(197, 0);                            // Two-Handed Axes

  c.SetActionButtons(0, 6603, $00000000);         // Spell: Auto Attack
  c.SetActionButtons(1, 2973, $00000000);         // Spell: Raptor Strike
  c.SetActionButtons(2, 75, $00000000);           // Spell: Auto Shot
  c.SetActionButtons(3, 58984, $00000000);        // Spell: Shadowmeld
  c.SetActionButtons(81, 58984, $00000000);       // Spell: Shadowmeld
end;
procedure RACE_NIGHTELF_CLASS_ROGUE(var c:TCharData);
begin
  c.Enum.zoneID                := 0;
  c.Enum.mapID                 := 1;
  c.Enum.position.x            := 10311.299804;
  c.Enum.position.y            := 831.463012;
  c.Enum.position.z            := 1326.410034;
  c.facing                     := 5.684536;

  c.scale_x                    := 1;
  c.power_type                 := 3;
  c.max_health                 := 55;
  c.max_power[POWER_MANA]      := 0;
  c.max_power[POWER_RAGE]      := 1000;
  c.max_power[POWER_FOCUS]     := 100;
  c.max_power[POWER_ENERGY]    := 100;
  c.max_power[POWER_HAPPINESS] := 0;
  c.max_power[POWER_RUNES]     := 8;
  c.max_power[POWER_RUNIC]     := 1000;
  c.health                     := 55;
  c.power[POWER_MANA]          := 0;
  c.power[POWER_RAGE]          := 1000;
  c.power[POWER_FOCUS]         := 100;
  c.power[POWER_ENERGY]        := 100;
  c.power[POWER_HAPPINESS]     := 0;
  c.power[POWER_RUNES]         := 8;
  c.power[POWER_RUNIC]         := 0;
  c.Enum.experienceLevel       := 1;
  c.faction_template           := 4;
  c.flags                      := $00000008;
  c.flags2                     := $00000800;
  c.mainhand_attack_time       := 1600;
  c.offhand_attack_time        := 1600;
  c.ranged_attack_time         := 1600;
  c.bounding_radius            := 0.305999;
  c.combat_reach               := 1.5;
  c.enum_model                 := 55+c.Enum.sexID;
  c.native_model               := 55+c.Enum.sexID;
  c.mount_model                := 0;
  c.min_damage                 := 3.971428;
  c.max_damage                 := 4.971428;
  c.min_offhand_damage         := 1.985714;
  c.max_offhand_damage         := 2.485714;
  c.mod_cast_speed             := 1;
  c.stat[0]                    := 17;
  c.stat[1]                    := 27;
  c.stat[2]                    := 21;
  c.stat[3]                    := 20;
  c.stat[4]                    := 20;
  c.resist[0]                  := 56;
  c.resist[1]                  := 0;
  c.resist[2]                  := 0;
  c.resist[3]                  := 0;
  c.resist[4]                  := 0;
  c.resist[5]                  := 0;
  c.resist[6]                  := 0;
  c.base_mana                  := 0;
  c.base_health                := 25;
  c.attack_power               := 26;
  c.ranged_attack_time         := 1600;
  c.min_ranged_damage          := 3.057143;
  c.max_ranged_damage          := 5.057143;
  c.hover_height               := 1;

  c.player_flags               := $00000000;
  c.xp                         := 0;
  c.next_level_xp              := 400;
  c.points1                    := 0;
  c.professions_left           := 2;
  c.ammo_id                    := 0;

  c.ItemsAdd($FF,3, 49,1, $00010000);             // Footpad's Shirt
  c.ItemsAdd($FF,6, 48,1, $00010000);             // Footpad's Pants
  c.ItemsAdd($FF,7, 47,1, $00010000);             // Footpad's Shoes
  c.ItemsAdd($FF,15, 2092,1, $00010000);          // Worn Dagger
  c.ItemsAdd($FF,16, 50055,1, $00010000);         //
  c.ItemsAdd($FF,17, 28979,1, $00010000);         // Light Throwing Knife
  c.ItemsAdd($FF,23, 6948,1, $00010001);          // Hearthstone

  c.SkillsAdd($0000,473, 1,0, 0,0);               // Fist Weapons
  c.SkillsAdd($0000,44, 5,0, 0,0);                // Axes
  c.SkillsAdd($0000,164, 0,0, 0,0);               // Blacksmithing
  c.SkillsAdd($0000,202, 0,0, 0,0);               // Engineering
  c.SkillsAdd($0000,762, 0,0, 0,0);               // Riding
  c.SkillsAdd($0000,46, 5,0, 0,0);                // Guns
  c.SkillsAdd($0000,769, 5,0, 0,0);               // Internal
  c.SkillsAdd($0000,755, 0,0, 0,0);               // Jewelcrafting
  c.SkillsAdd($0000,98, 300,300, 0,0);            // Language: Common
  c.SkillsAdd($0000,54, 5,0, 0,0);                // Maces
  c.SkillsAdd($0000,533, 0,0, 0,0);               // Raptor Riding
  c.SkillsAdd($0000,554, 0,0, 0,0);               // Undead Horsemanship
  c.SkillsAdd($0000,771, 1,0, 0,0);               // Frost
  c.SkillsAdd($0000,186, 0,0, 0,0);               // Mining
  c.SkillsAdd($0000,197, 0,0, 0,0);               // Tailoring
  c.SkillsAdd($0000,333, 0,0, 0,0);               // Enchanting
  c.SkillsAdd($0000,185, 0,0, 0,0);               // Cooking
  c.SkillsAdd($0000,777, 1,1, 0,0);               // Mounts
  c.SkillsAdd($0000,393, 0,0, 0,0);               // Skinning
  c.SkillsAdd($0000,137, 0,0, 0,0);               // Language: Thalassian
  c.SkillsAdd($0000,759, 0,0, 0,0);               // Language: Draenei
  c.SkillsAdd($0000,182, 0,0, 0,0);               // Herbalism
  c.SkillsAdd($0000,226, 5,0, 0,0);               // Crossbows
  c.SkillsAdd($0000,109, 0,0, 0,0);               // Language: Orcish
  c.SkillsAdd($0000,140, 300,0, 0,0);             // Language: Titan
  c.SkillsAdd($0000,149, 0,0, 0,0);               // Wolf Riding
  c.SkillsAdd($0000,253, 5,5, 0,0);               // Assassination
  c.SkillsAdd($0000,313, 0,0, 0,0);               // Language: Gnomish
  c.SkillsAdd($0000,45, 5,0, 0,0);                // Bows
  c.SkillsAdd($0000,713, 0,0, 0,0);               // Kodo Riding
  c.SkillsAdd($0000,773, 0,0, 0,0);               // Inscription
  c.SkillsAdd($0000,38, 5,5, 0,0);                // Combat
  c.SkillsAdd($0000,39, 5,0, 0,0);                // Subtlety
  c.SkillsAdd($0000,129, 0,0, 0,0);               // First Aid
  c.SkillsAdd($0000,126, 5,5, 0,0);               // Night Elf Racial
  c.SkillsAdd($0000,162, 5,1, 0,0);               // Unarmed
  c.SkillsAdd($0000,111, 0,0, 0,0);               // Language: Dwarven
  c.SkillsAdd($0000,113, 300,300, 0,0);           // Language: Darnassian
  c.SkillsAdd($0000,115, 0,0, 0,0);               // Language: Taurahe
  c.SkillsAdd($0000,315, 0,0, 0,0);               // Language: Troll
  c.SkillsAdd($0000,139, 0,0, 0,0);               // Language: Demon Tongue
  c.SkillsAdd($0000,152, 0,0, 0,0);               // Ram Riding
  c.SkillsAdd($0000,673, 0,0, 0,0);               // Language: Gutterspeak
  c.SkillsAdd($0000,118, 5,5, 0,0);               // Dual Wield
  c.SkillsAdd($0000,138, 300,0, 0,0);             // Language: Draconic
  c.SkillsAdd($0000,141, 0,0, 0,0);               // Language: Old Tongue
  c.SkillsAdd($0000,142, 1,0, 0,0);               // Survival
  c.SkillsAdd($0000,148, 0,0, 0,0);               // Horse Riding
  c.SkillsAdd($0000,150, 0,0, 0,0);               // Tiger Riding
  c.SkillsAdd($0000,173, 5,1, 0,0);               // Daggers
  c.SkillsAdd($0000,183, 5,5, 0,0);               // GENERIC (DND)
  c.SkillsAdd($0000,95, 5,1, 0,0);                // Defense
  c.SkillsAdd($0000,176, 5,1, 0,0);               // Thrown
  c.SkillsAdd($0000,415, 1,1, 0,0);               // Cloth
  c.SkillsAdd($0000,633, 5,0, 0,0);               // Lockpicking
  c.SkillsAdd($0000,414, 1,1, 0,0);               // Leather
  c.SkillsAdd($0000,356, 0,0, 0,0);               // Fishing
  c.SkillsAdd($0000,171, 0,0, 0,0);               // Alchemy
  c.SkillsAdd($0000,43, 5,0, 0,0);                // Swords
  c.SkillsAdd($0000,778, 1,0, 0,0);               // Companions
  c.SkillsAdd($0000,165, 0,0, 0,0);               // Leatherworking

  c.SpellsAdd(668, 0);                            // Language Common
  c.SpellsAdd(2098, 0);                           // Eviscerate
  c.SpellsAdd(75460, 0);                          // Unknown
  c.SpellsAdd(21184, 0);                          // Rogue Passive (DND)
  c.SpellsAdd(1752, 0);                           // Sinister Strike
  c.SpellsAdd(20583, 0);                          // Nature Resistance
  c.SpellsAdd(20582, 0);                          // Quickness
  c.SpellsAdd(20585, 0);                          // Wisp Spirit
  c.SpellsAdd(58984, 0);                          // Shadowmeld
  c.SpellsAdd(21009, 0);                          // Elusiveness
  c.SpellsAdd(203, 0);                            // Unarmed
  c.SpellsAdd(671, 0);                            // Language Darnassian
  c.SpellsAdd(674, 0);                            // Dual Wield
  c.SpellsAdd(1180, 0);                           // Daggers
  c.SpellsAdd(21651, 0);                          // Opening
  c.SpellsAdd(21652, 0);                          // Closing
  c.SpellsAdd(22810, 0);                          // Opening - No Text
  c.SpellsAdd(8386, 0);                           // Attacking
  c.SpellsAdd(3365, 0);                           // Opening
  c.SpellsAdd(3050, 0);                           // Detect
  c.SpellsAdd(9125, 0);                           // Generic
  c.SpellsAdd(7266, 0);                           // Duel
  c.SpellsAdd(7267, 0);                           // Grovel
  c.SpellsAdd(7355, 0);                           // Stuck
  c.SpellsAdd(6478, 0);                           // Opening
  c.SpellsAdd(6603, 0);                           // Auto Attack
  c.SpellsAdd(6233, 0);                           // Closing
  c.SpellsAdd(6246, 0);                           // Closing
  c.SpellsAdd(6247, 0);                           // Opening
  c.SpellsAdd(6477, 0);                           // Opening
  c.SpellsAdd(2479, 0);                           // Honorless Target
  c.SpellsAdd(45927, 0);                          // Summon Friend
  c.SpellsAdd(2382, 0);                           // Generic
  c.SpellsAdd(22027, 0);                          // Remove Insignia
  c.SpellsAdd(61437, 0);                          // Opening
  c.SpellsAdd(68398, 0);                          // Opening
  c.SpellsAdd(204, 0);                            // Defense
  c.SpellsAdd(16092, 0);                          // Defensive State (DND)
  c.SpellsAdd(81, 0);                             // Dodge
  c.SpellsAdd(522, 0);                            // SPELLDEFENSE (DND)
  c.SpellsAdd(2764, 0);                           // Throw
  c.SpellsAdd(2567, 0);                           // Thrown
  c.SpellsAdd(9078, 0);                           // Cloth
  c.SpellsAdd(9077, 0);                           // Leather

  c.SetActionButtons(0, 6603, $00000000);         // Spell: Auto Attack
  c.SetActionButtons(1, 1752, $00000000);         // Spell: Sinister Strike
  c.SetActionButtons(2, 2098, $00000000);         // Spell: Eviscerate
  c.SetActionButtons(3, 2764, $00000000);         // Spell: Throw
  c.SetActionButtons(4, 58984, $00000000);        // Spell: Shadowmeld
  c.SetActionButtons(82, 58984, $00000000);       // Spell: Shadowmeld
end;
procedure RACE_NIGHTELF_CLASS_PRIEST(var c:TCharData);
begin
  c.Enum.zoneID                := 0;
  c.Enum.mapID                 := 1;
  c.Enum.position.x            := 10311.299804;
  c.Enum.position.y            := 831.463012;
  c.Enum.position.z            := 1326.410034;
  c.facing                     := 5.480333;

  c.scale_x                    := 1;
  c.power_type                 := 0;
  c.max_health                 := 52;
  c.max_power[POWER_MANA]      := 160;
  c.max_power[POWER_RAGE]      := 1000;
  c.max_power[POWER_FOCUS]     := 100;
  c.max_power[POWER_ENERGY]    := 100;
  c.max_power[POWER_HAPPINESS] := 0;
  c.max_power[POWER_RUNES]     := 8;
  c.max_power[POWER_RUNIC]     := 1000;
  c.health                     := 52;
  c.power[POWER_MANA]          := 160;
  c.power[POWER_RAGE]          := 1000;
  c.power[POWER_FOCUS]         := 100;
  c.power[POWER_ENERGY]        := 100;
  c.power[POWER_HAPPINESS]     := 0;
  c.power[POWER_RUNES]         := 8;
  c.power[POWER_RUNIC]         := 0;
  c.Enum.experienceLevel       := 1;
  c.faction_template           := 4;
  c.flags                      := $00000008;
  c.flags2                     := $00000800;
  c.mainhand_attack_time       := 2900;
  c.offhand_attack_time        := 2000;
  c.ranged_attack_time         := 0;
  c.bounding_radius            := 0.305999;
  c.combat_reach               := 1.5;
  c.enum_model                 := 55+c.Enum.sexID;
  c.native_model               := 55+c.Enum.sexID;
  c.mount_model                := 0;
  c.min_damage                 := 5.485714;
  c.max_damage                 := 7.485714;
  c.min_offhand_damage         := 0;
  c.max_offhand_damage         := 0;
  c.mod_cast_speed             := 1;
  c.stat[0]                    := 16;
  c.stat[1]                    := 24;
  c.stat[2]                    := 20;
  c.stat[3]                    := 22;
  c.stat[4]                    := 23;
  c.resist[0]                  := 53;
  c.resist[1]                  := 0;
  c.resist[2]                  := 0;
  c.resist[3]                  := 0;
  c.resist[4]                  := 0;
  c.resist[5]                  := 0;
  c.resist[6]                  := 0;
  c.base_mana                  := 110;
  c.base_health                := 32;
  c.attack_power               := 12;
  c.ranged_attack_time         := 0;
  c.min_ranged_damage          := 0;
  c.max_ranged_damage          := 0;
  c.hover_height               := 1;

  c.player_flags               := $00000000;
  c.xp                         := 0;
  c.next_level_xp              := 400;
  c.points1                    := 0;
  c.professions_left           := 2;
  c.ammo_id                    := 0;

  c.ItemsAdd($FF,3, 53,1, $00010000);             // Neophyte's Shirt
  c.ItemsAdd($FF,4, 6119,1, $00010000);           // Neophyte's Robe
  c.ItemsAdd($FF,6, 52,1, $00010000);             // Neophyte's Pants
  c.ItemsAdd($FF,7, 51,1, $00010000);             // Neophyte's Boots
  c.ItemsAdd($FF,15, 3661,1, $00010000);          // Handcrafted Staff
  c.ItemsAdd($FF,23, 6948,1, $00010001);          // Hearthstone

  c.SkillsAdd($0000,164, 0,0, 0,0);               // Blacksmithing
  c.SkillsAdd($0000,202, 0,0, 0,0);               // Engineering
  c.SkillsAdd($0000,762, 0,0, 0,0);               // Riding
  c.SkillsAdd($0000,769, 5,0, 0,0);               // Internal
  c.SkillsAdd($0000,755, 0,0, 0,0);               // Jewelcrafting
  c.SkillsAdd($0000,98, 300,300, 0,0);            // Language: Common
  c.SkillsAdd($0000,136, 5,1, 0,0);               // Staves
  c.SkillsAdd($0000,54, 5,1, 0,0);                // Maces
  c.SkillsAdd($0000,533, 0,0, 0,0);               // Raptor Riding
  c.SkillsAdd($0000,554, 0,0, 0,0);               // Undead Horsemanship
  c.SkillsAdd($0000,771, 1,0, 0,0);               // Frost
  c.SkillsAdd($0000,186, 0,0, 0,0);               // Mining
  c.SkillsAdd($0000,197, 0,0, 0,0);               // Tailoring
  c.SkillsAdd($0000,333, 0,0, 0,0);               // Enchanting
  c.SkillsAdd($0000,185, 0,0, 0,0);               // Cooking
  c.SkillsAdd($0000,777, 1,1, 0,0);               // Mounts
  c.SkillsAdd($0000,393, 0,0, 0,0);               // Skinning
  c.SkillsAdd($0000,137, 0,0, 0,0);               // Language: Thalassian
  c.SkillsAdd($0000,759, 0,0, 0,0);               // Language: Draenei
  c.SkillsAdd($0000,182, 0,0, 0,0);               // Herbalism
  c.SkillsAdd($0000,228, 5,1, 0,0);               // Wands
  c.SkillsAdd($0000,109, 0,0, 0,0);               // Language: Orcish
  c.SkillsAdd($0000,140, 300,0, 0,0);             // Language: Titan
  c.SkillsAdd($0000,149, 0,0, 0,0);               // Wolf Riding
  c.SkillsAdd($0000,313, 0,0, 0,0);               // Language: Gnomish
  c.SkillsAdd($0000,613, 5,0, 0,0);               // Discipline
  c.SkillsAdd($0000,713, 0,0, 0,0);               // Kodo Riding
  c.SkillsAdd($0000,773, 0,0, 0,0);               // Inscription
  c.SkillsAdd($0000,129, 0,0, 0,0);               // First Aid
  c.SkillsAdd($0000,126, 5,5, 0,0);               // Night Elf Racial
  c.SkillsAdd($0000,162, 5,1, 0,0);               // Unarmed
  c.SkillsAdd($0000,56, 5,5, 0,0);                // Holy
  c.SkillsAdd($0000,111, 0,0, 0,0);               // Language: Dwarven
  c.SkillsAdd($0000,113, 300,300, 0,0);           // Language: Darnassian
  c.SkillsAdd($0000,115, 0,0, 0,0);               // Language: Taurahe
  c.SkillsAdd($0000,315, 0,0, 0,0);               // Language: Troll
  c.SkillsAdd($0000,139, 0,0, 0,0);               // Language: Demon Tongue
  c.SkillsAdd($0000,152, 0,0, 0,0);               // Ram Riding
  c.SkillsAdd($0000,673, 0,0, 0,0);               // Language: Gutterspeak
  c.SkillsAdd($0000,138, 300,0, 0,0);             // Language: Draconic
  c.SkillsAdd($0000,141, 0,0, 0,0);               // Language: Old Tongue
  c.SkillsAdd($0000,142, 1,0, 0,0);               // Survival
  c.SkillsAdd($0000,148, 0,0, 0,0);               // Horse Riding
  c.SkillsAdd($0000,150, 0,0, 0,0);               // Tiger Riding
  c.SkillsAdd($0000,173, 5,0, 0,0);               // Daggers
  c.SkillsAdd($0000,183, 5,5, 0,0);               // GENERIC (DND)
  c.SkillsAdd($0000,95, 5,1, 0,0);                // Defense
  c.SkillsAdd($0000,415, 1,1, 0,0);               // Cloth
  c.SkillsAdd($0000,356, 0,0, 0,0);               // Fishing
  c.SkillsAdd($0000,171, 0,0, 0,0);               // Alchemy
  c.SkillsAdd($0000,78, 5,0, 0,0);                // Shadow Magic
  c.SkillsAdd($0000,778, 1,0, 0,0);               // Companions
  c.SkillsAdd($0000,165, 0,0, 0,0);               // Leatherworking

  c.SpellsAdd(668, 0);                            // Language Common
  c.SpellsAdd(227, 0);                            // Staves
  c.SpellsAdd(198, 0);                            // One-Handed Maces
  c.SpellsAdd(5009, 0);                           // Wands
  c.SpellsAdd(5019, 0);                           // Shoot
  c.SpellsAdd(20583, 0);                          // Nature Resistance
  c.SpellsAdd(20582, 0);                          // Quickness
  c.SpellsAdd(20585, 0);                          // Wisp Spirit
  c.SpellsAdd(58984, 0);                          // Shadowmeld
  c.SpellsAdd(21009, 0);                          // Elusiveness
  c.SpellsAdd(203, 0);                            // Unarmed
  c.SpellsAdd(2050, 0);                           // Lesser Heal
  c.SpellsAdd(585, 0);                            // Smite
  c.SpellsAdd(671, 0);                            // Language Darnassian
  c.SpellsAdd(21651, 0);                          // Opening
  c.SpellsAdd(21652, 0);                          // Closing
  c.SpellsAdd(22810, 0);                          // Opening - No Text
  c.SpellsAdd(8386, 0);                           // Attacking
  c.SpellsAdd(3365, 0);                           // Opening
  c.SpellsAdd(3050, 0);                           // Detect
  c.SpellsAdd(9125, 0);                           // Generic
  c.SpellsAdd(7266, 0);                           // Duel
  c.SpellsAdd(7267, 0);                           // Grovel
  c.SpellsAdd(7355, 0);                           // Stuck
  c.SpellsAdd(6478, 0);                           // Opening
  c.SpellsAdd(6603, 0);                           // Auto Attack
  c.SpellsAdd(6233, 0);                           // Closing
  c.SpellsAdd(6246, 0);                           // Closing
  c.SpellsAdd(6247, 0);                           // Opening
  c.SpellsAdd(6477, 0);                           // Opening
  c.SpellsAdd(2479, 0);                           // Honorless Target
  c.SpellsAdd(45927, 0);                          // Summon Friend
  c.SpellsAdd(2382, 0);                           // Generic
  c.SpellsAdd(22027, 0);                          // Remove Insignia
  c.SpellsAdd(61437, 0);                          // Opening
  c.SpellsAdd(68398, 0);                          // Opening
  c.SpellsAdd(204, 0);                            // Defense
  c.SpellsAdd(81, 0);                             // Dodge
  c.SpellsAdd(522, 0);                            // SPELLDEFENSE (DND)
  c.SpellsAdd(9078, 0);                           // Cloth

  c.SetActionButtons(0, 585, $00000000);          // Spell: Smite
  c.SetActionButtons(1, 2050, $00000000);         // Spell: Lesser Heal
  c.SetActionButtons(2, 58984, $00000000);        // Spell: Shadowmeld
  c.SetActionButtons(81, 58984, $00000000);       // Spell: Shadowmeld
end;
procedure RACE_NIGHTELF_CLASS_DEATHKNIGHT(var c:TCharData);
begin
  c.Enum.zoneID                := 0;
  c.Enum.mapID                 := 609;
  c.Enum.position.x            := 2356.209960;
  c.Enum.position.y            := -5662.209960;
  c.Enum.position.z            := 426.026000;
  c.facing                     := 3.848485;

  c.scale_x                    := 1;
  c.power_type                 := 6;
  c.max_health                 := 3169;
  c.max_power[POWER_MANA]      := 0;
  c.max_power[POWER_RAGE]      := 1000;
  c.max_power[POWER_FOCUS]     := 100;
  c.max_power[POWER_ENERGY]    := 100;
  c.max_power[POWER_HAPPINESS] := 0;
  c.max_power[POWER_RUNES]     := 8;
  c.max_power[POWER_RUNIC]     := 1000;
  c.health                     := 3169;
  c.power[POWER_MANA]          := 0;
  c.power[POWER_RAGE]          := 1000;
  c.power[POWER_FOCUS]         := 100;
  c.power[POWER_ENERGY]        := 100;
  c.power[POWER_HAPPINESS]     := 0;
  c.power[POWER_RUNES]         := 8;
  c.power[POWER_RUNIC]         := 0;
  c.Enum.experienceLevel       := 55;
  c.faction_template           := 4;
  c.flags                      := $00000008;
  c.flags2                     := $00000800;
  c.mainhand_attack_time       := 2000;
  c.offhand_attack_time        := 2000;
  c.ranged_attack_time         := 0;
  c.bounding_radius            := 0.305999;
  c.combat_reach               := 1.5;
  c.enum_model                 := 55+c.Enum.sexID;
  c.native_model               := 55+c.Enum.sexID;
  c.mount_model                := 0;
  c.min_damage                 := 106.457145;
  c.max_damage                 := 106.457145;
  c.min_offhand_damage         := 0;
  c.max_offhand_damage         := 0;
  c.mod_cast_speed             := 1;
  c.stat[0]                    := 248;
  c.stat[1]                    := 115;
  c.stat[2]                    := 199;
  c.stat[3]                    := 29;
  c.stat[4]                    := 42;
  c.resist[0]                  := 3545;
  c.resist[1]                  := 0;
  c.resist[2]                  := 0;
  c.resist[3]                  := 0;
  c.resist[4]                  := 0;
  c.resist[5]                  := 0;
  c.resist[6]                  := 0;
  c.base_mana                  := 0;
  c.base_health                := 1359;
  c.attack_power               := 641;
  c.ranged_attack_time         := 0;
  c.min_ranged_damage          := 0;
  c.max_ranged_damage          := 0;
  c.hover_height               := 1;

  c.player_flags               := $00000020;
  c.xp                         := 815;
  c.next_level_xp              := 148200;
  c.points1                    := 0;
  c.professions_left           := 2;
  c.ammo_id                    := 0;

  c.ItemsAdd($FF,0, 34652,1, $00010001);          // Acherus Knight's Hood
  c.ItemsAdd($FF,1, 34657,1, $00010001);          // Choker of Damnation
  c.ItemsAdd($FF,2, 34655,1, $00010001);          // Acherus Knight's Pauldrons
  c.ItemsAdd($FF,4, 34650,1, $00010001);          // Acherus Knight's Tunic
  c.ItemsAdd($FF,5, 34651,1, $00010001);          // Acherus Knight's Girdle
  c.ItemsAdd($FF,6, 34656,1, $00010001);          // Acherus Knight's Cover
  c.ItemsAdd($FF,7, 34648,1, $00010001);          // Acherus Knight's Greaves
  c.ItemsAdd($FF,8, 34653,1, $00010001);          // Acherus Knight's Wristguard
  c.ItemsAdd($FF,9, 34649,1, $00010001);          // Acherus Knight's Gauntlets
  c.ItemsAdd($FF,10, 34658,1, $00010001);         // Plague Band
  c.ItemsAdd($FF,11, 38147,1, $00010001);         // Corrupted Band
  c.ItemsAdd($FF,14, 34659,1, $00010001);         // Acherus Knight's Shroud
  c.ItemsAdd($FF,23, 41751,10, $00010000);        // Black Mushroom

  c.SkillsAdd($0000,44, 275,270, 0,0);            // Axes
  c.SkillsAdd($0000,164, 0,0, 0,0);               // Blacksmithing
  c.SkillsAdd($0000,202, 0,0, 0,0);               // Engineering
  c.SkillsAdd($0002,762, 150,150, 0,0);           // Riding
  c.SkillsAdd($0000,769, 275,0, 0,0);             // Internal
  c.SkillsAdd($0000,755, 0,0, 0,0);               // Jewelcrafting
  c.SkillsAdd($0000,98, 300,300, 0,0);            // Language: Common
  c.SkillsAdd($0000,54, 275,0, 0,0);              // Maces
  c.SkillsAdd($0000,554, 0,0, 0,0);               // Undead Horsemanship
  c.SkillsAdd($0000,770, 275,275, 0,0);           // Blood
  c.SkillsAdd($0000,771, 275,275, 0,0);           // Frost
  c.SkillsAdd($0000,772, 275,275, 0,0);           // Unholy
  c.SkillsAdd($0000,186, 0,0, 0,0);               // Mining
  c.SkillsAdd($0000,197, 0,0, 0,0);               // Tailoring
  c.SkillsAdd($0000,776, 1,0, 0,0);               // Runeforging
  c.SkillsAdd($0000,333, 0,0, 0,0);               // Enchanting
  c.SkillsAdd($0000,185, 0,0, 0,0);               // Cooking
  c.SkillsAdd($0000,229, 275,270, 0,0);           // Polearms
  c.SkillsAdd($0000,777, 1,1, 0,0);               // Mounts
  c.SkillsAdd($0000,393, 0,0, 0,0);               // Skinning
  c.SkillsAdd($0000,759, 0,0, 0,0);               // Language: Draenei
  c.SkillsAdd($0000,182, 0,0, 0,0);               // Herbalism
  c.SkillsAdd($0000,140, 300,0, 0,0);             // Language: Titan
  c.SkillsAdd($0000,149, 0,0, 0,0);               // Wolf Riding
  c.SkillsAdd($0000,55, 275,270, 0,0);            // Two-Handed Swords
  c.SkillsAdd($0000,713, 0,0, 0,0);               // Kodo Riding
  c.SkillsAdd($0000,773, 0,0, 0,0);               // Inscription
  c.SkillsAdd($0004,129, 300,270, 0,0);           // First Aid
  c.SkillsAdd($0000,126, 275,275, 0,0);           // Night Elf Racial
  c.SkillsAdd($0000,162, 275,270, 0,0);           // Unarmed
  c.SkillsAdd($0000,113, 300,300, 0,0);           // Language: Darnassian
  c.SkillsAdd($0000,139, 0,0, 0,0);               // Language: Demon Tongue
  c.SkillsAdd($0000,152, 0,0, 0,0);               // Ram Riding
  c.SkillsAdd($0000,293, 1,1, 0,0);               // Plate Mail
  c.SkillsAdd($0000,118, 275,275, 0,0);           // Dual Wield
  c.SkillsAdd($0000,138, 300,0, 0,0);             // Language: Draconic
  c.SkillsAdd($0000,141, 0,0, 0,0);               // Language: Old Tongue
  c.SkillsAdd($0000,142, 1,0, 0,0);               // Survival
  c.SkillsAdd($0000,148, 0,0, 0,0);               // Horse Riding
  c.SkillsAdd($0000,183, 275,275, 0,0);           // GENERIC (DND)
  c.SkillsAdd($0000,95, 275,270, 0,0);            // Defense
  c.SkillsAdd($0000,415, 1,1, 0,0);               // Cloth
  c.SkillsAdd($0000,413, 1,1, 0,0);               // Mail
  c.SkillsAdd($0000,414, 1,1, 0,0);               // Leather
  c.SkillsAdd($0000,356, 0,0, 0,0);               // Fishing
  c.SkillsAdd($0000,171, 0,0, 0,0);               // Alchemy
  c.SkillsAdd($0000,172, 275,270, 0,0);           // Two-Handed Axes
  c.SkillsAdd($0000,43, 275,270, 0,0);            // Swords
  c.SkillsAdd($0000,778, 1,0, 0,0);               // Companions
  c.SkillsAdd($0000,160, 275,0, 0,0);             // Two-Handed Maces
  c.SkillsAdd($0000,165, 0,0, 0,0);               // Leatherworking

  c.SpellsAdd(196, 0);                            // One-Handed Axes
  c.SpellsAdd(33391, 0);                          // Journeyman Riding
  c.SpellsAdd(668, 0);                            // Language Common
  c.SpellsAdd(48266, 0);                          // Blood Presence
  c.SpellsAdd(45902, 0);                          // Blood Strike
  c.SpellsAdd(49410, 0);                          // Forceful Deflection
  c.SpellsAdd(45477, 0);                          // Icy Touch
  c.SpellsAdd(59921, 0);                          // Frost Fever
  c.SpellsAdd(61455, 0);                          // Runic Focus
  c.SpellsAdd(47541, 0);                          // Death Coil
  c.SpellsAdd(49576, 0);                          // Death Grip
  c.SpellsAdd(45462, 0);                          // Plague Strike
  c.SpellsAdd(59879, 0);                          // Blood Plague
  c.SpellsAdd(200, 0);                            // Polearms
  c.SpellsAdd(202, 0);                            // Two-Handed Swords
  c.SpellsAdd(3275, 0);                           // Linen Bandage
  c.SpellsAdd(10846, 0);                          // First Aid
  c.SpellsAdd(7934, 0);                           // Anti-Venom
  c.SpellsAdd(3276, 0);                           // Heavy Linen Bandage
  c.SpellsAdd(3277, 0);                           // Wool Bandage
  c.SpellsAdd(3278, 0);                           // Heavy Wool Bandage
  c.SpellsAdd(7928, 0);                           // Silk Bandage
  c.SpellsAdd(7929, 0);                           // Heavy Silk Bandage
  c.SpellsAdd(10840, 0);                          // Mageweave Bandage
  c.SpellsAdd(10841, 0);                          // Heavy Mageweave Bandage
  c.SpellsAdd(18629, 0);                          // Runecloth Bandage
  c.SpellsAdd(18630, 0);                          // Heavy Runecloth Bandage
  c.SpellsAdd(20583, 0);                          // Nature Resistance
  c.SpellsAdd(20582, 0);                          // Quickness
  c.SpellsAdd(20585, 0);                          // Wisp Spirit
  c.SpellsAdd(58984, 0);                          // Shadowmeld
  c.SpellsAdd(21009, 0);                          // Elusiveness
  c.SpellsAdd(203, 0);                            // Unarmed
  c.SpellsAdd(671, 0);                            // Language Darnassian
  c.SpellsAdd(750, 0);                            // Plate Mail
  c.SpellsAdd(674, 0);                            // Dual Wield
  c.SpellsAdd(21651, 0);                          // Opening
  c.SpellsAdd(21652, 0);                          // Closing
  c.SpellsAdd(22810, 0);                          // Opening - No Text
  c.SpellsAdd(8386, 0);                           // Attacking
  c.SpellsAdd(3365, 0);                           // Opening
  c.SpellsAdd(3050, 0);                           // Detect
  c.SpellsAdd(9125, 0);                           // Generic
  c.SpellsAdd(7266, 0);                           // Duel
  c.SpellsAdd(7267, 0);                           // Grovel
  c.SpellsAdd(7355, 0);                           // Stuck
  c.SpellsAdd(6478, 0);                           // Opening
  c.SpellsAdd(6603, 0);                           // Auto Attack
  c.SpellsAdd(6233, 0);                           // Closing
  c.SpellsAdd(6246, 0);                           // Closing
  c.SpellsAdd(6247, 0);                           // Opening
  c.SpellsAdd(6477, 0);                           // Opening
  c.SpellsAdd(2479, 0);                           // Honorless Target
  c.SpellsAdd(45927, 0);                          // Summon Friend
  c.SpellsAdd(2382, 0);                           // Generic
  c.SpellsAdd(22027, 0);                          // Remove Insignia
  c.SpellsAdd(52665, 0);                          // Sigil
  c.SpellsAdd(61437, 0);                          // Opening
  c.SpellsAdd(68398, 0);                          // Opening
  c.SpellsAdd(63645, 0);                          // Activate Primary Spec
  c.SpellsAdd(63644, 0);                          // Activate Secondary Spec
  c.SpellsAdd(204, 0);                            // Defense
  c.SpellsAdd(45903, 0);                          // Offensive State (DND)
  c.SpellsAdd(81, 0);                             // Dodge
  c.SpellsAdd(522, 0);                            // SPELLDEFENSE (DND)
  c.SpellsAdd(3127, 0);                           // Parry
  c.SpellsAdd(9078, 0);                           // Cloth
  c.SpellsAdd(8737, 0);                           // Mail
  c.SpellsAdd(9077, 0);                           // Leather
  c.SpellsAdd(197, 0);                            // Two-Handed Axes
  c.SpellsAdd(201, 0);                            // One-Handed Swords

  c.SetActionButtons(0, 6603, $00000000);         // Spell: Auto Attack
  c.SetActionButtons(1, 49576, $00000000);        // Spell: Death Grip
  c.SetActionButtons(2, 45477, $00000000);        // Spell: Icy Touch
  c.SetActionButtons(3, 45462, $00000000);        // Spell: Plague Strike
  c.SetActionButtons(4, 45902, $00000000);        // Spell: Blood Strike
  c.SetActionButtons(5, 47541, $00000000);        // Spell: Death Coil
  c.SetActionButtons(10, 58984, $00000000);       // Spell: Shadowmeld
  c.SetActionButtons(83, 58984, $00000000);       // Spell: Shadowmeld

end;
procedure RACE_NIGHTELF_CLASS_DRUID(var c:TCharData);
begin
  c.Enum.zoneID                := 0;
  c.Enum.mapID                 := 1;
  c.Enum.position.x            := 10311.299804;
  c.Enum.position.y            := 831.463012;
  c.Enum.position.z            := 1326.410034;
  c.facing                     := 5.696318;

  c.scale_x                    := 1;
  c.power_type                 := 0;
  c.max_health                 := 54;
  c.max_power[POWER_MANA]      := 100;
  c.max_power[POWER_RAGE]      := 1000;
  c.max_power[POWER_FOCUS]     := 100;
  c.max_power[POWER_ENERGY]    := 100;
  c.max_power[POWER_HAPPINESS] := 0;
  c.max_power[POWER_RUNES]     := 8;
  c.max_power[POWER_RUNIC]     := 1000;
  c.health                     := 54;
  c.power[POWER_MANA]          := 100;
  c.power[POWER_RAGE]          := 1000;
  c.power[POWER_FOCUS]         := 100;
  c.power[POWER_ENERGY]        := 100;
  c.power[POWER_HAPPINESS]     := 0;
  c.power[POWER_RUNES]         := 8;
  c.power[POWER_RUNIC]         := 0;
  c.Enum.experienceLevel       := 1;
  c.faction_template           := 4;
  c.flags                      := $00000008;
  c.flags2                     := $00000800;
  c.mainhand_attack_time       := 2900;
  c.offhand_attack_time        := 2000;
  c.ranged_attack_time         := 0;
  c.bounding_radius            := 0.305999;
  c.combat_reach               := 1.5;
  c.enum_model                 := 55+c.Enum.sexID;
  c.native_model               := 55+c.Enum.sexID;
  c.mount_model                := 0;
  c.min_damage                 := 5.900000;
  c.max_damage                 := 7.900000;
  c.min_offhand_damage         := 0;
  c.max_offhand_damage         := 0;
  c.mod_cast_speed             := 1;
  c.stat[0]                    := 17;
  c.stat[1]                    := 24;
  c.stat[2]                    := 20;
  c.stat[3]                    := 22;
  c.stat[4]                    := 22;
  c.resist[0]                  := 53;
  c.resist[1]                  := 0;
  c.resist[2]                  := 0;
  c.resist[3]                  := 0;
  c.resist[4]                  := 0;
  c.resist[5]                  := 0;
  c.resist[6]                  := 0;
  c.base_mana                  := 50;
  c.base_health                := 34;
  c.attack_power               := 14;
  c.ranged_attack_time         := 0;
  c.min_ranged_damage          := 0;
  c.max_ranged_damage          := 0;
  c.hover_height               := 1;

  c.player_flags               := $00000000;
  c.xp                         := 0;
  c.next_level_xp              := 400;
  c.points1                    := 0;
  c.professions_left           := 2;
  c.ammo_id                    := 0;

  c.ItemsAdd($FF,4, 6123,1, $00010000);           // Novice's Robe
  c.ItemsAdd($FF,6, 6124,1, $00010000);           // Novice's Pants
  c.ItemsAdd($FF,15, 3661,1, $00010000);          // Handcrafted Staff
  c.ItemsAdd($FF,23, 6948,1, $00010001);          // Hearthstone

  c.SkillsAdd($0000,473, 1,0, 0,0);               // Fist Weapons
  c.SkillsAdd($0000,164, 0,0, 0,0);               // Blacksmithing
  c.SkillsAdd($0000,202, 0,0, 0,0);               // Engineering
  c.SkillsAdd($0000,762, 0,0, 0,0);               // Riding
  c.SkillsAdd($0000,573, 5,5, 0,0);               // Restoration
  c.SkillsAdd($0000,769, 5,0, 0,0);               // Internal
  c.SkillsAdd($0000,755, 0,0, 0,0);               // Jewelcrafting
  c.SkillsAdd($0000,98, 300,300, 0,0);            // Language: Common
  c.SkillsAdd($0000,136, 5,1, 0,0);               // Staves
  c.SkillsAdd($0000,54, 5,0, 0,0);                // Maces
  c.SkillsAdd($0000,533, 0,0, 0,0);               // Raptor Riding
  c.SkillsAdd($0000,554, 0,0, 0,0);               // Undead Horsemanship
  c.SkillsAdd($0000,771, 1,0, 0,0);               // Frost
  c.SkillsAdd($0000,186, 0,0, 0,0);               // Mining
  c.SkillsAdd($0000,197, 0,0, 0,0);               // Tailoring
  c.SkillsAdd($0000,333, 0,0, 0,0);               // Enchanting
  c.SkillsAdd($0000,185, 0,0, 0,0);               // Cooking
  c.SkillsAdd($0000,229, 0,0, 0,0);               // Polearms
  c.SkillsAdd($0000,777, 1,1, 0,0);               // Mounts
  c.SkillsAdd($0000,393, 0,0, 0,0);               // Skinning
  c.SkillsAdd($0000,137, 0,0, 0,0);               // Language: Thalassian
  c.SkillsAdd($0000,759, 0,0, 0,0);               // Language: Draenei
  c.SkillsAdd($0000,182, 0,0, 0,0);               // Herbalism
  c.SkillsAdd($0000,109, 0,0, 0,0);               // Language: Orcish
  c.SkillsAdd($0000,140, 300,0, 0,0);             // Language: Titan
  c.SkillsAdd($0000,149, 0,0, 0,0);               // Wolf Riding
  c.SkillsAdd($0000,313, 0,0, 0,0);               // Language: Gnomish
  c.SkillsAdd($0000,713, 0,0, 0,0);               // Kodo Riding
  c.SkillsAdd($0000,773, 0,0, 0,0);               // Inscription
  c.SkillsAdd($0000,129, 0,0, 0,0);               // First Aid
  c.SkillsAdd($0000,126, 5,5, 0,0);               // Night Elf Racial
  c.SkillsAdd($0000,162, 5,1, 0,0);               // Unarmed
  c.SkillsAdd($0000,111, 0,0, 0,0);               // Language: Dwarven
  c.SkillsAdd($0000,113, 300,300, 0,0);           // Language: Darnassian
  c.SkillsAdd($0000,115, 0,0, 0,0);               // Language: Taurahe
  c.SkillsAdd($0000,315, 0,0, 0,0);               // Language: Troll
  c.SkillsAdd($0000,139, 0,0, 0,0);               // Language: Demon Tongue
  c.SkillsAdd($0000,152, 0,0, 0,0);               // Ram Riding
  c.SkillsAdd($0000,134, 0,0, 0,0);               // Feral Combat
  c.SkillsAdd($0000,574, 5,5, 0,0);               // Balance
  c.SkillsAdd($0000,673, 0,0, 0,0);               // Language: Gutterspeak
  c.SkillsAdd($0000,138, 300,0, 0,0);             // Language: Draconic
  c.SkillsAdd($0000,141, 0,0, 0,0);               // Language: Old Tongue
  c.SkillsAdd($0000,142, 1,0, 0,0);               // Survival
  c.SkillsAdd($0000,148, 0,0, 0,0);               // Horse Riding
  c.SkillsAdd($0000,150, 0,0, 0,0);               // Tiger Riding
  c.SkillsAdd($0000,173, 5,1, 0,0);               // Daggers
  c.SkillsAdd($0000,183, 5,5, 0,0);               // GENERIC (DND)
  c.SkillsAdd($0000,95, 5,1, 0,0);                // Defense
  c.SkillsAdd($0000,415, 1,1, 0,0);               // Cloth
  c.SkillsAdd($0000,414, 1,1, 0,0);               // Leather
  c.SkillsAdd($0000,356, 0,0, 0,0);               // Fishing
  c.SkillsAdd($0000,171, 0,0, 0,0);               // Alchemy
  c.SkillsAdd($0000,778, 1,0, 0,0);               // Companions
  c.SkillsAdd($0000,160, 5,0, 0,0);               // Two-Handed Maces
  c.SkillsAdd($0000,165, 0,0, 0,0);               // Leatherworking

  c.SpellsAdd(5185, 0);                           // Healing Touch
  c.SpellsAdd(66530, 0);                          // Improved Barkskin (Passive)
  c.SpellsAdd(668, 0);                            // Language Common
  c.SpellsAdd(227, 0);                            // Staves
  c.SpellsAdd(20583, 0);                          // Nature Resistance
  c.SpellsAdd(20582, 0);                          // Quickness
  c.SpellsAdd(20585, 0);                          // Wisp Spirit
  c.SpellsAdd(58984, 0);                          // Shadowmeld
  c.SpellsAdd(21009, 0);                          // Elusiveness
  c.SpellsAdd(203, 0);                            // Unarmed
  c.SpellsAdd(671, 0);                            // Language Darnassian
  c.SpellsAdd(5176, 0);                           // Wrath
  c.SpellsAdd(1180, 0);                           // Daggers
  c.SpellsAdd(21651, 0);                          // Opening
  c.SpellsAdd(21652, 0);                          // Closing
  c.SpellsAdd(22810, 0);                          // Opening - No Text
  c.SpellsAdd(8386, 0);                           // Attacking
  c.SpellsAdd(27764, 0);                          // Idol
  c.SpellsAdd(3365, 0);                           // Opening
  c.SpellsAdd(3050, 0);                           // Detect
  c.SpellsAdd(9125, 0);                           // Generic
  c.SpellsAdd(7266, 0);                           // Duel
  c.SpellsAdd(7267, 0);                           // Grovel
  c.SpellsAdd(7355, 0);                           // Stuck
  c.SpellsAdd(6478, 0);                           // Opening
  c.SpellsAdd(6603, 0);                           // Auto Attack
  c.SpellsAdd(6233, 0);                           // Closing
  c.SpellsAdd(6246, 0);                           // Closing
  c.SpellsAdd(6247, 0);                           // Opening
  c.SpellsAdd(6477, 0);                           // Opening
  c.SpellsAdd(2479, 0);                           // Honorless Target
  c.SpellsAdd(45927, 0);                          // Summon Friend
  c.SpellsAdd(2382, 0);                           // Generic
  c.SpellsAdd(22027, 0);                          // Remove Insignia
  c.SpellsAdd(61437, 0);                          // Opening
  c.SpellsAdd(68398, 0);                          // Opening
  c.SpellsAdd(204, 0);                            // Defense
  c.SpellsAdd(81, 0);                             // Dodge
  c.SpellsAdd(522, 0);                            // SPELLDEFENSE (DND)
  c.SpellsAdd(9078, 0);                           // Cloth
  c.SpellsAdd(9077, 0);                           // Leather

  c.SetActionButtons(0, 5176, $00000000);         // Spell: Wrath
  c.SetActionButtons(1, 5185, $00000000);         // Spell: Healing Touch
  c.SetActionButtons(2, 58984, $00000000);        // Spell: Shadowmeld
  c.SetActionButtons(72, 6603, $00000000);        // Spell: Auto Attack
  c.SetActionButtons(74, 58984, $00000000);       // Spell: Shadowmeld
  c.SetActionButtons(84, 6603, $00000000);        // Spell: Auto Attack
  c.SetActionButtons(96, 6603, $00000000);        // Spell: Auto Attack
  c.SetActionButtons(108, 6603, $00000000);       // Spell: Auto Attack
end;

procedure RACE_GNOME_CLASS_WARRIOR(var c:TCharData);
begin
  c.Enum.zoneID                := 0;
  c.Enum.mapID                 := 0;
  c.Enum.position.x            := -6240.319824;
  c.Enum.position.y            := 331.032989;
  c.Enum.position.z            := 382.757995;
  c.facing                     := 0;

  c.scale_x                    := 1;
  c.power_type                 := 1;
  c.max_health                 := 60;
  c.max_power[POWER_MANA]      := 0;
  c.max_power[POWER_RAGE]      := 1000;
  c.max_power[POWER_FOCUS]     := 100;
  c.max_power[POWER_ENERGY]    := 100;
  c.max_power[POWER_HAPPINESS] := 0;
  c.max_power[POWER_RUNES]     := 8;
  c.max_power[POWER_RUNIC]     := 1000;
  c.health                     := 60;
  c.power[POWER_MANA]          := 0;
  c.power[POWER_RAGE]          := 0;
  c.power[POWER_FOCUS]         := 100;
  c.power[POWER_ENERGY]        := 100;
  c.power[POWER_HAPPINESS]     := 0;
  c.power[POWER_RUNES]         := 8;
  c.power[POWER_RUNIC]         := 0;
  c.Enum.experienceLevel       := 1;
  c.faction_template           := 115;
  c.flags                      := $00000008;
  c.flags2                     := $00000800;
  c.mainhand_attack_time       := 2900;
  c.offhand_attack_time        := 2000;
  c.ranged_attack_time         := 0;
  c.bounding_radius            := 0.351899;
  c.combat_reach               := 1.5;
  c.enum_model                 := 1563+c.Enum.sexID;
  c.native_model               := 1563+c.Enum.sexID;
  c.mount_model                := 0;
  c.min_damage                 := 6.935714;
  c.max_damage                 := 8.935714;
  c.min_offhand_damage         := 0;
  c.max_offhand_damage         := 0;
  c.mod_cast_speed             := 1;
  c.stat[0]                    := 18;
  c.stat[1]                    := 22;
  c.stat[2]                    := 22;
  c.stat[3]                    := 24;
  c.stat[4]                    := 20;
  c.resist[0]                  := 46;
  c.resist[1]                  := 0;
  c.resist[2]                  := 0;
  c.resist[3]                  := 0;
  c.resist[4]                  := 0;
  c.resist[5]                  := 0;
  c.resist[6]                  := 0;
  c.base_mana                  := 0;
  c.base_health                := 20;
  c.attack_power               := 19;
  c.ranged_attack_time         := 0;
  c.min_ranged_damage          := 0;
  c.max_ranged_damage          := 0;
  c.hover_height               := 1;

  c.player_flags               := $00000000;
  c.xp                         := 0;
  c.next_level_xp              := 400;
  c.points1                    := 0;
  c.professions_left           := 2;
  c.ammo_id                    := 0;

  c.ItemsAdd($FF,3, 38,1, $00010000);             // Recruit's Shirt
  c.ItemsAdd($FF,6, 39,1, $00010000);             // Recruit's Pants
  c.ItemsAdd($FF,7, 40,1, $00010000);             // Recruit's Boots
  c.ItemsAdd($FF,15, 49778,1, $00010000);         //
  c.ItemsAdd($FF,23, 6948,1, $00010001);          // Hearthstone

  c.SkillsAdd($0000,473, 1,0, 0,0);               // Fist Weapons
  c.SkillsAdd($0000,44, 5,0, 0,0);                // Axes
  c.SkillsAdd($0000,164, 0,0, 0,0);               // Blacksmithing
  c.SkillsAdd($0000,202, 0,0, 15,0);              // Engineering
  c.SkillsAdd($0000,762, 0,0, 0,0);               // Riding
  c.SkillsAdd($0000,257, 5,0, 0,0);               // Protection
  c.SkillsAdd($0000,46, 5,0, 0,0);                // Guns
  c.SkillsAdd($0000,769, 5,0, 0,0);               // Internal
  c.SkillsAdd($0000,755, 0,0, 0,0);               // Jewelcrafting
  c.SkillsAdd($0000,98, 300,300, 0,0);            // Language: Common
  c.SkillsAdd($0000,136, 5,0, 0,0);               // Staves
  c.SkillsAdd($0000,54, 5,1, 0,0);                // Maces
  c.SkillsAdd($0000,533, 0,0, 0,0);               // Raptor Riding
  c.SkillsAdd($0000,554, 0,0, 0,0);               // Undead Horsemanship
  c.SkillsAdd($0000,771, 1,0, 0,0);               // Frost
  c.SkillsAdd($0000,186, 0,0, 0,0);               // Mining
  c.SkillsAdd($0000,197, 0,0, 0,0);               // Tailoring
  c.SkillsAdd($0000,333, 0,0, 0,0);               // Enchanting
  c.SkillsAdd($0000,185, 0,0, 0,0);               // Cooking
  c.SkillsAdd($0000,229, 0,0, 0,0);               // Polearms
  c.SkillsAdd($0000,777, 1,1, 0,0);               // Mounts
  c.SkillsAdd($0000,393, 0,0, 0,0);               // Skinning
  c.SkillsAdd($0000,137, 0,0, 0,0);               // Language: Thalassian
  c.SkillsAdd($0000,759, 0,0, 0,0);               // Language: Draenei
  c.SkillsAdd($0000,182, 0,0, 0,0);               // Herbalism
  c.SkillsAdd($0000,226, 5,0, 0,0);               // Crossbows
  c.SkillsAdd($0000,109, 0,0, 0,0);               // Language: Orcish
  c.SkillsAdd($0000,433, 1,1, 0,0);               // Shield
  c.SkillsAdd($0000,140, 300,0, 0,0);             // Language: Titan
  c.SkillsAdd($0000,149, 0,0, 0,0);               // Wolf Riding
  c.SkillsAdd($0000,313, 300,300, 0,0);           // Language: Gnomish
  c.SkillsAdd($0000,45, 5,0, 0,0);                // Bows
  c.SkillsAdd($0000,55, 5,1, 0,0);                // Two-Handed Swords
  c.SkillsAdd($0000,713, 0,0, 0,0);               // Kodo Riding
  c.SkillsAdd($0000,773, 0,0, 0,0);               // Inscription
  c.SkillsAdd($0000,753, 5,5, 0,0);               // Racial - Gnome
  c.SkillsAdd($0000,129, 0,0, 0,0);               // First Aid
  c.SkillsAdd($0000,162, 5,1, 0,0);               // Unarmed
  c.SkillsAdd($0000,111, 0,0, 0,0);               // Language: Dwarven
  c.SkillsAdd($0000,113, 0,0, 0,0);               // Language: Darnassian
  c.SkillsAdd($0000,115, 0,0, 0,0);               // Language: Taurahe
  c.SkillsAdd($0000,315, 0,0, 0,0);               // Language: Troll
  c.SkillsAdd($0000,139, 0,0, 0,0);               // Language: Demon Tongue
  c.SkillsAdd($0000,152, 0,0, 0,0);               // Ram Riding
  c.SkillsAdd($0000,553, 0,0, 0,0);               // Mechanostrider Piloting
  c.SkillsAdd($0000,673, 0,0, 0,0);               // Language: Gutterspeak
  c.SkillsAdd($0000,293, 0,0, 0,0);               // Plate Mail
  c.SkillsAdd($0000,118, 0,0, 0,0);               // Dual Wield
  c.SkillsAdd($0000,138, 300,0, 0,0);             // Language: Draconic
  c.SkillsAdd($0000,141, 0,0, 0,0);               // Language: Old Tongue
  c.SkillsAdd($0000,142, 1,0, 0,0);               // Survival
  c.SkillsAdd($0000,148, 0,0, 0,0);               // Horse Riding
  c.SkillsAdd($0000,150, 0,0, 0,0);               // Tiger Riding
  c.SkillsAdd($0000,173, 5,1, 0,0);               // Daggers
  c.SkillsAdd($0000,183, 5,5, 0,0);               // GENERIC (DND)
  c.SkillsAdd($0000,95, 5,1, 0,0);                // Defense
  c.SkillsAdd($0000,176, 5,0, 0,0);               // Thrown
  c.SkillsAdd($0000,415, 1,1, 0,0);               // Cloth
  c.SkillsAdd($0000,256, 5,0, 0,0);               // Fury
  c.SkillsAdd($0000,413, 1,1, 0,0);               // Mail
  c.SkillsAdd($0000,414, 1,1, 0,0);               // Leather
  c.SkillsAdd($0000,356, 0,0, 0,0);               // Fishing
  c.SkillsAdd($0000,171, 0,0, 0,0);               // Alchemy
  c.SkillsAdd($0000,172, 5,0, 0,0);               // Two-Handed Axes
  c.SkillsAdd($0000,43, 5,1, 0,0);                // Swords
  c.SkillsAdd($0000,26, 5,5, 0,0);                // Arms
  c.SkillsAdd($0000,778, 1,0, 0,0);               // Companions
  c.SkillsAdd($0000,160, 5,0, 0,0);               // Two-Handed Maces
  c.SkillsAdd($0000,165, 0,0, 0,0);               // Leatherworking

  c.SpellsAdd(668, 0);                            // Language Common
  c.SpellsAdd(198, 0);                            // One-Handed Maces
  c.SpellsAdd(9116, 0);                           // Shield
  c.SpellsAdd(7340, 0);                           // Language Gnomish
  c.SpellsAdd(202, 0);                            // Two-Handed Swords
  c.SpellsAdd(20589, 0);                          // Escape Artist
  c.SpellsAdd(20591, 0);                          // Expansive Mind
  c.SpellsAdd(20593, 0);                          // Engineering Specialization
  c.SpellsAdd(20592, 0);                          // Arcane Resistance
  c.SpellsAdd(203, 0);                            // Unarmed
  c.SpellsAdd(1180, 0);                           // Daggers
  c.SpellsAdd(21651, 0);                          // Opening
  c.SpellsAdd(21652, 0);                          // Closing
  c.SpellsAdd(22810, 0);                          // Opening - No Text
  c.SpellsAdd(8386, 0);                           // Attacking
  c.SpellsAdd(3365, 0);                           // Opening
  c.SpellsAdd(3050, 0);                           // Detect
  c.SpellsAdd(9125, 0);                           // Generic
  c.SpellsAdd(7266, 0);                           // Duel
  c.SpellsAdd(7267, 0);                           // Grovel
  c.SpellsAdd(7355, 0);                           // Stuck
  c.SpellsAdd(6478, 0);                           // Opening
  c.SpellsAdd(6603, 0);                           // Auto Attack
  c.SpellsAdd(6233, 0);                           // Closing
  c.SpellsAdd(6246, 0);                           // Closing
  c.SpellsAdd(6247, 0);                           // Opening
  c.SpellsAdd(6477, 0);                           // Opening
  c.SpellsAdd(2479, 0);                           // Honorless Target
  c.SpellsAdd(45927, 0);                          // Summon Friend
  c.SpellsAdd(2382, 0);                           // Generic
  c.SpellsAdd(22027, 0);                          // Remove Insignia
  c.SpellsAdd(61437, 0);                          // Opening
  c.SpellsAdd(68398, 0);                          // Opening
  c.SpellsAdd(204, 0);                            // Defense
  c.SpellsAdd(107, 0);                            // Block
  c.SpellsAdd(81, 0);                             // Dodge
  c.SpellsAdd(32215, 0);                          // Victorious State
  c.SpellsAdd(522, 0);                            // SPELLDEFENSE (DND)
  c.SpellsAdd(5301, 0);                           // Defensive State (DND)
  c.SpellsAdd(9078, 0);                           // Cloth
  c.SpellsAdd(8737, 0);                           // Mail
  c.SpellsAdd(9077, 0);                           // Leather
  c.SpellsAdd(201, 0);                            // One-Handed Swords
  c.SpellsAdd(78, 0);                             // Heroic Strike
  c.SpellsAdd(2457, 0);                           // Battle Stance

  c.SetActionButtons(0, 6603, $00000000);         // Spell: Auto Attack
  c.SetActionButtons(1, 78, $00000000);           // Spell: Heroic Strike
  c.SetActionButtons(72, 6603, $00000000);        // Spell: Auto Attack
  c.SetActionButtons(73, 78, $00000000);          // Spell: Heroic Strike
  c.SetActionButtons(84, 6603, $00000000);        // Spell: Auto Attack
  c.SetActionButtons(96, 6603, $00000000);        // Spell: Auto Attack
  c.SetActionButtons(108, 6603, $00000000);       // Spell: Auto Attack
end;
procedure RACE_GNOME_CLASS_ROGUE(var c:TCharData);
begin
  c.Enum.zoneID                := 0;
  c.Enum.mapID                 := 0;
  c.Enum.position.x            := -6240.319824;
  c.Enum.position.y            := 331.032989;
  c.Enum.position.z            := 382.757995;
  c.facing                     := 0;

  c.scale_x                    := 1;
  c.power_type                 := 3;
  c.max_health                 := 55;
  c.max_power[POWER_MANA]      := 0;
  c.max_power[POWER_RAGE]      := 1000;
  c.max_power[POWER_FOCUS]     := 100;
  c.max_power[POWER_ENERGY]    := 100;
  c.max_power[POWER_HAPPINESS] := 0;
  c.max_power[POWER_RUNES]     := 8;
  c.max_power[POWER_RUNIC]     := 1000;
  c.health                     := 55;
  c.power[POWER_MANA]          := 0;
  c.power[POWER_RAGE]          := 1000;
  c.power[POWER_FOCUS]         := 100;
  c.power[POWER_ENERGY]        := 100;
  c.power[POWER_HAPPINESS]     := 0;
  c.power[POWER_RUNES]         := 8;
  c.power[POWER_RUNIC]         := 0;
  c.Enum.experienceLevel       := 1;
  c.faction_template           := 115;
  c.flags                      := $00000008;
  c.flags2                     := $00000800;
  c.mainhand_attack_time       := 1600;
  c.offhand_attack_time        := 1600;
  c.ranged_attack_time         := 1600;
  c.bounding_radius            := 0.351899;
  c.combat_reach               := 1.5;
  c.enum_model                 := 1563+c.Enum.sexID;
  c.native_model               := 1563+c.Enum.sexID;
  c.mount_model                := 0;
  c.min_damage                 := 3.628571;
  c.max_damage                 := 4.628571;
  c.min_offhand_damage         := 1.757143;
  c.max_offhand_damage         := 2.257143;
  c.mod_cast_speed             := 1;
  c.stat[0]                    := 16;
  c.stat[1]                    := 25;
  c.stat[2]                    := 21;
  c.stat[3]                    := 24;
  c.stat[4]                    := 20;
  c.resist[0]                  := 52;
  c.resist[1]                  := 0;
  c.resist[2]                  := 0;
  c.resist[3]                  := 0;
  c.resist[4]                  := 0;
  c.resist[5]                  := 0;
  c.resist[6]                  := 0;
  c.base_mana                  := 0;
  c.base_health                := 25;
  c.attack_power               := 23;
  c.ranged_attack_time         := 1600;
  c.min_ranged_damage          := 2.828571;
  c.max_ranged_damage          := 4.828571;
  c.hover_height               := 1;

  c.player_flags               := $00000000;
  c.xp                         := 0;
  c.next_level_xp              := 400;
  c.points1                    := 0;
  c.professions_left           := 2;
  c.ammo_id                    := 0;

  c.ItemsAdd($FF,3, 49,1, $00010000);             // Footpad's Shirt
  c.ItemsAdd($FF,6, 48,1, $00010000);             // Footpad's Pants
  c.ItemsAdd($FF,7, 47,1, $00010000);             // Footpad's Shoes
  c.ItemsAdd($FF,15, 2092,1, $00010000);          // Worn Dagger
  c.ItemsAdd($FF,16, 50055,1, $00010000);         //
  c.ItemsAdd($FF,17, 28979,1, $00010000);         // Light Throwing Knife
  c.ItemsAdd($FF,23, 6948,1, $00010001);          // Hearthstone

  c.SkillsAdd($0000,473, 1,0, 0,0);               // Fist Weapons
  c.SkillsAdd($0000,44, 5,0, 0,0);                // Axes
  c.SkillsAdd($0000,164, 0,0, 0,0);               // Blacksmithing
  c.SkillsAdd($0000,202, 0,0, 15,0);              // Engineering
  c.SkillsAdd($0000,762, 0,0, 0,0);               // Riding
  c.SkillsAdd($0000,46, 5,0, 0,0);                // Guns
  c.SkillsAdd($0000,769, 5,0, 0,0);               // Internal
  c.SkillsAdd($0000,755, 0,0, 0,0);               // Jewelcrafting
  c.SkillsAdd($0000,98, 300,300, 0,0);            // Language: Common
  c.SkillsAdd($0000,54, 5,0, 0,0);                // Maces
  c.SkillsAdd($0000,533, 0,0, 0,0);               // Raptor Riding
  c.SkillsAdd($0000,554, 0,0, 0,0);               // Undead Horsemanship
  c.SkillsAdd($0000,771, 1,0, 0,0);               // Frost
  c.SkillsAdd($0000,186, 0,0, 0,0);               // Mining
  c.SkillsAdd($0000,197, 0,0, 0,0);               // Tailoring
  c.SkillsAdd($0000,333, 0,0, 0,0);               // Enchanting
  c.SkillsAdd($0000,185, 0,0, 0,0);               // Cooking
  c.SkillsAdd($0000,777, 1,1, 0,0);               // Mounts
  c.SkillsAdd($0000,393, 0,0, 0,0);               // Skinning
  c.SkillsAdd($0000,137, 0,0, 0,0);               // Language: Thalassian
  c.SkillsAdd($0000,759, 0,0, 0,0);               // Language: Draenei
  c.SkillsAdd($0000,182, 0,0, 0,0);               // Herbalism
  c.SkillsAdd($0000,226, 5,0, 0,0);               // Crossbows
  c.SkillsAdd($0000,109, 0,0, 0,0);               // Language: Orcish
  c.SkillsAdd($0000,140, 300,0, 0,0);             // Language: Titan
  c.SkillsAdd($0000,149, 0,0, 0,0);               // Wolf Riding
  c.SkillsAdd($0000,253, 5,5, 0,0);               // Assassination
  c.SkillsAdd($0000,313, 300,300, 0,0);           // Language: Gnomish
  c.SkillsAdd($0000,45, 5,0, 0,0);                // Bows
  c.SkillsAdd($0000,713, 0,0, 0,0);               // Kodo Riding
  c.SkillsAdd($0000,773, 0,0, 0,0);               // Inscription
  c.SkillsAdd($0000,753, 5,5, 0,0);               // Racial - Gnome
  c.SkillsAdd($0000,38, 5,5, 0,0);                // Combat
  c.SkillsAdd($0000,39, 5,0, 0,0);                // Subtlety
  c.SkillsAdd($0000,129, 0,0, 0,0);               // First Aid
  c.SkillsAdd($0000,162, 5,1, 0,0);               // Unarmed
  c.SkillsAdd($0000,111, 0,0, 0,0);               // Language: Dwarven
  c.SkillsAdd($0000,113, 0,0, 0,0);               // Language: Darnassian
  c.SkillsAdd($0000,115, 0,0, 0,0);               // Language: Taurahe
  c.SkillsAdd($0000,315, 0,0, 0,0);               // Language: Troll
  c.SkillsAdd($0000,139, 0,0, 0,0);               // Language: Demon Tongue
  c.SkillsAdd($0000,152, 0,0, 0,0);               // Ram Riding
  c.SkillsAdd($0000,553, 0,0, 0,0);               // Mechanostrider Piloting
  c.SkillsAdd($0000,673, 0,0, 0,0);               // Language: Gutterspeak
  c.SkillsAdd($0000,118, 5,5, 0,0);               // Dual Wield
  c.SkillsAdd($0000,138, 300,0, 0,0);             // Language: Draconic
  c.SkillsAdd($0000,141, 0,0, 0,0);               // Language: Old Tongue
  c.SkillsAdd($0000,142, 1,0, 0,0);               // Survival
  c.SkillsAdd($0000,148, 0,0, 0,0);               // Horse Riding
  c.SkillsAdd($0000,150, 0,0, 0,0);               // Tiger Riding
  c.SkillsAdd($0000,173, 5,1, 0,0);               // Daggers
  c.SkillsAdd($0000,183, 5,5, 0,0);               // GENERIC (DND)
  c.SkillsAdd($0000,95, 5,1, 0,0);                // Defense
  c.SkillsAdd($0000,176, 5,1, 0,0);               // Thrown
  c.SkillsAdd($0000,415, 1,1, 0,0);               // Cloth
  c.SkillsAdd($0000,633, 5,0, 0,0);               // Lockpicking
  c.SkillsAdd($0000,414, 1,1, 0,0);               // Leather
  c.SkillsAdd($0000,356, 0,0, 0,0);               // Fishing
  c.SkillsAdd($0000,171, 0,0, 0,0);               // Alchemy
  c.SkillsAdd($0000,43, 5,0, 0,0);                // Swords
  c.SkillsAdd($0000,778, 1,0, 0,0);               // Companions
  c.SkillsAdd($0000,165, 0,0, 0,0);               // Leatherworking

  c.SpellsAdd(668, 0);                            // Language Common
  c.SpellsAdd(2098, 0);                           // Eviscerate
  c.SpellsAdd(75460, 0);                          // Unknown
  c.SpellsAdd(7340, 0);                           // Language Gnomish
  c.SpellsAdd(20589, 0);                          // Escape Artist
  c.SpellsAdd(20591, 0);                          // Expansive Mind
  c.SpellsAdd(20593, 0);                          // Engineering Specialization
  c.SpellsAdd(20592, 0);                          // Arcane Resistance
  c.SpellsAdd(21184, 0);                          // Rogue Passive (DND)
  c.SpellsAdd(1752, 0);                           // Sinister Strike
  c.SpellsAdd(203, 0);                            // Unarmed
  c.SpellsAdd(674, 0);                            // Dual Wield
  c.SpellsAdd(1180, 0);                           // Daggers
  c.SpellsAdd(21651, 0);                          // Opening
  c.SpellsAdd(21652, 0);                          // Closing
  c.SpellsAdd(22810, 0);                          // Opening - No Text
  c.SpellsAdd(8386, 0);                           // Attacking
  c.SpellsAdd(3365, 0);                           // Opening
  c.SpellsAdd(3050, 0);                           // Detect
  c.SpellsAdd(9125, 0);                           // Generic
  c.SpellsAdd(7266, 0);                           // Duel
  c.SpellsAdd(7267, 0);                           // Grovel
  c.SpellsAdd(7355, 0);                           // Stuck
  c.SpellsAdd(6478, 0);                           // Opening
  c.SpellsAdd(6603, 0);                           // Auto Attack
  c.SpellsAdd(6233, 0);                           // Closing
  c.SpellsAdd(6246, 0);                           // Closing
  c.SpellsAdd(6247, 0);                           // Opening
  c.SpellsAdd(6477, 0);                           // Opening
  c.SpellsAdd(2479, 0);                           // Honorless Target
  c.SpellsAdd(45927, 0);                          // Summon Friend
  c.SpellsAdd(2382, 0);                           // Generic
  c.SpellsAdd(22027, 0);                          // Remove Insignia
  c.SpellsAdd(61437, 0);                          // Opening
  c.SpellsAdd(68398, 0);                          // Opening
  c.SpellsAdd(204, 0);                            // Defense
  c.SpellsAdd(16092, 0);                          // Defensive State (DND)
  c.SpellsAdd(81, 0);                             // Dodge
  c.SpellsAdd(522, 0);                            // SPELLDEFENSE (DND)
  c.SpellsAdd(2764, 0);                           // Throw
  c.SpellsAdd(2567, 0);                           // Thrown
  c.SpellsAdd(9078, 0);                           // Cloth
  c.SpellsAdd(9077, 0);                           // Leather

  c.SetActionButtons(0, 6603, $00000000);         // Spell: Auto Attack
  c.SetActionButtons(1, 1752, $00000000);         // Spell: Sinister Strike
  c.SetActionButtons(2, 2098, $00000000);         // Spell: Eviscerate
  c.SetActionButtons(3, 2764, $00000000);         // Spell: Throw
end;
procedure RACE_GNOME_CLASS_DEATHKNIGHT(var c:TCharData);
begin
  c.Enum.zoneID                := 0;
  c.Enum.mapID                 := 609;
  c.Enum.position.x            := 2355.050048;
  c.Enum.position.y            := -5661.700195;
  c.Enum.position.z            := 426.026000;
  c.facing                     := 3.911299;

  c.scale_x                    := 1;
  c.power_type                 := 6;
  c.max_health                 := 3169;
  c.max_power[POWER_MANA]      := 0;
  c.max_power[POWER_RAGE]      := 1000;
  c.max_power[POWER_FOCUS]     := 100;
  c.max_power[POWER_ENERGY]    := 100;
  c.max_power[POWER_HAPPINESS] := 0;
  c.max_power[POWER_RUNES]     := 8;
  c.max_power[POWER_RUNIC]     := 1000;
  c.health                     := 3169;
  c.power[POWER_MANA]          := 0;
  c.power[POWER_RAGE]          := 1000;
  c.power[POWER_FOCUS]         := 100;
  c.power[POWER_ENERGY]        := 100;
  c.power[POWER_HAPPINESS]     := 0;
  c.power[POWER_RUNES]         := 8;
  c.power[POWER_RUNIC]         := 0;
  c.Enum.experienceLevel       := 55;
  c.faction_template           := 115;
  c.flags                      := $00000008;
  c.flags2                     := $00000800;
  c.mainhand_attack_time       := 2000;
  c.offhand_attack_time        := 2000;
  c.ranged_attack_time         := 0;
  c.bounding_radius            := 0.351899;
  c.combat_reach               := 1.5;
  c.enum_model                 := 1563+c.Enum.sexID;
  c.native_model               := 1563+c.Enum.sexID;
  c.mount_model                := 0;
  c.min_damage                 := 106.128578;
  c.max_damage                 := 106.128578;
  c.min_offhand_damage         := 0;
  c.max_offhand_damage         := 0;
  c.mod_cast_speed             := 1;
  c.stat[0]                    := 247;
  c.stat[1]                    := 113;
  c.stat[2]                    := 199;
  c.stat[3]                    := 33;
  c.stat[4]                    := 42;
  c.resist[0]                  := 3541;
  c.resist[1]                  := 0;
  c.resist[2]                  := 0;
  c.resist[3]                  := 0;
  c.resist[4]                  := 0;
  c.resist[5]                  := 0;
  c.resist[6]                  := 0;
  c.base_mana                  := 0;
  c.base_health                := 1359;
  c.attack_power               := 639;
  c.ranged_attack_time         := 0;
  c.min_ranged_damage          := 0;
  c.max_ranged_damage          := 0;
  c.hover_height               := 1;

  c.player_flags               := $00000020;
  c.xp                         := 815;
  c.next_level_xp              := 148200;
  c.points1                    := 0;
  c.professions_left           := 2;
  c.ammo_id                    := 0;

  c.ItemsAdd($FF,0, 34652,1, $00010001);          // Acherus Knight's Hood
  c.ItemsAdd($FF,1, 34657,1, $00010001);          // Choker of Damnation
  c.ItemsAdd($FF,2, 34655,1, $00010001);          // Acherus Knight's Pauldrons
  c.ItemsAdd($FF,4, 34650,1, $00010001);          // Acherus Knight's Tunic
  c.ItemsAdd($FF,5, 34651,1, $00010001);          // Acherus Knight's Girdle
  c.ItemsAdd($FF,6, 34656,1, $00010001);          // Acherus Knight's Cover
  c.ItemsAdd($FF,7, 34648,1, $00010001);          // Acherus Knight's Greaves
  c.ItemsAdd($FF,8, 34653,1, $00010001);          // Acherus Knight's Wristguard
  c.ItemsAdd($FF,9, 34649,1, $00010001);          // Acherus Knight's Gauntlets
  c.ItemsAdd($FF,10, 34658,1, $00010001);         // Plague Band
  c.ItemsAdd($FF,11, 38147,1, $00010001);         // Corrupted Band
  c.ItemsAdd($FF,14, 34659,1, $00010001);         // Acherus Knight's Shroud
  c.ItemsAdd($FF,23, 41751,10, $00010000);        // Black Mushroom

  c.SkillsAdd($0000,44, 275,270, 0,0);            // Axes
  c.SkillsAdd($0000,164, 0,0, 0,0);               // Blacksmithing
  c.SkillsAdd($0000,202, 0,0, 15,0);              // Engineering
  c.SkillsAdd($0002,762, 150,150, 0,0);           // Riding
  c.SkillsAdd($0000,769, 275,0, 0,0);             // Internal
  c.SkillsAdd($0000,755, 0,0, 0,0);               // Jewelcrafting
  c.SkillsAdd($0000,98, 300,300, 0,0);            // Language: Common
  c.SkillsAdd($0000,54, 275,0, 0,0);              // Maces
  c.SkillsAdd($0000,554, 0,0, 0,0);               // Undead Horsemanship
  c.SkillsAdd($0000,770, 275,275, 0,0);           // Blood
  c.SkillsAdd($0000,771, 275,275, 0,0);           // Frost
  c.SkillsAdd($0000,772, 275,275, 0,0);           // Unholy
  c.SkillsAdd($0000,186, 0,0, 0,0);               // Mining
  c.SkillsAdd($0000,197, 0,0, 0,0);               // Tailoring
  c.SkillsAdd($0000,776, 1,0, 0,0);               // Runeforging
  c.SkillsAdd($0000,333, 0,0, 0,0);               // Enchanting
  c.SkillsAdd($0000,185, 0,0, 0,0);               // Cooking
  c.SkillsAdd($0000,229, 275,270, 0,0);           // Polearms
  c.SkillsAdd($0000,777, 1,1, 0,0);               // Mounts
  c.SkillsAdd($0000,393, 0,0, 0,0);               // Skinning
  c.SkillsAdd($0000,759, 0,0, 0,0);               // Language: Draenei
  c.SkillsAdd($0000,182, 0,0, 0,0);               // Herbalism
  c.SkillsAdd($0000,140, 300,0, 0,0);             // Language: Titan
  c.SkillsAdd($0000,149, 0,0, 0,0);               // Wolf Riding
  c.SkillsAdd($0000,313, 300,300, 0,0);           // Language: Gnomish
  c.SkillsAdd($0000,55, 275,270, 0,0);            // Two-Handed Swords
  c.SkillsAdd($0000,713, 0,0, 0,0);               // Kodo Riding
  c.SkillsAdd($0000,773, 0,0, 0,0);               // Inscription
  c.SkillsAdd($0000,753, 275,275, 0,0);           // Racial - Gnome
  c.SkillsAdd($0004,129, 300,270, 0,0);           // First Aid
  c.SkillsAdd($0000,162, 275,270, 0,0);           // Unarmed
  c.SkillsAdd($0000,139, 0,0, 0,0);               // Language: Demon Tongue
  c.SkillsAdd($0000,152, 0,0, 0,0);               // Ram Riding
  c.SkillsAdd($0000,293, 1,1, 0,0);               // Plate Mail
  c.SkillsAdd($0000,118, 275,275, 0,0);           // Dual Wield
  c.SkillsAdd($0000,138, 300,0, 0,0);             // Language: Draconic
  c.SkillsAdd($0000,141, 0,0, 0,0);               // Language: Old Tongue
  c.SkillsAdd($0000,142, 1,0, 0,0);               // Survival
  c.SkillsAdd($0000,148, 0,0, 0,0);               // Horse Riding
  c.SkillsAdd($0000,150, 0,0, 0,0);               // Tiger Riding
  c.SkillsAdd($0000,183, 275,275, 0,0);           // GENERIC (DND)
  c.SkillsAdd($0000,95, 275,270, 0,0);            // Defense
  c.SkillsAdd($0000,415, 1,1, 0,0);               // Cloth
  c.SkillsAdd($0000,413, 1,1, 0,0);               // Mail
  c.SkillsAdd($0000,414, 1,1, 0,0);               // Leather
  c.SkillsAdd($0000,356, 0,0, 0,0);               // Fishing
  c.SkillsAdd($0000,171, 0,0, 0,0);               // Alchemy
  c.SkillsAdd($0000,172, 275,270, 0,0);           // Two-Handed Axes
  c.SkillsAdd($0000,43, 275,270, 0,0);            // Swords
  c.SkillsAdd($0000,778, 1,0, 0,0);               // Companions
  c.SkillsAdd($0000,160, 275,0, 0,0);             // Two-Handed Maces
  c.SkillsAdd($0000,165, 0,0, 0,0);               // Leatherworking

  c.SpellsAdd(196, 0);                            // One-Handed Axes
  c.SpellsAdd(33391, 0);                          // Journeyman Riding
  c.SpellsAdd(668, 0);                            // Language Common
  c.SpellsAdd(48266, 0);                          // Blood Presence
  c.SpellsAdd(45902, 0);                          // Blood Strike
  c.SpellsAdd(49410, 0);                          // Forceful Deflection
  c.SpellsAdd(45477, 0);                          // Icy Touch
  c.SpellsAdd(59921, 0);                          // Frost Fever
  c.SpellsAdd(61455, 0);                          // Runic Focus
  c.SpellsAdd(47541, 0);                          // Death Coil
  c.SpellsAdd(49576, 0);                          // Death Grip
  c.SpellsAdd(45462, 0);                          // Plague Strike
  c.SpellsAdd(59879, 0);                          // Blood Plague
  c.SpellsAdd(200, 0);                            // Polearms
  c.SpellsAdd(7340, 0);                           // Language Gnomish
  c.SpellsAdd(202, 0);                            // Two-Handed Swords
  c.SpellsAdd(20589, 0);                          // Escape Artist
  c.SpellsAdd(20591, 0);                          // Expansive Mind
  c.SpellsAdd(20593, 0);                          // Engineering Specialization
  c.SpellsAdd(20592, 0);                          // Arcane Resistance
  c.SpellsAdd(3275, 0);                           // Linen Bandage
  c.SpellsAdd(10846, 0);                          // First Aid
  c.SpellsAdd(7934, 0);                           // Anti-Venom
  c.SpellsAdd(3276, 0);                           // Heavy Linen Bandage
  c.SpellsAdd(3277, 0);                           // Wool Bandage
  c.SpellsAdd(3278, 0);                           // Heavy Wool Bandage
  c.SpellsAdd(7928, 0);                           // Silk Bandage
  c.SpellsAdd(7929, 0);                           // Heavy Silk Bandage
  c.SpellsAdd(10840, 0);                          // Mageweave Bandage
  c.SpellsAdd(10841, 0);                          // Heavy Mageweave Bandage
  c.SpellsAdd(18629, 0);                          // Runecloth Bandage
  c.SpellsAdd(18630, 0);                          // Heavy Runecloth Bandage
  c.SpellsAdd(203, 0);                            // Unarmed
  c.SpellsAdd(750, 0);                            // Plate Mail
  c.SpellsAdd(674, 0);                            // Dual Wield
  c.SpellsAdd(21651, 0);                          // Opening
  c.SpellsAdd(21652, 0);                          // Closing
  c.SpellsAdd(22810, 0);                          // Opening - No Text
  c.SpellsAdd(8386, 0);                           // Attacking
  c.SpellsAdd(3365, 0);                           // Opening
  c.SpellsAdd(3050, 0);                           // Detect
  c.SpellsAdd(9125, 0);                           // Generic
  c.SpellsAdd(7266, 0);                           // Duel
  c.SpellsAdd(7267, 0);                           // Grovel
  c.SpellsAdd(7355, 0);                           // Stuck
  c.SpellsAdd(6478, 0);                           // Opening
  c.SpellsAdd(6603, 0);                           // Auto Attack
  c.SpellsAdd(6233, 0);                           // Closing
  c.SpellsAdd(6246, 0);                           // Closing
  c.SpellsAdd(6247, 0);                           // Opening
  c.SpellsAdd(6477, 0);                           // Opening
  c.SpellsAdd(2479, 0);                           // Honorless Target
  c.SpellsAdd(45927, 0);                          // Summon Friend
  c.SpellsAdd(2382, 0);                           // Generic
  c.SpellsAdd(22027, 0);                          // Remove Insignia
  c.SpellsAdd(52665, 0);                          // Sigil
  c.SpellsAdd(61437, 0);                          // Opening
  c.SpellsAdd(68398, 0);                          // Opening
  c.SpellsAdd(63645, 0);                          // Activate Primary Spec
  c.SpellsAdd(63644, 0);                          // Activate Secondary Spec
  c.SpellsAdd(204, 0);                            // Defense
  c.SpellsAdd(45903, 0);                          // Offensive State (DND)
  c.SpellsAdd(81, 0);                             // Dodge
  c.SpellsAdd(522, 0);                            // SPELLDEFENSE (DND)
  c.SpellsAdd(3127, 0);                           // Parry
  c.SpellsAdd(9078, 0);                           // Cloth
  c.SpellsAdd(8737, 0);                           // Mail
  c.SpellsAdd(9077, 0);                           // Leather
  c.SpellsAdd(197, 0);                            // Two-Handed Axes
  c.SpellsAdd(201, 0);                            // One-Handed Swords

  c.SetActionButtons(0, 6603, $00000000);         // Spell: Auto Attack
  c.SetActionButtons(1, 49576, $00000000);        // Spell: Death Grip
  c.SetActionButtons(2, 45477, $00000000);        // Spell: Icy Touch
  c.SetActionButtons(3, 45462, $00000000);        // Spell: Plague Strike
  c.SetActionButtons(4, 45902, $00000000);        // Spell: Blood Strike
  c.SetActionButtons(5, 47541, $00000000);        // Spell: Death Coil
  c.SetActionButtons(10, 20589, $00000000);       // Spell: Escape Artist
  c.SetActionButtons(72, 6603, $00000000);        // Spell: Auto Attack
  c.SetActionButtons(83, 117, $00008000);         // Item: Tough Jerky
  c.SetActionButtons(84, 6603, $00000000);        // Spell: Auto Attack
  c.SetActionButtons(96, 6603, $00000000);        // Spell: Auto Attack
  c.SetActionButtons(108, 6603, $00000000);       // Spell: Auto Attack
end;
procedure RACE_GNOME_CLASS_MAGE(var c:TCharData);
begin
  c.Enum.zoneID                := 0;
  c.Enum.mapID                 := 0;
  c.Enum.position.x            := -6240.319824;
  c.Enum.position.y            := 331.032989;
  c.Enum.position.z            := 382.757995;
  c.facing                     := 0;

  c.scale_x                    := 1;
  c.power_type                 := 0;
  c.max_health                 := 52;
  c.max_power[POWER_MANA]      := 225;
  c.max_power[POWER_RAGE]      := 1000;
  c.max_power[POWER_FOCUS]     := 100;
  c.max_power[POWER_ENERGY]    := 100;
  c.max_power[POWER_HAPPINESS] := 0;
  c.max_power[POWER_RUNES]     := 8;
  c.max_power[POWER_RUNIC]     := 1000;
  c.health                     := 52;
  c.power[POWER_MANA]          := 225;
  c.power[POWER_RAGE]          := 1000;
  c.power[POWER_FOCUS]         := 100;
  c.power[POWER_ENERGY]        := 100;
  c.power[POWER_HAPPINESS]     := 0;
  c.power[POWER_RUNES]         := 8;
  c.power[POWER_RUNIC]         := 0;
  c.Enum.experienceLevel       := 1;
  c.faction_template           := 115;
  c.flags                      := $00000008;
  c.flags2                     := $00000800;
  c.mainhand_attack_time       := 2900;
  c.offhand_attack_time        := 2000;
  c.ranged_attack_time         := 0;
  c.bounding_radius            := 0.351899;
  c.combat_reach               := 1.5;
  c.enum_model                 := 1563+c.Enum.sexID;
  c.native_model               := 1563+c.Enum.sexID;
  c.mount_model                := 0;
  c.min_damage                 := 5.071428;
  c.max_damage                 := 7.071428;
  c.min_offhand_damage         := 0;
  c.max_offhand_damage         := 0;
  c.mod_cast_speed             := 1;
  c.stat[0]                    := 15;
  c.stat[1]                    := 22;
  c.stat[2]                    := 20;
  c.stat[3]                    := 27;
  c.stat[4]                    := 22;
  c.resist[0]                  := 49;
  c.resist[1]                  := 0;
  c.resist[2]                  := 0;
  c.resist[3]                  := 0;
  c.resist[4]                  := 0;
  c.resist[5]                  := 0;
  c.resist[6]                  := 0;
  c.base_mana                  := 100;
  c.base_health                := 32;
  c.attack_power               := 10;
  c.ranged_attack_time         := 0;
  c.min_ranged_damage          := 0;
  c.max_ranged_damage          := 0;
  c.hover_height               := 1;

  c.player_flags               := $00000000;
  c.xp                         := 0;
  c.next_level_xp              := 400;
  c.points1                    := 0;
  c.professions_left           := 2;
  c.ammo_id                    := 0;

  c.ItemsAdd($FF,3, 6096,1, $00010000);           // Apprentice's Shirt
  c.ItemsAdd($FF,4, 56,1, $00010000);             // pprentice's Robe
  c.ItemsAdd($FF,6, 1395,1, $00010000);           // Apprentice's Pants
  c.ItemsAdd($FF,7, 55,1, $00010000);             // Apprentice's Boots
  c.ItemsAdd($FF,15, 35,1, $00010000);            // Bent Staff
  c.ItemsAdd($FF,23, 6948,1, $00010001);          // Hearthstone

  c.SkillsAdd($0000,164, 0,0, 0,0);               // Blacksmithing
  c.SkillsAdd($0000,202, 0,0, 15,0);              // Engineering
  c.SkillsAdd($0000,762, 0,0, 0,0);               // Riding
  c.SkillsAdd($0000,769, 5,0, 0,0);               // Internal
  c.SkillsAdd($0000,755, 0,0, 0,0);               // Jewelcrafting
  c.SkillsAdd($0000,98, 300,300, 0,0);            // Language: Common
  c.SkillsAdd($0000,136, 5,1, 0,0);               // Staves
  c.SkillsAdd($0000,533, 0,0, 0,0);               // Raptor Riding
  c.SkillsAdd($0000,554, 0,0, 0,0);               // Undead Horsemanship
  c.SkillsAdd($0000,771, 1,0, 0,0);               // Frost
  c.SkillsAdd($0000,186, 0,0, 0,0);               // Mining
  c.SkillsAdd($0000,197, 0,0, 0,0);               // Tailoring
  c.SkillsAdd($0000,333, 0,0, 0,0);               // Enchanting
  c.SkillsAdd($0000,185, 0,0, 0,0);               // Cooking
  c.SkillsAdd($0000,777, 1,1, 0,0);               // Mounts
  c.SkillsAdd($0000,393, 0,0, 0,0);               // Skinning
  c.SkillsAdd($0000,137, 0,0, 0,0);               // Language: Thalassian
  c.SkillsAdd($0000,759, 0,0, 0,0);               // Language: Draenei
  c.SkillsAdd($0000,182, 0,0, 0,0);               // Herbalism
  c.SkillsAdd($0000,228, 5,1, 0,0);               // Wands
  c.SkillsAdd($0000,109, 0,0, 0,0);               // Language: Orcish
  c.SkillsAdd($0000,140, 300,0, 0,0);             // Language: Titan
  c.SkillsAdd($0000,149, 0,0, 0,0);               // Wolf Riding
  c.SkillsAdd($0000,313, 300,300, 0,0);           // Language: Gnomish
  c.SkillsAdd($0000,713, 0,0, 0,0);               // Kodo Riding
  c.SkillsAdd($0000,773, 0,0, 0,0);               // Inscription
  c.SkillsAdd($0000,753, 5,5, 0,0);               // Racial - Gnome
  c.SkillsAdd($0000,6, 5,5, 0,0);                 // Frost
  c.SkillsAdd($0000,129, 0,0, 0,0);               // First Aid
  c.SkillsAdd($0000,237, 5,0, 0,0);               // Arcane
  c.SkillsAdd($0000,162, 5,1, 0,0);               // Unarmed
  c.SkillsAdd($0000,111, 0,0, 0,0);               // Language: Dwarven
  c.SkillsAdd($0000,113, 0,0, 0,0);               // Language: Darnassian
  c.SkillsAdd($0000,115, 0,0, 0,0);               // Language: Taurahe
  c.SkillsAdd($0000,315, 0,0, 0,0);               // Language: Troll
  c.SkillsAdd($0000,139, 0,0, 0,0);               // Language: Demon Tongue
  c.SkillsAdd($0000,152, 0,0, 0,0);               // Ram Riding
  c.SkillsAdd($0000,8, 5,5, 0,0);                 // Fire
  c.SkillsAdd($0000,553, 0,0, 0,0);               // Mechanostrider Piloting
  c.SkillsAdd($0000,673, 0,0, 0,0);               // Language: Gutterspeak
  c.SkillsAdd($0000,138, 300,0, 0,0);             // Language: Draconic
  c.SkillsAdd($0000,141, 0,0, 0,0);               // Language: Old Tongue
  c.SkillsAdd($0000,142, 1,0, 0,0);               // Survival
  c.SkillsAdd($0000,148, 0,0, 0,0);               // Horse Riding
  c.SkillsAdd($0000,150, 0,0, 0,0);               // Tiger Riding
  c.SkillsAdd($0000,173, 5,0, 0,0);               // Daggers
  c.SkillsAdd($0000,183, 5,5, 0,0);               // GENERIC (DND)
  c.SkillsAdd($0000,205, 1,0, 0,0);               // Pet - Succubus
  c.SkillsAdd($0000,95, 5,1, 0,0);                // Defense
  c.SkillsAdd($0000,415, 1,1, 0,0);               // Cloth
  c.SkillsAdd($0000,356, 0,0, 0,0);               // Fishing
  c.SkillsAdd($0000,171, 0,0, 0,0);               // Alchemy
  c.SkillsAdd($0000,43, 5,0, 0,0);                // Swords
  c.SkillsAdd($0000,778, 1,0, 0,0);               // Companions
  c.SkillsAdd($0000,165, 0,0, 0,0);               // Leatherworking

  c.SpellsAdd(668, 0);                            // Language Common
  c.SpellsAdd(227, 0);                            // Staves
  c.SpellsAdd(5009, 0);                           // Wands
  c.SpellsAdd(5019, 0);                           // Shoot
  c.SpellsAdd(7340, 0);                           // Language Gnomish
  c.SpellsAdd(20589, 0);                          // Escape Artist
  c.SpellsAdd(20591, 0);                          // Expansive Mind
  c.SpellsAdd(20593, 0);                          // Engineering Specialization
  c.SpellsAdd(20592, 0);                          // Arcane Resistance
  c.SpellsAdd(71761, 0);                          // Deep Freeze Immunity State
  c.SpellsAdd(168, 0);                            // Frost Armor
  c.SpellsAdd(203, 0);                            // Unarmed
  c.SpellsAdd(133, 0);                            // Fireball
  c.SpellsAdd(21651, 0);                          // Opening
  c.SpellsAdd(21652, 0);                          // Closing
  c.SpellsAdd(22810, 0);                          // Opening - No Text
  c.SpellsAdd(8386, 0);                           // Attacking
  c.SpellsAdd(3365, 0);                           // Opening
  c.SpellsAdd(3050, 0);                           // Detect
  c.SpellsAdd(9125, 0);                           // Generic
  c.SpellsAdd(7266, 0);                           // Duel
  c.SpellsAdd(7267, 0);                           // Grovel
  c.SpellsAdd(7355, 0);                           // Stuck
  c.SpellsAdd(6478, 0);                           // Opening
  c.SpellsAdd(6603, 0);                           // Auto Attack
  c.SpellsAdd(6233, 0);                           // Closing
  c.SpellsAdd(6246, 0);                           // Closing
  c.SpellsAdd(6247, 0);                           // Opening
  c.SpellsAdd(6477, 0);                           // Opening
  c.SpellsAdd(2479, 0);                           // Honorless Target
  c.SpellsAdd(45927, 0);                          // Summon Friend
  c.SpellsAdd(2382, 0);                           // Generic
  c.SpellsAdd(22027, 0);                          // Remove Insignia
  c.SpellsAdd(61437, 0);                          // Opening
  c.SpellsAdd(68398, 0);                          // Opening
  c.SpellsAdd(204, 0);                            // Defense
  c.SpellsAdd(81, 0);                             // Dodge
  c.SpellsAdd(522, 0);                            // SPELLDEFENSE (DND)
  c.SpellsAdd(9078, 0);                           // Cloth

  c.SetActionButtons(0, 133, $00000000);          // Spell: Fireball
  c.SetActionButtons(1, 168, $00000000);          // Spell: Frost Armor
end;
procedure RACE_GNOME_CLASS_WARLOCK(var c:TCharData);
begin
  c.Enum.zoneID                := 0;
  c.Enum.mapID                 := 0;
  c.Enum.position.x            := -6240.319824;
  c.Enum.position.y            := 331.032989;
  c.Enum.position.z            := 382.757995;
  c.facing                     := 0;

  c.scale_x                    := 1;
  c.power_type                 := 0;
  c.max_health                 := 53;
  c.max_power[POWER_MANA]      := 200;
  c.max_power[POWER_RAGE]      := 1000;
  c.max_power[POWER_FOCUS]     := 100;
  c.max_power[POWER_ENERGY]    := 100;
  c.max_power[POWER_HAPPINESS] := 0;
  c.max_power[POWER_RUNES]     := 8;
  c.max_power[POWER_RUNIC]     := 1000;
  c.health                     := 53;
  c.power[POWER_MANA]          := 200;
  c.power[POWER_RAGE]          := 1000;
  c.power[POWER_FOCUS]         := 100;
  c.power[POWER_ENERGY]        := 100;
  c.power[POWER_HAPPINESS]     := 0;
  c.power[POWER_RUNES]         := 8;
  c.power[POWER_RUNIC]         := 0;
  c.Enum.experienceLevel       := 1;
  c.faction_template           := 115;
  c.flags                      := $00000008;
  c.flags2                     := $00000800;
  c.mainhand_attack_time       := 2900;
  c.offhand_attack_time        := 2000;
  c.ranged_attack_time         := 0;
  c.bounding_radius            := 0.351899;
  c.combat_reach               := 1.5;
  c.enum_model                 := 1563+c.Enum.sexID;
  c.native_model               := 1563+c.Enum.sexID;
  c.mount_model                := 0;
  c.min_damage                 := 5.071428;
  c.max_damage                 := 7.071428;
  c.min_offhand_damage         := 0;
  c.max_offhand_damage         := 0;
  c.mod_cast_speed             := 1;
  c.stat[0]                    := 15;
  c.stat[1]                    := 22;
  c.stat[2]                    := 21;
  c.stat[3]                    := 26;
  c.stat[4]                    := 22;
  c.resist[0]                  := 49;
  c.resist[1]                  := 0;
  c.resist[2]                  := 0;
  c.resist[3]                  := 0;
  c.resist[4]                  := 0;
  c.resist[5]                  := 0;
  c.resist[6]                  := 0;
  c.base_mana                  := 90;
  c.base_health                := 23;
  c.attack_power               := 10;
  c.ranged_attack_time         := 0;
  c.min_ranged_damage          := 0;
  c.max_ranged_damage          := 0;
  c.hover_height               := 1;

  c.player_flags               := $00000000;
  c.xp                         := 0;
  c.next_level_xp              := 400;
  c.points1                    := 0;
  c.professions_left           := 2;
  c.ammo_id                    := 0;

  c.ItemsAdd($FF,3, 6097,1, $00010000);           // Acolyte's Shirt
  c.ItemsAdd($FF,4, 57,1, $00010000);             // Acolyte's Robe
  c.ItemsAdd($FF,6, 1396,1, $00010000);           // Acolyte's Pants
  c.ItemsAdd($FF,7, 59,1, $00010000);             // Acolyte's Shoes
  c.ItemsAdd($FF,15, 35,1, $00010000);            // Bent Staff
  c.ItemsAdd($FF,23, 6948,1, $00010001);          // Hearthstone

  c.SkillsAdd($0000,164, 0,0, 0,0);               // Blacksmithing
  c.SkillsAdd($0000,202, 0,0, 15,0);              // Engineering
  c.SkillsAdd($0000,762, 0,0, 0,0);               // Riding
  c.SkillsAdd($0000,769, 5,0, 0,0);               // Internal
  c.SkillsAdd($0000,755, 0,0, 0,0);               // Jewelcrafting
  c.SkillsAdd($0000,98, 300,300, 0,0);            // Language: Common
  c.SkillsAdd($0000,136, 5,1, 0,0);               // Staves
  c.SkillsAdd($0000,533, 0,0, 0,0);               // Raptor Riding
  c.SkillsAdd($0000,554, 0,0, 0,0);               // Undead Horsemanship
  c.SkillsAdd($0000,771, 1,0, 0,0);               // Frost
  c.SkillsAdd($0000,186, 0,0, 0,0);               // Mining
  c.SkillsAdd($0000,197, 0,0, 0,0);               // Tailoring
  c.SkillsAdd($0000,333, 0,0, 0,0);               // Enchanting
  c.SkillsAdd($0000,185, 0,0, 0,0);               // Cooking
  c.SkillsAdd($0000,777, 1,1, 0,0);               // Mounts
  c.SkillsAdd($0000,393, 0,0, 0,0);               // Skinning
  c.SkillsAdd($0000,137, 0,0, 0,0);               // Language: Thalassian
  c.SkillsAdd($0000,759, 0,0, 0,0);               // Language: Draenei
  c.SkillsAdd($0000,182, 0,0, 0,0);               // Herbalism
  c.SkillsAdd($0000,228, 5,1, 0,0);               // Wands
  c.SkillsAdd($0000,109, 0,0, 0,0);               // Language: Orcish
  c.SkillsAdd($0000,140, 300,0, 0,0);             // Language: Titan
  c.SkillsAdd($0000,149, 0,0, 0,0);               // Wolf Riding
  c.SkillsAdd($0000,313, 300,300, 0,0);           // Language: Gnomish
  c.SkillsAdd($0000,713, 0,0, 0,0);               // Kodo Riding
  c.SkillsAdd($0000,773, 0,0, 0,0);               // Inscription
  c.SkillsAdd($0000,753, 5,5, 0,0);               // Racial - Gnome
  c.SkillsAdd($0000,129, 0,0, 0,0);               // First Aid
  c.SkillsAdd($0000,162, 5,1, 0,0);               // Unarmed
  c.SkillsAdd($0000,111, 0,0, 0,0);               // Language: Dwarven
  c.SkillsAdd($0000,113, 0,0, 0,0);               // Language: Darnassian
  c.SkillsAdd($0000,115, 0,0, 0,0);               // Language: Taurahe
  c.SkillsAdd($0000,315, 0,0, 0,0);               // Language: Troll
  c.SkillsAdd($0000,139, 0,0, 0,0);               // Language: Demon Tongue
  c.SkillsAdd($0000,152, 0,0, 0,0);               // Ram Riding
  c.SkillsAdd($0000,354, 5,5, 0,0);               // Demonology
  c.SkillsAdd($0000,553, 0,0, 0,0);               // Mechanostrider Piloting
  c.SkillsAdd($0000,355, 5,0, 0,0);               // Affliction
  c.SkillsAdd($0000,673, 0,0, 0,0);               // Language: Gutterspeak
  c.SkillsAdd($0000,138, 300,0, 0,0);             // Language: Draconic
  c.SkillsAdd($0000,141, 0,0, 0,0);               // Language: Old Tongue
  c.SkillsAdd($0000,142, 1,0, 0,0);               // Survival
  c.SkillsAdd($0000,148, 0,0, 0,0);               // Horse Riding
  c.SkillsAdd($0000,150, 0,0, 0,0);               // Tiger Riding
  c.SkillsAdd($0000,173, 5,1, 0,0);               // Daggers
  c.SkillsAdd($0000,183, 5,5, 0,0);               // GENERIC (DND)
  c.SkillsAdd($0000,95, 5,1, 0,0);                // Defense
  c.SkillsAdd($0000,415, 1,1, 0,0);               // Cloth
  c.SkillsAdd($0000,356, 0,0, 0,0);               // Fishing
  c.SkillsAdd($0000,171, 0,0, 0,0);               // Alchemy
  c.SkillsAdd($0000,43, 5,0, 0,0);                // Swords
  c.SkillsAdd($0000,593, 5,5, 0,0);               // Destruction
  c.SkillsAdd($0000,778, 1,0, 0,0);               // Companions
  c.SkillsAdd($0000,165, 0,0, 0,0);               // Leatherworking

  c.SpellsAdd(668, 0);                            // Language Common
  c.SpellsAdd(227, 0);                            // Staves
  c.SpellsAdd(5009, 0);                           // Wands
  c.SpellsAdd(5019, 0);                           // Shoot
  c.SpellsAdd(7340, 0);                           // Language Gnomish
  c.SpellsAdd(20589, 0);                          // Escape Artist
  c.SpellsAdd(20591, 0);                          // Expansive Mind
  c.SpellsAdd(20593, 0);                          // Engineering Specialization
  c.SpellsAdd(20592, 0);                          // Arcane Resistance
  c.SpellsAdd(203, 0);                            // Unarmed
  c.SpellsAdd(687, 0);                            // Demon Skin
  c.SpellsAdd(18822, 0);                          // Improved Enslave Demon
  c.SpellsAdd(1180, 0);                           // Daggers
  c.SpellsAdd(21651, 0);                          // Opening
  c.SpellsAdd(21652, 0);                          // Closing
  c.SpellsAdd(22810, 0);                          // Opening - No Text
  c.SpellsAdd(8386, 0);                           // Attacking
  c.SpellsAdd(3365, 0);                           // Opening
  c.SpellsAdd(3050, 0);                           // Detect
  c.SpellsAdd(9125, 0);                           // Generic
  c.SpellsAdd(7266, 0);                           // Duel
  c.SpellsAdd(7267, 0);                           // Grovel
  c.SpellsAdd(7355, 0);                           // Stuck
  c.SpellsAdd(6478, 0);                           // Opening
  c.SpellsAdd(6603, 0);                           // Auto Attack
  c.SpellsAdd(6233, 0);                           // Closing
  c.SpellsAdd(6246, 0);                           // Closing
  c.SpellsAdd(6247, 0);                           // Opening
  c.SpellsAdd(6477, 0);                           // Opening
  c.SpellsAdd(2479, 0);                           // Honorless Target
  c.SpellsAdd(45927, 0);                          // Summon Friend
  c.SpellsAdd(2382, 0);                           // Generic
  c.SpellsAdd(22027, 0);                          // Remove Insignia
  c.SpellsAdd(61437, 0);                          // Opening
  c.SpellsAdd(68398, 0);                          // Opening
  c.SpellsAdd(204, 0);                            // Defense
  c.SpellsAdd(81, 0);                             // Dodge
  c.SpellsAdd(522, 0);                            // SPELLDEFENSE (DND)
  c.SpellsAdd(9078, 0);                           // Cloth
  c.SpellsAdd(686, 0);                            // Shadow Bolt
  c.SpellsAdd(58284, 0);                          // Chaos Bolt Passive
  c.SpellsAdd(75445, 0);                          // Demonic Immolate

  c.SetActionButtons(0, 686, $00000000);          // Spell: Shadow Bolt
  c.SetActionButtons(1, 687, $00000000);          // Spell: Demon Skin
end;

procedure RACE_DRAENEI_CLASS_WARRIOR(var c:TCharData);
begin
  c.Enum.zoneID                := 0;
  c.Enum.mapID                 := 530;
  c.Enum.position.x            := -3961.639892;
  c.Enum.position.y            := -13931.200195;
  c.Enum.position.z            := 100.614997;
  c.facing                     := 2.083643;

  c.scale_x                    := 1;
  c.power_type                 := 1;
  c.max_health                 := 60;
  c.max_power[POWER_MANA]      := 0;
  c.max_power[POWER_RAGE]      := 1000;
  c.max_power[POWER_FOCUS]     := 100;
  c.max_power[POWER_ENERGY]    := 100;
  c.max_power[POWER_HAPPINESS] := 0;
  c.max_power[POWER_RUNES]     := 8;
  c.max_power[POWER_RUNIC]     := 1000;
  c.health                     := 60;
  c.power[POWER_MANA]          := 0;
  c.power[POWER_RAGE]          := 0;
  c.power[POWER_FOCUS]         := 100;
  c.power[POWER_ENERGY]        := 100;
  c.power[POWER_HAPPINESS]     := 0;
  c.power[POWER_RUNES]         := 8;
  c.power[POWER_RUNIC]         := 0;
  c.Enum.experienceLevel       := 1;
  c.faction_template           := 1629;
  c.flags                      := $00000008;
  c.flags2                     := $00000800;
  c.mainhand_attack_time       := 2900;
  c.offhand_attack_time        := 2000;
  c.ranged_attack_time         := 0;
  c.bounding_radius            := 1;
  c.combat_reach               := 1.5;
  c.enum_model                 := 16125+c.Enum.sexID;
  c.native_model               := 16125+c.Enum.sexID;
  c.mount_model                := 0;
  c.min_damage                 := 9.421429;
  c.max_damage                 := 11.421429;
  c.min_offhand_damage         := 0;
  c.max_offhand_damage         := 0;
  c.mod_cast_speed             := 1;
  c.stat[0]                    := 24;
  c.stat[1]                    := 17;
  c.stat[2]                    := 22;
  c.stat[3]                    := 20;
  c.stat[4]                    := 22;
  c.resist[0]                  := 36;
  c.resist[1]                  := 0;
  c.resist[2]                  := 0;
  c.resist[3]                  := 0;
  c.resist[4]                  := 0;
  c.resist[5]                  := 0;
  c.resist[6]                  := 0;
  c.base_mana                  := 0;
  c.base_health                := 20;
  c.attack_power               := 31;
  c.ranged_attack_time         := 0;
  c.min_ranged_damage          := 0;
  c.max_ranged_damage          := 0;
  c.hover_height               := 1;

  c.player_flags               := $00000000;
  c.xp                         := 0;
  c.next_level_xp              := 400;
  c.points1                    := 0;
  c.professions_left           := 2;
  c.ammo_id                    := 0;

  c.ItemsAdd($FF,3, 23473,1, $00010000);          // Recruit's Shirt
  c.ItemsAdd($FF,6, 23474,1, $00010000);          // Recruit's Pants
  c.ItemsAdd($FF,7, 23475,1, $00010000);          // Recruit's Boots
  c.ItemsAdd($FF,15, 23346,1, $00010000);         // Battleworn Claymore
  c.ItemsAdd($FF,23, 6948,1, $00010001);          // Hearthstone

  c.SkillsAdd($0000,473, 1,0, 0,0);               // Fist Weapons
  c.SkillsAdd($0000,44, 5,0, 0,0);                // Axes
  c.SkillsAdd($0000,164, 0,0, 0,0);               // Blacksmithing
  c.SkillsAdd($0000,202, 0,0, 0,0);               // Engineering
  c.SkillsAdd($0000,762, 0,0, 0,0);               // Riding
  c.SkillsAdd($0000,257, 5,0, 0,0);               // Protection
  c.SkillsAdd($0000,46, 5,0, 0,0);                // Guns
  c.SkillsAdd($0000,769, 5,0, 0,0);               // Internal
  c.SkillsAdd($0000,755, 0,0, 5,0);               // Jewelcrafting
  c.SkillsAdd($0000,760, 5,5, 0,0);               // Draenei Racial
  c.SkillsAdd($0000,98, 300,300, 0,0);            // Language: Common
  c.SkillsAdd($0000,136, 5,0, 0,0);               // Staves
  c.SkillsAdd($0000,54, 5,1, 0,0);                // Maces
  c.SkillsAdd($0000,771, 1,0, 0,0);               // Frost
  c.SkillsAdd($0000,186, 0,0, 0,0);               // Mining
  c.SkillsAdd($0000,197, 0,0, 0,0);               // Tailoring
  c.SkillsAdd($0000,333, 0,0, 0,0);               // Enchanting
  c.SkillsAdd($0000,185, 0,0, 0,0);               // Cooking
  c.SkillsAdd($0000,229, 0,0, 0,0);               // Polearms
  c.SkillsAdd($0000,777, 1,1, 0,0);               // Mounts
  c.SkillsAdd($0000,393, 0,0, 0,0);               // Skinning
  c.SkillsAdd($0000,137, 0,0, 0,0);               // Language: Thalassian
  c.SkillsAdd($0000,759, 300,300, 0,0);           // Language: Draenei
  c.SkillsAdd($0000,182, 0,0, 0,0);               // Herbalism
  c.SkillsAdd($0000,226, 5,0, 0,0);               // Crossbows
  c.SkillsAdd($0000,109, 0,0, 0,0);               // Language: Orcish
  c.SkillsAdd($0000,433, 1,1, 0,0);               // Shield
  c.SkillsAdd($0000,140, 300,0, 0,0);             // Language: Titan
  c.SkillsAdd($0000,313, 0,0, 0,0);               // Language: Gnomish
  c.SkillsAdd($0000,45, 5,0, 0,0);                // Bows
  c.SkillsAdd($0000,55, 5,1, 0,0);                // Two-Handed Swords
  c.SkillsAdd($0000,773, 0,0, 0,0);               // Inscription
  c.SkillsAdd($0000,129, 0,0, 0,0);               // First Aid
  c.SkillsAdd($0000,162, 5,1, 0,0);               // Unarmed
  c.SkillsAdd($0000,111, 0,0, 0,0);               // Language: Dwarven
  c.SkillsAdd($0000,113, 0,0, 0,0);               // Language: Darnassian
  c.SkillsAdd($0000,115, 0,0, 0,0);               // Language: Taurahe
  c.SkillsAdd($0000,315, 0,0, 0,0);               // Language: Troll
  c.SkillsAdd($0000,139, 0,0, 0,0);               // Language: Demon Tongue
  c.SkillsAdd($0000,673, 0,0, 0,0);               // Language: Gutterspeak
  c.SkillsAdd($0000,293, 0,0, 0,0);               // Plate Mail
  c.SkillsAdd($0000,118, 0,0, 0,0);               // Dual Wield
  c.SkillsAdd($0000,138, 300,0, 0,0);             // Language: Draconic
  c.SkillsAdd($0000,141, 0,0, 0,0);               // Language: Old Tongue
  c.SkillsAdd($0000,142, 1,0, 0,0);               // Survival
  c.SkillsAdd($0000,173, 5,0, 0,0);               // Daggers
  c.SkillsAdd($0000,183, 5,5, 0,0);               // GENERIC (DND)
  c.SkillsAdd($0000,95, 5,1, 0,0);                // Defense
  c.SkillsAdd($0000,176, 5,0, 0,0);               // Thrown
  c.SkillsAdd($0000,415, 1,1, 0,0);               // Cloth
  c.SkillsAdd($0000,256, 5,0, 0,0);               // Fury
  c.SkillsAdd($0000,413, 1,1, 0,0);               // Mail
  c.SkillsAdd($0000,414, 1,1, 0,0);               // Leather
  c.SkillsAdd($0000,356, 0,0, 0,0);               // Fishing
  c.SkillsAdd($0000,171, 0,0, 0,0);               // Alchemy
  c.SkillsAdd($0000,172, 5,0, 0,0);               // Two-Handed Axes
  c.SkillsAdd($0000,43, 5,1, 0,0);                // Swords
  c.SkillsAdd($0000,26, 5,5, 0,0);                // Arms
  c.SkillsAdd($0000,778, 1,0, 0,0);               // Companions
  c.SkillsAdd($0000,160, 5,0, 0,0);               // Two-Handed Maces
  c.SkillsAdd($0000,165, 0,0, 0,0);               // Leatherworking

  c.SpellsAdd(6562, 0);                           // Heroic Presence
  c.SpellsAdd(28880, 0);                          // Gift of the Naaru
  c.SpellsAdd(28875, 0);                          // Gemcutting
  c.SpellsAdd(59221, 0);                          // Shadow Resistance
  c.SpellsAdd(668, 0);                            // Language Common
  c.SpellsAdd(198, 0);                            // One-Handed Maces
  c.SpellsAdd(29932, 0);                          // Language Draenei
  c.SpellsAdd(9116, 0);                           // Shield
  c.SpellsAdd(202, 0);                            // Two-Handed Swords
  c.SpellsAdd(203, 0);                            // Unarmed
  c.SpellsAdd(21651, 0);                          // Opening
  c.SpellsAdd(21652, 0);                          // Closing
  c.SpellsAdd(22810, 0);                          // Opening - No Text
  c.SpellsAdd(8386, 0);                           // Attacking
  c.SpellsAdd(3365, 0);                           // Opening
  c.SpellsAdd(3050, 0);                           // Detect
  c.SpellsAdd(9125, 0);                           // Generic
  c.SpellsAdd(7266, 0);                           // Duel
  c.SpellsAdd(7267, 0);                           // Grovel
  c.SpellsAdd(7355, 0);                           // Stuck
  c.SpellsAdd(6478, 0);                           // Opening
  c.SpellsAdd(6603, 0);                           // Auto Attack
  c.SpellsAdd(6233, 0);                           // Closing
  c.SpellsAdd(6246, 0);                           // Closing
  c.SpellsAdd(6247, 0);                           // Opening
  c.SpellsAdd(6477, 0);                           // Opening
  c.SpellsAdd(2479, 0);                           // Honorless Target
  c.SpellsAdd(45927, 0);                          // Summon Friend
  c.SpellsAdd(2382, 0);                           // Generic
  c.SpellsAdd(22027, 0);                          // Remove Insignia
  c.SpellsAdd(61437, 0);                          // Opening
  c.SpellsAdd(68398, 0);                          // Opening
  c.SpellsAdd(204, 0);                            // Defense
  c.SpellsAdd(107, 0);                            // Block
  c.SpellsAdd(81, 0);                             // Dodge
  c.SpellsAdd(32215, 0);                          // Victorious State
  c.SpellsAdd(522, 0);                            // SPELLDEFENSE (DND)
  c.SpellsAdd(5301, 0);                           // Defensive State (DND)
  c.SpellsAdd(9078, 0);                           // Cloth
  c.SpellsAdd(8737, 0);                           // Mail
  c.SpellsAdd(9077, 0);                           // Leather
  c.SpellsAdd(201, 0);                            // One-Handed Swords
  c.SpellsAdd(78, 0);                             // Heroic Strike
  c.SpellsAdd(2457, 0);                           // Battle Stance

  c.SetActionButtons(0, 6603, $00000000);         // Spell: Auto Attack
  c.SetActionButtons(1, 78, $00000000);           // Spell: Heroic Strike
  c.SetActionButtons(2, 28880, $00000000);        // Spell: Gift of the Naaru
  c.SetActionButtons(72, 6603, $00000000);        // Spell: Auto Attack
  c.SetActionButtons(73, 78, $00000000);          // Spell: Heroic Strike
  c.SetActionButtons(74, 28880, $00000000);       // Spell: Gift of the Naaru
  c.SetActionButtons(84, 6603, $00000000);        // Spell: Auto Attack
  c.SetActionButtons(96, 6603, $00000000);        // Spell: Auto Attack
  c.SetActionButtons(108, 6603, $00000000);       // Spell: Auto Attack
end;
procedure RACE_DRAENEI_CLASS_PALADIN(var c:TCharData);
begin
  c.Enum.zoneID                := 0;
  c.Enum.mapID                 := 530;
  c.Enum.position.x            := -3961.639892;
  c.Enum.position.y            := -13931.200195;
  c.Enum.position.z            := 100.614997;
  c.facing                     := 2.083643;

  c.scale_x                    := 1;
  c.power_type                 := 0;
  c.max_health                 := 58;
  c.max_power[POWER_MANA]      := 80;
  c.max_power[POWER_RAGE]      := 1000;
  c.max_power[POWER_FOCUS]     := 100;
  c.max_power[POWER_ENERGY]    := 100;
  c.max_power[POWER_HAPPINESS] := 0;
  c.max_power[POWER_RUNES]     := 8;
  c.max_power[POWER_RUNIC]     := 1000;
  c.health                     := 58;
  c.power[POWER_MANA]          := 80;
  c.power[POWER_RAGE]          := 1000;
  c.power[POWER_FOCUS]         := 100;
  c.power[POWER_ENERGY]        := 100;
  c.power[POWER_HAPPINESS]     := 0;
  c.power[POWER_RUNES]         := 8;
  c.power[POWER_RUNIC]         := 0;
  c.Enum.experienceLevel       := 1;
  c.faction_template           := 1629;
  c.flags                      := $00000008;
  c.flags2                     := $00000800;
  c.mainhand_attack_time       := 2900;
  c.offhand_attack_time        := 2000;
  c.ranged_attack_time         := 0;
  c.bounding_radius            := 1;
  c.combat_reach               := 1.5;
  c.enum_model                 := 16125+c.Enum.sexID;
  c.native_model               := 16125+c.Enum.sexID;
  c.mount_model                := 0;
  c.min_damage                 := 9.007143;
  c.max_damage                 := 11.007143;
  c.min_offhand_damage         := 0;
  c.max_offhand_damage         := 0;
  c.mod_cast_speed             := 1;
  c.stat[0]                    := 23;
  c.stat[1]                    := 17;
  c.stat[2]                    := 22;
  c.stat[3]                    := 20;
  c.stat[4]                    := 23;
  c.resist[0]                  := 36;
  c.resist[1]                  := 0;
  c.resist[2]                  := 0;
  c.resist[3]                  := 0;
  c.resist[4]                  := 0;
  c.resist[5]                  := 0;
  c.resist[6]                  := 0;
  c.base_mana                  := 60;
  c.base_health                := 18;
  c.attack_power               := 29;
  c.ranged_attack_time         := 0;
  c.min_ranged_damage          := 0;
  c.max_ranged_damage          := 0;
  c.hover_height               := 1;

  c.player_flags               := $00000000;
  c.xp                         := 0;
  c.next_level_xp              := 400;
  c.points1                    := 0;
  c.professions_left           := 2;
  c.ammo_id                    := 0;

  c.ItemsAdd($FF,3, 23476,1, $00010000);          // Squire's Shirt
  c.ItemsAdd($FF,6, 23477,1, $00010000);          // Squire's Pants
  c.ItemsAdd($FF,15, 2361,1, $00010000);          // Battleworn Hammer
  c.ItemsAdd($FF,23, 6948,1, $00010001);          // Hearthstone

  c.SkillsAdd($0000,44, 5,0, 0,0);                // Axes
  c.SkillsAdd($0000,164, 0,0, 0,0);               // Blacksmithing
  c.SkillsAdd($0000,202, 0,0, 0,0);               // Engineering
  c.SkillsAdd($0000,762, 0,0, 0,0);               // Riding
  c.SkillsAdd($0000,769, 5,0, 0,0);               // Internal
  c.SkillsAdd($0000,755, 0,0, 5,0);               // Jewelcrafting
  c.SkillsAdd($0000,760, 5,5, 0,0);               // Draenei Racial
  c.SkillsAdd($0000,98, 300,300, 0,0);            // Language: Common
  c.SkillsAdd($0000,54, 5,1, 0,0);                // Maces
  c.SkillsAdd($0000,771, 1,0, 0,0);               // Frost
  c.SkillsAdd($0000,186, 0,0, 0,0);               // Mining
  c.SkillsAdd($0000,197, 0,0, 0,0);               // Tailoring
  c.SkillsAdd($0000,333, 0,0, 0,0);               // Enchanting
  c.SkillsAdd($0000,185, 0,0, 0,0);               // Cooking
  c.SkillsAdd($0000,229, 0,0, 0,0);               // Polearms
  c.SkillsAdd($0000,777, 1,1, 0,0);               // Mounts
  c.SkillsAdd($0000,393, 0,0, 0,0);               // Skinning
  c.SkillsAdd($0000,137, 0,0, 0,0);               // Language: Thalassian
  c.SkillsAdd($0000,759, 300,300, 0,0);           // Language: Draenei
  c.SkillsAdd($0000,182, 0,0, 0,0);               // Herbalism
  c.SkillsAdd($0000,109, 0,0, 0,0);               // Language: Orcish
  c.SkillsAdd($0000,433, 1,1, 0,0);               // Shield
  c.SkillsAdd($0000,140, 300,0, 0,0);             // Language: Titan
  c.SkillsAdd($0000,313, 0,0, 0,0);               // Language: Gnomish
  c.SkillsAdd($0000,55, 5,0, 0,0);                // Two-Handed Swords
  c.SkillsAdd($0000,773, 0,0, 0,0);               // Inscription
  c.SkillsAdd($0000,129, 0,0, 0,0);               // First Aid
  c.SkillsAdd($0000,267, 5,0, 0,0);               // Protection
  c.SkillsAdd($0000,162, 5,1, 0,0);               // Unarmed
  c.SkillsAdd($0000,111, 0,0, 0,0);               // Language: Dwarven
  c.SkillsAdd($0000,113, 0,0, 0,0);               // Language: Darnassian
  c.SkillsAdd($0000,115, 0,0, 0,0);               // Language: Taurahe
  c.SkillsAdd($0000,315, 0,0, 0,0);               // Language: Troll
  c.SkillsAdd($0000,139, 0,0, 0,0);               // Language: Demon Tongue
  c.SkillsAdd($0000,673, 0,0, 0,0);               // Language: Gutterspeak
  c.SkillsAdd($0000,293, 0,0, 0,0);               // Plate Mail
  c.SkillsAdd($0000,138, 300,0, 0,0);             // Language: Draconic
  c.SkillsAdd($0000,141, 0,0, 0,0);               // Language: Old Tongue
  c.SkillsAdd($0000,142, 1,0, 0,0);               // Survival
  c.SkillsAdd($0000,183, 5,5, 0,0);               // GENERIC (DND)
  c.SkillsAdd($0000,184, 5,0, 0,0);               // Retribution
  c.SkillsAdd($0000,95, 5,1, 0,0);                // Defense
  c.SkillsAdd($0000,415, 1,1, 0,0);               // Cloth
  c.SkillsAdd($0000,594, 5,5, 0,0);               // Holy
  c.SkillsAdd($0000,413, 1,1, 0,0);               // Mail
  c.SkillsAdd($0000,414, 1,1, 0,0);               // Leather
  c.SkillsAdd($0000,356, 0,0, 0,0);               // Fishing
  c.SkillsAdd($0000,171, 0,0, 0,0);               // Alchemy
  c.SkillsAdd($0000,172, 5,0, 0,0);               // Two-Handed Axes
  c.SkillsAdd($0000,43, 5,0, 0,0);                // Swords
  c.SkillsAdd($0000,778, 1,0, 0,0);               // Companions
  c.SkillsAdd($0000,160, 5,1, 0,0);               // Two-Handed Maces
  c.SkillsAdd($0000,165, 0,0, 0,0);               // Leatherworking

  c.SpellsAdd(59535, 0);                          // Shadow Resistance
  c.SpellsAdd(6562, 0);                           // Heroic Presence
  c.SpellsAdd(28875, 0);                          // Gemcutting
  c.SpellsAdd(59542, 0);                          // Gift of the Naaru
  c.SpellsAdd(668, 0);                            // Language Common
  c.SpellsAdd(198, 0);                            // One-Handed Maces
  c.SpellsAdd(29932, 0);                          // Language Draenei
  c.SpellsAdd(9116, 0);                           // Shield
  c.SpellsAdd(203, 0);                            // Unarmed
  c.SpellsAdd(21651, 0);                          // Opening
  c.SpellsAdd(21652, 0);                          // Closing
  c.SpellsAdd(22810, 0);                          // Opening - No Text
  c.SpellsAdd(8386, 0);                           // Attacking
  c.SpellsAdd(27762, 0);                          // Libram
  c.SpellsAdd(3365, 0);                           // Opening
  c.SpellsAdd(3050, 0);                           // Detect
  c.SpellsAdd(9125, 0);                           // Generic
  c.SpellsAdd(7266, 0);                           // Duel
  c.SpellsAdd(7267, 0);                           // Grovel
  c.SpellsAdd(7355, 0);                           // Stuck
  c.SpellsAdd(6478, 0);                           // Opening
  c.SpellsAdd(6603, 0);                           // Auto Attack
  c.SpellsAdd(6233, 0);                           // Closing
  c.SpellsAdd(6246, 0);                           // Closing
  c.SpellsAdd(6247, 0);                           // Opening
  c.SpellsAdd(6477, 0);                           // Opening
  c.SpellsAdd(2479, 0);                           // Honorless Target
  c.SpellsAdd(45927, 0);                          // Summon Friend
  c.SpellsAdd(2382, 0);                           // Generic
  c.SpellsAdd(22027, 0);                          // Remove Insignia
  c.SpellsAdd(61437, 0);                          // Opening
  c.SpellsAdd(68398, 0);                          // Opening
  c.SpellsAdd(204, 0);                            // Defense
  c.SpellsAdd(107, 0);                            // Block
  c.SpellsAdd(81, 0);                             // Dodge
  c.SpellsAdd(522, 0);                            // SPELLDEFENSE (DND)
  c.SpellsAdd(9078, 0);                           // Cloth
  c.SpellsAdd(20154, 0);                          // Seal of Righteousness
  c.SpellsAdd(635, 0);                            // Holy Light
  c.SpellsAdd(8737, 0);                           // Mail
  c.SpellsAdd(9077, 0);                           // Leather
  c.SpellsAdd(199, 0);                            // Two-Handed Maces

  c.SetActionButtons(0, 6603, $00000000);         // Spell: Auto Attack
  c.SetActionButtons(1, 20154, $00000000);        // Spell: Seal of Righteousness
  c.SetActionButtons(2, 635, $00000000);          // Spell: Holy Light
  c.SetActionButtons(3, 59542, $00000000);        // Spell: Gift of the Naaru
  c.SetActionButtons(83, 4540, $00008000);        // Item: Tough Hunk of Bread
end;
procedure RACE_DRAENEI_CLASS_HUNTER(var c:TCharData);
begin
  c.Enum.zoneID                := 0;
  c.Enum.mapID                 := 530;
  c.Enum.position.x            := -3961.639892;
  c.Enum.position.y            := -13931.200195;
  c.Enum.position.z            := 100.614997;
  c.facing                     := 2.083643;

  c.scale_x                    := 1;
  c.power_type                 := 0;
  c.max_health                 := 56;
  c.max_power[POWER_MANA]      := 85;
  c.max_power[POWER_RAGE]      := 1000;
  c.max_power[POWER_FOCUS]     := 100;
  c.max_power[POWER_ENERGY]    := 100;
  c.max_power[POWER_HAPPINESS] := 0;
  c.max_power[POWER_RUNES]     := 8;
  c.max_power[POWER_RUNIC]     := 1000;
  c.health                     := 56;
  c.power[POWER_MANA]          := 85;
  c.power[POWER_RAGE]          := 1000;
  c.power[POWER_FOCUS]         := 100;
  c.power[POWER_ENERGY]        := 100;
  c.power[POWER_HAPPINESS]     := 0;
  c.power[POWER_RUNES]         := 8;
  c.power[POWER_RUNIC]         := 0;
  c.Enum.experienceLevel       := 1;
  c.faction_template           := 1629;
  c.flags                      := $00000008;
  c.flags2                     := $00000800;
  c.mainhand_attack_time       := 2900;
  c.offhand_attack_time        := 2000;
  c.ranged_attack_time         := 2500;
  c.bounding_radius            := 1;
  c.combat_reach               := 1.5;
  c.enum_model                 := 16125+c.Enum.sexID;
  c.native_model               := 16125+c.Enum.sexID;
  c.mount_model                := 0;
  c.min_damage                 := 7.764286;
  c.max_damage                 := 9.764286;
  c.min_offhand_damage         := 0;
  c.max_offhand_damage         := 0;
  c.mod_cast_speed             := 1;
  c.stat[0]                    := 21;
  c.stat[1]                    := 20;
  c.stat[2]                    := 21;
  c.stat[3]                    := 20;
  c.stat[4]                    := 23;
  c.resist[0]                  := 42;
  c.resist[1]                  := 0;
  c.resist[2]                  := 0;
  c.resist[3]                  := 0;
  c.resist[4]                  := 0;
  c.resist[5]                  := 0;
  c.resist[6]                  := 0;
  c.base_mana                  := 65;
  c.base_health                := 26;
  c.attack_power               := 23;
  c.ranged_attack_time         := 2500;
  c.min_ranged_damage          := 8.142857;
  c.max_ranged_damage          := 12.142857;
  c.hover_height               := 1;

  c.player_flags               := $00000000;
  c.xp                         := 0;
  c.next_level_xp              := 400;
  c.points1                    := 0;
  c.professions_left           := 2;
  c.ammo_id                    := 2512;

  c.ItemsAdd($FF,3, 23345,1, $00010000);          // Scout's Shirt
  c.ItemsAdd($FF,6, 23344,1, $00010000);          // Scout's Pants
  c.ItemsAdd($FF,7, 23348,1, $00010000);          // Scout's Boots
  c.ItemsAdd($FF,15, 12282,1, $00010000);         // Worn Battleaxe
  c.ItemsAdd($FF,17, 23347,1, $00010000);         // Weathered Crossbow
  c.ItemsAdd($FF,23, 6948,1, $00010001);          // Hearthstone

  c.SkillsAdd($0000,473, 1,0, 0,0);               // Fist Weapons
  c.SkillsAdd($0000,44, 5,0, 0,0);                // Axes
  c.SkillsAdd($0000,163, 5,5, 0,0);               // Marksmanship
  c.SkillsAdd($0000,164, 0,0, 0,0);               // Blacksmithing
  c.SkillsAdd($0000,202, 0,0, 0,0);               // Engineering
  c.SkillsAdd($0000,762, 0,0, 0,0);               // Riding
  c.SkillsAdd($0000,46, 5,0, 0,0);                // Guns
  c.SkillsAdd($0000,769, 5,0, 0,0);               // Internal
  c.SkillsAdd($0000,755, 0,0, 5,0);               // Jewelcrafting
  c.SkillsAdd($0000,51, 5,5, 0,0);                // Survival
  c.SkillsAdd($0000,760, 5,5, 0,0);               // Draenei Racial
  c.SkillsAdd($0000,98, 300,300, 0,0);            // Language: Common
  c.SkillsAdd($0000,136, 5,0, 0,0);               // Staves
  c.SkillsAdd($0000,771, 1,0, 0,0);               // Frost
  c.SkillsAdd($0000,186, 0,0, 0,0);               // Mining
  c.SkillsAdd($0000,197, 0,0, 0,0);               // Tailoring
  c.SkillsAdd($0000,333, 0,0, 0,0);               // Enchanting
  c.SkillsAdd($0000,185, 0,0, 0,0);               // Cooking
  c.SkillsAdd($0000,229, 0,0, 0,0);               // Polearms
  c.SkillsAdd($0000,777, 1,1, 0,0);               // Mounts
  c.SkillsAdd($0000,393, 0,0, 0,0);               // Skinning
  c.SkillsAdd($0000,137, 0,0, 0,0);               // Language: Thalassian
  c.SkillsAdd($0000,759, 300,300, 0,0);           // Language: Draenei
  c.SkillsAdd($0000,182, 0,0, 0,0);               // Herbalism
  c.SkillsAdd($0000,226, 5,1, 0,0);               // Crossbows
  c.SkillsAdd($0000,109, 0,0, 0,0);               // Language: Orcish
  c.SkillsAdd($0000,140, 300,0, 0,0);             // Language: Titan
  c.SkillsAdd($0000,313, 0,0, 0,0);               // Language: Gnomish
  c.SkillsAdd($0000,45, 5,0, 0,0);                // Bows
  c.SkillsAdd($0000,55, 5,0, 0,0);                // Two-Handed Swords
  c.SkillsAdd($0000,773, 0,0, 0,0);               // Inscription
  c.SkillsAdd($0000,129, 0,0, 0,0);               // First Aid
  c.SkillsAdd($0000,162, 5,1, 0,0);               // Unarmed
  c.SkillsAdd($0000,50, 5,0, 0,0);                // Beast Mastery
  c.SkillsAdd($0000,111, 0,0, 0,0);               // Language: Dwarven
  c.SkillsAdd($0000,113, 0,0, 0,0);               // Language: Darnassian
  c.SkillsAdd($0000,115, 0,0, 0,0);               // Language: Taurahe
  c.SkillsAdd($0000,315, 0,0, 0,0);               // Language: Troll
  c.SkillsAdd($0000,139, 0,0, 0,0);               // Language: Demon Tongue
  c.SkillsAdd($0000,673, 0,0, 0,0);               // Language: Gutterspeak
  c.SkillsAdd($0000,118, 0,0, 0,0);               // Dual Wield
  c.SkillsAdd($0000,138, 300,0, 0,0);             // Language: Draconic
  c.SkillsAdd($0000,141, 0,0, 0,0);               // Language: Old Tongue
  c.SkillsAdd($0000,142, 1,0, 0,0);               // Survival
  c.SkillsAdd($0000,173, 5,0, 0,0);               // Daggers
  c.SkillsAdd($0000,183, 5,5, 0,0);               // GENERIC (DND)
  c.SkillsAdd($0000,95, 5,1, 0,0);                // Defense
  c.SkillsAdd($0000,176, 5,0, 0,0);               // Thrown
  c.SkillsAdd($0000,415, 1,1, 0,0);               // Cloth
  c.SkillsAdd($0000,413, 0,0, 0,0);               // Mail
  c.SkillsAdd($0000,414, 1,1, 0,0);               // Leather
  c.SkillsAdd($0000,356, 0,0, 0,0);               // Fishing
  c.SkillsAdd($0000,171, 0,0, 0,0);               // Alchemy
  c.SkillsAdd($0000,172, 5,1, 0,0);               // Two-Handed Axes
  c.SkillsAdd($0000,43, 5,1, 0,0);                // Swords
  c.SkillsAdd($0000,778, 1,0, 0,0);               // Companions
  c.SkillsAdd($0000,165, 0,0, 0,0);               // Leatherworking

  c.SpellsAdd(75, 0);                             // Auto Shot
  c.SpellsAdd(2973, 0);                           // Raptor Strike
  c.SpellsAdd(59543, 0);                          // Gift of the Naaru
  c.SpellsAdd(6562, 0);                           // Heroic Presence
  c.SpellsAdd(28875, 0);                          // Gemcutting
  c.SpellsAdd(59536, 0);                          // Shadow Resistance
  c.SpellsAdd(668, 0);                            // Language Common
  c.SpellsAdd(29932, 0);                          // Language Draenei
  c.SpellsAdd(5011, 0);                           // Crossbows
  c.SpellsAdd(203, 0);                            // Unarmed
  c.SpellsAdd(21651, 0);                          // Opening
  c.SpellsAdd(21652, 0);                          // Closing
  c.SpellsAdd(22810, 0);                          // Opening - No Text
  c.SpellsAdd(8386, 0);                           // Attacking
  c.SpellsAdd(3365, 0);                           // Opening
  c.SpellsAdd(3050, 0);                           // Detect
  c.SpellsAdd(9125, 0);                           // Generic
  c.SpellsAdd(7266, 0);                           // Duel
  c.SpellsAdd(7267, 0);                           // Grovel
  c.SpellsAdd(7355, 0);                           // Stuck
  c.SpellsAdd(6478, 0);                           // Opening
  c.SpellsAdd(6603, 0);                           // Auto Attack
  c.SpellsAdd(6233, 0);                           // Closing
  c.SpellsAdd(6246, 0);                           // Closing
  c.SpellsAdd(6247, 0);                           // Opening
  c.SpellsAdd(6477, 0);                           // Opening
  c.SpellsAdd(2479, 0);                           // Honorless Target
  c.SpellsAdd(45927, 0);                          // Summon Friend
  c.SpellsAdd(2382, 0);                           // Generic
  c.SpellsAdd(22027, 0);                          // Remove Insignia
  c.SpellsAdd(34082, 0);                          // Advantaged State (DND)
  c.SpellsAdd(61437, 0);                          // Opening
  c.SpellsAdd(68398, 0);                          // Opening
  c.SpellsAdd(204, 0);                            // Defense
  c.SpellsAdd(24949, 0);                          // Defensive State 2 (DND)
  c.SpellsAdd(13358, 0);                          // Defensive State (DND)
  c.SpellsAdd(81, 0);                             // Dodge
  c.SpellsAdd(522, 0);                            // SPELLDEFENSE (DND)
  c.SpellsAdd(9078, 0);                           // Cloth
  c.SpellsAdd(9077, 0);                           // Leather
  c.SpellsAdd(197, 0);                            // Two-Handed Axes
  c.SpellsAdd(201, 0);                            // One-Handed Swords

  c.SetActionButtons(0, 6603, $00000000);         // Spell: Auto Attack
  c.SetActionButtons(1, 2973, $00000000);         // Spell: Raptor Strike
  c.SetActionButtons(2, 75, $00000000);           // Spell: Auto Shot
  c.SetActionButtons(3, 59543, $00000000);        // Spell: Gift of the Naaru
  c.SetActionButtons(72, 6603, $00000000);        // Spell: Auto Attack
  c.SetActionButtons(73, 2973, $00000000);        // Spell: Raptor Strike
  c.SetActionButtons(74, 75, $00000000);          // Spell: Auto Shot
  c.SetActionButtons(82, 159, $00008000);         // Item: Refreshing Spring Water
  c.SetActionButtons(83, 4540, $00008000);        // Item: Tough Hunk of Bread
end;
procedure RACE_DRAENEI_CLASS_PRIEST(var c:TCharData);
begin
  c.Enum.zoneID                := 0;
  c.Enum.mapID                 := 530;
  c.Enum.position.x            := -3961.639892;
  c.Enum.position.y            := -13931.200195;
  c.Enum.position.z            := 100.614997;
  c.facing                     := 2.083643;

  c.scale_x                    := 1;
  c.power_type                 := 0;
  c.max_health                 := 52;
  c.max_power[POWER_MANA]      := 160;
  c.max_power[POWER_RAGE]      := 1000;
  c.max_power[POWER_FOCUS]     := 100;
  c.max_power[POWER_ENERGY]    := 100;
  c.max_power[POWER_HAPPINESS] := 0;
  c.max_power[POWER_RUNES]     := 8;
  c.max_power[POWER_RUNIC]     := 1000;
  c.health                     := 52;
  c.power[POWER_MANA]          := 160;
  c.power[POWER_RAGE]          := 1000;
  c.power[POWER_FOCUS]         := 100;
  c.power[POWER_ENERGY]        := 100;
  c.power[POWER_HAPPINESS]     := 0;
  c.power[POWER_RUNES]         := 8;
  c.power[POWER_RUNIC]         := 0;
  c.Enum.experienceLevel       := 1;
  c.faction_template           := 1629;
  c.flags                      := $00000008;
  c.flags2                     := $00000800;
  c.mainhand_attack_time       := 2900;
  c.offhand_attack_time        := 2000;
  c.ranged_attack_time         := 0;
  c.bounding_radius            := 1;
  c.combat_reach               := 1.5;
  c.enum_model                 := 16125+c.Enum.sexID;
  c.native_model               := 16125+c.Enum.sexID;
  c.mount_model                := 0;
  c.min_damage                 := 7.557143;
  c.max_damage                 := 9.557143;
  c.min_offhand_damage         := 0;
  c.max_offhand_damage         := 0;
  c.mod_cast_speed             := 1;
  c.stat[0]                    := 21;
  c.stat[1]                    := 17;
  c.stat[2]                    := 20;
  c.stat[3]                    := 22;
  c.stat[4]                    := 25;
  c.resist[0]                  := 39;
  c.resist[1]                  := 0;
  c.resist[2]                  := 0;
  c.resist[3]                  := 0;
  c.resist[4]                  := 0;
  c.resist[5]                  := 0;
  c.resist[6]                  := 0;
  c.base_mana                  := 110;
  c.base_health                := 32;
  c.attack_power               := 22;
  c.ranged_attack_time         := 0;
  c.min_ranged_damage          := 0;
  c.max_ranged_damage          := 0;
  c.hover_height               := 1;

  c.player_flags               := $00000000;
  c.xp                         := 0;
  c.next_level_xp              := 400;
  c.points1                    := 0;
  c.professions_left           := 2;
  c.ammo_id                    := 0;

  c.ItemsAdd($FF,3, 6097,1, $00010000);           // Acolyte's Shirt
  c.ItemsAdd($FF,4, 23322,1, $00010000);          // Acolyte's Robe
  c.ItemsAdd($FF,6, 1396,1, $00010000);           // Acolyte's Pants
  c.ItemsAdd($FF,15, 3661,1, $00010000);          // Handcrafted Staff
  c.ItemsAdd($FF,23, 6948,1, $00010001);          // Hearthstone

  c.SkillsAdd($0000,164, 0,0, 0,0);               // Blacksmithing
  c.SkillsAdd($0000,202, 0,0, 0,0);               // Engineering
  c.SkillsAdd($0000,762, 0,0, 0,0);               // Riding
  c.SkillsAdd($0000,769, 5,0, 0,0);               // Internal
  c.SkillsAdd($0000,755, 0,0, 5,0);               // Jewelcrafting
  c.SkillsAdd($0000,760, 5,5, 0,0);               // Draenei Racial
  c.SkillsAdd($0000,98, 300,300, 0,0);            // Language: Common
  c.SkillsAdd($0000,136, 5,1, 0,0);               // Staves
  c.SkillsAdd($0000,54, 5,1, 0,0);                // Maces
  c.SkillsAdd($0000,771, 1,0, 0,0);               // Frost
  c.SkillsAdd($0000,186, 0,0, 0,0);               // Mining
  c.SkillsAdd($0000,197, 0,0, 0,0);               // Tailoring
  c.SkillsAdd($0000,333, 0,0, 0,0);               // Enchanting
  c.SkillsAdd($0000,185, 0,0, 0,0);               // Cooking
  c.SkillsAdd($0000,777, 1,1, 0,0);               // Mounts
  c.SkillsAdd($0000,393, 0,0, 0,0);               // Skinning
  c.SkillsAdd($0000,137, 0,0, 0,0);               // Language: Thalassian
  c.SkillsAdd($0000,759, 300,300, 0,0);           // Language: Draenei
  c.SkillsAdd($0000,182, 0,0, 0,0);               // Herbalism
  c.SkillsAdd($0000,228, 5,1, 0,0);               // Wands
  c.SkillsAdd($0000,109, 0,0, 0,0);               // Language: Orcish
  c.SkillsAdd($0000,140, 300,0, 0,0);             // Language: Titan
  c.SkillsAdd($0000,313, 0,0, 0,0);               // Language: Gnomish
  c.SkillsAdd($0000,613, 5,0, 0,0);               // Discipline
  c.SkillsAdd($0000,773, 0,0, 0,0);               // Inscription
  c.SkillsAdd($0000,129, 0,0, 0,0);               // First Aid
  c.SkillsAdd($0000,162, 5,1, 0,0);               // Unarmed
  c.SkillsAdd($0000,56, 5,5, 0,0);                // Holy
  c.SkillsAdd($0000,111, 0,0, 0,0);               // Language: Dwarven
  c.SkillsAdd($0000,113, 0,0, 0,0);               // Language: Darnassian
  c.SkillsAdd($0000,115, 0,0, 0,0);               // Language: Taurahe
  c.SkillsAdd($0000,315, 0,0, 0,0);               // Language: Troll
  c.SkillsAdd($0000,139, 0,0, 0,0);               // Language: Demon Tongue
  c.SkillsAdd($0000,673, 0,0, 0,0);               // Language: Gutterspeak
  c.SkillsAdd($0000,138, 300,0, 0,0);             // Language: Draconic
  c.SkillsAdd($0000,141, 0,0, 0,0);               // Language: Old Tongue
  c.SkillsAdd($0000,142, 1,0, 0,0);               // Survival
  c.SkillsAdd($0000,173, 5,0, 0,0);               // Daggers
  c.SkillsAdd($0000,183, 5,5, 0,0);               // GENERIC (DND)
  c.SkillsAdd($0000,95, 5,1, 0,0);                // Defense
  c.SkillsAdd($0000,415, 1,1, 0,0);               // Cloth
  c.SkillsAdd($0000,356, 0,0, 0,0);               // Fishing
  c.SkillsAdd($0000,171, 0,0, 0,0);               // Alchemy
  c.SkillsAdd($0000,78, 5,0, 0,0);                // Shadow Magic
  c.SkillsAdd($0000,778, 1,0, 0,0);               // Companions
  c.SkillsAdd($0000,165, 0,0, 0,0);               // Leatherworking

  c.SpellsAdd(59538, 0);                          // Shadow Resistance
  c.SpellsAdd(28875, 0);                          // Gemcutting
  c.SpellsAdd(28878, 0);                          // Heroic Presence
  c.SpellsAdd(59544, 0);                          // Gift of the Naaru
  c.SpellsAdd(668, 0);                            // Language Common
  c.SpellsAdd(227, 0);                            // Staves
  c.SpellsAdd(198, 0);                            // One-Handed Maces
  c.SpellsAdd(29932, 0);                          // Language Draenei
  c.SpellsAdd(5009, 0);                           // Wands
  c.SpellsAdd(5019, 0);                           // Shoot
  c.SpellsAdd(203, 0);                            // Unarmed
  c.SpellsAdd(2050, 0);                           // Lesser Heal
  c.SpellsAdd(585, 0);                            // Smite
  c.SpellsAdd(21651, 0);                          // Opening
  c.SpellsAdd(21652, 0);                          // Closing
  c.SpellsAdd(22810, 0);                          // Opening - No Text
  c.SpellsAdd(8386, 0);                           // Attacking
  c.SpellsAdd(3365, 0);                           // Opening
  c.SpellsAdd(3050, 0);                           // Detect
  c.SpellsAdd(9125, 0);                           // Generic
  c.SpellsAdd(7266, 0);                           // Duel
  c.SpellsAdd(7267, 0);                           // Grovel
  c.SpellsAdd(7355, 0);                           // Stuck
  c.SpellsAdd(6478, 0);                           // Opening
  c.SpellsAdd(6603, 0);                           // Auto Attack
  c.SpellsAdd(6233, 0);                           // Closing
  c.SpellsAdd(6246, 0);                           // Closing
  c.SpellsAdd(6247, 0);                           // Opening
  c.SpellsAdd(6477, 0);                           // Opening
  c.SpellsAdd(2479, 0);                           // Honorless Target
  c.SpellsAdd(45927, 0);                          // Summon Friend
  c.SpellsAdd(2382, 0);                           // Generic
  c.SpellsAdd(22027, 0);                          // Remove Insignia
  c.SpellsAdd(61437, 0);                          // Opening
  c.SpellsAdd(68398, 0);                          // Opening
  c.SpellsAdd(204, 0);                            // Defense
  c.SpellsAdd(81, 0);                             // Dodge
  c.SpellsAdd(522, 0);                            // SPELLDEFENSE (DND)
  c.SpellsAdd(9078, 0);                           // Cloth

  c.SetActionButtons(0, 585, $00000000);          // Spell: Smite
  c.SetActionButtons(1, 2050, $00000000);         // Spell: Lesser Heal
  c.SetActionButtons(2, 59544, $00000000);        // Spell: Gift of the Naaru
  c.SetActionButtons(83, 4540, $00008000);        // Item: Tough Hunk of Bread
end;
procedure RACE_DRAENEI_CLASS_DEATHKNIGHT(var c:TCharData);
begin
  c.Enum.zoneID                := 0;
  c.Enum.mapID                 := 609;
  c.Enum.position.x            := 2358.169921;
  c.Enum.position.y            := -5663.209960;
  c.Enum.position.z            := 426.027008;
  c.facing                     := 3.711024;

  c.scale_x                    := 1;
  c.power_type                 := 6;
  c.max_health                 := 3169;
  c.max_power[POWER_MANA]      := 0;
  c.max_power[POWER_RAGE]      := 1000;
  c.max_power[POWER_FOCUS]     := 100;
  c.max_power[POWER_ENERGY]    := 100;
  c.max_power[POWER_HAPPINESS] := 0;
  c.max_power[POWER_RUNES]     := 8;
  c.max_power[POWER_RUNIC]     := 1000;
  c.health                     := 3169;
  c.power[POWER_MANA]          := 0;
  c.power[POWER_RAGE]          := 1000;
  c.power[POWER_FOCUS]         := 100;
  c.power[POWER_ENERGY]        := 100;
  c.power[POWER_HAPPINESS]     := 0;
  c.power[POWER_RUNES]         := 8;
  c.power[POWER_RUNIC]         := 0;
  c.Enum.experienceLevel       := 55;
  c.faction_template           := 1629;
  c.flags                      := $00000008;
  c.flags2                     := $00000800;
  c.mainhand_attack_time       := 2000;
  c.offhand_attack_time        := 2000;
  c.ranged_attack_time         := 0;
  c.bounding_radius            := 1;
  c.combat_reach               := 1.5;
  c.enum_model                 := 16125+c.Enum.sexID;
  c.native_model               := 16125+c.Enum.sexID;
  c.mount_model                := 0;
  c.min_damage                 := 108.100006;
  c.max_damage                 := 108.100006;
  c.min_offhand_damage         := 0;
  c.max_offhand_damage         := 0;
  c.mod_cast_speed             := 1;
  c.stat[0]                    := 253;
  c.stat[1]                    := 108;
  c.stat[2]                    := 199;
  c.stat[3]                    := 29;
  c.stat[4]                    := 44;
  c.resist[0]                  := 3531;
  c.resist[1]                  := 0;
  c.resist[2]                  := 0;
  c.resist[3]                  := 0;
  c.resist[4]                  := 0;
  c.resist[5]                  := 0;
  c.resist[6]                  := 0;
  c.base_mana                  := 0;
  c.base_health                := 1359;
  c.attack_power               := 651;
  c.ranged_attack_time         := 0;
  c.min_ranged_damage          := 0;
  c.max_ranged_damage          := 0;
  c.hover_height               := 1;

  c.player_flags               := $00000020;
  c.xp                         := 815;
  c.next_level_xp              := 148200;
  c.points1                    := 0;
  c.professions_left           := 2;
  c.ammo_id                    := 0;

  c.ItemsAdd($FF,0, 34652,1, $00010001);          // Acherus Knight's Hood
  c.ItemsAdd($FF,1, 34657,1, $00010001);          // Choker of Damnation
  c.ItemsAdd($FF,2, 34655,1, $00010001);          // Acherus Knight's Pauldrons
  c.ItemsAdd($FF,4, 34650,1, $00010001);          // Acherus Knight's Tunic
  c.ItemsAdd($FF,5, 34651,1, $00010001);          // Acherus Knight's Girdle
  c.ItemsAdd($FF,6, 34656,1, $00010001);          // Acherus Knight's Cover
  c.ItemsAdd($FF,7, 34648,1, $00010001);          // Acherus Knight's Greaves
  c.ItemsAdd($FF,8, 34653,1, $00010001);          // Acherus Knight's Wristguard
  c.ItemsAdd($FF,9, 34649,1, $00010001);          // Acherus Knight's Gauntlets
  c.ItemsAdd($FF,10, 34658,1, $00010001);         // Plague Band
  c.ItemsAdd($FF,11, 38147,1, $00010001);         // Corrupted Band
  c.ItemsAdd($FF,14, 34659,1, $00010001);         // Acherus Knight's Shroud
  c.ItemsAdd($FF,23, 41751,10, $00010000);        // Black Mushroom

  c.SkillsAdd($0000,44, 275,270, 0,0);            // Axes
  c.SkillsAdd($0000,164, 0,0, 0,0);               // Blacksmithing
  c.SkillsAdd($0000,202, 0,0, 0,0);               // Engineering
  c.SkillsAdd($0002,762, 150,150, 0,0);           // Riding
  c.SkillsAdd($0000,769, 275,0, 0,0);             // Internal
  c.SkillsAdd($0000,755, 0,0, 5,0);               // Jewelcrafting
  c.SkillsAdd($0000,760, 275,275, 0,0);           // Draenei Racial
  c.SkillsAdd($0000,98, 300,300, 0,0);            // Language: Common
  c.SkillsAdd($0000,54, 275,0, 0,0);              // Maces
  c.SkillsAdd($0000,770, 275,275, 0,0);           // Blood
  c.SkillsAdd($0000,771, 275,275, 0,0);           // Frost
  c.SkillsAdd($0000,772, 275,275, 0,0);           // Unholy
  c.SkillsAdd($0000,186, 0,0, 0,0);               // Mining
  c.SkillsAdd($0000,197, 0,0, 0,0);               // Tailoring
  c.SkillsAdd($0000,776, 1,0, 0,0);               // Runeforging
  c.SkillsAdd($0000,333, 0,0, 0,0);               // Enchanting
  c.SkillsAdd($0000,185, 0,0, 0,0);               // Cooking
  c.SkillsAdd($0000,229, 275,270, 0,0);           // Polearms
  c.SkillsAdd($0000,777, 1,1, 0,0);               // Mounts
  c.SkillsAdd($0000,393, 0,0, 0,0);               // Skinning
  c.SkillsAdd($0000,759, 300,300, 0,0);           // Language: Draenei
  c.SkillsAdd($0000,182, 0,0, 0,0);               // Herbalism
  c.SkillsAdd($0000,140, 300,0, 0,0);             // Language: Titan
  c.SkillsAdd($0000,55, 275,270, 0,0);            // Two-Handed Swords
  c.SkillsAdd($0000,773, 0,0, 0,0);               // Inscription
  c.SkillsAdd($0004,129, 300,270, 0,0);           // First Aid
  c.SkillsAdd($0000,162, 275,270, 0,0);           // Unarmed
  c.SkillsAdd($0000,139, 0,0, 0,0);               // Language: Demon Tongue
  c.SkillsAdd($0000,293, 1,1, 0,0);               // Plate Mail
  c.SkillsAdd($0000,118, 275,275, 0,0);           // Dual Wield
  c.SkillsAdd($0000,138, 300,0, 0,0);             // Language: Draconic
  c.SkillsAdd($0000,141, 0,0, 0,0);               // Language: Old Tongue
  c.SkillsAdd($0000,142, 1,0, 0,0);               // Survival
  c.SkillsAdd($0000,183, 275,275, 0,0);           // GENERIC (DND)
  c.SkillsAdd($0000,95, 275,270, 0,0);            // Defense
  c.SkillsAdd($0000,415, 1,1, 0,0);               // Cloth
  c.SkillsAdd($0000,413, 1,1, 0,0);               // Mail
  c.SkillsAdd($0000,414, 1,1, 0,0);               // Leather
  c.SkillsAdd($0000,356, 0,0, 0,0);               // Fishing
  c.SkillsAdd($0000,171, 0,0, 0,0);               // Alchemy
  c.SkillsAdd($0000,172, 275,270, 0,0);           // Two-Handed Axes
  c.SkillsAdd($0000,43, 275,270, 0,0);            // Swords
  c.SkillsAdd($0000,778, 1,0, 0,0);               // Companions
  c.SkillsAdd($0000,160, 275,0, 0,0);             // Two-Handed Maces
  c.SkillsAdd($0000,165, 0,0, 0,0);               // Leatherworking

  c.SpellsAdd(196, 0);                            // One-Handed Axes
  c.SpellsAdd(33391, 0);                          // Journeyman Riding
  c.SpellsAdd(6562, 0);                           // Heroic Presence
  c.SpellsAdd(28875, 0);                          // Gemcutting
  c.SpellsAdd(59545, 0);                          // Gift of the Naaru
  c.SpellsAdd(59539, 0);                          // Shadow Resistance
  c.SpellsAdd(668, 0);                            // Language Common
  c.SpellsAdd(48266, 0);                          // Blood Presence
  c.SpellsAdd(45902, 0);                          // Blood Strike
  c.SpellsAdd(49410, 0);                          // Forceful Deflection
  c.SpellsAdd(45477, 0);                          // Icy Touch
  c.SpellsAdd(59921, 0);                          // Frost Fever
  c.SpellsAdd(61455, 0);                          // Runic Focus
  c.SpellsAdd(47541, 0);                          // Death Coil
  c.SpellsAdd(49576, 0);                          // Death Grip
  c.SpellsAdd(45462, 0);                          // Plague Strike
  c.SpellsAdd(59879, 0);                          // Blood Plague
  c.SpellsAdd(200, 0);                            // Polearms
  c.SpellsAdd(29932, 0);                          // Language Draenei
  c.SpellsAdd(202, 0);                            // Two-Handed Swords
  c.SpellsAdd(3275, 0);                           // Linen Bandage
  c.SpellsAdd(10846, 0);                          // First Aid
  c.SpellsAdd(7934, 0);                           // Anti-Venom
  c.SpellsAdd(3276, 0);                           // Heavy Linen Bandage
  c.SpellsAdd(3277, 0);                           // Wool Bandage
  c.SpellsAdd(3278, 0);                           // Heavy Wool Bandage
  c.SpellsAdd(7928, 0);                           // Silk Bandage
  c.SpellsAdd(7929, 0);                           // Heavy Silk Bandage
  c.SpellsAdd(10840, 0);                          // Mageweave Bandage
  c.SpellsAdd(10841, 0);                          // Heavy Mageweave Bandage
  c.SpellsAdd(18629, 0);                          // Runecloth Bandage
  c.SpellsAdd(18630, 0);                          // Heavy Runecloth Bandage
  c.SpellsAdd(203, 0);                            // Unarmed
  c.SpellsAdd(750, 0);                            // Plate Mail
  c.SpellsAdd(674, 0);                            // Dual Wield
  c.SpellsAdd(21651, 0);                          // Opening
  c.SpellsAdd(21652, 0);                          // Closing
  c.SpellsAdd(22810, 0);                          // Opening - No Text
  c.SpellsAdd(8386, 0);                           // Attacking
  c.SpellsAdd(3365, 0);                           // Opening
  c.SpellsAdd(3050, 0);                           // Detect
  c.SpellsAdd(9125, 0);                           // Generic
  c.SpellsAdd(7266, 0);                           // Duel
  c.SpellsAdd(7267, 0);                           // Grovel
  c.SpellsAdd(7355, 0);                           // Stuck
  c.SpellsAdd(6478, 0);                           // Opening
  c.SpellsAdd(6603, 0);                           // Auto Attack
  c.SpellsAdd(6233, 0);                           // Closing
  c.SpellsAdd(6246, 0);                           // Closing
  c.SpellsAdd(6247, 0);                           // Opening
  c.SpellsAdd(6477, 0);                           // Opening
  c.SpellsAdd(2479, 0);                           // Honorless Target
  c.SpellsAdd(45927, 0);                          // Summon Friend
  c.SpellsAdd(2382, 0);                           // Generic
  c.SpellsAdd(22027, 0);                          // Remove Insignia
  c.SpellsAdd(52665, 0);                          // Sigil
  c.SpellsAdd(61437, 0);                          // Opening
  c.SpellsAdd(68398, 0);                          // Opening
  c.SpellsAdd(63645, 0);                          // Activate Primary Spec
  c.SpellsAdd(63644, 0);                          // Activate Secondary Spec
  c.SpellsAdd(204, 0);                            // Defense
  c.SpellsAdd(45903, 0);                          // Offensive State (DND)
  c.SpellsAdd(81, 0);                             // Dodge
  c.SpellsAdd(522, 0);                            // SPELLDEFENSE (DND)
  c.SpellsAdd(3127, 0);                           // Parry
  c.SpellsAdd(9078, 0);                           // Cloth
  c.SpellsAdd(8737, 0);                           // Mail
  c.SpellsAdd(9077, 0);                           // Leather
  c.SpellsAdd(197, 0);                            // Two-Handed Axes
  c.SpellsAdd(201, 0);                            // One-Handed Swords

  c.SetActionButtons(0, 6603, $00000000);         // Spell: Auto Attack
  c.SetActionButtons(1, 49576, $00000000);        // Spell: Death Grip
  c.SetActionButtons(2, 45477, $00000000);        // Spell: Icy Touch
  c.SetActionButtons(3, 45462, $00000000);        // Spell: Plague Strike
  c.SetActionButtons(4, 45902, $00000000);        // Spell: Blood Strike
  c.SetActionButtons(5, 47541, $00000000);        // Spell: Death Coil
  c.SetActionButtons(10, 59545, $00000000);       // Spell: Gift of the Naaru
end;
procedure RACE_DRAENEI_CLASS_SHAMAN(var c:TCharData);
begin
  c.Enum.zoneID                := 0;
  c.Enum.mapID                 := 530;
  c.Enum.position.x            := -3961.639892;
  c.Enum.position.y            := -13931.200195;
  c.Enum.position.z            := 100.614997;
  c.facing                     := 2.083643;

  c.scale_x                    := 1;
  c.power_type                 := 0;
  c.max_health                 := 59;
  c.max_power[POWER_MANA]      := 90;
  c.max_power[POWER_RAGE]      := 1000;
  c.max_power[POWER_FOCUS]     := 100;
  c.max_power[POWER_ENERGY]    := 100;
  c.max_power[POWER_HAPPINESS] := 0;
  c.max_power[POWER_RUNES]     := 8;
  c.max_power[POWER_RUNIC]     := 1000;
  c.health                     := 59;
  c.power[POWER_MANA]          := 90;
  c.power[POWER_RAGE]          := 1000;
  c.power[POWER_FOCUS]         := 100;
  c.power[POWER_ENERGY]        := 100;
  c.power[POWER_HAPPINESS]     := 0;
  c.power[POWER_RUNES]         := 8;
  c.power[POWER_RUNIC]         := 0;
  c.Enum.experienceLevel       := 1;
  c.faction_template           := 1629;
  c.flags                      := $00000008;
  c.flags2                     := $00000800;
  c.mainhand_attack_time       := 1900;
  c.offhand_attack_time        := 2000;
  c.ranged_attack_time         := 0;
  c.bounding_radius            := 1;
  c.combat_reach               := 1.5;
  c.enum_model                 := 16125+c.Enum.sexID;
  c.native_model               := 16125+c.Enum.sexID;
  c.mount_model                := 0;
  c.min_damage                 := 3.850000;
  c.max_damage                 := 5.850000;
  c.min_offhand_damage         := 0;
  c.max_offhand_damage         := 0;
  c.mod_cast_speed             := 1;
  c.stat[0]                    := 22;
  c.stat[1]                    := 17;
  c.stat[2]                    := 21;
  c.stat[3]                    := 21;
  c.stat[4]                    := 24;
  c.resist[0]                  := 41;
  c.resist[1]                  := 0;
  c.resist[2]                  := 0;
  c.resist[3]                  := 0;
  c.resist[4]                  := 0;
  c.resist[5]                  := 0;
  c.resist[6]                  := 0;
  c.base_mana                  := 55;
  c.base_health                := 29;
  c.attack_power               := 21;
  c.ranged_attack_time         := 0;
  c.min_ranged_damage          := 1.950000;
  c.max_ranged_damage          := 1.950000;
  c.hover_height               := 1;

  c.player_flags               := $00000000;
  c.xp                         := 0;
  c.next_level_xp              := 400;
  c.points1                    := 0;
  c.professions_left           := 2;
  c.ammo_id                    := 0;

  c.ItemsAdd($FF,3, 23345,1, $00010000);          // Scout's Shirt
  c.ItemsAdd($FF,6, 23344,1, $00010000);          // Scout's Pants
  c.ItemsAdd($FF,7, 23348,1, $00010000);          // Scout's Boots
  c.ItemsAdd($FF,15, 36,1, $00010000);            // Worn Mace
  c.ItemsAdd($FF,16, 2362,1, $00010000);          // Worn Wooden Shield
  c.ItemsAdd($FF,23, 6948,1, $00010001);          // Hearthstone

  c.SkillsAdd($0000,473, 1,0, 0,0);               // Fist Weapons
  c.SkillsAdd($0000,44, 5,0, 0,0);                // Axes
  c.SkillsAdd($0000,164, 0,0, 0,0);               // Blacksmithing
  c.SkillsAdd($0000,202, 0,0, 0,0);               // Engineering
  c.SkillsAdd($0000,762, 0,0, 0,0);               // Riding
  c.SkillsAdd($0000,769, 5,0, 0,0);               // Internal
  c.SkillsAdd($0000,755, 0,0, 5,0);               // Jewelcrafting
  c.SkillsAdd($0000,760, 5,5, 0,0);               // Draenei Racial
  c.SkillsAdd($0000,98, 300,300, 0,0);            // Language: Common
  c.SkillsAdd($0000,136, 5,1, 0,0);               // Staves
  c.SkillsAdd($0000,54, 5,1, 0,0);                // Maces
  c.SkillsAdd($0000,771, 1,0, 0,0);               // Frost
  c.SkillsAdd($0000,186, 0,0, 0,0);               // Mining
  c.SkillsAdd($0000,197, 0,0, 0,0);               // Tailoring
  c.SkillsAdd($0000,333, 0,0, 0,0);               // Enchanting
  c.SkillsAdd($0000,185, 0,0, 0,0);               // Cooking
  c.SkillsAdd($0000,374, 5,5, 0,0);               // Restoration
  c.SkillsAdd($0000,777, 1,1, 0,0);               // Mounts
  c.SkillsAdd($0000,393, 0,0, 0,0);               // Skinning
  c.SkillsAdd($0000,137, 0,0, 0,0);               // Language: Thalassian
  c.SkillsAdd($0000,759, 300,300, 0,0);           // Language: Draenei
  c.SkillsAdd($0000,182, 0,0, 0,0);               // Herbalism
  c.SkillsAdd($0000,109, 0,0, 0,0);               // Language: Orcish
  c.SkillsAdd($0000,433, 1,1, 0,0);               // Shield
  c.SkillsAdd($0000,140, 300,0, 0,0);             // Language: Titan
  c.SkillsAdd($0000,313, 0,0, 0,0);               // Language: Gnomish
  c.SkillsAdd($0000,773, 0,0, 0,0);               // Inscription
  c.SkillsAdd($0000,129, 0,0, 0,0);               // First Aid
  c.SkillsAdd($0000,162, 5,1, 0,0);               // Unarmed
  c.SkillsAdd($0000,111, 0,0, 0,0);               // Language: Dwarven
  c.SkillsAdd($0000,113, 0,0, 0,0);               // Language: Darnassian
  c.SkillsAdd($0000,115, 0,0, 0,0);               // Language: Taurahe
  c.SkillsAdd($0000,315, 0,0, 0,0);               // Language: Troll
  c.SkillsAdd($0000,139, 0,0, 0,0);               // Language: Demon Tongue
  c.SkillsAdd($0000,373, 5,0, 0,0);               // Enhancement
  c.SkillsAdd($0000,673, 0,0, 0,0);               // Language: Gutterspeak
  c.SkillsAdd($0000,118, 5,0, 0,0);               // Dual Wield
  c.SkillsAdd($0000,138, 300,0, 0,0);             // Language: Draconic
  c.SkillsAdd($0000,141, 0,0, 0,0);               // Language: Old Tongue
  c.SkillsAdd($0000,142, 1,0, 0,0);               // Survival
  c.SkillsAdd($0000,173, 5,0, 0,0);               // Daggers
  c.SkillsAdd($0000,183, 5,5, 0,0);               // GENERIC (DND)
  c.SkillsAdd($0000,95, 5,1, 0,0);                // Defense
  c.SkillsAdd($0000,375, 5,5, 0,0);               // Elemental Combat
  c.SkillsAdd($0000,415, 1,1, 0,0);               // Cloth
  c.SkillsAdd($0000,413, 0,0, 0,0);               // Mail
  c.SkillsAdd($0000,414, 1,1, 0,0);               // Leather
  c.SkillsAdd($0000,356, 0,0, 0,0);               // Fishing
  c.SkillsAdd($0000,171, 0,0, 0,0);               // Alchemy
  c.SkillsAdd($0000,172, 5,0, 0,0);               // Two-Handed Axes
  c.SkillsAdd($0000,778, 1,0, 0,0);               // Companions
  c.SkillsAdd($0000,160, 5,0, 0,0);               // Two-Handed Maces
  c.SkillsAdd($0000,165, 0,0, 0,0);               // Leatherworking

  c.SpellsAdd(28875, 0);                          // Gemcutting
  c.SpellsAdd(28878, 0);                          // Heroic Presence
  c.SpellsAdd(59547, 0);                          // Gift of the Naaru
  c.SpellsAdd(59540, 0);                          // Shadow Resistance
  c.SpellsAdd(668, 0);                            // Language Common
  c.SpellsAdd(227, 0);                            // Staves
  c.SpellsAdd(198, 0);                            // One-Handed Maces
  c.SpellsAdd(331, 0);                            // Healing Wave
  c.SpellsAdd(29932, 0);                          // Language Draenei
  c.SpellsAdd(9116, 0);                           // Shield
  c.SpellsAdd(203, 0);                            // Unarmed
  c.SpellsAdd(21651, 0);                          // Opening
  c.SpellsAdd(21652, 0);                          // Closing
  c.SpellsAdd(22810, 0);                          // Opening - No Text
  c.SpellsAdd(8386, 0);                           // Attacking
  c.SpellsAdd(27763, 0);                          // Totem
  c.SpellsAdd(3365, 0);                           // Opening
  c.SpellsAdd(3050, 0);                           // Detect
  c.SpellsAdd(9125, 0);                           // Generic
  c.SpellsAdd(7266, 0);                           // Duel
  c.SpellsAdd(7267, 0);                           // Grovel
  c.SpellsAdd(7355, 0);                           // Stuck
  c.SpellsAdd(6478, 0);                           // Opening
  c.SpellsAdd(6603, 0);                           // Auto Attack
  c.SpellsAdd(6233, 0);                           // Closing
  c.SpellsAdd(6246, 0);                           // Closing
  c.SpellsAdd(6247, 0);                           // Opening
  c.SpellsAdd(6477, 0);                           // Opening
  c.SpellsAdd(2479, 0);                           // Honorless Target
  c.SpellsAdd(45927, 0);                          // Summon Friend
  c.SpellsAdd(2382, 0);                           // Generic
  c.SpellsAdd(22027, 0);                          // Remove Insignia
  c.SpellsAdd(61437, 0);                          // Opening
  c.SpellsAdd(68398, 0);                          // Opening
  c.SpellsAdd(204, 0);                            // Defense
  c.SpellsAdd(107, 0);                            // Block
  c.SpellsAdd(81, 0);                             // Dodge
  c.SpellsAdd(522, 0);                            // SPELLDEFENSE (DND)
  c.SpellsAdd(403, 0);                            // Lightning Bolt
  c.SpellsAdd(75461, 0);                          // Flame Shock Passive
  c.SpellsAdd(9078, 0);                           // Cloth
  c.SpellsAdd(9077, 0);                           // Leather

  c.SetActionButtons(0, 6603, $00000000);         // Spell: Auto Attack
  c.SetActionButtons(1, 403, $00000000);          // Spell: Lightning Bolt
  c.SetActionButtons(2, 331, $00000000);          // Spell: Healing Wave
  c.SetActionButtons(3, 59547, $00000000);        // Spell: Gift of the Naaru
end;
procedure RACE_DRAENEI_CLASS_MAGE(var c:TCharData);
begin
  c.Enum.zoneID                := 0;
  c.Enum.mapID                 := 530;
  c.Enum.position.x            := -3961.639892;
  c.Enum.position.y            := -13931.200195;
  c.Enum.position.z            := 100.614997;
  c.facing                     := 2.083643;

  c.scale_x                    := 1;
  c.power_type                 := 0;
  c.max_health                 := 52;
  c.max_power[POWER_MANA]      := 165;
  c.max_power[POWER_RAGE]      := 1000;
  c.max_power[POWER_FOCUS]     := 100;
  c.max_power[POWER_ENERGY]    := 100;
  c.max_power[POWER_HAPPINESS] := 0;
  c.max_power[POWER_RUNES]     := 8;
  c.max_power[POWER_RUNIC]     := 1000;
  c.health                     := 52;
  c.power[POWER_MANA]          := 165;
  c.power[POWER_RAGE]          := 1000;
  c.power[POWER_FOCUS]         := 100;
  c.power[POWER_ENERGY]        := 100;
  c.power[POWER_HAPPINESS]     := 0;
  c.power[POWER_RUNES]         := 8;
  c.power[POWER_RUNIC]         := 0;
  c.Enum.experienceLevel       := 1;
  c.faction_template           := 1629;
  c.flags                      := $00000008;
  c.flags2                     := $00000800;
  c.mainhand_attack_time       := 2900;
  c.offhand_attack_time        := 2000;
  c.ranged_attack_time         := 0;
  c.bounding_radius            := 1;
  c.combat_reach               := 1.5;
  c.enum_model                 := 16125+c.Enum.sexID;
  c.native_model               := 16125+c.Enum.sexID;
  c.mount_model                := 0;
  c.min_damage                 := 7.557143;
  c.max_damage                 := 9.557143;
  c.min_offhand_damage         := 0;
  c.max_offhand_damage         := 0;
  c.mod_cast_speed             := 1;
  c.stat[0]                    := 21;
  c.stat[1]                    := 17;
  c.stat[2]                    := 20;
  c.stat[3]                    := 23;
  c.stat[4]                    := 24;
  c.resist[0]                  := 39;
  c.resist[1]                  := 0;
  c.resist[2]                  := 0;
  c.resist[3]                  := 0;
  c.resist[4]                  := 0;
  c.resist[5]                  := 0;
  c.resist[6]                  := 0;
  c.base_mana                  := 100;
  c.base_health                := 32;
  c.attack_power               := 22;
  c.ranged_attack_time         := 0;
  c.min_ranged_damage          := 0;
  c.max_ranged_damage          := 0;
  c.hover_height               := 1;

  c.player_flags               := $00000000;
  c.xp                         := 0;
  c.next_level_xp              := 400;
  c.points1                    := 0;
  c.professions_left           := 2;
  c.ammo_id                    := 0;

  c.ItemsAdd($FF,3, 23473,1, $00010000);          // Recruit's Shirt
  c.ItemsAdd($FF,4, 23479,1, $00010000);          // Recruit's Robe
  c.ItemsAdd($FF,6, 23478,1, $00010000);          // Recruit's Pants
  c.ItemsAdd($FF,15, 3661,1, $00010000);          // Handcrafted Staff
  c.ItemsAdd($FF,23, 6948,1, $00010001);          // Hearthstone

  c.SkillsAdd($0000,164, 0,0, 0,0);               // Blacksmithing
  c.SkillsAdd($0000,202, 0,0, 0,0);               // Engineering
  c.SkillsAdd($0000,762, 0,0, 0,0);               // Riding
  c.SkillsAdd($0000,769, 5,0, 0,0);               // Internal
  c.SkillsAdd($0000,755, 0,0, 5,0);               // Jewelcrafting
  c.SkillsAdd($0000,760, 5,5, 0,0);               // Draenei Racial
  c.SkillsAdd($0000,98, 300,300, 0,0);            // Language: Common
  c.SkillsAdd($0000,136, 5,1, 0,0);               // Staves
  c.SkillsAdd($0000,771, 1,0, 0,0);               // Frost
  c.SkillsAdd($0000,186, 0,0, 0,0);               // Mining
  c.SkillsAdd($0000,197, 0,0, 0,0);               // Tailoring
  c.SkillsAdd($0000,333, 0,0, 0,0);               // Enchanting
  c.SkillsAdd($0000,185, 0,0, 0,0);               // Cooking
  c.SkillsAdd($0000,777, 1,1, 0,0);               // Mounts
  c.SkillsAdd($0000,393, 0,0, 0,0);               // Skinning
  c.SkillsAdd($0000,137, 0,0, 0,0);               // Language: Thalassian
  c.SkillsAdd($0000,759, 300,300, 0,0);           // Language: Draenei
  c.SkillsAdd($0000,182, 0,0, 0,0);               // Herbalism
  c.SkillsAdd($0000,228, 5,1, 0,0);               // Wands
  c.SkillsAdd($0000,109, 0,0, 0,0);               // Language: Orcish
  c.SkillsAdd($0000,140, 300,0, 0,0);             // Language: Titan
  c.SkillsAdd($0000,313, 0,0, 0,0);               // Language: Gnomish
  c.SkillsAdd($0000,773, 0,0, 0,0);               // Inscription
  c.SkillsAdd($0000,6, 5,5, 0,0);                 // Frost
  c.SkillsAdd($0000,129, 0,0, 0,0);               // First Aid
  c.SkillsAdd($0000,237, 5,0, 0,0);               // Arcane
  c.SkillsAdd($0000,162, 5,1, 0,0);               // Unarmed
  c.SkillsAdd($0000,111, 0,0, 0,0);               // Language: Dwarven
  c.SkillsAdd($0000,113, 0,0, 0,0);               // Language: Darnassian
  c.SkillsAdd($0000,115, 0,0, 0,0);               // Language: Taurahe
  c.SkillsAdd($0000,315, 0,0, 0,0);               // Language: Troll
  c.SkillsAdd($0000,139, 0,0, 0,0);               // Language: Demon Tongue
  c.SkillsAdd($0000,8, 5,5, 0,0);                 // Fire
  c.SkillsAdd($0000,673, 0,0, 0,0);               // Language: Gutterspeak
  c.SkillsAdd($0000,138, 300,0, 0,0);             // Language: Draconic
  c.SkillsAdd($0000,141, 0,0, 0,0);               // Language: Old Tongue
  c.SkillsAdd($0000,142, 1,0, 0,0);               // Survival
  c.SkillsAdd($0000,173, 5,0, 0,0);               // Daggers
  c.SkillsAdd($0000,183, 5,5, 0,0);               // GENERIC (DND)
  c.SkillsAdd($0000,205, 1,0, 0,0);               // Pet - Succubus
  c.SkillsAdd($0000,95, 5,1, 0,0);                // Defense
  c.SkillsAdd($0000,415, 1,1, 0,0);               // Cloth
  c.SkillsAdd($0000,356, 0,0, 0,0);               // Fishing
  c.SkillsAdd($0000,171, 0,0, 0,0);               // Alchemy
  c.SkillsAdd($0000,43, 5,0, 0,0);                // Swords
  c.SkillsAdd($0000,778, 1,0, 0,0);               // Companions
  c.SkillsAdd($0000,165, 0,0, 0,0);               // Leatherworking

  c.SpellsAdd(59541, 0);                          // Shadow Resistance
  c.SpellsAdd(28875, 0);                          // Gemcutting
  c.SpellsAdd(28878, 0);                          // Heroic Presence
  c.SpellsAdd(59548, 0);                          // Gift of the Naaru
  c.SpellsAdd(668, 0);                            // Language Common
  c.SpellsAdd(227, 0);                            // Staves
  c.SpellsAdd(29932, 0);                          // Language Draenei
  c.SpellsAdd(5009, 0);                           // Wands
  c.SpellsAdd(5019, 0);                           // Shoot
  c.SpellsAdd(71761, 0);                          // Deep Freeze Immunity State
  c.SpellsAdd(168, 0);                            // Frost Armor
  c.SpellsAdd(203, 0);                            // Unarmed
  c.SpellsAdd(133, 0);                            // Fireball
  c.SpellsAdd(21651, 0);                          // Opening
  c.SpellsAdd(21652, 0);                          // Closing
  c.SpellsAdd(22810, 0);                          // Opening - No Text
  c.SpellsAdd(8386, 0);                           // Attacking
  c.SpellsAdd(3365, 0);                           // Opening
  c.SpellsAdd(3050, 0);                           // Detect
  c.SpellsAdd(9125, 0);                           // Generic
  c.SpellsAdd(7266, 0);                           // Duel
  c.SpellsAdd(7267, 0);                           // Grovel
  c.SpellsAdd(7355, 0);                           // Stuck
  c.SpellsAdd(6478, 0);                           // Opening
  c.SpellsAdd(6603, 0);                           // Auto Attack
  c.SpellsAdd(6233, 0);                           // Closing
  c.SpellsAdd(6246, 0);                           // Closing
  c.SpellsAdd(6247, 0);                           // Opening
  c.SpellsAdd(6477, 0);                           // Opening
  c.SpellsAdd(2479, 0);                           // Honorless Target
  c.SpellsAdd(45927, 0);                          // Summon Friend
  c.SpellsAdd(2382, 0);                           // Generic
  c.SpellsAdd(22027, 0);                          // Remove Insignia
  c.SpellsAdd(61437, 0);                          // Opening
  c.SpellsAdd(68398, 0);                          // Opening
  c.SpellsAdd(204, 0);                            // Defense
  c.SpellsAdd(81, 0);                             // Dodge
  c.SpellsAdd(522, 0);                            // SPELLDEFENSE (DND)
  c.SpellsAdd(9078, 0);                           // Cloth

  c.SetActionButtons(0, 133, $00000000);          // Spell: Fireball
  c.SetActionButtons(1, 168, $00000000);          // Spell: Frost Armor
  c.SetActionButtons(2, 59548, $00000000);        // Spell: Gift of the Naaru
  c.SetActionButtons(83, 4540, $00008000);        // Item: Tough Hunk of Bread
end;

end.
