unit CharsConstsAlliance;

interface

uses
  Struct, Defines;

procedure RACE_HUMAN_CLASS_WARRIOR(var c:TCharData);
procedure RACE_HUMAN_CLASS_PALADIN(var c:TCharData);
procedure RACE_HUMAN_CLASS_ROGUE(var c:TCharData);
procedure RACE_HUMAN_CLASS_PRIEST(var c:TCharData);
procedure RACE_HUMAN_CLASS_MAGE(var c:TCharData);
procedure RACE_HUMAN_CLASS_WARLOCK(var c:TCharData);

procedure RACE_DWARF_CLASS_WARRIOR(var c:TCharData);
procedure RACE_DWARF_CLASS_PALADIN(var c:TCharData);
procedure RACE_DWARF_CLASS_HUNTER(var c:TCharData);
procedure RACE_DWARF_CLASS_ROGUE(var c:TCharData);
procedure RACE_DWARF_CLASS_PRIEST(var c:TCharData);

procedure RACE_NIGHTELF_CLASS_WARRIOR(var c:TCharData);
procedure RACE_NIGHTELF_CLASS_HUNTER(var c:TCharData);
procedure RACE_NIGHTELF_CLASS_ROGUE(var c:TCharData);
procedure RACE_NIGHTELF_CLASS_PRIEST(var c:TCharData);
procedure RACE_NIGHTELF_CLASS_DRUID(var c:TCharData);

procedure RACE_GNOME_CLASS_WARRIOR(var c:TCharData);
procedure RACE_GNOME_CLASS_ROGUE(var c:TCharData);
procedure RACE_GNOME_CLASS_MAGE(var c:TCharData);
procedure RACE_GNOME_CLASS_WARLOCK(var c:TCharData);

implementation

procedure RACE_HUMAN_CLASS_WARRIOR(var c:TCharData);
begin
          c.max_health                 :=60;
          c.power_type                 :=POWER_RAGE;
          c.max_power[POWER_MANA]      :=0;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=1900;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=0;
          c.base_mana                  :=0;
          c.base_health                :=20;

          c.attack_power               :=29;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=11;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=4.9;
          c.max_damage                 :=6.9;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=0.0;
          c.max_ranged_damage          :=0.0;

          c.stat[0]                    :=23;      // strength
          c.stat[1]                    :=20;      // agility
          c.stat[2]                    :=22;      // stamina
          c.stat[3]                    :=20;      // intellect
          c.stat[4]                    :=20;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,3,   38,1,   $00000000);     // Recruit's Shirt
          c.ItemsAdd($FF,6,   39,1,   $00000000);     // Recruit's Pants
          c.ItemsAdd($FF,7,   40,1,   $00000000);     // Recruit's Boots
          c.ItemsAdd($FF,15,  25,1,   $00000000);     // Worn Shortsword
          c.ItemsAdd($FF,16,  2362,1, $00000000);     // Worn Wooden Shield
          c.ItemsAdd($FF,23,  117,4,  $00000000);     // Tough Jerky
          c.ItemsAdd($FF,24,  6948,1, $0001);     // Hearthstone

          c.SkillsAdd(182, 0,0,0,0);              // Herbalism
          c.SkillsAdd(186, 0,0,0,0);              // Mining
          c.SkillsAdd(98, 300,300,0,0);           // Language: Common
          c.SkillsAdd(136, 5,0,0,0);              // Staves
          c.SkillsAdd(533, 0,0,0,0);              // Raptor Riding
          c.SkillsAdd(554, 0,0,0,0);              // Undead Horsemanship
          c.SkillsAdd(762, 0,0,0,0);              // Riding
          c.SkillsAdd(769, 5,0,0,0);              // Internal
          c.SkillsAdd(160, 5,0,0,0);              // Two-Handed Maces
          c.SkillsAdd(43, 5,1,0,0);               // Swords
          c.SkillsAdd(172, 5,0,0,0);              // Two-Handed Axes
          c.SkillsAdd(183, 5,5,0,0);              // GENERIC (DND)
          c.SkillsAdd(356, 0,0,0,0);              // Fishing
          c.SkillsAdd(673, 0,0,0,0);              // Language: Gutterspeak
          c.SkillsAdd(95, 5,1,0,0);               // Defense
          c.SkillsAdd(754, 5,5,0,0);              // Racial - Human
          c.SkillsAdd(393, 0,0,0,0);              // Skinning
          c.SkillsAdd(333, 0,0,0,0);              // Enchanting
          c.SkillsAdd(293, 0,0,0,0);              // Plate Mail
          c.SkillsAdd(46, 5,0,0,0);               // Guns
          c.SkillsAdd(713, 0,0,0,0);              // Kodo Riding
          c.SkillsAdd(149, 0,0,0,0);              // Wolf Riding
          c.SkillsAdd(111, 0,0,0,0);              // Language: Dwarven
          c.SkillsAdd(473, 1,0,0,0);              // Fist Weapons
          c.SkillsAdd(113, 0,0,0,0);              // Language: Darnassian
          c.SkillsAdd(755, 0,0,0,0);              // Jewelcrafting
          c.SkillsAdd(315, 0,0,0,0);              // Language: Troll
          c.SkillsAdd(139, 0,0,0,0);              // Language: Demon Tongue
          c.SkillsAdd(152, 0,0,0,0);              // Ram Riding
          c.SkillsAdd(415, 1,1,0,0);              // Cloth
          c.SkillsAdd(256, 5,0,0,0);              // Fury
          c.SkillsAdd(109, 0,0,0,0);              // Language: Orcish
          c.SkillsAdd(226, 5,0,0,0);              // Crossbows
          c.SkillsAdd(44, 5,1,0,0);               // Axes
          c.SkillsAdd(176, 5,0,0,0);              // Thrown
          c.SkillsAdd(45, 5,0,0,0);               // Bows
          c.SkillsAdd(148, 0,0,0,0);              // Horse Riding
          c.SkillsAdd(164, 0,0,0,0);              // Blacksmithing
          c.SkillsAdd(173, 5,0,0,0);              // Daggers
          c.SkillsAdd(202, 0,0,0,0);              // Engineering
          c.SkillsAdd(171, 0,0,0,0);              // Alchemy
          c.SkillsAdd(54, 5,1,0,0);               // Maces
          c.SkillsAdd(55, 5,0,0,0);               // Two-Handed Swords
          c.SkillsAdd(197, 0,0,0,0);              // Tailoring
          c.SkillsAdd(165, 0,0,0,0);              // Leatherworking
          c.SkillsAdd(129, 0,0,0,0);              // First Aid
          c.SkillsAdd(433, 1,1,0,0);              // Shield
          c.SkillsAdd(137, 0,0,0,0);              // Language: Thalassian
          c.SkillsAdd(140, 0,0,0,0);              // Language: Titan
          c.SkillsAdd(313, 0,0,0,0);              // Language: Gnomish
          c.SkillsAdd(413, 1,1,0,0);              // Mail
          c.SkillsAdd(414, 1,1,0,0);              // Leather
          c.SkillsAdd(26, 5,5,0,0);               // Arms
          c.SkillsAdd(759, 0,0,0,0);              // Language: Draenei
          c.SkillsAdd(162, 5,1,0,0);              // Unarmed
          c.SkillsAdd(115, 0,0,0,0);              // Language: Taurahe
          c.SkillsAdd(118, 0,0,0,0);              // Dual Wield
          c.SkillsAdd(138, 0,0,0,0);              // Language: Draconic
          c.SkillsAdd(141, 0,0,0,0);              // Language: Old Tongue
          c.SkillsAdd(142, 1,0,0,0);              // Survival
          c.SkillsAdd(150, 0,0,0,0);              // Tiger Riding
          c.SkillsAdd(185, 0,0,0,0);              // Cooking
          c.SkillsAdd(229, 0,0,0,0);              // Polearms
          c.SkillsAdd(257, 5,0,0,0);              // Protection

          c.SpellsAdd(668, 0);                    // Language Common
          c.SpellsAdd(201, 0);                    // One-Handed Swords
          c.SpellsAdd(2479, 0);                   // Honorless Target
          c.SpellsAdd(21651, 0);                  // Opening
          c.SpellsAdd(21652, 0);                  // Closing
          c.SpellsAdd(9125, 0);                   // Generic
          c.SpellsAdd(3365, 0);                   // Opening
          c.SpellsAdd(3050, 0);                   // Detect
          c.SpellsAdd(6477, 0);                   // Opening
          c.SpellsAdd(6478, 0);                   // Opening
          c.SpellsAdd(6603, 0);                   // Attack
          c.SpellsAdd(22027, 0);                  // Remove Insignia
          c.SpellsAdd(22810, 0);                  // Opening - No Text
          c.SpellsAdd(45927, 0);                  // RAFS
          c.SpellsAdd(6233, 0);                   // Closing
          c.SpellsAdd(6246, 0);                   // Closing
          c.SpellsAdd(6247, 0);                   // Opening
          c.SpellsAdd(2382, 0);                   // Generic
          c.SpellsAdd(8386, 0);                   // Attacking
          c.SpellsAdd(7266, 0);                   // Duel
          c.SpellsAdd(7267, 0);                   // Grovel
          c.SpellsAdd(7355, 0);                   // Stuck
          c.SpellsAdd(5301, 0);                   // Defensive State (DND)
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(32215, 0);                  // Victorious State
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(107, 0);                    // Block
          c.SpellsAdd(20599, 0);                  // Diplomacy
          c.SpellsAdd(20600, 0);                  // Perception
          c.SpellsAdd(20597, 0);                  // Sword Specialization
          c.SpellsAdd(20598, 0);                  // The Human Spirit
          c.SpellsAdd(20864, 0);                  // Mace Specialization
          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(196, 0);                    // One-Handed Axes
          c.SpellsAdd(198, 0);                    // One-Handed Maces
          c.SpellsAdd(9116, 0);                   // Shield
          c.SpellsAdd(8737, 0);                   // Mail
          c.SpellsAdd(9077, 0);                   // Leather
          c.SpellsAdd(2457, 0);                   // Battle Stance
          c.SpellsAdd(78, 0);                     // Heroic Strike
          c.SpellsAdd(203, 0);                    // Unarmed

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(11, 117, $80000000);     // Item: Tough Jerky
          c.SetActionButtons(72, 6603, $00000000);    // Spell: Attack
          c.SetActionButtons(73, 78, $00000000);      // Spell: Heroic Strike
          c.SetActionButtons(83, 117, $80000000);     // Item: Tough Jerky
          c.SetActionButtons(84, 6603, $00000000);    // Spell: Attack
          c.SetActionButtons(96, 6603, $00000000);    // Spell: Attack
          c.SetActionButtons(108, 6603, $00000000);   // Spell: Attack
end;
procedure RACE_HUMAN_CLASS_PALADIN(var c:TCharData);
begin
          c.max_health                 :=58;
          c.power_type                 :=POWER_MANA;
          c.max_power[POWER_MANA]      :=80;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=2900;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=0;
          c.base_mana                  :=60;
          c.base_health                :=18;

          c.attack_power               :=27;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=10;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=8.59;
          c.max_damage                 :=10.59;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=0.0;
          c.max_ranged_damage          :=0.0;

          c.stat[0]                    :=22;      // strength
          c.stat[1]                    :=20;      // agility
          c.stat[2]                    :=22;      // stamina
          c.stat[3]                    :=20;      // intellect
          c.stat[4]                    :=21;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,3, 45,1, $00000000);         // Squire's Shirt
          c.ItemsAdd($FF,6, 44,1, $00000000);         // Squire's Pants
          c.ItemsAdd($FF,7, 43,1, $00000000);         // Squire's Boots
          c.ItemsAdd($FF,15, 2361,1, $00000000);      // Battleworn Hammer
          c.ItemsAdd($FF,23, 6948,1, $0001);      // Hearthstone
          c.ItemsAdd($FF,24, 159,2, $00000000);       // Refreshing Spring Water
          c.ItemsAdd($FF,25, 2070,4, $00000000);      // Darnassian Bleu

          c.SkillsAdd(182, 0,0,0,0);              // Herbalism
          c.SkillsAdd(186, 0,0,0,0);              // Mining
          c.SkillsAdd(98, 300,300,0,0);           // Language: Common
          c.SkillsAdd(533, 0,0,0,0);              // Raptor Riding
          c.SkillsAdd(554, 0,0,0,0);              // Undead Horsemanship
          c.SkillsAdd(762, 0,0,0,0);              // Riding
          c.SkillsAdd(769, 5,0,0,0);              // Internal
          c.SkillsAdd(160, 5,1,0,0);              // Two-Handed Maces
          c.SkillsAdd(43, 5,0,0,0);               // Swords
          c.SkillsAdd(172, 5,0,0,0);              // Two-Handed Axes
          c.SkillsAdd(183, 5,5,0,0);              // GENERIC (DND)
          c.SkillsAdd(184, 5,0,0,0);              // Retribution
          c.SkillsAdd(356, 0,0,0,0);              // Fishing
          c.SkillsAdd(673, 0,0,0,0);              // Language: Gutterspeak
          c.SkillsAdd(95, 5,1,0,0);               // Defense
          c.SkillsAdd(754, 5,5,0,0);              // Racial - Human
          c.SkillsAdd(393, 0,0,0,0);              // Skinning
          c.SkillsAdd(333, 0,0,0,0);              // Enchanting
          c.SkillsAdd(293, 0,0,0,0);              // Plate Mail
          c.SkillsAdd(713, 0,0,0,0);              // Kodo Riding
          c.SkillsAdd(149, 0,0,0,0);              // Wolf Riding
          c.SkillsAdd(111, 0,0,0,0);              // Language: Dwarven
          c.SkillsAdd(113, 0,0,0,0);              // Language: Darnassian
          c.SkillsAdd(755, 0,0,0,0);              // Jewelcrafting
          c.SkillsAdd(315, 0,0,0,0);              // Language: Troll
          c.SkillsAdd(139, 0,0,0,0);              // Language: Demon Tongue
          c.SkillsAdd(152, 0,0,0,0);              // Ram Riding
          c.SkillsAdd(415, 1,1,0,0);              // Cloth
          c.SkillsAdd(594, 5,5,0,0);              // Holy
          c.SkillsAdd(109, 0,0,0,0);              // Language: Orcish
          c.SkillsAdd(44, 5,0,0,0);               // Axes
          c.SkillsAdd(148, 0,0,0,0);              // Horse Riding
          c.SkillsAdd(164, 0,0,0,0);              // Blacksmithing
          c.SkillsAdd(202, 0,0,0,0);              // Engineering
          c.SkillsAdd(171, 0,0,0,0);              // Alchemy
          c.SkillsAdd(54, 5,1,0,0);               // Maces
          c.SkillsAdd(55, 5,0,0,0);               // Two-Handed Swords
          c.SkillsAdd(197, 0,0,0,0);              // Tailoring
          c.SkillsAdd(165, 0,0,0,0);              // Leatherworking
          c.SkillsAdd(129, 0,0,0,0);              // First Aid
          c.SkillsAdd(433, 1,1,0,0);              // Shield
          c.SkillsAdd(137, 0,0,0,0);              // Language: Thalassian
          c.SkillsAdd(140, 0,0,0,0);              // Language: Titan
          c.SkillsAdd(313, 0,0,0,0);              // Language: Gnomish
          c.SkillsAdd(413, 1,1,0,0);              // Mail
          c.SkillsAdd(414, 1,1,0,0);              // Leather
          c.SkillsAdd(759, 0,0,0,0);              // Language: Draenei
          c.SkillsAdd(267, 5,0,0,0);              // Protection
          c.SkillsAdd(162, 5,1,0,0);              // Unarmed
          c.SkillsAdd(115, 0,0,0,0);              // Language: Taurahe
          c.SkillsAdd(138, 0,0,0,0);              // Language: Draconic
          c.SkillsAdd(141, 0,0,0,0);              // Language: Old Tongue
          c.SkillsAdd(142, 1,0,0,0);              // Survival
          c.SkillsAdd(150, 0,0,0,0);              // Tiger Riding
          c.SkillsAdd(185, 0,0,0,0);              // Cooking
          c.SkillsAdd(229, 0,0,0,0);              // Polearms

          c.SpellsAdd(668, 0);                    // Language Common
          c.SpellsAdd(199, 0);                    // Two-Handed Maces
          c.SpellsAdd(2479, 0);                   // Honorless Target
          c.SpellsAdd(21651, 0);                  // Opening
          c.SpellsAdd(21652, 0);                  // Closing
          c.SpellsAdd(9125, 0);                   // Generic
          c.SpellsAdd(27762, 0);                  // Libram
          c.SpellsAdd(3365, 0);                   // Opening
          c.SpellsAdd(3050, 0);                   // Detect
          c.SpellsAdd(6477, 0);                   // Opening
          c.SpellsAdd(6478, 0);                   // Opening
          c.SpellsAdd(6603, 0);                   // Attack
          c.SpellsAdd(22027, 0);                  // Remove Insignia
          c.SpellsAdd(22810, 0);                  // Opening - No Text
          c.SpellsAdd(45927, 0);                  // RAFS
          c.SpellsAdd(6233, 0);                   // Closing
          c.SpellsAdd(6246, 0);                   // Closing
          c.SpellsAdd(6247, 0);                   // Opening
          c.SpellsAdd(2382, 0);                   // Generic
          c.SpellsAdd(8386, 0);                   // Attacking
          c.SpellsAdd(7266, 0);                   // Duel
          c.SpellsAdd(7267, 0);                   // Grovel
          c.SpellsAdd(7355, 0);                   // Stuck
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(107, 0);                    // Block
          c.SpellsAdd(20599, 0);                  // Diplomacy
          c.SpellsAdd(20600, 0);                  // Perception
          c.SpellsAdd(20597, 0);                  // Sword Specialization
          c.SpellsAdd(20598, 0);                  // The Human Spirit
          c.SpellsAdd(20864, 0);                  // Mace Specialization
          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(20154, 0);                  // Seal of Righteousness
          c.SpellsAdd(635, 0);                    // Holy Light
          c.SpellsAdd(198, 0);                    // One-Handed Maces
          c.SpellsAdd(9116, 0);                   // Shield
          c.SpellsAdd(8737, 0);                   // Mail
          c.SpellsAdd(9077, 0);                   // Leather
          c.SpellsAdd(203, 0);                    // Unarmed

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 20154, $00000000);    // Spell: Seal of Righteousness
          c.SetActionButtons(2, 635, $00000000);      // Spell: Holy Light
          c.SetActionButtons(10, 159, $80000000);     // Item: Refreshing Spring Water
          c.SetActionButtons(11, 2070, $80000000);    // Item: Darnassian Bleu
end;
procedure RACE_HUMAN_CLASS_ROGUE(var c:TCharData);
begin
          c.max_health                 :=55;
          c.power_type                 :=POWER_ENERGY;
          c.max_power[POWER_MANA]      :=0;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=1600;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=1600;
          c.base_mana                  :=0;
          c.base_health                :=25;

          c.attack_power               :=26;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=14;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=3.97;
          c.max_damage                 :=4.97;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=5.6;
          c.max_ranged_damage          :=8.6;

          c.stat[0]                    :=21;      // strength
          c.stat[1]                    :=23;      // agility
          c.stat[2]                    :=21;      // stamina
          c.stat[3]                    :=20;      // intellect
          c.stat[4]                    :=20;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,3, 49,1, $00000000);         // Footpad's Shirt
          c.ItemsAdd($FF,6, 48,1, $00000000);         // Footpad's Pants
          c.ItemsAdd($FF,7, 47,1, $00000000);         // Footpad's Shoes
          c.ItemsAdd($FF,15, 2092,1, $00000000);      // Worn Dagger
          c.ItemsAdd($FF,17, 28979,1, $00000000);     // Light Throwing Knife
          c.ItemsAdd($FF,23, 2070,4, $00000000);      // Darnassian Bleu
          c.ItemsAdd($FF,24, 6948,1, $0001);      // Hearthstone

          c.SkillsAdd(182, 0,0,0,0);              // Herbalism
          c.SkillsAdd(186, 0,0,0,0);              // Mining
          c.SkillsAdd(98, 300,300,0,0);           // Language: Common
          c.SkillsAdd(533, 0,0,0,0);              // Raptor Riding
          c.SkillsAdd(554, 0,0,0,0);              // Undead Horsemanship
          c.SkillsAdd(762, 0,0,0,0);              // Riding
          c.SkillsAdd(769, 5,0,0,0);              // Internal
          c.SkillsAdd(43, 5,0,0,0);               // Swords
          c.SkillsAdd(183, 5,5,0,0);              // GENERIC (DND)
          c.SkillsAdd(356, 0,0,0,0);              // Fishing
          c.SkillsAdd(673, 0,0,0,0);              // Language: Gutterspeak
          c.SkillsAdd(95, 5,1,0,0);               // Defense
          c.SkillsAdd(754, 5,5,0,0);              // Racial - Human
          c.SkillsAdd(393, 0,0,0,0);              // Skinning
          c.SkillsAdd(333, 0,0,0,0);              // Enchanting
          c.SkillsAdd(38, 5,5,0,0);               // Combat
          c.SkillsAdd(46, 5,0,0,0);               // Guns
          c.SkillsAdd(713, 0,0,0,0);              // Kodo Riding
          c.SkillsAdd(149, 0,0,0,0);              // Wolf Riding
          c.SkillsAdd(111, 0,0,0,0);              // Language: Dwarven
          c.SkillsAdd(39, 5,0,0,0);               // Subtlety
          c.SkillsAdd(473, 1,0,0,0);              // Fist Weapons
          c.SkillsAdd(113, 0,0,0,0);              // Language: Darnassian
          c.SkillsAdd(755, 0,0,0,0);              // Jewelcrafting
          c.SkillsAdd(315, 0,0,0,0);              // Language: Troll
          c.SkillsAdd(139, 0,0,0,0);              // Language: Demon Tongue
          c.SkillsAdd(152, 0,0,0,0);              // Ram Riding
          c.SkillsAdd(415, 1,1,0,0);              // Cloth
          c.SkillsAdd(633, 5,0,0,0);              // Lockpicking
          c.SkillsAdd(109, 0,0,0,0);              // Language: Orcish
          c.SkillsAdd(226, 5,0,0,0);              // Crossbows
          c.SkillsAdd(176, 5,1,0,0);              // Thrown
          c.SkillsAdd(45, 5,0,0,0);               // Bows
          c.SkillsAdd(148, 0,0,0,0);              // Horse Riding
          c.SkillsAdd(164, 0,0,0,0);              // Blacksmithing
          c.SkillsAdd(173, 5,1,0,0);              // Daggers
          c.SkillsAdd(202, 0,0,0,0);              // Engineering
          c.SkillsAdd(171, 0,0,0,0);              // Alchemy
          c.SkillsAdd(54, 5,0,0,0);               // Maces
          c.SkillsAdd(197, 0,0,0,0);              // Tailoring
          c.SkillsAdd(165, 0,0,0,0);              // Leatherworking
          c.SkillsAdd(129, 0,0,0,0);              // First Aid
          c.SkillsAdd(137, 0,0,0,0);              // Language: Thalassian
          c.SkillsAdd(140, 0,0,0,0);              // Language: Titan
          c.SkillsAdd(253, 5,5,0,0);              // Assassination
          c.SkillsAdd(313, 0,0,0,0);              // Language: Gnomish
          c.SkillsAdd(414, 1,1,0,0);              // Leather
          c.SkillsAdd(759, 0,0,0,0);              // Language: Draenei
          c.SkillsAdd(40, 5,0,0,0);               // Poisons
          c.SkillsAdd(162, 5,1,0,0);              // Unarmed
          c.SkillsAdd(115, 0,0,0,0);              // Language: Taurahe
          c.SkillsAdd(118, 0,0,0,0);              // Dual Wield
          c.SkillsAdd(138, 0,0,0,0);              // Language: Draconic
          c.SkillsAdd(141, 0,0,0,0);              // Language: Old Tongue
          c.SkillsAdd(142, 1,0,0,0);              // Survival
          c.SkillsAdd(150, 0,0,0,0);              // Tiger Riding
          c.SkillsAdd(185, 0,0,0,0);              // Cooking

          c.SpellsAdd(668, 0);                    // Language Common
          c.SpellsAdd(2479, 0);                   // Honorless Target
          c.SpellsAdd(21651, 0);                  // Opening
          c.SpellsAdd(21652, 0);                  // Closing
          c.SpellsAdd(9125, 0);                   // Generic
          c.SpellsAdd(3365, 0);                   // Opening
          c.SpellsAdd(3050, 0);                   // Detect
          c.SpellsAdd(6477, 0);                   // Opening
          c.SpellsAdd(6478, 0);                   // Opening
          c.SpellsAdd(6603, 0);                   // Attack
          c.SpellsAdd(22027, 0);                  // Remove Insignia
          c.SpellsAdd(22810, 0);                  // Opening - No Text
          c.SpellsAdd(45927, 0);                  // RAFS
          c.SpellsAdd(6233, 0);                   // Closing
          c.SpellsAdd(6246, 0);                   // Closing
          c.SpellsAdd(6247, 0);                   // Opening
          c.SpellsAdd(2382, 0);                   // Generic
          c.SpellsAdd(8386, 0);                   // Attacking
          c.SpellsAdd(7266, 0);                   // Duel
          c.SpellsAdd(7267, 0);                   // Grovel
          c.SpellsAdd(7355, 0);                   // Stuck
          c.SpellsAdd(16092, 0);                  // Defensive State (DND)
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(20599, 0);                  // Diplomacy
          c.SpellsAdd(20600, 0);                  // Perception
          c.SpellsAdd(20597, 0);                  // Sword Specialization
          c.SpellsAdd(20598, 0);                  // The Human Spirit
          c.SpellsAdd(20864, 0);                  // Mace Specialization
          c.SpellsAdd(21184, 0);                  // Rogue Passive (DND)
          c.SpellsAdd(1752, 0);                   // Sinister Strike
          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(2764, 0);                   // Throw
          c.SpellsAdd(2567, 0);                   // Thrown
          c.SpellsAdd(1180, 0);                   // Daggers
          c.SpellsAdd(2098, 0);                   // Eviscerate
          c.SpellsAdd(9077, 0);                   // Leather
          c.SpellsAdd(203, 0);                    // Unarmed

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 1752, $00000000);     // Spell: Sinister Strike
          c.SetActionButtons(2, 2098, $00000000);     // Spell: Eviscerate
          c.SetActionButtons(3, 2764, $00000000);     // Spell: Throw
          c.SetActionButtons(11, 2070, $80000000);    // Item: Darnassian Bleu
end;
procedure RACE_HUMAN_CLASS_PRIEST(var c:TCharData);
begin
          c.max_health                 :=52;
          c.power_type                 :=POWER_MANA;
          c.max_power[POWER_MANA]      :=160;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=1900;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=0;
          c.base_mana                  :=110;
          c.base_health                :=32;

          c.attack_power               :=10;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=10;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=2.35;
          c.max_damage                 :=4.35;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=0.0;
          c.max_ranged_damage          :=0.0;

          c.stat[0]                    :=20;      // strength
          c.stat[1]                    :=20;      // agility
          c.stat[2]                    :=20;      // stamina
          c.stat[3]                    :=22;      // intellect
          c.stat[4]                    :=23;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,3, 53,1, $00000000);         // Neophyte's Shirt
          c.ItemsAdd($FF,4, 6098,1, $00000000);       // Neophyte's Robe
          c.ItemsAdd($FF,6, 52,1, $00000000);         // Neophyte's Pants
          c.ItemsAdd($FF,7, 51,1, $00000000);         // Neophyte's Boots
          c.ItemsAdd($FF,15, 36,1, $00000000);        // Worn Mace
          c.ItemsAdd($FF,23, 159,2, $00000000);       // Refreshing Spring Water
          c.ItemsAdd($FF,24, 2070,4, $00000000);      // Darnassian Bleu
          c.ItemsAdd($FF,25, 6948,1, $0001);      // Hearthstone

          c.SkillsAdd(182, 0,0,0,0);              // Herbalism
          c.SkillsAdd(186, 0,0,0,0);              // Mining
          c.SkillsAdd(98, 300,300,0,0);           // Language: Common
          c.SkillsAdd(136, 5,0,0,0);              // Staves
          c.SkillsAdd(533, 0,0,0,0);              // Raptor Riding
          c.SkillsAdd(554, 0,0,0,0);              // Undead Horsemanship
          c.SkillsAdd(762, 0,0,0,0);              // Riding
          c.SkillsAdd(769, 5,0,0,0);              // Internal
          c.SkillsAdd(183, 5,5,0,0);              // GENERIC (DND)
          c.SkillsAdd(356, 0,0,0,0);              // Fishing
          c.SkillsAdd(673, 0,0,0,0);              // Language: Gutterspeak
          c.SkillsAdd(95, 5,1,0,0);               // Defense
          c.SkillsAdd(228, 5,1,0,0);              // Wands
          c.SkillsAdd(754, 5,5,0,0);              // Racial - Human
          c.SkillsAdd(393, 0,0,0,0);              // Skinning
          c.SkillsAdd(333, 0,0,0,0);              // Enchanting
          c.SkillsAdd(713, 0,0,0,0);              // Kodo Riding
          c.SkillsAdd(149, 0,0,0,0);              // Wolf Riding
          c.SkillsAdd(111, 0,0,0,0);              // Language: Dwarven
          c.SkillsAdd(113, 0,0,0,0);              // Language: Darnassian
          c.SkillsAdd(755, 0,0,0,0);              // Jewelcrafting
          c.SkillsAdd(315, 0,0,0,0);              // Language: Troll
          c.SkillsAdd(139, 0,0,0,0);              // Language: Demon Tongue
          c.SkillsAdd(152, 0,0,0,0);              // Ram Riding
          c.SkillsAdd(415, 1,1,0,0);              // Cloth
          c.SkillsAdd(109, 0,0,0,0);              // Language: Orcish
          c.SkillsAdd(148, 0,0,0,0);              // Horse Riding
          c.SkillsAdd(164, 0,0,0,0);              // Blacksmithing
          c.SkillsAdd(173, 5,0,0,0);              // Daggers
          c.SkillsAdd(202, 0,0,0,0);              // Engineering
          c.SkillsAdd(171, 0,0,0,0);              // Alchemy
          c.SkillsAdd(54, 5,1,0,0);               // Maces
          c.SkillsAdd(197, 0,0,0,0);              // Tailoring
          c.SkillsAdd(165, 0,0,0,0);              // Leatherworking
          c.SkillsAdd(129, 0,0,0,0);              // First Aid
          c.SkillsAdd(137, 0,0,0,0);              // Language: Thalassian
          c.SkillsAdd(140, 0,0,0,0);              // Language: Titan
          c.SkillsAdd(313, 0,0,0,0);              // Language: Gnomish
          c.SkillsAdd(613, 5,0,0,0);              // Discipline
          c.SkillsAdd(78, 5,0,0,0);               // Shadow Magic
          c.SkillsAdd(759, 0,0,0,0);              // Language: Draenei
          c.SkillsAdd(162, 5,1,0,0);              // Unarmed
          c.SkillsAdd(56, 5,5,0,0);               // Holy
          c.SkillsAdd(115, 0,0,0,0);              // Language: Taurahe
          c.SkillsAdd(138, 0,0,0,0);              // Language: Draconic
          c.SkillsAdd(141, 0,0,0,0);              // Language: Old Tongue
          c.SkillsAdd(142, 1,0,0,0);              // Survival
          c.SkillsAdd(150, 0,0,0,0);              // Tiger Riding
          c.SkillsAdd(185, 0,0,0,0);              // Cooking

          c.SpellsAdd(668, 0);                    // Language Common
          c.SpellsAdd(2479, 0);                   // Honorless Target
          c.SpellsAdd(21651, 0);                  // Opening
          c.SpellsAdd(21652, 0);                  // Closing
          c.SpellsAdd(9125, 0);                   // Generic
          c.SpellsAdd(3365, 0);                   // Opening
          c.SpellsAdd(3050, 0);                   // Detect
          c.SpellsAdd(6477, 0);                   // Opening
          c.SpellsAdd(6478, 0);                   // Opening
          c.SpellsAdd(6603, 0);                   // Attack
          c.SpellsAdd(22027, 0);                  // Remove Insignia
          c.SpellsAdd(22810, 0);                  // Opening - No Text
          c.SpellsAdd(45927, 0);                  // RAFS
          c.SpellsAdd(6233, 0);                   // Closing
          c.SpellsAdd(6246, 0);                   // Closing
          c.SpellsAdd(6247, 0);                   // Opening
          c.SpellsAdd(2382, 0);                   // Generic
          c.SpellsAdd(8386, 0);                   // Attacking
          c.SpellsAdd(7266, 0);                   // Duel
          c.SpellsAdd(7267, 0);                   // Grovel
          c.SpellsAdd(7355, 0);                   // Stuck
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(5009, 0);                   // Wands
          c.SpellsAdd(5019, 0);                   // Shoot
          c.SpellsAdd(20599, 0);                  // Diplomacy
          c.SpellsAdd(20600, 0);                  // Perception
          c.SpellsAdd(20597, 0);                  // Sword Specialization
          c.SpellsAdd(20598, 0);                  // The Human Spirit
          c.SpellsAdd(20864, 0);                  // Mace Specialization
          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(198, 0);                    // One-Handed Maces
          c.SpellsAdd(203, 0);                    // Unarmed
          c.SpellsAdd(2050, 0);                   // Lesser Heal
          c.SpellsAdd(585, 0);                    // Smite

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 585, $00000000);      // Spell: Smite
          c.SetActionButtons(2, 2050, $00000000);     // Spell: Lesser Heal
          c.SetActionButtons(10, 159, $80000000);     // Item: Refreshing Spring Water
          c.SetActionButtons(11, 2070, $80000000);    // Item: Darnassian Bleu
end;
procedure RACE_HUMAN_CLASS_MAGE(var c:TCharData);
begin
          c.max_health                 :=52;
          c.power_type                 :=POWER_MANA;
          c.max_power[POWER_MANA]      :=165;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=2900;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=0;
          c.base_mana                  :=100;
          c.base_health                :=32;

          c.attack_power               :=10;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=10;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=5.07;
          c.max_damage                 :=7.07;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=0.0;
          c.max_ranged_damage          :=0.0;

          c.stat[0]                    :=20;      // strength
          c.stat[1]                    :=20;      // agility
          c.stat[2]                    :=20;      // stamina
          c.stat[3]                    :=23;      // intellect
          c.stat[4]                    :=22;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,3, 6096,1, $00000000);       // Apprentice's Shirt
          c.ItemsAdd($FF,4, 56,1, $00000000);         // Apprentice's Robe
          c.ItemsAdd($FF,6, 1395,1, $00000000);       // Apprentice's Pants
          c.ItemsAdd($FF,7, 55,1, $00000000);         // Apprentice's Boots
          c.ItemsAdd($FF,15, 35,1, $00000000);        // Bent Staff
          c.ItemsAdd($FF,23, 2070,4, $00000000);      // Darnassian Bleu
          c.ItemsAdd($FF,24, 159,2, $00000000);       // Refreshing Spring Water
          c.ItemsAdd($FF,25, 6948,1, $0001);      // Hearthstone

          c.SkillsAdd(182, 0,0,0,0);              // Herbalism
          c.SkillsAdd(186, 0,0,0,0);              // Mining
          c.SkillsAdd(98, 300,300,0,0);           // Language: Common
          c.SkillsAdd(136, 5,1,0,0);              // Staves
          c.SkillsAdd(533, 0,0,0,0);              // Raptor Riding
          c.SkillsAdd(554, 0,0,0,0);              // Undead Horsemanship
          c.SkillsAdd(762, 0,0,0,0);              // Riding
          c.SkillsAdd(769, 5,0,0,0);              // Internal
          c.SkillsAdd(43, 5,0,0,0);               // Swords
          c.SkillsAdd(183, 5,5,0,0);              // GENERIC (DND)
          c.SkillsAdd(356, 0,0,0,0);              // Fishing
          c.SkillsAdd(673, 0,0,0,0);              // Language: Gutterspeak
          c.SkillsAdd(95, 5,1,0,0);               // Defense
          c.SkillsAdd(228, 5,1,0,0);              // Wands
          c.SkillsAdd(754, 5,5,0,0);              // Racial - Human
          c.SkillsAdd(393, 0,0,0,0);              // Skinning
          c.SkillsAdd(333, 0,0,0,0);              // Enchanting
          c.SkillsAdd(6, 5,5,0,0);                // Frost
          c.SkillsAdd(8, 5,5,0,0);                // Fire
          c.SkillsAdd(713, 0,0,0,0);              // Kodo Riding
          c.SkillsAdd(149, 0,0,0,0);              // Wolf Riding
          c.SkillsAdd(111, 0,0,0,0);              // Language: Dwarven
          c.SkillsAdd(113, 0,0,0,0);              // Language: Darnassian
          c.SkillsAdd(755, 0,0,0,0);              // Jewelcrafting
          c.SkillsAdd(315, 0,0,0,0);              // Language: Troll
          c.SkillsAdd(139, 0,0,0,0);              // Language: Demon Tongue
          c.SkillsAdd(152, 0,0,0,0);              // Ram Riding
          c.SkillsAdd(415, 1,1,0,0);              // Cloth
          c.SkillsAdd(109, 0,0,0,0);              // Language: Orcish
          c.SkillsAdd(148, 0,0,0,0);              // Horse Riding
          c.SkillsAdd(164, 0,0,0,0);              // Blacksmithing
          c.SkillsAdd(173, 5,0,0,0);              // Daggers
          c.SkillsAdd(202, 0,0,0,0);              // Engineering
          c.SkillsAdd(171, 0,0,0,0);              // Alchemy
          c.SkillsAdd(197, 0,0,0,0);              // Tailoring
          c.SkillsAdd(165, 0,0,0,0);              // Leatherworking
          c.SkillsAdd(129, 0,0,0,0);              // First Aid
          c.SkillsAdd(137, 0,0,0,0);              // Language: Thalassian
          c.SkillsAdd(140, 0,0,0,0);              // Language: Titan
          c.SkillsAdd(313, 0,0,0,0);              // Language: Gnomish
          c.SkillsAdd(759, 0,0,0,0);              // Language: Draenei
          c.SkillsAdd(237, 5,0,0,0);              // Arcane
          c.SkillsAdd(162, 5,1,0,0);              // Unarmed
          c.SkillsAdd(115, 0,0,0,0);              // Language: Taurahe
          c.SkillsAdd(138, 0,0,0,0);              // Language: Draconic
          c.SkillsAdd(141, 0,0,0,0);              // Language: Old Tongue
          c.SkillsAdd(142, 1,0,0,0);              // Survival
          c.SkillsAdd(150, 0,0,0,0);              // Tiger Riding
          c.SkillsAdd(185, 0,0,0,0);              // Cooking

          c.SpellsAdd(668, 0);                    // Language Common
          c.SpellsAdd(227, 0);                    // Staves
          c.SpellsAdd(2479, 0);                   // Honorless Target
          c.SpellsAdd(21651, 0);                  // Opening
          c.SpellsAdd(21652, 0);                  // Closing
          c.SpellsAdd(9125, 0);                   // Generic
          c.SpellsAdd(3365, 0);                   // Opening
          c.SpellsAdd(3050, 0);                   // Detect
          c.SpellsAdd(6477, 0);                   // Opening
          c.SpellsAdd(6478, 0);                   // Opening
          c.SpellsAdd(6603, 0);                   // Attack
          c.SpellsAdd(22027, 0);                  // Remove Insignia
          c.SpellsAdd(22810, 0);                  // Opening - No Text
          c.SpellsAdd(45927, 0);                  // RAFS
          c.SpellsAdd(6233, 0);                   // Closing
          c.SpellsAdd(6246, 0);                   // Closing
          c.SpellsAdd(6247, 0);                   // Opening
          c.SpellsAdd(2382, 0);                   // Generic
          c.SpellsAdd(8386, 0);                   // Attacking
          c.SpellsAdd(7266, 0);                   // Duel
          c.SpellsAdd(7267, 0);                   // Grovel
          c.SpellsAdd(7355, 0);                   // Stuck
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(5009, 0);                   // Wands
          c.SpellsAdd(5019, 0);                   // Shoot
          c.SpellsAdd(20599, 0);                  // Diplomacy
          c.SpellsAdd(20600, 0);                  // Perception
          c.SpellsAdd(20597, 0);                  // Sword Specialization
          c.SpellsAdd(20598, 0);                  // The Human Spirit
          c.SpellsAdd(20864, 0);                  // Mace Specialization
          c.SpellsAdd(168, 0);                    // Frost Armor
          c.SpellsAdd(133, 0);                    // Fireball
          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(203, 0);                    // Unarmed

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 133, $00000000);      // Spell: Fireball
          c.SetActionButtons(2, 168, $00000000);      // Spell: Frost Armor
          c.SetActionButtons(10, 159, $80000000);     // Item: Refreshing Spring Water
          c.SetActionButtons(11, 2070, $80000000);    // Item: Darnassian Bleu
end;
procedure RACE_HUMAN_CLASS_WARLOCK(var c:TCharData);
begin
          c.max_health                 :=53;
          c.power_type                 :=POWER_MANA;
          c.max_power[POWER_MANA]      :=140;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=1600;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=0;
          c.base_mana                  :=90;
          c.base_health                :=23;

          c.attack_power               :=10;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=10;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=2.14;
          c.max_damage                 :=3.14;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=0.0;
          c.max_ranged_damage          :=0.0;

          c.stat[0]                    :=20;      // strength
          c.stat[1]                    :=20;      // agility
          c.stat[2]                    :=21;      // stamina
          c.stat[3]                    :=22;      // intellect
          c.stat[4]                    :=22;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,3, 6097,1, $00000000);       // Acolyte's Shirt
          c.ItemsAdd($FF,4, 57,1, $00000000);         // Acolyte's Robe
          c.ItemsAdd($FF,6, 1396,1, $00000000);       // Acolyte's Pants
          c.ItemsAdd($FF,7, 59,1, $00000000);         // Acolyte's Shoes
          c.ItemsAdd($FF,15, 2092,1, $00000000);      // Worn Dagger
          c.ItemsAdd($FF,23, 4604,4, $00000000);      // Forest Mushroom Cap
          c.ItemsAdd($FF,24, 159,2, $00000000);       // Refreshing Spring Water
          c.ItemsAdd($FF,25, 6948,1, $0001);      // Hearthstone

          c.SkillsAdd(182, 0,0,0,0);              // Herbalism
          c.SkillsAdd(186, 0,0,0,0);              // Mining
          c.SkillsAdd(98, 300,300,0,0);           // Language: Common
          c.SkillsAdd(136, 5,0,0,0);              // Staves
          c.SkillsAdd(533, 0,0,0,0);              // Raptor Riding
          c.SkillsAdd(554, 0,0,0,0);              // Undead Horsemanship
          c.SkillsAdd(762, 0,0,0,0);              // Riding
          c.SkillsAdd(769, 5,0,0,0);              // Internal
          c.SkillsAdd(43, 5,0,0,0);               // Swords
          c.SkillsAdd(183, 5,5,0,0);              // GENERIC (DND)
          c.SkillsAdd(356, 0,0,0,0);              // Fishing
          c.SkillsAdd(673, 0,0,0,0);              // Language: Gutterspeak
          c.SkillsAdd(95, 5,1,0,0);               // Defense
          c.SkillsAdd(228, 5,1,0,0);              // Wands
          c.SkillsAdd(754, 5,5,0,0);              // Racial - Human
          c.SkillsAdd(393, 0,0,0,0);              // Skinning
          c.SkillsAdd(333, 0,0,0,0);              // Enchanting
          c.SkillsAdd(713, 0,0,0,0);              // Kodo Riding
          c.SkillsAdd(149, 0,0,0,0);              // Wolf Riding
          c.SkillsAdd(111, 0,0,0,0);              // Language: Dwarven
          c.SkillsAdd(113, 0,0,0,0);              // Language: Darnassian
          c.SkillsAdd(755, 0,0,0,0);              // Jewelcrafting
          c.SkillsAdd(315, 0,0,0,0);              // Language: Troll
          c.SkillsAdd(139, 0,0,0,0);              // Language: Demon Tongue
          c.SkillsAdd(152, 0,0,0,0);              // Ram Riding
          c.SkillsAdd(354, 5,5,0,0);              // Demonology
          c.SkillsAdd(355, 5,0,0,0);              // Affliction
          c.SkillsAdd(415, 1,1,0,0);              // Cloth
          c.SkillsAdd(109, 0,0,0,0);              // Language: Orcish
          c.SkillsAdd(148, 0,0,0,0);              // Horse Riding
          c.SkillsAdd(164, 0,0,0,0);              // Blacksmithing
          c.SkillsAdd(173, 5,1,0,0);              // Daggers
          c.SkillsAdd(202, 0,0,0,0);              // Engineering
          c.SkillsAdd(171, 0,0,0,0);              // Alchemy
          c.SkillsAdd(197, 0,0,0,0);              // Tailoring
          c.SkillsAdd(165, 0,0,0,0);              // Leatherworking
          c.SkillsAdd(129, 0,0,0,0);              // First Aid
          c.SkillsAdd(137, 0,0,0,0);              // Language: Thalassian
          c.SkillsAdd(140, 0,0,0,0);              // Language: Titan
          c.SkillsAdd(313, 0,0,0,0);              // Language: Gnomish
          c.SkillsAdd(593, 5,5,0,0);              // Destruction
          c.SkillsAdd(759, 0,0,0,0);              // Language: Draenei
          c.SkillsAdd(162, 5,1,0,0);              // Unarmed
          c.SkillsAdd(115, 0,0,0,0);              // Language: Taurahe
          c.SkillsAdd(138, 0,0,0,0);              // Language: Draconic
          c.SkillsAdd(141, 0,0,0,0);              // Language: Old Tongue
          c.SkillsAdd(142, 1,0,0,0);              // Survival
          c.SkillsAdd(150, 0,0,0,0);              // Tiger Riding
          c.SkillsAdd(185, 0,0,0,0);              // Cooking

          c.SpellsAdd(668, 0);                    // Language Common
          c.SpellsAdd(2479, 0);                   // Honorless Target
          c.SpellsAdd(21651, 0);                  // Opening
          c.SpellsAdd(21652, 0);                  // Closing
          c.SpellsAdd(9125, 0);                   // Generic
          c.SpellsAdd(3365, 0);                   // Opening
          c.SpellsAdd(3050, 0);                   // Detect
          c.SpellsAdd(6477, 0);                   // Opening
          c.SpellsAdd(6478, 0);                   // Opening
          c.SpellsAdd(6603, 0);                   // Attack
          c.SpellsAdd(22027, 0);                  // Remove Insignia
          c.SpellsAdd(22810, 0);                  // Opening - No Text
          c.SpellsAdd(45927, 0);                  // RAFS
          c.SpellsAdd(6233, 0);                   // Closing
          c.SpellsAdd(6246, 0);                   // Closing
          c.SpellsAdd(6247, 0);                   // Opening
          c.SpellsAdd(2382, 0);                   // Generic
          c.SpellsAdd(8386, 0);                   // Attacking
          c.SpellsAdd(7266, 0);                   // Duel
          c.SpellsAdd(7267, 0);                   // Grovel
          c.SpellsAdd(7355, 0);                   // Stuck
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(5009, 0);                   // Wands
          c.SpellsAdd(5019, 0);                   // Shoot
          c.SpellsAdd(20599, 0);                  // Diplomacy
          c.SpellsAdd(20600, 0);                  // Perception
          c.SpellsAdd(20597, 0);                  // Sword Specialization
          c.SpellsAdd(20598, 0);                  // The Human Spirit
          c.SpellsAdd(20864, 0);                  // Mace Specialization
          c.SpellsAdd(687, 0);                    // Demon Skin
          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(1180, 0);                   // Daggers
          c.SpellsAdd(686, 0);                    // Shadow Bolt
          c.SpellsAdd(203, 0);                    // Unarmed

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 686, $00000000);      // Spell: Shadow Bolt
          c.SetActionButtons(2, 687, $00000000);      // Spell: Demon Skin
          c.SetActionButtons(10, 159, $80000000);     // Item: Refreshing Spring Water
          c.SetActionButtons(11, 4604, $80000000);    // Item: Forest Mushroom Cap
end;

procedure RACE_DWARF_CLASS_WARRIOR(var c:TCharData);
begin
          c.max_health                 :=90;
          c.power_type                 :=POWER_RAGE;
          c.max_power[POWER_MANA]      :=0;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=2900;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=0;
          c.base_mana                  :=0;
          c.base_health                :=20;

          c.attack_power               :=33;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=7;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=9.83;
          c.max_damage                 :=11.83;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=0.0;
          c.max_ranged_damage          :=0.0;

          c.stat[0]                    :=25;      // strength
          c.stat[1]                    :=16;      // agility
          c.stat[2]                    :=25;      // stamina
          c.stat[3]                    :=19;      // intellect
          c.stat[4]                    :=19;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,3, 38,1, $00000000);         // Recruit's Shirt
          c.ItemsAdd($FF,6, 39,1, $00000000);         // Recruit's Pants
          c.ItemsAdd($FF,7, 40,1, $00000000);         // Recruit's Boots
          c.ItemsAdd($FF,15, 12282,1, $00000000);     // Worn Battleaxe
          c.ItemsAdd($FF,23, 6948,1, $0001);      // Hearthstone
          c.ItemsAdd($FF,24, 117,4, $00000000);       // Tough Jerky

          c.SkillsAdd(415, 1,1, 0,0);             // Cloth
          c.SkillsAdd(256, 5,0, 0,0);             // Fury
          c.SkillsAdd(202, 0,0, 0,0);             // Engineering
          c.SkillsAdd(356, 0,0, 0,0);             // Fishing
          c.SkillsAdd(171, 0,0, 0,0);             // Alchemy
          c.SkillsAdd(182, 0,0, 0,0);             // Herbalism
          c.SkillsAdd(673, 0,0, 0,0);             // Language: Gutterspeak
          c.SkillsAdd(95, 5,1, 0,0);              // Defense
          c.SkillsAdd(333, 0,0, 0,0);             // Enchanting
          c.SkillsAdd(55, 5,0, 0,0);              // Two-Handed Swords
          c.SkillsAdd(713, 0,0, 0,0);             // Kodo Riding
          c.SkillsAdd(176, 5,0, 0,0);             // Thrown
          c.SkillsAdd(129, 0,0, 0,0);             // First Aid
          c.SkillsAdd(185, 0,0, 0,0);             // Cooking
          c.SkillsAdd(162, 5,1, 0,0);             // Unarmed
          c.SkillsAdd(160, 5,0, 0,0);             // Two-Handed Maces
          c.SkillsAdd(165, 0,0, 0,0);             // Leatherworking
          c.SkillsAdd(43, 5,0, 0,0);              // Swords
          c.SkillsAdd(186, 0,0, 0,0);             // Mining
          c.SkillsAdd(98, 300,300, 0,0);          // Language: Common
          c.SkillsAdd(136, 5,0, 0,0);             // Staves
          c.SkillsAdd(54, 5,1, 0,0);              // Maces
          c.SkillsAdd(533, 0,0, 0,0);             // Raptor Riding
          c.SkillsAdd(553, 0,0, 0,0);             // Mechanostrider Piloting
          c.SkillsAdd(554, 0,0, 0,0);             // Undead Horsemanship
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(229, 0,0, 0,0);             // Polearms
          c.SkillsAdd(257, 5,0, 0,0);             // Protection
          c.SkillsAdd(293, 0,0, 0,0);             // Plate Mail
          c.SkillsAdd(46, 5,0, 5,0);              // Guns
          c.SkillsAdd(315, 0,0, 0,0);             // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(152, 0,0, 0,0);             // Ram Riding
          c.SkillsAdd(173, 5,0, 0,0);             // Daggers
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(226, 5,0, 0,0);             // Crossbows
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 0,0, 0,0);             // Language: Orcish
          c.SkillsAdd(433, 1,1, 0,0);             // Shield
          c.SkillsAdd(137, 0,0, 0,0);             // Language: Thalassian
          c.SkillsAdd(473, 1,0, 0,0);             // Fist Weapons
          c.SkillsAdd(140, 0,0, 0,0);             // Language: Titan
          c.SkillsAdd(149, 0,0, 0,0);             // Wolf Riding
          c.SkillsAdd(313, 0,0, 0,0);             // Language: Gnomish
          c.SkillsAdd(413, 1,1, 0,0);             // Mail
          c.SkillsAdd(414, 1,1, 0,0);             // Leather
          c.SkillsAdd(45, 5,0, 0,0);              // Bows
          c.SkillsAdd(26, 5,5, 0,0);              // Arms
          c.SkillsAdd(759, 0,0, 0,0);             // Language: Draenei
          c.SkillsAdd(197, 0,0, 0,0);             // Tailoring
          c.SkillsAdd(44, 5,1, 0,0);              // Axes
          c.SkillsAdd(101, 5,5, 0,0);             // Dwarven Racial
          c.SkillsAdd(111, 300,300, 0,0);         // Language: Dwarven
          c.SkillsAdd(113, 0,0, 0,0);             // Language: Darnassian
          c.SkillsAdd(115, 0,0, 0,0);             // Language: Taurahe
          c.SkillsAdd(118, 0,0, 0,0);             // Dual Wield
          c.SkillsAdd(138, 0,0, 0,0);             // Language: Draconic
          c.SkillsAdd(141, 0,0, 0,0);             // Language: Old Tongue
          c.SkillsAdd(142, 1,0, 0,0);             // Survival
          c.SkillsAdd(148, 0,0, 0,0);             // Horse Riding
          c.SkillsAdd(150, 0,0, 0,0);             // Tiger Riding
          c.SkillsAdd(164, 0,0, 0,0);             // Blacksmithing
          c.SkillsAdd(172, 5,1, 0,0);             // Two-Handed Axes

          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(107, 0);                    // Block
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(5301, 0);                   // Defensive State (DND)
          c.SpellsAdd(32215, 0);                  // Victorious State
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(203, 0);                    // Unarmed
          c.SpellsAdd(668, 0);                    // Language Common
          c.SpellsAdd(198, 0);                    // One-Handed Maces
          c.SpellsAdd(21651, 0);                  // Opening
          c.SpellsAdd(21652, 0);                  // Closing
          c.SpellsAdd(8386, 0);                   // Attacking
          c.SpellsAdd(9125, 0);                   // Generic
          c.SpellsAdd(7266, 0);                   // Duel
          c.SpellsAdd(7267, 0);                   // Grovel
          c.SpellsAdd(7355, 0);                   // Stuck
          c.SpellsAdd(22027, 0);                  // Remove Insignia
          c.SpellsAdd(22810, 0);                  // Opening - No Text
          c.SpellsAdd(2479, 0);                   // Honorless Target
          c.SpellsAdd(2382, 0);                   // Generic
          c.SpellsAdd(3365, 0);                   // Opening
          c.SpellsAdd(3050, 0);                   // Detect
          c.SpellsAdd(6477, 0);                   // Opening
          c.SpellsAdd(6478, 0);                   // Opening
          c.SpellsAdd(6603, 0);                   // Attack
          c.SpellsAdd(6233, 0);                   // Closing
          c.SpellsAdd(6246, 0);                   // Closing
          c.SpellsAdd(6247, 0);                   // Opening
          c.SpellsAdd(9116, 0);                   // Shield
          c.SpellsAdd(8737, 0);                   // Mail
          c.SpellsAdd(9077, 0);                   // Leather
          c.SpellsAdd(2457, 0);                   // Battle Stance
          c.SpellsAdd(78, 0);                     // Heroic Strike
          c.SpellsAdd(196, 0);                    // One-Handed Axes
          c.SpellsAdd(2481, 0);                   // Find Treasure
          c.SpellsAdd(20596, 0);                  // Frost Resistance
          c.SpellsAdd(20595, 0);                  // Gun Specialization
          c.SpellsAdd(20594, 0);                  // Stoneform
          c.SpellsAdd(672, 0);                    // Language Dwarven
          c.SpellsAdd(197, 0);                    // Two-Handed Axes

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 78, $00000000);       // Spell: Heroic Strike
          c.SetActionButtons(2, 2457, $00000000);     // Spell: Battle Stance
          c.SetActionButtons(11, 117, $80000000);     // Item: Tough Jerky
          c.SetActionButtons(72, 6603, $00000000);    // Spell: Attack
          c.SetActionButtons(73, 78, $00000000);      // Spell: Heroic Strike
          c.SetActionButtons(74, 20594, $00000000);   // Spell: Stoneform
          c.SetActionButtons(75, 2481, $00000000);    // Spell: Find Treasure
          c.SetActionButtons(83, 117, $80000000);     // Item: Tough Jerky
          c.SetActionButtons(84, 6603, $00000000);    // Spell: Attack
          c.SetActionButtons(96, 6603, $00000000);    // Spell: Attack
          c.SetActionButtons(108, 6603, $00000000);   // Spell: Attack
end;
procedure RACE_DWARF_CLASS_PALADIN(var c:TCharData);
begin
          c.max_health                 :=88;
          c.power_type                 :=POWER_MANA;
          c.max_power[POWER_MANA]      :=79;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=2900;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=0;
          c.base_mana                  :=60;
          c.base_health                :=18;

          c.attack_power               :=31;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=6;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=9.83;
          c.max_damage                 :=11.83;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=0.0;
          c.max_ranged_damage          :=0.0;

          c.stat[0]                    :=24;      // strength
          c.stat[1]                    :=16;      // agility
          c.stat[2]                    :=25;      // stamina
          c.stat[3]                    :=19;      // intellect
          c.stat[4]                    :=20;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,3, 6117,1, $00000000);       // Squire's Shirt
          c.ItemsAdd($FF,6, 6118,1, $00000000);       // Squire's Pants
          c.ItemsAdd($FF,7, 43,1, $00000000);         // Squire's Boots
          c.ItemsAdd($FF,15, 2361,1, $00000000);      // Battleworn Hammer
          c.ItemsAdd($FF,23, 4540,4, $00000000);      // Tough Hunk of Bread
          c.ItemsAdd($FF,24, 159,2, $00000000);       // Refreshing Spring Water
          c.ItemsAdd($FF,25, 6948,1, $0001);      // Hearthstone

          c.SkillsAdd(415, 1,1, 0,0);             // Cloth
          c.SkillsAdd(594, 5,5, 0,0);             // Holy
          c.SkillsAdd(202, 0,0, 0,0);             // Engineering
          c.SkillsAdd(356, 0,0, 0,0);             // Fishing
          c.SkillsAdd(171, 0,0, 0,0);             // Alchemy
          c.SkillsAdd(182, 0,0, 0,0);             // Herbalism
          c.SkillsAdd(673, 0,0, 0,0);             // Language: Gutterspeak
          c.SkillsAdd(95, 5,1, 0,0);              // Defense
          c.SkillsAdd(333, 0,0, 0,0);             // Enchanting
          c.SkillsAdd(55, 5,0, 0,0);              // Two-Handed Swords
          c.SkillsAdd(713, 0,0, 0,0);             // Kodo Riding
          c.SkillsAdd(129, 0,0, 0,0);             // First Aid
          c.SkillsAdd(185, 0,0, 0,0);             // Cooking
          c.SkillsAdd(267, 5,0, 0,0);             // Protection
          c.SkillsAdd(162, 5,1, 0,0);             // Unarmed
          c.SkillsAdd(160, 5,1, 0,0);             // Two-Handed Maces
          c.SkillsAdd(165, 0,0, 0,0);             // Leatherworking
          c.SkillsAdd(43, 5,0, 0,0);              // Swords
          c.SkillsAdd(186, 0,0, 0,0);             // Mining
          c.SkillsAdd(98, 300,300, 0,0);          // Language: Common
          c.SkillsAdd(54, 5,1, 0,0);              // Maces
          c.SkillsAdd(533, 0,0, 0,0);             // Raptor Riding
          c.SkillsAdd(553, 0,0, 0,0);             // Mechanostrider Piloting
          c.SkillsAdd(554, 0,0, 0,0);             // Undead Horsemanship
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(229, 0,0, 0,0);             // Polearms
          c.SkillsAdd(293, 0,0, 0,0);             // Plate Mail
          c.SkillsAdd(315, 0,0, 0,0);             // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(152, 0,0, 0,0);             // Ram Riding
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(184, 5,0, 0,0);             // Retribution
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 0,0, 0,0);             // Language: Orcish
          c.SkillsAdd(433, 1,1, 0,0);             // Shield
          c.SkillsAdd(137, 0,0, 0,0);             // Language: Thalassian
          c.SkillsAdd(140, 0,0, 0,0);             // Language: Titan
          c.SkillsAdd(149, 0,0, 0,0);             // Wolf Riding
          c.SkillsAdd(313, 0,0, 0,0);             // Language: Gnomish
          c.SkillsAdd(413, 1,1, 0,0);             // Mail
          c.SkillsAdd(414, 1,1, 0,0);             // Leather
          c.SkillsAdd(759, 0,0, 0,0);             // Language: Draenei
          c.SkillsAdd(197, 0,0, 0,0);             // Tailoring
          c.SkillsAdd(44, 5,0, 0,0);              // Axes
          c.SkillsAdd(101, 5,5, 0,0);             // Dwarven Racial
          c.SkillsAdd(111, 300,300, 0,0);         // Language: Dwarven
          c.SkillsAdd(113, 0,0, 0,0);             // Language: Darnassian
          c.SkillsAdd(115, 0,0, 0,0);             // Language: Taurahe
          c.SkillsAdd(138, 0,0, 0,0);             // Language: Draconic
          c.SkillsAdd(141, 0,0, 0,0);             // Language: Old Tongue
          c.SkillsAdd(142, 1,0, 0,0);             // Survival
          c.SkillsAdd(148, 0,0, 0,0);             // Horse Riding
          c.SkillsAdd(150, 0,0, 0,0);             // Tiger Riding
          c.SkillsAdd(164, 0,0, 0,0);             // Blacksmithing
          c.SkillsAdd(172, 5,0, 0,0);             // Two-Handed Axes

          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(20154, 0);                  // Seal of Righteousness
          c.SpellsAdd(635, 0);                    // Holy Light
          c.SpellsAdd(107, 0);                    // Block
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(203, 0);                    // Unarmed
          c.SpellsAdd(199, 0);                    // Two-Handed Maces
          c.SpellsAdd(668, 0);                    // Language Common
          c.SpellsAdd(198, 0);                    // One-Handed Maces
          c.SpellsAdd(21651, 0);                  // Opening
          c.SpellsAdd(21652, 0);                  // Closing
          c.SpellsAdd(8386, 0);                   // Attacking
          c.SpellsAdd(9125, 0);                   // Generic
          c.SpellsAdd(7266, 0);                   // Duel
          c.SpellsAdd(7267, 0);                   // Grovel
          c.SpellsAdd(7355, 0);                   // Stuck
          c.SpellsAdd(27762, 0);                  // Libram
          c.SpellsAdd(22027, 0);                  // Remove Insignia
          c.SpellsAdd(22810, 0);                  // Opening - No Text
          c.SpellsAdd(2479, 0);                   // Honorless Target
          c.SpellsAdd(2382, 0);                   // Generic
          c.SpellsAdd(3365, 0);                   // Opening
          c.SpellsAdd(3050, 0);                   // Detect
          c.SpellsAdd(6477, 0);                   // Opening
          c.SpellsAdd(6478, 0);                   // Opening
          c.SpellsAdd(6603, 0);                   // Attack
          c.SpellsAdd(6233, 0);                   // Closing
          c.SpellsAdd(6246, 0);                   // Closing
          c.SpellsAdd(6247, 0);                   // Opening
          c.SpellsAdd(9116, 0);                   // Shield
          c.SpellsAdd(8737, 0);                   // Mail
          c.SpellsAdd(9077, 0);                   // Leather
          c.SpellsAdd(2481, 0);                   // Find Treasure
          c.SpellsAdd(20596, 0);                  // Frost Resistance
          c.SpellsAdd(20595, 0);                  // Gun Specialization
          c.SpellsAdd(20594, 0);                  // Stoneform
          c.SpellsAdd(672, 0);                    // Language Dwarven

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 20154, $00000000);    // Spell: Seal of Righteousness
          c.SetActionButtons(2, 635, $00000000);      // Spell: Holy Light
          c.SetActionButtons(3, 20594, $00000000);    // Spell: Stoneform
          c.SetActionButtons(4, 2481, $00000000);     // Spell: Find Treasure
          c.SetActionButtons(10, 159, $80000000);     // Item: Refreshing Spring Water
          c.SetActionButtons(11, 4540, $80000000);    // Item: Tough Hunk of Bread
end;
procedure RACE_DWARF_CLASS_HUNTER(var c:TCharData);
begin
          c.max_health                 :=86;
          c.power_type                 :=POWER_MANA;
          c.max_power[POWER_MANA]      :=84;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=2000;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=2300;
          c.base_mana                  :=65;
          c.base_health                :=26;

          c.attack_power               :=23;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=20;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=4.29;
          c.max_damage                 :=6.29;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=6.80;
          c.max_ranged_damage          :=11.80;

          c.stat[0]                    :=22;      // strength
          c.stat[1]                    :=19;      // agility
          c.stat[2]                    :=24;      // stamina
          c.stat[3]                    :=19;      // intellect
          c.stat[4]                    :=20;      // spirit

          c.ammo_id                    :=2516;

          c.ItemsAdd($FF,3, 148,1, $00000000);        // Rugged Trapper's Shirt
          c.ItemsAdd($FF,6, 147,1, $00000000);        // Rugged Trapper's Pants
          c.ItemsAdd($FF,7, 129,1, $00000000);        // Rugged Trapper's Boots
          c.ItemsAdd($FF,15, 37,1, $00000000);        // Worn Axe
          c.ItemsAdd($FF,17, 2508,1, $00000000);      // Old Blunderbuss
          c.ItemsAdd($FF,19, 2102,1, $00000000);      // Small Ammo Pouch
          c.ItemsAdd($FF,23, 159,2, $00000000);       // Refreshing Spring Water
          c.ItemsAdd($FF,24, 117,4, $00000000);       // Tough Jerky
          c.ItemsAdd($FF,25, 6948,1, $0001);      // Hearthstone
          c.ItemsAdd(19,0, 2516,200, $00000000);

          c.SkillsAdd(415, 1,1, 0,0);             // Cloth
          c.SkillsAdd(202, 0,0, 0,0);             // Engineering
          c.SkillsAdd(356, 0,0, 0,0);             // Fishing
          c.SkillsAdd(171, 0,0, 0,0);             // Alchemy
          c.SkillsAdd(182, 0,0, 0,0);             // Herbalism
          c.SkillsAdd(673, 0,0, 0,0);             // Language: Gutterspeak
          c.SkillsAdd(95, 5,1, 0,0);              // Defense
          c.SkillsAdd(333, 0,0, 0,0);             // Enchanting
          c.SkillsAdd(55, 5,0, 0,0);              // Two-Handed Swords
          c.SkillsAdd(713, 0,0, 0,0);             // Kodo Riding
          c.SkillsAdd(176, 5,0, 0,0);             // Thrown
          c.SkillsAdd(129, 0,0, 0,0);             // First Aid
          c.SkillsAdd(185, 0,0, 0,0);             // Cooking
          c.SkillsAdd(261, 5,0, 0,0);             // Beast Training
          c.SkillsAdd(162, 5,1, 0,0);             // Unarmed
          c.SkillsAdd(165, 0,0, 0,0);             // Leatherworking
          c.SkillsAdd(43, 5,0, 0,0);              // Swords
          c.SkillsAdd(186, 0,0, 0,0);             // Mining
          c.SkillsAdd(51, 5,5, 0,0);              // Survival
          c.SkillsAdd(98, 300,300, 0,0);          // Language: Common
          c.SkillsAdd(136, 5,0, 0,0);             // Staves
          c.SkillsAdd(533, 0,0, 0,0);             // Raptor Riding
          c.SkillsAdd(553, 0,0, 0,0);             // Mechanostrider Piloting
          c.SkillsAdd(554, 0,0, 0,0);             // Undead Horsemanship
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(229, 0,0, 0,0);             // Polearms
          c.SkillsAdd(46, 5,1, 5,0);              // Guns
          c.SkillsAdd(315, 0,0, 0,0);             // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(152, 0,0, 0,0);             // Ram Riding
          c.SkillsAdd(173, 5,0, 0,0);             // Daggers
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(226, 5,0, 0,0);             // Crossbows
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 0,0, 0,0);             // Language: Orcish
          c.SkillsAdd(137, 0,0, 0,0);             // Language: Thalassian
          c.SkillsAdd(473, 1,0, 0,0);             // Fist Weapons
          c.SkillsAdd(140, 0,0, 0,0);             // Language: Titan
          c.SkillsAdd(149, 0,0, 0,0);             // Wolf Riding
          c.SkillsAdd(313, 0,0, 0,0);             // Language: Gnomish
          c.SkillsAdd(413, 0,0, 0,0);             // Mail
          c.SkillsAdd(414, 1,1, 0,0);             // Leather
          c.SkillsAdd(45, 5,0, 0,0);              // Bows
          c.SkillsAdd(759, 0,0, 0,0);             // Language: Draenei
          c.SkillsAdd(197, 0,0, 0,0);             // Tailoring
          c.SkillsAdd(44, 5,1, 0,0);              // Axes
          c.SkillsAdd(50, 5,0, 0,0);              // Beast Mastery
          c.SkillsAdd(101, 5,5, 0,0);             // Dwarven Racial
          c.SkillsAdd(111, 300,300, 0,0);         // Language: Dwarven
          c.SkillsAdd(113, 0,0, 0,0);             // Language: Darnassian
          c.SkillsAdd(115, 0,0, 0,0);             // Language: Taurahe
          c.SkillsAdd(118, 0,0, 0,0);             // Dual Wield
          c.SkillsAdd(138, 0,0, 0,0);             // Language: Draconic
          c.SkillsAdd(141, 0,0, 0,0);             // Language: Old Tongue
          c.SkillsAdd(142, 1,0, 0,0);             // Survival
          c.SkillsAdd(148, 0,0, 0,0);             // Horse Riding
          c.SkillsAdd(150, 0,0, 0,0);             // Tiger Riding
          c.SkillsAdd(163, 5,5, 0,0);             // Marksmanship
          c.SkillsAdd(164, 0,0, 0,0);             // Blacksmithing
          c.SkillsAdd(172, 5,0, 0,0);             // Two-Handed Axes

          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(24949, 0);                  // Defensive State 2 (DND)
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(13358, 0);                  // Defensive State (DND)
          c.SpellsAdd(203, 0);                    // Unarmed
          c.SpellsAdd(2973, 0);                   // Raptor Strike
          c.SpellsAdd(668, 0);                    // Language Common
          c.SpellsAdd(266, 0);                    // Guns
          c.SpellsAdd(21651, 0);                  // Opening
          c.SpellsAdd(21652, 0);                  // Closing
          c.SpellsAdd(8386, 0);                   // Attacking
          c.SpellsAdd(9125, 0);                   // Generic
          c.SpellsAdd(7266, 0);                   // Duel
          c.SpellsAdd(7267, 0);                   // Grovel
          c.SpellsAdd(7355, 0);                   // Stuck
          c.SpellsAdd(34082, 0);                  // Advantaged State (DND)
          c.SpellsAdd(22027, 0);                  // Remove Insignia
          c.SpellsAdd(22810, 0);                  // Opening - No Text
          c.SpellsAdd(2479, 0);                   // Honorless Target
          c.SpellsAdd(2382, 0);                   // Generic
          c.SpellsAdd(3365, 0);                   // Opening
          c.SpellsAdd(3050, 0);                   // Detect
          c.SpellsAdd(6477, 0);                   // Opening
          c.SpellsAdd(6478, 0);                   // Opening
          c.SpellsAdd(6603, 0);                   // Attack
          c.SpellsAdd(6233, 0);                   // Closing
          c.SpellsAdd(6246, 0);                   // Closing
          c.SpellsAdd(6247, 0);                   // Opening
          c.SpellsAdd(9077, 0);                   // Leather
          c.SpellsAdd(196, 0);                    // One-Handed Axes
          c.SpellsAdd(2481, 0);                   // Find Treasure
          c.SpellsAdd(20596, 0);                  // Frost Resistance
          c.SpellsAdd(20595, 0);                  // Gun Specialization
          c.SpellsAdd(20594, 0);                  // Stoneform
          c.SpellsAdd(672, 0);                    // Language Dwarven
          c.SpellsAdd(75, 0);                     // Auto Shot

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 2973, $00000000);     // Spell: Raptor Strike
          c.SetActionButtons(2, 75, $00000000);       // Spell: Auto Shot
          c.SetActionButtons(3, 20594, $00000000);    // Spell: Stoneform
          c.SetActionButtons(4, 2481, $00000000);     // Spell: Find Treasure
          c.SetActionButtons(10, 159, $80000000);     // Item: Refreshing Spring Water
          c.SetActionButtons(11, 117, $80000000);     // Item: Tough Jerky
          c.SetActionButtons(75, 20594, $00000000);   // Spell: Stoneform
          c.SetActionButtons(76, 2481, $00000000);    // Spell: Find Treasure
end;
procedure RACE_DWARF_CLASS_ROGUE(var c:TCharData);
begin
          c.max_health                 :=85;
          c.power_type                 :=POWER_ENERGY;
          c.max_power[POWER_MANA]      :=0;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=1600;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=1800;
          c.base_mana                  :=0;
          c.base_health                :=25;

          c.attack_power               :=24;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=10;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=3.74;
          c.max_damage                 :=4.74;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=5.29;
          c.max_ranged_damage          :=9.29;

          c.stat[0]                    :=23;      // strength
          c.stat[1]                    :=19;      // agility
          c.stat[2]                    :=24;      // stamina
          c.stat[3]                    :=19;      // intellect
          c.stat[4]                    :=19;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,3, 49,1, $00000000);         // Footpad's Shirt
          c.ItemsAdd($FF,6, 48,1, $00000000);         // Footpad's Pants
          c.ItemsAdd($FF,7, 47,1, $00000000);         // Footpad's Shoes
          c.ItemsAdd($FF,15, 2092,1, $00000000);      // Worn Dagger
          c.ItemsAdd($FF,17, 25861,1, $00000000);     // Crude Throwing Axe
          c.ItemsAdd($FF,23, 4540,4, $00000000);      // Tough Hunk of Bread
          c.ItemsAdd($FF,24, 6948,1, $0001);      // Hearthstone

          c.SkillsAdd(415, 1,1, 0,0);             // Cloth
          c.SkillsAdd(633, 5,0, 0,0);             // Lockpicking
          c.SkillsAdd(202, 0,0, 0,0);             // Engineering
          c.SkillsAdd(356, 0,0, 0,0);             // Fishing
          c.SkillsAdd(171, 0,0, 0,0);             // Alchemy
          c.SkillsAdd(182, 0,0, 0,0);             // Herbalism
          c.SkillsAdd(673, 0,0, 0,0);             // Language: Gutterspeak
          c.SkillsAdd(95, 5,1, 0,0);              // Defense
          c.SkillsAdd(333, 0,0, 0,0);             // Enchanting
          c.SkillsAdd(713, 0,0, 0,0);             // Kodo Riding
          c.SkillsAdd(176, 5,1, 0,0);             // Thrown
          c.SkillsAdd(38, 5,5, 0,0);              // Combat
          c.SkillsAdd(39, 5,0, 0,0);              // Subtlety
          c.SkillsAdd(129, 0,0, 0,0);             // First Aid
          c.SkillsAdd(185, 0,0, 0,0);             // Cooking
          c.SkillsAdd(40, 5,0, 0,0);              // Poisons
          c.SkillsAdd(162, 5,1, 0,0);             // Unarmed
          c.SkillsAdd(165, 0,0, 0,0);             // Leatherworking
          c.SkillsAdd(43, 5,0, 0,0);              // Swords
          c.SkillsAdd(186, 0,0, 0,0);             // Mining
          c.SkillsAdd(98, 300,300, 0,0);          // Language: Common
          c.SkillsAdd(54, 5,0, 0,0);              // Maces
          c.SkillsAdd(533, 0,0, 0,0);             // Raptor Riding
          c.SkillsAdd(553, 0,0, 0,0);             // Mechanostrider Piloting
          c.SkillsAdd(554, 0,0, 0,0);             // Undead Horsemanship
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(46, 5,0, 5,0);              // Guns
          c.SkillsAdd(315, 0,0, 0,0);             // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(152, 0,0, 0,0);             // Ram Riding
          c.SkillsAdd(173, 5,1, 0,0);             // Daggers
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(226, 5,0, 0,0);             // Crossbows
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 0,0, 0,0);             // Language: Orcish
          c.SkillsAdd(137, 0,0, 0,0);             // Language: Thalassian
          c.SkillsAdd(473, 1,0, 0,0);             // Fist Weapons
          c.SkillsAdd(140, 0,0, 0,0);             // Language: Titan
          c.SkillsAdd(149, 0,0, 0,0);             // Wolf Riding
          c.SkillsAdd(253, 5,5, 0,0);             // Assassination
          c.SkillsAdd(313, 0,0, 0,0);             // Language: Gnomish
          c.SkillsAdd(414, 1,1, 0,0);             // Leather
          c.SkillsAdd(45, 5,0, 0,0);              // Bows
          c.SkillsAdd(759, 0,0, 0,0);             // Language: Draenei
          c.SkillsAdd(197, 0,0, 0,0);             // Tailoring
          c.SkillsAdd(101, 5,5, 0,0);             // Dwarven Racial
          c.SkillsAdd(111, 300,300, 0,0);         // Language: Dwarven
          c.SkillsAdd(113, 0,0, 0,0);             // Language: Darnassian
          c.SkillsAdd(115, 0,0, 0,0);             // Language: Taurahe
          c.SkillsAdd(118, 0,0, 0,0);             // Dual Wield
          c.SkillsAdd(138, 0,0, 0,0);             // Language: Draconic
          c.SkillsAdd(141, 0,0, 0,0);             // Language: Old Tongue
          c.SkillsAdd(142, 1,0, 0,0);             // Survival
          c.SkillsAdd(148, 0,0, 0,0);             // Horse Riding
          c.SkillsAdd(150, 0,0, 0,0);             // Tiger Riding
          c.SkillsAdd(164, 0,0, 0,0);             // Blacksmithing

          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(16092, 0);                  // Defensive State (DND)
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(2567, 0);                   // Thrown
          c.SpellsAdd(2764, 0);                   // Throw
          c.SpellsAdd(21184, 0);                  // Rogue Passive (DND)
          c.SpellsAdd(1752, 0);                   // Sinister Strike
          c.SpellsAdd(203, 0);                    // Unarmed
          c.SpellsAdd(668, 0);                    // Language Common
          c.SpellsAdd(1180, 0);                   // Daggers
          c.SpellsAdd(21651, 0);                  // Opening
          c.SpellsAdd(21652, 0);                  // Closing
          c.SpellsAdd(8386, 0);                   // Attacking
          c.SpellsAdd(9125, 0);                   // Generic
          c.SpellsAdd(7266, 0);                   // Duel
          c.SpellsAdd(7267, 0);                   // Grovel
          c.SpellsAdd(7355, 0);                   // Stuck
          c.SpellsAdd(22027, 0);                  // Remove Insignia
          c.SpellsAdd(22810, 0);                  // Opening - No Text
          c.SpellsAdd(2479, 0);                   // Honorless Target
          c.SpellsAdd(2382, 0);                   // Generic
          c.SpellsAdd(3365, 0);                   // Opening
          c.SpellsAdd(3050, 0);                   // Detect
          c.SpellsAdd(6477, 0);                   // Opening
          c.SpellsAdd(6478, 0);                   // Opening
          c.SpellsAdd(6603, 0);                   // Attack
          c.SpellsAdd(6233, 0);                   // Closing
          c.SpellsAdd(6246, 0);                   // Closing
          c.SpellsAdd(6247, 0);                   // Opening
          c.SpellsAdd(2098, 0);                   // Eviscerate
          c.SpellsAdd(9077, 0);                   // Leather
          c.SpellsAdd(2481, 0);                   // Find Treasure
          c.SpellsAdd(20596, 0);                  // Frost Resistance
          c.SpellsAdd(20595, 0);                  // Gun Specialization
          c.SpellsAdd(20594, 0);                  // Stoneform
          c.SpellsAdd(672, 0);                    // Language Dwarven

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 1752, $00000000);     // Spell: Sinister Strike
          c.SetActionButtons(2, 2098, $00000000);     // Spell: Eviscerate
          c.SetActionButtons(3, 2764, $00000000);     // Spell: Throw
          c.SetActionButtons(4, 20594, $00000000);    // Spell: Stoneform
          c.SetActionButtons(5, 2481, $00000000);     // Spell: Find Treasure
          c.SetActionButtons(11, 4540, $80000000);    // Item: Tough Hunk of Bread
end;
procedure RACE_DWARF_CLASS_PRIEST(var c:TCharData);
begin
          c.max_health                 :=82;
          c.power_type                 :=POWER_MANA;
          c.max_power[POWER_MANA]      :=145;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=1900;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=0;
          c.base_mana                  :=110;
          c.base_health                :=32;

          c.attack_power               :=12;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=6;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=2.63;
          c.max_damage                 :=4.63;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=0.0;
          c.max_ranged_damage          :=0.0;

          c.stat[0]                    :=22;      // strength
          c.stat[1]                    :=16;      // agility
          c.stat[2]                    :=23;      // stamina
          c.stat[3]                    :=21;      // intellect
          c.stat[4]                    :=22;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,3, 53,1, $00000000);         // Neophyte's Shirt
          c.ItemsAdd($FF,4, 6098,1, $00000000);       // Neophyte's Robe
          c.ItemsAdd($FF,6, 52,1, $00000000);         // Neophyte's Pants
          c.ItemsAdd($FF,7, 51,1, $00000000);         // Neophyte's Boots
          c.ItemsAdd($FF,15, 36,1, $00000000);        // Worn Mace
          c.ItemsAdd($FF,23, 159,2, $00000000);       // Refreshing Spring Water
          c.ItemsAdd($FF,24, 4540,4, $00000000);      // Tough Hunk of Bread
          c.ItemsAdd($FF,25, 6948,1, $0001);      // Hearthstone

          c.SkillsAdd(415, 1,1, 0,0);             // Cloth
          c.SkillsAdd(202, 0,0, 0,0);             // Engineering
          c.SkillsAdd(356, 0,0, 0,0);             // Fishing
          c.SkillsAdd(171, 0,0, 0,0);             // Alchemy
          c.SkillsAdd(182, 0,0, 0,0);             // Herbalism
          c.SkillsAdd(673, 0,0, 0,0);             // Language: Gutterspeak
          c.SkillsAdd(95, 5,1, 0,0);              // Defense
          c.SkillsAdd(333, 0,0, 0,0);             // Enchanting
          c.SkillsAdd(713, 0,0, 0,0);             // Kodo Riding
          c.SkillsAdd(129, 0,0, 0,0);             // First Aid
          c.SkillsAdd(185, 0,0, 0,0);             // Cooking
          c.SkillsAdd(162, 5,1, 0,0);             // Unarmed
          c.SkillsAdd(165, 0,0, 0,0);             // Leatherworking
          c.SkillsAdd(186, 0,0, 0,0);             // Mining
          c.SkillsAdd(98, 300,300, 0,0);          // Language: Common
          c.SkillsAdd(136, 5,0, 0,0);             // Staves
          c.SkillsAdd(54, 5,1, 0,0);              // Maces
          c.SkillsAdd(533, 0,0, 0,0);             // Raptor Riding
          c.SkillsAdd(553, 0,0, 0,0);             // Mechanostrider Piloting
          c.SkillsAdd(554, 0,0, 0,0);             // Undead Horsemanship
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(315, 0,0, 0,0);             // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(152, 0,0, 0,0);             // Ram Riding
          c.SkillsAdd(173, 5,0, 0,0);             // Daggers
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(228, 5,1, 0,0);             // Wands
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 0,0, 0,0);             // Language: Orcish
          c.SkillsAdd(137, 0,0, 0,0);             // Language: Thalassian
          c.SkillsAdd(140, 0,0, 0,0);             // Language: Titan
          c.SkillsAdd(149, 0,0, 0,0);             // Wolf Riding
          c.SkillsAdd(313, 0,0, 0,0);             // Language: Gnomish
          c.SkillsAdd(613, 5,0, 0,0);             // Discipline
          c.SkillsAdd(78, 5,0, 0,0);              // Shadow Magic
          c.SkillsAdd(759, 0,0, 0,0);             // Language: Draenei
          c.SkillsAdd(197, 0,0, 0,0);             // Tailoring
          c.SkillsAdd(56, 5,5, 0,0);              // Holy
          c.SkillsAdd(101, 5,5, 0,0);             // Dwarven Racial
          c.SkillsAdd(111, 300,300, 0,0);         // Language: Dwarven
          c.SkillsAdd(113, 0,0, 0,0);             // Language: Darnassian
          c.SkillsAdd(115, 0,0, 0,0);             // Language: Taurahe
          c.SkillsAdd(138, 0,0, 0,0);             // Language: Draconic
          c.SkillsAdd(141, 0,0, 0,0);             // Language: Old Tongue
          c.SkillsAdd(142, 1,0, 0,0);             // Survival
          c.SkillsAdd(148, 0,0, 0,0);             // Horse Riding
          c.SkillsAdd(150, 0,0, 0,0);             // Tiger Riding
          c.SkillsAdd(164, 0,0, 0,0);             // Blacksmithing

          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(203, 0);                    // Unarmed
          c.SpellsAdd(668, 0);                    // Language Common
          c.SpellsAdd(198, 0);                    // One-Handed Maces
          c.SpellsAdd(21651, 0);                  // Opening
          c.SpellsAdd(21652, 0);                  // Closing
          c.SpellsAdd(8386, 0);                   // Attacking
          c.SpellsAdd(9125, 0);                   // Generic
          c.SpellsAdd(7266, 0);                   // Duel
          c.SpellsAdd(7267, 0);                   // Grovel
          c.SpellsAdd(7355, 0);                   // Stuck
          c.SpellsAdd(22027, 0);                  // Remove Insignia
          c.SpellsAdd(22810, 0);                  // Opening - No Text
          c.SpellsAdd(2479, 0);                   // Honorless Target
          c.SpellsAdd(2382, 0);                   // Generic
          c.SpellsAdd(3365, 0);                   // Opening
          c.SpellsAdd(3050, 0);                   // Detect
          c.SpellsAdd(6477, 0);                   // Opening
          c.SpellsAdd(6478, 0);                   // Opening
          c.SpellsAdd(6603, 0);                   // Attack
          c.SpellsAdd(6233, 0);                   // Closing
          c.SpellsAdd(6246, 0);                   // Closing
          c.SpellsAdd(6247, 0);                   // Opening
          c.SpellsAdd(5009, 0);                   // Wands
          c.SpellsAdd(5019, 0);                   // Shoot
          c.SpellsAdd(2050, 0);                   // Lesser Heal
          c.SpellsAdd(585, 0);                    // Smite
          c.SpellsAdd(2481, 0);                   // Find Treasure
          c.SpellsAdd(20596, 0);                  // Frost Resistance
          c.SpellsAdd(20595, 0);                  // Gun Specialization
          c.SpellsAdd(20594, 0);                  // Stoneform
          c.SpellsAdd(672, 0);                    // Language Dwarven

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 585, $00000000);      // Spell: Smite
          c.SetActionButtons(2, 2050, $00000000);     // Spell: Lesser Heal
          c.SetActionButtons(3, 20594, $00000000);    // Spell: Stoneform
          c.SetActionButtons(4, 2481, $00000000);     // Spell: Find Treasure
          c.SetActionButtons(10, 159, $80000000);     // Item: Refreshing Spring Water
          c.SetActionButtons(11, 4540, $80000000);    // Item: Tough Hunk of Bread
end;

procedure RACE_NIGHTELF_CLASS_WARRIOR(var c:TCharData);
begin
          c.max_health                 :=50;
          c.power_type                 :=POWER_RAGE;
          c.max_power[POWER_MANA]      :=0;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=1900;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=0;
          c.base_mana                  :=0;
          c.base_health                :=20;

          c.attack_power               :=23;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=16;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=4.12;
          c.max_damage                 :=6.12;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=0.0;
          c.max_ranged_damage          :=0.0;

          c.stat[0]                    :=20;      // strength
          c.stat[1]                    :=25;      // agility
          c.stat[2]                    :=21;      // stamina
          c.stat[3]                    :=20;      // intellect
          c.stat[4]                    :=20;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,3, 6120,1, $00000000);       // Recruit's Shirt
          c.ItemsAdd($FF,6, 6121,1, $00000000);       // Recruit's Pants
          c.ItemsAdd($FF,7, 6122,1, $00000000);       // Recruit's Boots
          c.ItemsAdd($FF,15, 25,1, $00000000);        // Worn Shortsword
          c.ItemsAdd($FF,16, 2362,1, $00000000);      // Worn Wooden Shield
          c.ItemsAdd($FF,23, 117,4, $00000000);       // Tough Jerky
          c.ItemsAdd($FF,24, 6948,1, $0001);      // Hearthstone

          c.SkillsAdd(229, 0,0, 0,0);             // Polearms
          c.SkillsAdd(257, 5,0, 0,0);             // Protection
          c.SkillsAdd(293, 0,0, 0,0);             // Plate Mail
          c.SkillsAdd(46, 5,0, 0,0);              // Guns
          c.SkillsAdd(315, 0,0, 0,0);             // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(152, 0,0, 0,0);             // Ram Riding
          c.SkillsAdd(415, 1,1, 0,0);             // Cloth
          c.SkillsAdd(256, 5,0, 0,0);             // Fury
          c.SkillsAdd(202, 0,0, 0,0);             // Engineering
          c.SkillsAdd(356, 0,0, 0,0);             // Fishing
          c.SkillsAdd(171, 0,0, 0,0);             // Alchemy
          c.SkillsAdd(182, 0,0, 0,0);             // Herbalism
          c.SkillsAdd(673, 0,0, 0,0);             // Language: Gutterspeak
          c.SkillsAdd(95, 5,1, 0,0);              // Defense
          c.SkillsAdd(333, 0,0, 0,0);             // Enchanting
          c.SkillsAdd(55, 5,0, 0,0);              // Two-Handed Swords
          c.SkillsAdd(713, 0,0, 0,0);             // Kodo Riding
          c.SkillsAdd(176, 5,0, 0,0);             // Thrown
          c.SkillsAdd(414, 1,1, 0,0);             // Leather
          c.SkillsAdd(45, 5,0, 0,0);              // Bows
          c.SkillsAdd(26, 5,5, 0,0);              // Arms
          c.SkillsAdd(759, 0,0, 0,0);             // Language: Draenei
          c.SkillsAdd(197, 0,0, 0,0);             // Tailoring
          c.SkillsAdd(160, 5,0, 0,0);             // Two-Handed Maces
          c.SkillsAdd(165, 0,0, 0,0);             // Leatherworking
          c.SkillsAdd(43, 5,1, 0,0);              // Swords
          c.SkillsAdd(186, 0,0, 0,0);             // Mining
          c.SkillsAdd(98, 300,300, 0,0);          // Language: Common
          c.SkillsAdd(136, 5,0, 0,0);             // Staves
          c.SkillsAdd(54, 5,1, 0,0);              // Maces
          c.SkillsAdd(533, 0,0, 0,0);             // Raptor Riding
          c.SkillsAdd(554, 0,0, 0,0);             // Undead Horsemanship
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(129, 0,0, 0,0);             // First Aid
          c.SkillsAdd(185, 0,0, 0,0);             // Cooking
          c.SkillsAdd(126, 5,5, 0,0);             // Night Elf Racial
          c.SkillsAdd(162, 5,1, 0,0);             // Unarmed
          c.SkillsAdd(44, 5,0, 0,0);              // Axes
          c.SkillsAdd(111, 0,0, 0,0);             // Language: Dwarven
          c.SkillsAdd(113, 300,300, 0,0);         // Language: Darnassian
          c.SkillsAdd(115, 0,0, 0,0);             // Language: Taurahe
          c.SkillsAdd(118, 0,0, 0,0);             // Dual Wield
          c.SkillsAdd(138, 0,0, 0,0);             // Language: Draconic
          c.SkillsAdd(141, 0,0, 0,0);             // Language: Old Tongue
          c.SkillsAdd(142, 1,0, 0,0);             // Survival
          c.SkillsAdd(148, 0,0, 0,0);             // Horse Riding
          c.SkillsAdd(150, 0,0, 0,0);             // Tiger Riding
          c.SkillsAdd(164, 0,0, 0,0);             // Blacksmithing
          c.SkillsAdd(172, 5,0, 0,0);             // Two-Handed Axes
          c.SkillsAdd(173, 5,1, 0,0);             // Daggers
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(226, 5,0, 0,0);             // Crossbows
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 0,0, 0,0);             // Language: Orcish
          c.SkillsAdd(433, 1,1, 0,0);             // Shield
          c.SkillsAdd(137, 0,0, 0,0);             // Language: Thalassian
          c.SkillsAdd(473, 1,0, 0,0);             // Fist Weapons
          c.SkillsAdd(140, 0,0, 0,0);             // Language: Titan
          c.SkillsAdd(149, 0,0, 0,0);             // Wolf Riding
          c.SkillsAdd(313, 0,0, 0,0);             // Language: Gnomish
          c.SkillsAdd(413, 1,1, 0,0);             // Mail

          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(107, 0);                    // Block
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(5301, 0);                   // Defensive State (DND)
          c.SpellsAdd(32215, 0);                  // Victorious State
          c.SpellsAdd(9077, 0);                   // Leather
          c.SpellsAdd(2457, 0);                   // Battle Stance
          c.SpellsAdd(78, 0);                     // Heroic Strike
          c.SpellsAdd(201, 0);                    // One-Handed Swords
          c.SpellsAdd(668, 0);                    // Language Common
          c.SpellsAdd(198, 0);                    // One-Handed Maces
          c.SpellsAdd(20580, 0);                  // Shadowmeld
          c.SpellsAdd(20583, 0);                  // Nature Resistance
          c.SpellsAdd(20582, 0);                  // Quickness
          c.SpellsAdd(20585, 0);                  // Wisp Spirit
          c.SpellsAdd(21009, 0);                  // Shadowmeld Passive
          c.SpellsAdd(203, 0);                    // Unarmed
          c.SpellsAdd(671, 0);                    // Language Darnassian
          c.SpellsAdd(1180, 0);                   // Daggers
          c.SpellsAdd(2479, 0);                   // Honorless Target
          c.SpellsAdd(9125, 0);                   // Generic
          c.SpellsAdd(6477, 0);                   // Opening
          c.SpellsAdd(6478, 0);                   // Opening
          c.SpellsAdd(6603, 0);                   // Attack
          c.SpellsAdd(7266, 0);                   // Duel
          c.SpellsAdd(7267, 0);                   // Grovel
          c.SpellsAdd(7355, 0);                   // Stuck
          c.SpellsAdd(3365, 0);                   // Opening
          c.SpellsAdd(3050, 0);                   // Detect
          c.SpellsAdd(6233, 0);                   // Closing
          c.SpellsAdd(6246, 0);                   // Closing
          c.SpellsAdd(6247, 0);                   // Opening
          c.SpellsAdd(22027, 0);                  // Remove Insignia
          c.SpellsAdd(22810, 0);                  // Opening - No Text
          c.SpellsAdd(2382, 0);                   // Generic
          c.SpellsAdd(21651, 0);                  // Opening
          c.SpellsAdd(21652, 0);                  // Closing
          c.SpellsAdd(8386, 0);                   // Attacking
          c.SpellsAdd(9116, 0);                   // Shield
          c.SpellsAdd(8737, 0);                   // Mail

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(72, 6603, $00000000);    // Spell: Attack
          c.SetActionButtons(73, 78, $00000000);      // Spell: Heroic Strike
          c.SetActionButtons(74, 20580, $00000000);   // Spell: Shadowmeld
          c.SetActionButtons(83, 117, $80000000);     // Item: Tough Jerky
          c.SetActionButtons(84, 6603, $00000000);    // Spell: Attack
          c.SetActionButtons(96, 6603, $00000000);    // Spell: Attack
          c.SetActionButtons(108, 6603, $00000000);   // Spell: Attack
end;
procedure RACE_NIGHTELF_CLASS_HUNTER(var c:TCharData);
begin
          c.max_health                 :=46;
          c.power_type                 :=POWER_MANA;
          c.max_power[POWER_MANA]      :=85;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=1600;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=2300;
          c.base_mana                  :=65;
          c.base_health                :=26;

          c.attack_power               :=27;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=20;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=4.09;
          c.max_damage                 :=5.09;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=8.26;
          c.max_ranged_damage          :=13.26;

          c.stat[0]                    :=17;      // strength
          c.stat[1]                    :=28;      // agility
          c.stat[2]                    :=20;      // stamina
          c.stat[3]                    :=20;      // intellect
          c.stat[4]                    :=21;      // spirit

          c.ammo_id                    :=2512;

          c.ItemsAdd($FF,3, 148,1, $00000000);        // Rugged Trapper's Shirt
          c.ItemsAdd($FF,6, 147,1, $00000000);        // Rugged Trapper's Pants
          c.ItemsAdd($FF,7, 129,1, $00000000);        // Rugged Trapper's Boots
          c.ItemsAdd($FF,15, 2092,1, $00000000);      // Worn Dagger
          c.ItemsAdd($FF,17, 2504,1, $00000000);      // Worn Shortbow
          c.ItemsAdd($FF,19, 2101,1, $00000000);      // Light Quiver
          c.ItemsAdd($FF,23, 159,2, $00000000);       // Refreshing Spring Water
          c.ItemsAdd($FF,24, 117,4, $00000000);       // Tough Jerky
          c.ItemsAdd($FF,25, 6948,1, $0001);      // Hearthstone
          c.ItemsAdd(19,0, 2512,200, $00000000);

          c.SkillsAdd(229, 0,0, 0,0);             // Polearms
          c.SkillsAdd(46, 5,0, 0,0);              // Guns
          c.SkillsAdd(315, 0,0, 0,0);             // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(152, 0,0, 0,0);             // Ram Riding
          c.SkillsAdd(415, 1,1, 0,0);             // Cloth
          c.SkillsAdd(202, 0,0, 0,0);             // Engineering
          c.SkillsAdd(356, 0,0, 0,0);             // Fishing
          c.SkillsAdd(171, 0,0, 0,0);             // Alchemy
          c.SkillsAdd(182, 0,0, 0,0);             // Herbalism
          c.SkillsAdd(673, 0,0, 0,0);             // Language: Gutterspeak
          c.SkillsAdd(95, 5,1, 0,0);              // Defense
          c.SkillsAdd(333, 0,0, 0,0);             // Enchanting
          c.SkillsAdd(55, 5,0, 0,0);              // Two-Handed Swords
          c.SkillsAdd(713, 0,0, 0,0);             // Kodo Riding
          c.SkillsAdd(176, 5,0, 0,0);             // Thrown
          c.SkillsAdd(414, 1,1, 0,0);             // Leather
          c.SkillsAdd(45, 5,1, 0,0);              // Bows
          c.SkillsAdd(759, 0,0, 0,0);             // Language: Draenei
          c.SkillsAdd(197, 0,0, 0,0);             // Tailoring
          c.SkillsAdd(165, 0,0, 0,0);             // Leatherworking
          c.SkillsAdd(43, 5,0, 0,0);              // Swords
          c.SkillsAdd(186, 0,0, 0,0);             // Mining
          c.SkillsAdd(51, 5,5, 0,0);              // Survival
          c.SkillsAdd(98, 300,300, 0,0);          // Language: Common
          c.SkillsAdd(136, 5,0, 0,0);             // Staves
          c.SkillsAdd(533, 0,0, 0,0);             // Raptor Riding
          c.SkillsAdd(554, 0,0, 0,0);             // Undead Horsemanship
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(129, 0,0, 0,0);             // First Aid
          c.SkillsAdd(185, 0,0, 0,0);             // Cooking
          c.SkillsAdd(126, 5,5, 0,0);             // Night Elf Racial
          c.SkillsAdd(261, 5,0, 0,0);             // Beast Training
          c.SkillsAdd(162, 5,1, 0,0);             // Unarmed
          c.SkillsAdd(44, 5,0, 0,0);              // Axes
          c.SkillsAdd(50, 5,0, 0,0);              // Beast Mastery
          c.SkillsAdd(111, 0,0, 0,0);             // Language: Dwarven
          c.SkillsAdd(113, 300,300, 0,0);         // Language: Darnassian
          c.SkillsAdd(115, 0,0, 0,0);             // Language: Taurahe
          c.SkillsAdd(118, 0,0, 0,0);             // Dual Wield
          c.SkillsAdd(138, 0,0, 0,0);             // Language: Draconic
          c.SkillsAdd(141, 0,0, 0,0);             // Language: Old Tongue
          c.SkillsAdd(142, 1,0, 0,0);             // Survival
          c.SkillsAdd(148, 0,0, 0,0);             // Horse Riding
          c.SkillsAdd(150, 0,0, 0,0);             // Tiger Riding
          c.SkillsAdd(163, 5,5, 0,0);             // Marksmanship
          c.SkillsAdd(164, 0,0, 0,0);             // Blacksmithing
          c.SkillsAdd(172, 5,0, 0,0);             // Two-Handed Axes
          c.SkillsAdd(173, 5,1, 0,0);             // Daggers
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(226, 5,0, 0,0);             // Crossbows
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 0,0, 0,0);             // Language: Orcish
          c.SkillsAdd(137, 0,0, 0,0);             // Language: Thalassian
          c.SkillsAdd(473, 1,0, 0,0);             // Fist Weapons
          c.SkillsAdd(140, 0,0, 0,0);             // Language: Titan
          c.SkillsAdd(149, 0,0, 0,0);             // Wolf Riding
          c.SkillsAdd(313, 0,0, 0,0);             // Language: Gnomish
          c.SkillsAdd(413, 0,0, 0,0);             // Mail

          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(24949, 0);                  // Defensive State 2 (DND)
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(13358, 0);                  // Defensive State (DND)
          c.SpellsAdd(9077, 0);                   // Leather
          c.SpellsAdd(264, 0);                    // Bows
          c.SpellsAdd(2973, 0);                   // Raptor Strike
          c.SpellsAdd(668, 0);                    // Language Common
          c.SpellsAdd(20580, 0);                  // Shadowmeld
          c.SpellsAdd(20583, 0);                  // Nature Resistance
          c.SpellsAdd(20582, 0);                  // Quickness
          c.SpellsAdd(20585, 0);                  // Wisp Spirit
          c.SpellsAdd(21009, 0);                  // Shadowmeld Passive
          c.SpellsAdd(203, 0);                    // Unarmed
          c.SpellsAdd(671, 0);                    // Language Darnassian
          c.SpellsAdd(75, 0);                     // Auto Shot
          c.SpellsAdd(1180, 0);                   // Daggers
          c.SpellsAdd(2479, 0);                   // Honorless Target
          c.SpellsAdd(34082, 0);                  // Advantaged State (DND)
          c.SpellsAdd(9125, 0);                   // Generic
          c.SpellsAdd(6477, 0);                   // Opening
          c.SpellsAdd(6478, 0);                   // Opening
          c.SpellsAdd(6603, 0);                   // Attack
          c.SpellsAdd(7266, 0);                   // Duel
          c.SpellsAdd(7267, 0);                   // Grovel
          c.SpellsAdd(7355, 0);                   // Stuck
          c.SpellsAdd(3365, 0);                   // Opening
          c.SpellsAdd(3050, 0);                   // Detect
          c.SpellsAdd(6233, 0);                   // Closing
          c.SpellsAdd(6246, 0);                   // Closing
          c.SpellsAdd(6247, 0);                   // Opening
          c.SpellsAdd(22027, 0);                  // Remove Insignia
          c.SpellsAdd(22810, 0);                  // Opening - No Text
          c.SpellsAdd(2382, 0);                   // Generic
          c.SpellsAdd(21651, 0);                  // Opening
          c.SpellsAdd(21652, 0);                  // Closing
          c.SpellsAdd(8386, 0);                   // Attacking

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 2973, $00000000);     // Spell: Raptor Strike
          c.SetActionButtons(2, 75, $00000000);       // Spell: Auto Shot
          c.SetActionButtons(3, 20580, $00000000);    // Spell: Shadowmeld
          c.SetActionButtons(10, 159, $80000000);     // Item: Refreshing Spring Water
          c.SetActionButtons(11, 117, $80000000);     // Item: Tough Jerky
          c.SetActionButtons(75, 20580, $00000000);   // Spell: Shadowmeld
end;
procedure RACE_NIGHTELF_CLASS_ROGUE(var c:TCharData);
begin
          c.max_health                 :=45;
          c.power_type                 :=POWER_ENERGY;
          c.max_power[POWER_MANA]      :=0;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=1600;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=1600;
          c.base_mana                  :=0;
          c.base_health                :=25;

          c.attack_power               :=28;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=19;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=4.2;
          c.max_damage                 :=5.2;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=6.17;
          c.max_ranged_damage          :=9.17;

          c.stat[0]                    :=18;      // strength
          c.stat[1]                    :=28;      // agility
          c.stat[2]                    :=20;      // stamina
          c.stat[3]                    :=20;      // intellect
          c.stat[4]                    :=20;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,3, 49,1, $00000000);         // Footpad's Shirt
          c.ItemsAdd($FF,6, 48,1, $00000000);         // Footpad's Pants
          c.ItemsAdd($FF,7, 47,1, $00000000);         // Footpad's Shoes
          c.ItemsAdd($FF,15, 2092,1, $00000000);      // Worn Dagger
          c.ItemsAdd($FF,17, 28979,1, $00000000);     // Light Throwing Knife
          c.ItemsAdd($FF,23, 4540,4, $00000000);      // Tough Hunk of Bread
          c.ItemsAdd($FF,24, 6948,1, $0001);      // Hearthstone

          c.SkillsAdd(46, 5,0, 0,0);              // Guns
          c.SkillsAdd(315, 0,0, 0,0);             // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(152, 0,0, 0,0);             // Ram Riding
          c.SkillsAdd(415, 1,1, 0,0);             // Cloth
          c.SkillsAdd(633, 5,0, 0,0);             // Lockpicking
          c.SkillsAdd(202, 0,0, 0,0);             // Engineering
          c.SkillsAdd(356, 0,0, 0,0);             // Fishing
          c.SkillsAdd(171, 0,0, 0,0);             // Alchemy
          c.SkillsAdd(182, 0,0, 0,0);             // Herbalism
          c.SkillsAdd(673, 0,0, 0,0);             // Language: Gutterspeak
          c.SkillsAdd(95, 5,1, 0,0);              // Defense
          c.SkillsAdd(333, 0,0, 0,0);             // Enchanting
          c.SkillsAdd(713, 0,0, 0,0);             // Kodo Riding
          c.SkillsAdd(176, 5,1, 0,0);             // Thrown
          c.SkillsAdd(38, 5,5, 0,0);              // Combat
          c.SkillsAdd(39, 5,0, 0,0);              // Subtlety
          c.SkillsAdd(414, 1,1, 0,0);             // Leather
          c.SkillsAdd(45, 5,0, 0,0);              // Bows
          c.SkillsAdd(759, 0,0, 0,0);             // Language: Draenei
          c.SkillsAdd(197, 0,0, 0,0);             // Tailoring
          c.SkillsAdd(165, 0,0, 0,0);             // Leatherworking
          c.SkillsAdd(43, 5,0, 0,0);              // Swords
          c.SkillsAdd(186, 0,0, 0,0);             // Mining
          c.SkillsAdd(98, 300,300, 0,0);          // Language: Common
          c.SkillsAdd(54, 5,0, 0,0);              // Maces
          c.SkillsAdd(533, 0,0, 0,0);             // Raptor Riding
          c.SkillsAdd(554, 0,0, 0,0);             // Undead Horsemanship
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(129, 0,0, 0,0);             // First Aid
          c.SkillsAdd(185, 0,0, 0,0);             // Cooking
          c.SkillsAdd(126, 5,5, 0,0);             // Night Elf Racial
          c.SkillsAdd(40, 5,0, 0,0);              // Poisons
          c.SkillsAdd(162, 5,1, 0,0);             // Unarmed
          c.SkillsAdd(111, 0,0, 0,0);             // Language: Dwarven
          c.SkillsAdd(113, 300,300, 0,0);         // Language: Darnassian
          c.SkillsAdd(115, 0,0, 0,0);             // Language: Taurahe
          c.SkillsAdd(118, 0,0, 0,0);             // Dual Wield
          c.SkillsAdd(138, 0,0, 0,0);             // Language: Draconic
          c.SkillsAdd(141, 0,0, 0,0);             // Language: Old Tongue
          c.SkillsAdd(142, 1,0, 0,0);             // Survival
          c.SkillsAdd(148, 0,0, 0,0);             // Horse Riding
          c.SkillsAdd(150, 0,0, 0,0);             // Tiger Riding
          c.SkillsAdd(164, 0,0, 0,0);             // Blacksmithing
          c.SkillsAdd(173, 5,1, 0,0);             // Daggers
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(226, 5,0, 0,0);             // Crossbows
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 0,0, 0,0);             // Language: Orcish
          c.SkillsAdd(137, 0,0, 0,0);             // Language: Thalassian
          c.SkillsAdd(473, 1,0, 0,0);             // Fist Weapons
          c.SkillsAdd(140, 0,0, 0,0);             // Language: Titan
          c.SkillsAdd(149, 0,0, 0,0);             // Wolf Riding
          c.SkillsAdd(253, 5,5, 0,0);             // Assassination
          c.SkillsAdd(313, 0,0, 0,0);             // Language: Gnomish

          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(16092, 0);                  // Defensive State (DND)
          c.SpellsAdd(2764, 0);                   // Throw
          c.SpellsAdd(2567, 0);                   // Thrown
          c.SpellsAdd(21184, 0);                  // Rogue Passive (DND)
          c.SpellsAdd(1752, 0);                   // Sinister Strike
          c.SpellsAdd(9077, 0);                   // Leather
          c.SpellsAdd(668, 0);                    // Language Common
          c.SpellsAdd(20580, 0);                  // Shadowmeld
          c.SpellsAdd(20583, 0);                  // Nature Resistance
          c.SpellsAdd(20582, 0);                  // Quickness
          c.SpellsAdd(20585, 0);                  // Wisp Spirit
          c.SpellsAdd(21009, 0);                  // Shadowmeld Passive
          c.SpellsAdd(203, 0);                    // Unarmed
          c.SpellsAdd(671, 0);                    // Language Darnassian
          c.SpellsAdd(1180, 0);                   // Daggers
          c.SpellsAdd(2479, 0);                   // Honorless Target
          c.SpellsAdd(9125, 0);                   // Generic
          c.SpellsAdd(6477, 0);                   // Opening
          c.SpellsAdd(6478, 0);                   // Opening
          c.SpellsAdd(6603, 0);                   // Attack
          c.SpellsAdd(7266, 0);                   // Duel
          c.SpellsAdd(7267, 0);                   // Grovel
          c.SpellsAdd(7355, 0);                   // Stuck
          c.SpellsAdd(3365, 0);                   // Opening
          c.SpellsAdd(3050, 0);                   // Detect
          c.SpellsAdd(6233, 0);                   // Closing
          c.SpellsAdd(6246, 0);                   // Closing
          c.SpellsAdd(6247, 0);                   // Opening
          c.SpellsAdd(22027, 0);                  // Remove Insignia
          c.SpellsAdd(22810, 0);                  // Opening - No Text
          c.SpellsAdd(2382, 0);                   // Generic
          c.SpellsAdd(21651, 0);                  // Opening
          c.SpellsAdd(21652, 0);                  // Closing
          c.SpellsAdd(8386, 0);                   // Attacking
          c.SpellsAdd(2098, 0);                   // Eviscerate

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 1752, $00000000);     // Spell: Sinister Strike
          c.SetActionButtons(2, 2098, $00000000);     // Spell: Eviscerate
          c.SetActionButtons(3, 2764, $00000000);     // Spell: Throw
          c.SetActionButtons(11, 4540, $80000000);    // Item: Tough Hunk of Bread
end;
procedure RACE_NIGHTELF_CLASS_PRIEST(var c:TCharData);
begin
          c.max_health                 :=51;
          c.power_type                 :=POWER_MANA;
          c.max_power[POWER_MANA]      :=160;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=1900;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=0;
          c.base_mana                  :=110;
          c.base_health                :=32;

          c.attack_power               :=7;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=15;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=1.95;
          c.max_damage                 :=3.95;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=0.0;
          c.max_ranged_damage          :=0.0;

          c.stat[0]                    :=17;      // strength
          c.stat[1]                    :=25;      // agility
          c.stat[2]                    :=19;      // stamina
          c.stat[3]                    :=22;      // intellect
          c.stat[4]                    :=23;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,3, 53,1, $00000000);         // Neophyte's Shirt
          c.ItemsAdd($FF,4, 6119,1, $00000000);       // Neophyte's Robe
          c.ItemsAdd($FF,6, 52,1, $00000000);         // Neophyte's Pants
          c.ItemsAdd($FF,7, 51,1, $00000000);         // Neophyte's Boots
          c.ItemsAdd($FF,15, 36,1, $00000000);        // Worn Mace
          c.ItemsAdd($FF,23, 2070,4, $00000000);      // Darnassian Bleu
          c.ItemsAdd($FF,24, 159,2, $00000000);       // Refreshing Spring Water
          c.ItemsAdd($FF,25, 6948,1, $0001);      // Hearthstone

          c.SkillsAdd(315, 0,0, 0,0);             // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(152, 0,0, 0,0);             // Ram Riding
          c.SkillsAdd(415, 1,1, 0,0);             // Cloth
          c.SkillsAdd(202, 0,0, 0,0);             // Engineering
          c.SkillsAdd(356, 0,0, 0,0);             // Fishing
          c.SkillsAdd(171, 0,0, 0,0);             // Alchemy
          c.SkillsAdd(182, 0,0, 0,0);             // Herbalism
          c.SkillsAdd(673, 0,0, 0,0);             // Language: Gutterspeak
          c.SkillsAdd(95, 5,1, 0,0);              // Defense
          c.SkillsAdd(333, 0,0, 0,0);             // Enchanting
          c.SkillsAdd(713, 0,0, 0,0);             // Kodo Riding
          c.SkillsAdd(78, 5,0, 0,0);              // Shadow Magic
          c.SkillsAdd(759, 0,0, 0,0);             // Language: Draenei
          c.SkillsAdd(197, 0,0, 0,0);             // Tailoring
          c.SkillsAdd(165, 0,0, 0,0);             // Leatherworking
          c.SkillsAdd(186, 0,0, 0,0);             // Mining
          c.SkillsAdd(98, 300,300, 0,0);          // Language: Common
          c.SkillsAdd(136, 5,0, 0,0);             // Staves
          c.SkillsAdd(54, 5,1, 0,0);              // Maces
          c.SkillsAdd(533, 0,0, 0,0);             // Raptor Riding
          c.SkillsAdd(554, 0,0, 0,0);             // Undead Horsemanship
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(129, 0,0, 0,0);             // First Aid
          c.SkillsAdd(185, 0,0, 0,0);             // Cooking
          c.SkillsAdd(126, 5,5, 0,0);             // Night Elf Racial
          c.SkillsAdd(162, 5,1, 0,0);             // Unarmed
          c.SkillsAdd(56, 5,5, 0,0);              // Holy
          c.SkillsAdd(111, 0,0, 0,0);             // Language: Dwarven
          c.SkillsAdd(113, 300,300, 0,0);         // Language: Darnassian
          c.SkillsAdd(115, 0,0, 0,0);             // Language: Taurahe
          c.SkillsAdd(138, 0,0, 0,0);             // Language: Draconic
          c.SkillsAdd(141, 0,0, 0,0);             // Language: Old Tongue
          c.SkillsAdd(142, 1,0, 0,0);             // Survival
          c.SkillsAdd(148, 0,0, 0,0);             // Horse Riding
          c.SkillsAdd(150, 0,0, 0,0);             // Tiger Riding
          c.SkillsAdd(164, 0,0, 0,0);             // Blacksmithing
          c.SkillsAdd(173, 5,0, 0,0);             // Daggers
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(228, 5,1, 0,0);             // Wands
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 0,0, 0,0);             // Language: Orcish
          c.SkillsAdd(137, 0,0, 0,0);             // Language: Thalassian
          c.SkillsAdd(140, 0,0, 0,0);             // Language: Titan
          c.SkillsAdd(149, 0,0, 0,0);             // Wolf Riding
          c.SkillsAdd(313, 0,0, 0,0);             // Language: Gnomish
          c.SkillsAdd(613, 5,0, 0,0);             // Discipline

          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(668, 0);                    // Language Common
          c.SpellsAdd(198, 0);                    // One-Handed Maces
          c.SpellsAdd(20580, 0);                  // Shadowmeld
          c.SpellsAdd(20583, 0);                  // Nature Resistance
          c.SpellsAdd(20582, 0);                  // Quickness
          c.SpellsAdd(20585, 0);                  // Wisp Spirit
          c.SpellsAdd(21009, 0);                  // Shadowmeld Passive
          c.SpellsAdd(203, 0);                    // Unarmed
          c.SpellsAdd(2050, 0);                   // Lesser Heal
          c.SpellsAdd(585, 0);                    // Smite
          c.SpellsAdd(671, 0);                    // Language Darnassian
          c.SpellsAdd(2479, 0);                   // Honorless Target
          c.SpellsAdd(9125, 0);                   // Generic
          c.SpellsAdd(6477, 0);                   // Opening
          c.SpellsAdd(6478, 0);                   // Opening
          c.SpellsAdd(6603, 0);                   // Attack
          c.SpellsAdd(7266, 0);                   // Duel
          c.SpellsAdd(7267, 0);                   // Grovel
          c.SpellsAdd(7355, 0);                   // Stuck
          c.SpellsAdd(3365, 0);                   // Opening
          c.SpellsAdd(3050, 0);                   // Detect
          c.SpellsAdd(6233, 0);                   // Closing
          c.SpellsAdd(6246, 0);                   // Closing
          c.SpellsAdd(6247, 0);                   // Opening
          c.SpellsAdd(22027, 0);                  // Remove Insignia
          c.SpellsAdd(22810, 0);                  // Opening - No Text
          c.SpellsAdd(2382, 0);                   // Generic
          c.SpellsAdd(21651, 0);                  // Opening
          c.SpellsAdd(21652, 0);                  // Closing
          c.SpellsAdd(8386, 0);                   // Attacking
          c.SpellsAdd(5009, 0);                   // Wands
          c.SpellsAdd(5019, 0);                   // Shoot

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 585, $00000000);      // Spell: Smite
          c.SetActionButtons(2, 2050, $00000000);     // Spell: Lesser Heal
          c.SetActionButtons(3, 20580, $00000000);    // Spell: Shadowmeld
          c.SetActionButtons(10, 159, $80000000);     // Item: Refreshing Spring Water
          c.SetActionButtons(11, 2070, $80000000);    // Item: Darnassian Bleu
end;
procedure RACE_NIGHTELF_CLASS_DRUID(var c:TCharData);
begin
          c.max_health                 :=53;
          c.power_type                 :=POWER_MANA;
          c.max_power[POWER_MANA]      :=100;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=2900;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=0;
          c.base_mana                  :=50;
          c.base_health                :=34;

          c.attack_power               :=16;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=15;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=6.31;
          c.max_damage                 :=8.31;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=0.0;
          c.max_ranged_damage          :=0.0;

          c.stat[0]                    :=18;      // strength
          c.stat[1]                    :=25;      // agility
          c.stat[2]                    :=19;      // stamina
          c.stat[3]                    :=22;      // intellect
          c.stat[4]                    :=22;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,4, 6123,1, $00000000);       // Novice's Robe
          c.ItemsAdd($FF,6, 6124,1, $00000000);       // Novice's Pants
          c.ItemsAdd($FF,15, 3661,1, $00000000);      // Handcrafted Staff
          c.ItemsAdd($FF,23, 159,2, $00000000);       // Refreshing Spring Water
          c.ItemsAdd($FF,24, 4536,4, $00000000);      // Shiny Red Apple
          c.ItemsAdd($FF,25, 6948,1, $0001);      // Hearthstone

          c.SkillsAdd(573, 5,5, 0,0);             // Restoration
          c.SkillsAdd(315, 0,0, 0,0);             // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(152, 0,0, 0,0);             // Ram Riding
          c.SkillsAdd(134, 0,0, 0,0);             // Feral Combat
          c.SkillsAdd(415, 1,1, 0,0);             // Cloth
          c.SkillsAdd(202, 0,0, 0,0);             // Engineering
          c.SkillsAdd(356, 0,0, 0,0);             // Fishing
          c.SkillsAdd(171, 0,0, 0,0);             // Alchemy
          c.SkillsAdd(182, 0,0, 0,0);             // Herbalism
          c.SkillsAdd(673, 0,0, 0,0);             // Language: Gutterspeak
          c.SkillsAdd(95, 5,1, 0,0);              // Defense
          c.SkillsAdd(333, 0,0, 0,0);             // Enchanting
          c.SkillsAdd(713, 0,0, 0,0);             // Kodo Riding
          c.SkillsAdd(414, 1,1, 0,0);             // Leather
          c.SkillsAdd(759, 0,0, 0,0);             // Language: Draenei
          c.SkillsAdd(197, 0,0, 0,0);             // Tailoring
          c.SkillsAdd(160, 5,0, 0,0);             // Two-Handed Maces
          c.SkillsAdd(165, 0,0, 0,0);             // Leatherworking
          c.SkillsAdd(186, 0,0, 0,0);             // Mining
          c.SkillsAdd(98, 300,300, 0,0);          // Language: Common
          c.SkillsAdd(136, 5,1, 0,0);             // Staves
          c.SkillsAdd(54, 5,0, 0,0);              // Maces
          c.SkillsAdd(533, 0,0, 0,0);             // Raptor Riding
          c.SkillsAdd(554, 0,0, 0,0);             // Undead Horsemanship
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(129, 0,0, 0,0);             // First Aid
          c.SkillsAdd(185, 0,0, 0,0);             // Cooking
          c.SkillsAdd(126, 5,5, 0,0);             // Night Elf Racial
          c.SkillsAdd(162, 5,1, 0,0);             // Unarmed
          c.SkillsAdd(111, 0,0, 0,0);             // Language: Dwarven
          c.SkillsAdd(113, 300,300, 0,0);         // Language: Darnassian
          c.SkillsAdd(115, 0,0, 0,0);             // Language: Taurahe
          c.SkillsAdd(138, 0,0, 0,0);             // Language: Draconic
          c.SkillsAdd(141, 0,0, 0,0);             // Language: Old Tongue
          c.SkillsAdd(142, 1,0, 0,0);             // Survival
          c.SkillsAdd(148, 0,0, 0,0);             // Horse Riding
          c.SkillsAdd(150, 0,0, 0,0);             // Tiger Riding
          c.SkillsAdd(164, 0,0, 0,0);             // Blacksmithing
          c.SkillsAdd(173, 5,1, 0,0);             // Daggers
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(574, 5,5, 0,0);             // Balance
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 0,0, 0,0);             // Language: Orcish
          c.SkillsAdd(137, 0,0, 0,0);             // Language: Thalassian
          c.SkillsAdd(473, 1,0, 0,0);             // Fist Weapons
          c.SkillsAdd(140, 0,0, 0,0);             // Language: Titan
          c.SkillsAdd(149, 0,0, 0,0);             // Wolf Riding
          c.SkillsAdd(313, 0,0, 0,0);             // Language: Gnomish

          c.SpellsAdd(5185, 0);                   // Healing Touch
          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(9077, 0);                   // Leather
          c.SpellsAdd(668, 0);                    // Language Common
          c.SpellsAdd(227, 0);                    // Staves
          c.SpellsAdd(20580, 0);                  // Shadowmeld
          c.SpellsAdd(20583, 0);                  // Nature Resistance
          c.SpellsAdd(20582, 0);                  // Quickness
          c.SpellsAdd(20585, 0);                  // Wisp Spirit
          c.SpellsAdd(21009, 0);                  // Shadowmeld Passive
          c.SpellsAdd(203, 0);                    // Unarmed
          c.SpellsAdd(671, 0);                    // Language Darnassian
          c.SpellsAdd(1180, 0);                   // Daggers
          c.SpellsAdd(2479, 0);                   // Honorless Target
          c.SpellsAdd(27764, 0);                  // Fetish
          c.SpellsAdd(9125, 0);                   // Generic
          c.SpellsAdd(6477, 0);                   // Opening
          c.SpellsAdd(6478, 0);                   // Opening
          c.SpellsAdd(6603, 0);                   // Attack
          c.SpellsAdd(7266, 0);                   // Duel
          c.SpellsAdd(7267, 0);                   // Grovel
          c.SpellsAdd(7355, 0);                   // Stuck
          c.SpellsAdd(3365, 0);                   // Opening
          c.SpellsAdd(3050, 0);                   // Detect
          c.SpellsAdd(6233, 0);                   // Closing
          c.SpellsAdd(6246, 0);                   // Closing
          c.SpellsAdd(6247, 0);                   // Opening
          c.SpellsAdd(22027, 0);                  // Remove Insignia
          c.SpellsAdd(22810, 0);                  // Opening - No Text
          c.SpellsAdd(2382, 0);                   // Generic
          c.SpellsAdd(21651, 0);                  // Opening
          c.SpellsAdd(21652, 0);                  // Closing
          c.SpellsAdd(8386, 0);                   // Attacking
          c.SpellsAdd(5176, 0);                   // Wrath
          c.SpellsAdd(45927, 0);                   // Wrath

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 5176, $00000000);     // Spell: Wrath
          c.SetActionButtons(2, 5185, $00000000);     // Spell: Healing Touch
          c.SetActionButtons(3, 20580, $00000000);    // Spell: Shadowmeld
          c.SetActionButtons(10, 159, $80000000);     // Item: Refreshing Spring Water
          c.SetActionButtons(11, 4536, $80000000);    // Item: Shiny Red Apple
          c.SetActionButtons(72, 6603, $00000000);    // Spell: Attack
          c.SetActionButtons(84, 6603, $00000000);    // Spell: Attack
          c.SetActionButtons(96, 6603, $00000000);    // Spell: Attack
          c.SetActionButtons(108, 6603, $00000000);   // Spell: Attack
end;

procedure RACE_GNOME_CLASS_WARRIOR(var c:TCharData);
begin
          c.max_health                 :=50;
          c.power_type                 :=POWER_RAGE;
          c.max_power[POWER_MANA]      :=0;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=1900;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=0;
          c.base_mana                  :=0;
          c.base_health                :=20;

          c.attack_power               :=19;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=14;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=3.56;
          c.max_damage                 :=5.56;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=0.0;
          c.max_ranged_damage          :=0.0;

          c.stat[0]                    :=18;      // strength
          c.stat[1]                    :=23;      // agility
          c.stat[2]                    :=21;      // stamina
          c.stat[3]                    :=24;      // intellect
          c.stat[4]                    :=20;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,3, 38,1, $00000000);         // Recruit's Shirt
          c.ItemsAdd($FF,6, 39,1, $00000000);         // Recruit's Pants
          c.ItemsAdd($FF,7, 40,1, $00000000);         // Recruit's Boots
          c.ItemsAdd($FF,15, 25,1, $00000000);        // Worn Shortsword
          c.ItemsAdd($FF,16, 2362,1, $00000000);      // Worn Wooden Shield
          c.ItemsAdd($FF,23, 117,4, $00000000);       // Tough Jerky
          c.ItemsAdd($FF,24, 6948,1, $0001);      // Hearthstone

          c.SkillsAdd(229, 0,0, 0,0);             // Polearms
          c.SkillsAdd(257, 5,0, 0,0);             // Protection
          c.SkillsAdd(293, 0,0, 0,0);             // Plate Mail
          c.SkillsAdd(46, 5,0, 0,0);              // Guns
          c.SkillsAdd(315, 0,0, 0,0);             // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(152, 0,0, 0,0);             // Ram Riding
          c.SkillsAdd(415, 1,1, 0,0);             // Cloth
          c.SkillsAdd(256, 5,0, 0,0);             // Fury
          c.SkillsAdd(202, 0,0, 15,0);            // Engineering
          c.SkillsAdd(356, 0,0, 0,0);             // Fishing
          c.SkillsAdd(171, 0,0, 0,0);             // Alchemy
          c.SkillsAdd(182, 0,0, 0,0);             // Herbalism
          c.SkillsAdd(673, 0,0, 0,0);             // Language: Gutterspeak
          c.SkillsAdd(95, 5,1, 0,0);              // Defense
          c.SkillsAdd(333, 0,0, 0,0);             // Enchanting
          c.SkillsAdd(55, 5,0, 0,0);              // Two-Handed Swords
          c.SkillsAdd(713, 0,0, 0,0);             // Kodo Riding
          c.SkillsAdd(753, 5,5, 0,0);             // Racial - Gnome
          c.SkillsAdd(176, 5,0, 0,0);             // Thrown
          c.SkillsAdd(414, 1,1, 0,0);             // Leather
          c.SkillsAdd(45, 5,0, 0,0);              // Bows
          c.SkillsAdd(26, 5,5, 0,0);              // Arms
          c.SkillsAdd(759, 0,0, 0,0);             // Language: Draenei
          c.SkillsAdd(197, 0,0, 0,0);             // Tailoring
          c.SkillsAdd(160, 5,0, 0,0);             // Two-Handed Maces
          c.SkillsAdd(165, 0,0, 0,0);             // Leatherworking
          c.SkillsAdd(43, 5,1, 0,0);              // Swords
          c.SkillsAdd(186, 0,0, 0,0);             // Mining
          c.SkillsAdd(98, 300,300, 0,0);          // Language: Common
          c.SkillsAdd(136, 5,0, 0,0);             // Staves
          c.SkillsAdd(54, 5,1, 0,0);              // Maces
          c.SkillsAdd(533, 0,0, 0,0);             // Raptor Riding
          c.SkillsAdd(553, 0,0, 0,0);             // Mechanostrider Piloting
          c.SkillsAdd(554, 0,0, 0,0);             // Undead Horsemanship
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(129, 0,0, 0,0);             // First Aid
          c.SkillsAdd(185, 0,0, 0,0);             // Cooking
          c.SkillsAdd(162, 5,1, 0,0);             // Unarmed
          c.SkillsAdd(44, 5,0, 0,0);              // Axes
          c.SkillsAdd(111, 0,0, 0,0);             // Language: Dwarven
          c.SkillsAdd(113, 0,0, 0,0);             // Language: Darnassian
          c.SkillsAdd(115, 0,0, 0,0);             // Language: Taurahe
          c.SkillsAdd(118, 0,0, 0,0);             // Dual Wield
          c.SkillsAdd(138, 0,0, 0,0);             // Language: Draconic
          c.SkillsAdd(141, 0,0, 0,0);             // Language: Old Tongue
          c.SkillsAdd(142, 1,0, 0,0);             // Survival
          c.SkillsAdd(148, 0,0, 0,0);             // Horse Riding
          c.SkillsAdd(150, 0,0, 0,0);             // Tiger Riding
          c.SkillsAdd(164, 0,0, 0,0);             // Blacksmithing
          c.SkillsAdd(172, 5,0, 0,0);             // Two-Handed Axes
          c.SkillsAdd(173, 5,1, 0,0);             // Daggers
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(226, 5,0, 0,0);             // Crossbows
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 0,0, 0,0);             // Language: Orcish
          c.SkillsAdd(433, 1,1, 0,0);             // Shield
          c.SkillsAdd(137, 0,0, 0,0);             // Language: Thalassian
          c.SkillsAdd(473, 1,0, 0,0);             // Fist Weapons
          c.SkillsAdd(140, 0,0, 0,0);             // Language: Titan
          c.SkillsAdd(149, 0,0, 0,0);             // Wolf Riding
          c.SkillsAdd(313, 300,300, 0,0);         // Language: Gnomish
          c.SkillsAdd(413, 1,1, 0,0);             // Mail

          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(107, 0);                    // Block
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(5301, 0);                   // Defensive State (DND)
          c.SpellsAdd(32215, 0);                  // Victorious State
          c.SpellsAdd(20589, 0);                  // Escape Artist
          c.SpellsAdd(20591, 0);                  // Expansive Mind
          c.SpellsAdd(20593, 0);                  // Engineering Specialization
          c.SpellsAdd(20592, 0);                  // Arcane Resistance
          c.SpellsAdd(9077, 0);                   // Leather
          c.SpellsAdd(2457, 0);                   // Battle Stance
          c.SpellsAdd(78, 0);                     // Heroic Strike
          c.SpellsAdd(201, 0);                    // One-Handed Swords
          c.SpellsAdd(668, 0);                    // Language Common
          c.SpellsAdd(198, 0);                    // One-Handed Maces
          c.SpellsAdd(203, 0);                    // Unarmed
          c.SpellsAdd(1180, 0);                   // Daggers
          c.SpellsAdd(2479, 0);                   // Honorless Target
          c.SpellsAdd(9125, 0);                   // Generic
          c.SpellsAdd(6477, 0);                   // Opening
          c.SpellsAdd(6478, 0);                   // Opening
          c.SpellsAdd(6603, 0);                   // Attack
          c.SpellsAdd(7266, 0);                   // Duel
          c.SpellsAdd(7267, 0);                   // Grovel
          c.SpellsAdd(7355, 0);                   // Stuck
          c.SpellsAdd(3365, 0);                   // Opening
          c.SpellsAdd(3050, 0);                   // Detect
          c.SpellsAdd(6233, 0);                   // Closing
          c.SpellsAdd(6246, 0);                   // Closing
          c.SpellsAdd(6247, 0);                   // Opening
          c.SpellsAdd(22027, 0);                  // Remove Insignia
          c.SpellsAdd(22810, 0);                  // Opening - No Text
          c.SpellsAdd(2382, 0);                   // Generic
          c.SpellsAdd(21651, 0);                  // Opening
          c.SpellsAdd(21652, 0);                  // Closing
          c.SpellsAdd(8386, 0);                   // Attacking
          c.SpellsAdd(9116, 0);                   // Shield
          c.SpellsAdd(7340, 0);                   // Language Gnomish
          c.SpellsAdd(8737, 0);                   // Mail

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 78, $00000000);       // Spell: Heroic Strike
          c.SetActionButtons(11, 117, $80000000);     // Item: Tough Jerky
          c.SetActionButtons(72, 6603, $00000000);    // Spell: Attack
          c.SetActionButtons(73, 78, $00000000);      // Spell: Heroic Strike
          c.SetActionButtons(83, 117, $80000000);     // Item: Tough Jerky
          c.SetActionButtons(84, 6603, $00000000);    // Spell: Attack
          c.SetActionButtons(96, 6603, $00000000);    // Spell: Attack
          c.SetActionButtons(108, 6603, $00000000);   // Spell: Attack
end;
procedure RACE_GNOME_CLASS_ROGUE(var c:TCharData);
begin
          c.max_health                 :=45;
          c.power_type                 :=POWER_ENERGY;
          c.max_power[POWER_MANA]      :=0;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=1600;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=1600;
          c.base_mana                  :=0;
          c.base_health                :=25;

          c.attack_power               :=24;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=17;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=3.74;
          c.max_damage                 :=4.74;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=5.94;
          c.max_ranged_damage          :=8.94;

          c.stat[0]                    :=16;      // strength
          c.stat[1]                    :=26;      // agility
          c.stat[2]                    :=20;      // stamina
          c.stat[3]                    :=24;      // intellect
          c.stat[4]                    :=20;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,3, 49,1, $00000000);         // Footpad's Shirt
          c.ItemsAdd($FF,6, 48,1, $00000000);         // Footpad's Pants
          c.ItemsAdd($FF,7, 47,1, $00000000);         // Footpad's Shoes
          c.ItemsAdd($FF,15, 2092,1, $00000000);      // Worn Dagger
          c.ItemsAdd($FF,17, 28979,1, $00000000);     // Light Throwing Knife
          c.ItemsAdd($FF,23, 117,4, $00000000);       // Tough Jerky
          c.ItemsAdd($FF,24, 6948,1, $0001);      // Hearthstone

          c.SkillsAdd(46, 5,0, 0,0);              // Guns
          c.SkillsAdd(315, 0,0, 0,0);             // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(152, 0,0, 0,0);             // Ram Riding
          c.SkillsAdd(415, 1,1, 0,0);             // Cloth
          c.SkillsAdd(633, 5,0, 0,0);             // Lockpicking
          c.SkillsAdd(202, 0,0, 15,0);            // Engineering
          c.SkillsAdd(356, 0,0, 0,0);             // Fishing
          c.SkillsAdd(171, 0,0, 0,0);             // Alchemy
          c.SkillsAdd(182, 0,0, 0,0);             // Herbalism
          c.SkillsAdd(673, 0,0, 0,0);             // Language: Gutterspeak
          c.SkillsAdd(95, 5,1, 0,0);              // Defense
          c.SkillsAdd(333, 0,0, 0,0);             // Enchanting
          c.SkillsAdd(713, 0,0, 0,0);             // Kodo Riding
          c.SkillsAdd(753, 5,5, 0,0);             // Racial - Gnome
          c.SkillsAdd(176, 5,1, 0,0);             // Thrown
          c.SkillsAdd(38, 5,5, 0,0);              // Combat
          c.SkillsAdd(39, 5,0, 0,0);              // Subtlety
          c.SkillsAdd(414, 1,1, 0,0);             // Leather
          c.SkillsAdd(45, 5,0, 0,0);              // Bows
          c.SkillsAdd(759, 0,0, 0,0);             // Language: Draenei
          c.SkillsAdd(197, 0,0, 0,0);             // Tailoring
          c.SkillsAdd(165, 0,0, 0,0);             // Leatherworking
          c.SkillsAdd(43, 5,0, 0,0);              // Swords
          c.SkillsAdd(186, 0,0, 0,0);             // Mining
          c.SkillsAdd(98, 300,300, 0,0);          // Language: Common
          c.SkillsAdd(54, 5,0, 0,0);              // Maces
          c.SkillsAdd(533, 0,0, 0,0);             // Raptor Riding
          c.SkillsAdd(553, 0,0, 0,0);             // Mechanostrider Piloting
          c.SkillsAdd(554, 0,0, 0,0);             // Undead Horsemanship
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(129, 0,0, 0,0);             // First Aid
          c.SkillsAdd(185, 0,0, 0,0);             // Cooking
          c.SkillsAdd(40, 5,0, 0,0);              // Poisons
          c.SkillsAdd(162, 5,1, 0,0);             // Unarmed
          c.SkillsAdd(111, 0,0, 0,0);             // Language: Dwarven
          c.SkillsAdd(113, 0,0, 0,0);             // Language: Darnassian
          c.SkillsAdd(115, 0,0, 0,0);             // Language: Taurahe
          c.SkillsAdd(118, 0,0, 0,0);             // Dual Wield
          c.SkillsAdd(138, 0,0, 0,0);             // Language: Draconic
          c.SkillsAdd(141, 0,0, 0,0);             // Language: Old Tongue
          c.SkillsAdd(142, 1,0, 0,0);             // Survival
          c.SkillsAdd(148, 0,0, 0,0);             // Horse Riding
          c.SkillsAdd(150, 0,0, 0,0);             // Tiger Riding
          c.SkillsAdd(164, 0,0, 0,0);             // Blacksmithing
          c.SkillsAdd(173, 5,1, 0,0);             // Daggers
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(226, 5,0, 0,0);             // Crossbows
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 0,0, 0,0);             // Language: Orcish
          c.SkillsAdd(137, 0,0, 0,0);             // Language: Thalassian
          c.SkillsAdd(473, 1,0, 0,0);             // Fist Weapons
          c.SkillsAdd(140, 0,0, 0,0);             // Language: Titan
          c.SkillsAdd(149, 0,0, 0,0);             // Wolf Riding
          c.SkillsAdd(253, 5,5, 0,0);             // Assassination
          c.SkillsAdd(313, 300,300, 0,0);         // Language: Gnomish

          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(16092, 0);                  // Defensive State (DND)
          c.SpellsAdd(20589, 0);                  // Escape Artist
          c.SpellsAdd(20591, 0);                  // Expansive Mind
          c.SpellsAdd(20593, 0);                  // Engineering Specialization
          c.SpellsAdd(20592, 0);                  // Arcane Resistance
          c.SpellsAdd(2764, 0);                   // Throw
          c.SpellsAdd(2567, 0);                   // Thrown
          c.SpellsAdd(21184, 0);                  // Rogue Passive (DND)
          c.SpellsAdd(1752, 0);                   // Sinister Strike
          c.SpellsAdd(9077, 0);                   // Leather
          c.SpellsAdd(668, 0);                    // Language Common
          c.SpellsAdd(203, 0);                    // Unarmed
          c.SpellsAdd(1180, 0);                   // Daggers
          c.SpellsAdd(2479, 0);                   // Honorless Target
          c.SpellsAdd(9125, 0);                   // Generic
          c.SpellsAdd(6477, 0);                   // Opening
          c.SpellsAdd(6478, 0);                   // Opening
          c.SpellsAdd(6603, 0);                   // Attack
          c.SpellsAdd(7266, 0);                   // Duel
          c.SpellsAdd(7267, 0);                   // Grovel
          c.SpellsAdd(7355, 0);                   // Stuck
          c.SpellsAdd(3365, 0);                   // Opening
          c.SpellsAdd(3050, 0);                   // Detect
          c.SpellsAdd(6233, 0);                   // Closing
          c.SpellsAdd(6246, 0);                   // Closing
          c.SpellsAdd(6247, 0);                   // Opening
          c.SpellsAdd(22027, 0);                  // Remove Insignia
          c.SpellsAdd(22810, 0);                  // Opening - No Text
          c.SpellsAdd(2382, 0);                   // Generic
          c.SpellsAdd(21651, 0);                  // Opening
          c.SpellsAdd(21652, 0);                  // Closing
          c.SpellsAdd(8386, 0);                   // Attacking
          c.SpellsAdd(2098, 0);                   // Eviscerate
          c.SpellsAdd(7340, 0);                   // Language Gnomish

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 1752, $00000000);     // Spell: Sinister Strike
          c.SetActionButtons(2, 2098, $00000000);     // Spell: Eviscerate
          c.SetActionButtons(3, 2764, $00000000);     // Spell: Throw
          c.SetActionButtons(11, 117, $80000000);     // Item: Tough Jerky
end;
procedure RACE_GNOME_CLASS_MAGE(var c:TCharData);
begin
          c.max_health                 :=51;
          c.power_type                 :=POWER_MANA;
          c.max_power[POWER_MANA]      :=225;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=2900;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=0;
          c.base_mana                  :=100;
          c.base_health                :=32;

          c.attack_power               :=5;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=13;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=4.03;
          c.max_damage                 :=6.03;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=0.0;
          c.max_ranged_damage          :=0.0;

          c.stat[0]                    :=15;      // strength
          c.stat[1]                    :=23;      // agility
          c.stat[2]                    :=19;      // stamina
          c.stat[3]                    :=27;      // intellect
          c.stat[4]                    :=22;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,3, 6096,1, $00000000);       // Apprentice's Shirt
          c.ItemsAdd($FF,4, 56,1, $00000000);         // Apprentice's Robe
          c.ItemsAdd($FF,6, 1395,1, $00000000);       // Apprentice's Pants
          c.ItemsAdd($FF,7, 55,1, $00000000);         // Apprentice's Boots
          c.ItemsAdd($FF,15, 35,1, $00000000);        // Bent Staff
          c.ItemsAdd($FF,23, 4536,4, $00000000);      // Shiny Red Apple
          c.ItemsAdd($FF,24, 159,2, $00000000);       // Refreshing Spring Water
          c.ItemsAdd($FF,25, 6948,1, $0001);      // Hearthstone

          c.SkillsAdd(8, 5,5, 0,0);               // Fire
          c.SkillsAdd(315, 0,0, 0,0);             // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(152, 0,0, 0,0);             // Ram Riding
          c.SkillsAdd(415, 1,1, 0,0);             // Cloth
          c.SkillsAdd(202, 0,0, 15,0);            // Engineering
          c.SkillsAdd(356, 0,0, 0,0);             // Fishing
          c.SkillsAdd(171, 0,0, 0,0);             // Alchemy
          c.SkillsAdd(182, 0,0, 0,0);             // Herbalism
          c.SkillsAdd(673, 0,0, 0,0);             // Language: Gutterspeak
          c.SkillsAdd(95, 5,1, 0,0);              // Defense
          c.SkillsAdd(333, 0,0, 0,0);             // Enchanting
          c.SkillsAdd(713, 0,0, 0,0);             // Kodo Riding
          c.SkillsAdd(753, 5,5, 0,0);             // Racial - Gnome
          c.SkillsAdd(6, 5,5, 0,0);               // Frost
          c.SkillsAdd(759, 0,0, 0,0);             // Language: Draenei
          c.SkillsAdd(197, 0,0, 0,0);             // Tailoring
          c.SkillsAdd(165, 0,0, 0,0);             // Leatherworking
          c.SkillsAdd(43, 5,0, 0,0);              // Swords
          c.SkillsAdd(186, 0,0, 0,0);             // Mining
          c.SkillsAdd(98, 300,300, 0,0);          // Language: Common
          c.SkillsAdd(136, 5,1, 0,0);             // Staves
          c.SkillsAdd(533, 0,0, 0,0);             // Raptor Riding
          c.SkillsAdd(553, 0,0, 0,0);             // Mechanostrider Piloting
          c.SkillsAdd(554, 0,0, 0,0);             // Undead Horsemanship
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(129, 0,0, 0,0);             // First Aid
          c.SkillsAdd(185, 0,0, 0,0);             // Cooking
          c.SkillsAdd(237, 5,0, 0,0);             // Arcane
          c.SkillsAdd(162, 5,1, 0,0);             // Unarmed
          c.SkillsAdd(111, 0,0, 0,0);             // Language: Dwarven
          c.SkillsAdd(113, 0,0, 0,0);             // Language: Darnassian
          c.SkillsAdd(115, 0,0, 0,0);             // Language: Taurahe
          c.SkillsAdd(138, 0,0, 0,0);             // Language: Draconic
          c.SkillsAdd(141, 0,0, 0,0);             // Language: Old Tongue
          c.SkillsAdd(142, 1,0, 0,0);             // Survival
          c.SkillsAdd(148, 0,0, 0,0);             // Horse Riding
          c.SkillsAdd(150, 0,0, 0,0);             // Tiger Riding
          c.SkillsAdd(164, 0,0, 0,0);             // Blacksmithing
          c.SkillsAdd(173, 5,0, 0,0);             // Daggers
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(228, 5,1, 0,0);             // Wands
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 0,0, 0,0);             // Language: Orcish
          c.SkillsAdd(137, 0,0, 0,0);             // Language: Thalassian
          c.SkillsAdd(140, 0,0, 0,0);             // Language: Titan
          c.SkillsAdd(149, 0,0, 0,0);             // Wolf Riding
          c.SkillsAdd(313, 300,300, 0,0);         // Language: Gnomish

          c.SpellsAdd(133, 0);                    // Fireball
          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(20589, 0);                  // Escape Artist
          c.SpellsAdd(20591, 0);                  // Expansive Mind
          c.SpellsAdd(20593, 0);                  // Engineering Specialization
          c.SpellsAdd(20592, 0);                  // Arcane Resistance
          c.SpellsAdd(168, 0);                    // Frost Armor
          c.SpellsAdd(668, 0);                    // Language Common
          c.SpellsAdd(227, 0);                    // Staves
          c.SpellsAdd(203, 0);                    // Unarmed
          c.SpellsAdd(2479, 0);                   // Honorless Target
          c.SpellsAdd(9125, 0);                   // Generic
          c.SpellsAdd(6477, 0);                   // Opening
          c.SpellsAdd(6478, 0);                   // Opening
          c.SpellsAdd(6603, 0);                   // Attack
          c.SpellsAdd(7266, 0);                   // Duel
          c.SpellsAdd(7267, 0);                   // Grovel
          c.SpellsAdd(7355, 0);                   // Stuck
          c.SpellsAdd(3365, 0);                   // Opening
          c.SpellsAdd(3050, 0);                   // Detect
          c.SpellsAdd(6233, 0);                   // Closing
          c.SpellsAdd(6246, 0);                   // Closing
          c.SpellsAdd(6247, 0);                   // Opening
          c.SpellsAdd(22027, 0);                  // Remove Insignia
          c.SpellsAdd(22810, 0);                  // Opening - No Text
          c.SpellsAdd(2382, 0);                   // Generic
          c.SpellsAdd(21651, 0);                  // Opening
          c.SpellsAdd(21652, 0);                  // Closing
          c.SpellsAdd(8386, 0);                   // Attacking
          c.SpellsAdd(5009, 0);                   // Wands
          c.SpellsAdd(5019, 0);                   // Shoot
          c.SpellsAdd(7340, 0);                   // Language Gnomish

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 133, $00000000);      // Spell: Fireball
          c.SetActionButtons(2, 168, $00000000);      // Spell: Frost Armor
          c.SetActionButtons(10, 159, $80000000);     // Item: Refreshing Spring Water
          c.SetActionButtons(11, 4536, $80000000);    // Item: Shiny Red Apple
end;
procedure RACE_GNOME_CLASS_WARLOCK(var c:TCharData);
begin
          c.max_health                 :=43;
          c.power_type                 :=POWER_MANA;
          c.max_power[POWER_MANA]      :=200;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=1600;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=0;
          c.base_mana                  :=90;
          c.base_health                :=23;

          c.attack_power               :=5;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=13;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=1.57;
          c.max_damage                 :=2.57;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=0.0;
          c.max_ranged_damage          :=0.0;

          c.stat[0]                    :=15;      // strength
          c.stat[1]                    :=23;      // agility
          c.stat[2]                    :=20;      // stamina
          c.stat[3]                    :=26;      // intellect
          c.stat[4]                    :=22;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,3, 6097,1, $00000000);       // Acolyte's Shirt
          c.ItemsAdd($FF,4, 57,1, $00000000);         // Acolyte's Robe
          c.ItemsAdd($FF,6, 1396,1, $00000000);       // Acolyte's Pants
          c.ItemsAdd($FF,7, 59,1, $00000000);         // Acolyte's Shoes
          c.ItemsAdd($FF,15, 2092,1, $00000000);      // Worn Dagger
          c.ItemsAdd($FF,23, 159,2, $00000000);       // Refreshing Spring Water
          c.ItemsAdd($FF,24, 4604,4, $00000000);      // Forest Mushroom Cap
          c.ItemsAdd($FF,25, 6948,1, $0001);      // Hearthstone

          c.SkillsAdd(315, 0,0, 0,0);             // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(152, 0,0, 0,0);             // Ram Riding
          c.SkillsAdd(354, 5,5, 0,0);             // Demonology
          c.SkillsAdd(355, 5,0, 0,0);             // Affliction
          c.SkillsAdd(415, 1,1, 0,0);             // Cloth
          c.SkillsAdd(202, 0,0, 15,0);            // Engineering
          c.SkillsAdd(356, 0,0, 0,0);             // Fishing
          c.SkillsAdd(171, 0,0, 0,0);             // Alchemy
          c.SkillsAdd(182, 0,0, 0,0);             // Herbalism
          c.SkillsAdd(673, 0,0, 0,0);             // Language: Gutterspeak
          c.SkillsAdd(95, 5,1, 0,0);              // Defense
          c.SkillsAdd(333, 0,0, 0,0);             // Enchanting
          c.SkillsAdd(713, 0,0, 0,0);             // Kodo Riding
          c.SkillsAdd(753, 5,5, 0,0);             // Racial - Gnome
          c.SkillsAdd(593, 5,5, 0,0);             // Destruction
          c.SkillsAdd(759, 0,0, 0,0);             // Language: Draenei
          c.SkillsAdd(197, 0,0, 0,0);             // Tailoring
          c.SkillsAdd(165, 0,0, 0,0);             // Leatherworking
          c.SkillsAdd(43, 5,0, 0,0);              // Swords
          c.SkillsAdd(186, 0,0, 0,0);             // Mining
          c.SkillsAdd(98, 300,300, 0,0);          // Language: Common
          c.SkillsAdd(136, 5,0, 0,0);             // Staves
          c.SkillsAdd(533, 0,0, 0,0);             // Raptor Riding
          c.SkillsAdd(553, 0,0, 0,0);             // Mechanostrider Piloting
          c.SkillsAdd(554, 0,0, 0,0);             // Undead Horsemanship
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(129, 0,0, 0,0);             // First Aid
          c.SkillsAdd(185, 0,0, 0,0);             // Cooking
          c.SkillsAdd(162, 5,1, 0,0);             // Unarmed
          c.SkillsAdd(111, 0,0, 0,0);             // Language: Dwarven
          c.SkillsAdd(113, 0,0, 0,0);             // Language: Darnassian
          c.SkillsAdd(115, 0,0, 0,0);             // Language: Taurahe
          c.SkillsAdd(138, 0,0, 0,0);             // Language: Draconic
          c.SkillsAdd(141, 0,0, 0,0);             // Language: Old Tongue
          c.SkillsAdd(142, 1,0, 0,0);             // Survival
          c.SkillsAdd(148, 0,0, 0,0);             // Horse Riding
          c.SkillsAdd(150, 0,0, 0,0);             // Tiger Riding
          c.SkillsAdd(164, 0,0, 0,0);             // Blacksmithing
          c.SkillsAdd(173, 5,1, 0,0);             // Daggers
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(228, 5,1, 0,0);             // Wands
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 0,0, 0,0);             // Language: Orcish
          c.SkillsAdd(137, 0,0, 0,0);             // Language: Thalassian
          c.SkillsAdd(140, 0,0, 0,0);             // Language: Titan
          c.SkillsAdd(149, 0,0, 0,0);             // Wolf Riding
          c.SkillsAdd(313, 300,300, 0,0);         // Language: Gnomish

          c.SpellsAdd(687, 0);                    // Demon Skin
          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(20589, 0);                  // Escape Artist
          c.SpellsAdd(20591, 0);                  // Expansive Mind
          c.SpellsAdd(20593, 0);                  // Engineering Specialization
          c.SpellsAdd(20592, 0);                  // Arcane Resistance
          c.SpellsAdd(686, 0);                    // Shadow Bolt
          c.SpellsAdd(668, 0);                    // Language Common
          c.SpellsAdd(203, 0);                    // Unarmed
          c.SpellsAdd(1180, 0);                   // Daggers
          c.SpellsAdd(2479, 0);                   // Honorless Target
          c.SpellsAdd(9125, 0);                   // Generic
          c.SpellsAdd(6477, 0);                   // Opening
          c.SpellsAdd(6478, 0);                   // Opening
          c.SpellsAdd(6603, 0);                   // Attack
          c.SpellsAdd(7266, 0);                   // Duel
          c.SpellsAdd(7267, 0);                   // Grovel
          c.SpellsAdd(7355, 0);                   // Stuck
          c.SpellsAdd(3365, 0);                   // Opening
          c.SpellsAdd(3050, 0);                   // Detect
          c.SpellsAdd(6233, 0);                   // Closing
          c.SpellsAdd(6246, 0);                   // Closing
          c.SpellsAdd(6247, 0);                   // Opening
          c.SpellsAdd(22027, 0);                  // Remove Insignia
          c.SpellsAdd(22810, 0);                  // Opening - No Text
          c.SpellsAdd(2382, 0);                   // Generic
          c.SpellsAdd(21651, 0);                  // Opening
          c.SpellsAdd(21652, 0);                  // Closing
          c.SpellsAdd(8386, 0);                   // Attacking
          c.SpellsAdd(5009, 0);                   // Wands
          c.SpellsAdd(5019, 0);                   // Shoot
          c.SpellsAdd(7340, 0);                   // Language Gnomish

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 686, $00000000);      // Spell: Shadow Bolt
          c.SetActionButtons(2, 687, $00000000);      // Spell: Demon Skin
          c.SetActionButtons(10, 159, $80000000);     // Item: Refreshing Spring Water
          c.SetActionButtons(11, 4604, $80000000);    // Item: Forest Mushroom Cap
end;

end.
