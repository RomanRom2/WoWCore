unit CharsConstsHorde;

interface

uses
  Struct, Defines;

procedure RACE_ORC_CLASS_WARRIOR(var c:TCharData);
procedure RACE_ORC_CLASS_HUNTER(var c:TCharData);
procedure RACE_ORC_CLASS_ROGUE(var c:TCharData);
procedure RACE_ORC_CLASS_SHAMAN(var c:TCharData);
procedure RACE_ORC_CLASS_WARLOCK(var c:TCharData);

procedure RACE_UNDEAD_CLASS_WARRIOR(var c:TCharData);
procedure RACE_UNDEAD_CLASS_ROGUE(var c:TCharData);
procedure RACE_UNDEAD_CLASS_PRIEST(var c:TCharData);
procedure RACE_UNDEAD_CLASS_MAGE(var c:TCharData);
procedure RACE_UNDEAD_CLASS_WARLOCK(var c:TCharData);

procedure RACE_TAUREN_CLASS_WARRIOR(var c:TCharData);
procedure RACE_TAUREN_CLASS_HUNTER(var c:TCharData);
procedure RACE_TAUREN_CLASS_SHAMAN(var c:TCharData);
procedure RACE_TAUREN_CLASS_DRUID(var c:TCharData);

procedure RACE_TROLL_CLASS_WARRIOR(var c:TCharData);
procedure RACE_TROLL_CLASS_HUNTER(var c:TCharData);
procedure RACE_TROLL_CLASS_ROGUE(var c:TCharData);
procedure RACE_TROLL_CLASS_PRIEST(var c:TCharData);
procedure RACE_TROLL_CLASS_SHAMAN(var c:TCharData);
procedure RACE_TROLL_CLASS_MAGE(var c:TCharData);

implementation

procedure RACE_ORC_CLASS_WARRIOR(var c:TCharData);
begin
          c.max_health                 :=80;
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

          c.attack_power               :=35;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=8;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=10.25;
          c.max_damage                 :=12.25;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=0.0;
          c.max_ranged_damage          :=0.0;

          c.stat[0]                    :=26;      // strength
          c.stat[1]                    :=17;      // agility
          c.stat[2]                    :=24;      // stamina
          c.stat[3]                    :=17;      // intellect
          c.stat[4]                    :=23;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,3, 6125,1, $00000000);       // Brawler's Harness
          c.ItemsAdd($FF,6, 139,1, $00000000);        // Brawler's Pants
          c.ItemsAdd($FF,7, 140,1, $00000000);        // Brawler's Boots
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
          c.SkillsAdd(43, 5,1, 0,0);              // Swords
          c.SkillsAdd(186, 0,0, 0,0);             // Mining
          c.SkillsAdd(98, 0,0, 0,0);              // Language: Common
          c.SkillsAdd(136, 5,0, 0,0);             // Staves
          c.SkillsAdd(54, 5,0, 0,0);              // Maces
          c.SkillsAdd(533, 0,0, 0,0);             // Raptor Riding
          c.SkillsAdd(554, 0,0, 0,0);             // Undead Horsemanship
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(229, 0,0, 0,0);             // Polearms
          c.SkillsAdd(257, 5,0, 0,0);             // Protection
          c.SkillsAdd(293, 0,0, 0,0);             // Plate Mail
          c.SkillsAdd(46, 5,0, 0,0);              // Guns
          c.SkillsAdd(125, 5,5, 0,0);             // Orc Racial
          c.SkillsAdd(315, 0,0, 0,0);             // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(152, 0,0, 0,0);             // Ram Riding
          c.SkillsAdd(173, 5,0, 0,0);             // Daggers
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(226, 5,0, 0,0);             // Crossbows
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 300,300, 0,0);         // Language: Orcish
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
          c.SkillsAdd(44, 5,1, 5,0);              // Axes
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
          c.SkillsAdd(172, 5,1, 5,0);             // Two-Handed Axes

          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(107, 0);                    // Block
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(5301, 0);                   // Defensive State (DND)
          c.SpellsAdd(32215, 0);                  // Victorious State
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(203, 0);                    // Unarmed
          c.SpellsAdd(201, 0);                    // One-Handed Swords
          c.SpellsAdd(21563, 0);                  // Command
          c.SpellsAdd(20572, 0);                  // Blood Fury
          c.SpellsAdd(20573, 0);                  // Hardiness
          c.SpellsAdd(20574, 0);                  // Axe Specialization
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
          c.SpellsAdd(669, 0);                    // Language Orcish
          c.SpellsAdd(9116, 0);                   // Shield
          c.SpellsAdd(8737, 0);                   // Mail
          c.SpellsAdd(9077, 0);                   // Leather
          c.SpellsAdd(2457, 0);                   // Battle Stance
          c.SpellsAdd(78, 0);                     // Heroic Strike
          c.SpellsAdd(196, 0);                    // One-Handed Axes
          c.SpellsAdd(197, 0);                    // Two-Handed Axes

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(72, 6603, $00000000);    // Spell: Attack
          c.SetActionButtons(73, 78, $00000000);      // Spell: Heroic Strike
          c.SetActionButtons(74, 20572, $00000000);   // Spell: Blood Fury
          c.SetActionButtons(83, 117, $80000000);     // Item: Tough Jerky
          c.SetActionButtons(84, 6603, $00000000);    // Spell: Attack
          c.SetActionButtons(96, 6603, $00000000);    // Spell: Attack
          c.SetActionButtons(108, 6603, $00000000);   // Spell: Attack

end;
procedure RACE_ORC_CLASS_HUNTER(var c:TCharData);
begin
          c.max_health                 :=76;
          c.power_type                 :=POWER_MANA;
          c.max_power[POWER_MANA]      :=82;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=2000;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=2300;
          c.base_mana                  :=65;
          c.base_health                :=26;

          c.attack_power               :=25;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=12;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=4.57;
          c.max_damage                 :=6.57;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=6.97;
          c.max_ranged_damage          :=11.97;

          c.stat[0]                    :=23;      // strength
          c.stat[1]                    :=20;      // agility
          c.stat[2]                    :=23;      // stamina
          c.stat[3]                    :=17;      // intellect
          c.stat[4]                    :=24;      // spirit

          c.ammo_id                    :=2512;

          c.ItemsAdd($FF,3, 127,1, $00000000);        // Trapper's Shirt
          c.ItemsAdd($FF,6, 6126,1, $00000000);       // Trapper's Pants
          c.ItemsAdd($FF,7, 6127,1, $00000000);       // Trapper's Boots
          c.ItemsAdd($FF,15, 37,1, $00000000);        // Worn Axe
          c.ItemsAdd($FF,17, 2504,1, $00000000);      // Worn Shortbow
          c.ItemsAdd($FF,19, 2101,1, $00000000);      // Light Quiver
          c.ItemsAdd($FF,23, 159,2, $00000000);       // Refreshing Spring Water
          c.ItemsAdd($FF,24, 6948,1, $0001);      // Hearthstone
          c.ItemsAdd($FF,25, 117,4, $00000000);       // Tough Jerky
          c.ItemsAdd(19,0, 2512,200, $00000000);

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
          c.SkillsAdd(98, 0,0, 0,0);              // Language: Common
          c.SkillsAdd(136, 5,0, 0,0);             // Staves
          c.SkillsAdd(533, 0,0, 0,0);             // Raptor Riding
          c.SkillsAdd(554, 0,0, 0,0);             // Undead Horsemanship
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(229, 0,0, 0,0);             // Polearms
          c.SkillsAdd(46, 5,0, 0,0);              // Guns
          c.SkillsAdd(125, 5,5, 0,0);             // Orc Racial
          c.SkillsAdd(315, 0,0, 0,0);             // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(152, 0,0, 0,0);             // Ram Riding
          c.SkillsAdd(173, 5,0, 0,0);             // Daggers
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(226, 5,0, 0,0);             // Crossbows
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 300,300, 0,0);         // Language: Orcish
          c.SkillsAdd(137, 0,0, 0,0);             // Language: Thalassian
          c.SkillsAdd(473, 1,0, 0,0);             // Fist Weapons
          c.SkillsAdd(140, 0,0, 0,0);             // Language: Titan
          c.SkillsAdd(149, 0,0, 0,0);             // Wolf Riding
          c.SkillsAdd(313, 0,0, 0,0);             // Language: Gnomish
          c.SkillsAdd(413, 0,0, 0,0);             // Mail
          c.SkillsAdd(414, 1,1, 0,0);             // Leather
          c.SkillsAdd(45, 5,1, 0,0);              // Bows
          c.SkillsAdd(759, 0,0, 0,0);             // Language: Draenei
          c.SkillsAdd(197, 0,0, 0,0);             // Tailoring
          c.SkillsAdd(44, 5,1, 5,0);              // Axes
          c.SkillsAdd(50, 5,0, 0,0);              // Beast Mastery
          c.SkillsAdd(111, 0,0, 0,0);             // Language: Dwarven
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
          c.SkillsAdd(172, 5,0, 5,0);             // Two-Handed Axes

          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(24949, 0);                  // Defensive State 2 (DND)
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(13358, 0);                  // Defensive State (DND)
          c.SpellsAdd(203, 0);                    // Unarmed
          c.SpellsAdd(2973, 0);                   // Raptor Strike
          c.SpellsAdd(20572, 0);                  // Blood Fury
          c.SpellsAdd(20573, 0);                  // Hardiness
          c.SpellsAdd(20574, 0);                  // Axe Specialization
          c.SpellsAdd(20576, 0);                  // Command
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
          c.SpellsAdd(669, 0);                    // Language Orcish
          c.SpellsAdd(9077, 0);                   // Leather
          c.SpellsAdd(264, 0);                    // Bows
          c.SpellsAdd(196, 0);                    // One-Handed Axes
          c.SpellsAdd(75, 0);                     // Auto Shot

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 2973, $00000000);     // Spell: Raptor Strike
          c.SetActionButtons(2, 75, $00000000);       // Spell: Auto Shot
          c.SetActionButtons(3, 20572, $00000000);    // Spell: Blood Fury
          c.SetActionButtons(10, 159, $80000000);     // Item: Refreshing Spring Water
          c.SetActionButtons(11, 117, $80000000);     // Item: Tough Jerky

end;
procedure RACE_ORC_CLASS_ROGUE(var c:TCharData);
begin
          c.max_health                 :=75;
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

          c.attack_power               :=26;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=11;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=3.97;
          c.max_damage                 :=4.97;
          c.min_offhand_damage         :=4.0;
          c.max_offhand_damage         :=7.0;
          c.min_ranged_damage          :=5.41;
          c.max_ranged_damage          :=9.41;

          c.stat[0]                    :=24;      // strength
          c.stat[1]                    :=20;      // agility
          c.stat[2]                    :=23;      // stamina
          c.stat[3]                    :=17;      // intellect
          c.stat[4]                    :=23;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,3, 2105,1, $00000000);       // Thug Shirt
          c.ItemsAdd($FF,6, 120,1, $00000000);        // Thug Pants
          c.ItemsAdd($FF,7, 121,1, $00000000);        // Thug Boots
          c.ItemsAdd($FF,15, 2092,1, $00000000);      // Worn Dagger
          c.ItemsAdd($FF,17, 25861,1, $00000000);     // Crude Throwing Axe
          c.ItemsAdd($FF,23, 117,4, $00000000);       // Tough Jerky
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
          c.SkillsAdd(98, 0,0, 0,0);              // Language: Common
          c.SkillsAdd(54, 5,0, 0,0);              // Maces
          c.SkillsAdd(533, 0,0, 0,0);             // Raptor Riding
          c.SkillsAdd(554, 0,0, 0,0);             // Undead Horsemanship
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(46, 5,0, 0,0);              // Guns
          c.SkillsAdd(125, 5,5, 0,0);             // Orc Racial
          c.SkillsAdd(315, 0,0, 0,0);             // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(152, 0,0, 0,0);             // Ram Riding
          c.SkillsAdd(173, 5,1, 0,0);             // Daggers
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(226, 5,0, 0,0);             // Crossbows
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 300,300, 0,0);         // Language: Orcish
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
          c.SpellsAdd(21563, 0);                  // Command
          c.SpellsAdd(20572, 0);                  // Blood Fury
          c.SpellsAdd(20573, 0);                  // Hardiness
          c.SpellsAdd(20574, 0);                  // Axe Specialization
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
          c.SpellsAdd(669, 0);                    // Language Orcish
          c.SpellsAdd(2098, 0);                   // Eviscerate
          c.SpellsAdd(9077, 0);                   // Leather

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 1752, $00000000);     // Spell: Sinister Strike
          c.SetActionButtons(2, 2098, $00000000);     // Spell: Eviscerate
          c.SetActionButtons(3, 2764, $00000000);     // Spell: Throw
          c.SetActionButtons(4, 20572, $00000000);    // Spell: Blood Fury
          c.SetActionButtons(11, 117, $80000000);     // Item: Tough Jerky

end;
procedure RACE_ORC_CLASS_SHAMAN(var c:TCharData);
begin
          c.max_health                 :=77;
          c.power_type                 :=POWER_MANA;
          c.max_power[POWER_MANA]      :=73;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=1900;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=0;
          c.base_mana                  :=55;
          c.base_health                :=27;

          c.attack_power               :=30;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=7;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=5.07;
          c.max_damage                 :=7.07;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=0.0;
          c.max_ranged_damage          :=0.0;

          c.stat[0]                    :=24;      // strength
          c.stat[1]                    :=17;      // agility
          c.stat[2]                    :=23;      // stamina
          c.stat[3]                    :=18;      // intellect
          c.stat[4]                    :=25;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,3, 154,1, $00000000);        // Primitive Mantle
          c.ItemsAdd($FF,6, 153,1, $00000000);        // Primitive Kilt
          c.ItemsAdd($FF,15, 36,1, $00000000);        // Worn Mace
          c.ItemsAdd($FF,23, 6948,1, $0001);      // Hearthstone
          c.ItemsAdd($FF,24, 117,4, $00000000);       // Tough Jerky
          c.ItemsAdd($FF,25, 159,2, $00000000);       // Refreshing Spring Water

          c.SkillsAdd(373, 5,0, 0,0);             // Enhancement
          c.SkillsAdd(374, 5,5, 0,0);             // Restoration
          c.SkillsAdd(375, 5,5, 0,0);             // Elemental Combat
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
          c.SkillsAdd(160, 5,0, 0,0);             // Two-Handed Maces
          c.SkillsAdd(165, 0,0, 0,0);             // Leatherworking
          c.SkillsAdd(186, 0,0, 0,0);             // Mining
          c.SkillsAdd(98, 0,0, 0,0);              // Language: Common
          c.SkillsAdd(136, 5,1, 0,0);             // Staves
          c.SkillsAdd(54, 5,1, 0,0);              // Maces
          c.SkillsAdd(533, 0,0, 0,0);             // Raptor Riding
          c.SkillsAdd(554, 0,0, 0,0);             // Undead Horsemanship
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(125, 5,5, 0,0);             // Orc Racial
          c.SkillsAdd(315, 0,0, 0,0);             // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(152, 0,0, 0,0);             // Ram Riding
          c.SkillsAdd(173, 5,0, 0,0);             // Daggers
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 300,300, 0,0);         // Language: Orcish
          c.SkillsAdd(433, 1,1, 0,0);             // Shield
          c.SkillsAdd(137, 0,0, 0,0);             // Language: Thalassian
          c.SkillsAdd(473, 1,0, 0,0);             // Fist Weapons
          c.SkillsAdd(140, 0,0, 0,0);             // Language: Titan
          c.SkillsAdd(149, 0,0, 0,0);             // Wolf Riding
          c.SkillsAdd(313, 0,0, 0,0);             // Language: Gnomish
          c.SkillsAdd(413, 0,0, 0,0);             // Mail
          c.SkillsAdd(414, 1,1, 0,0);             // Leather
          c.SkillsAdd(759, 0,0, 0,0);             // Language: Draenei
          c.SkillsAdd(197, 0,0, 0,0);             // Tailoring
          c.SkillsAdd(44, 5,0, 5,0);              // Axes
          c.SkillsAdd(111, 0,0, 0,0);             // Language: Dwarven
          c.SkillsAdd(113, 0,0, 0,0);             // Language: Darnassian
          c.SkillsAdd(115, 0,0, 0,0);             // Language: Taurahe
          c.SkillsAdd(118, 5,0, 0,0);             // Dual Wield
          c.SkillsAdd(138, 0,0, 0,0);             // Language: Draconic
          c.SkillsAdd(141, 0,0, 0,0);             // Language: Old Tongue
          c.SkillsAdd(142, 1,0, 0,0);             // Survival
          c.SkillsAdd(148, 0,0, 0,0);             // Horse Riding
          c.SkillsAdd(150, 0,0, 0,0);             // Tiger Riding
          c.SkillsAdd(164, 0,0, 0,0);             // Blacksmithing
          c.SkillsAdd(172, 5,0, 5,0);             // Two-Handed Axes

          c.SpellsAdd(331, 0);                    // Healing Wave
          c.SpellsAdd(403, 0);                    // Lightning Bolt
          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(107, 0);                    // Block
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(203, 0);                    // Unarmed
          c.SpellsAdd(227, 0);                    // Staves
          c.SpellsAdd(198, 0);                    // One-Handed Maces
          c.SpellsAdd(21563, 0);                  // Command
          c.SpellsAdd(20573, 0);                  // Hardiness
          c.SpellsAdd(20574, 0);                  // Axe Specialization
          c.SpellsAdd(33697, 0);                  // Blood Fury
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
          c.SpellsAdd(27763, 0);                  // Totem
          c.SpellsAdd(3365, 0);                   // Opening
          c.SpellsAdd(3050, 0);                   // Detect
          c.SpellsAdd(6477, 0);                   // Opening
          c.SpellsAdd(6478, 0);                   // Opening
          c.SpellsAdd(6603, 0);                   // Attack
          c.SpellsAdd(6233, 0);                   // Closing
          c.SpellsAdd(6246, 0);                   // Closing
          c.SpellsAdd(6247, 0);                   // Opening
          c.SpellsAdd(669, 0);                    // Language Orcish
          c.SpellsAdd(9116, 0);                   // Shield
          c.SpellsAdd(9077, 0);                   // Leather

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 403, $00000000);      // Spell: Lightning Bolt
          c.SetActionButtons(2, 331, $00000000);      // Spell: Healing Wave
          c.SetActionButtons(3, 33697, $00000000);    // Spell: Blood Fury
          c.SetActionButtons(10, 159, $80000000);     // Item: Refreshing Spring Water
          c.SetActionButtons(11, 117, $80000000);     // Item: Tough Jerky

end;
procedure RACE_ORC_CLASS_WARLOCK(var c:TCharData);
begin
          c.max_health                 :=73;
          c.power_type                 :=POWER_MANA;
          c.max_power[POWER_MANA]      :=109;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=1600;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=0;
          c.base_mana                  :=90;
          c.base_health                :=23;

          c.attack_power               :=13;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=7;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=2.49;
          c.max_damage                 :=3.49;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=0.0;
          c.max_ranged_damage          :=0.0;

          c.stat[0]                    :=23;      // strength
          c.stat[1]                    :=17;      // agility
          c.stat[2]                    :=23;      // stamina
          c.stat[3]                    :=19;      // intellect
          c.stat[4]                    :=25;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,4, 6129,1, $00000000);       // Acolyte's Robe
          c.ItemsAdd($FF,6, 1396,1, $00000000);       // Acolyte's Pants
          c.ItemsAdd($FF,7, 59,1, $00000000);         // Acolyte's Shoes
          c.ItemsAdd($FF,15, 2092,1, $00000000);      // Worn Dagger
          c.ItemsAdd($FF,23, 6948,1, $0001);      // Hearthstone
          c.ItemsAdd($FF,24, 117,4, $00000000);       // Tough Jerky
          c.ItemsAdd($FF,25, 159,2, $00000000);       // Refreshing Spring Water

          c.SkillsAdd(355, 5,0, 0,0);             // Affliction
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
          c.SkillsAdd(43, 5,0, 0,0);              // Swords
          c.SkillsAdd(186, 0,0, 0,0);             // Mining
          c.SkillsAdd(98, 0,0, 0,0);              // Language: Common
          c.SkillsAdd(136, 5,0, 0,0);             // Staves
          c.SkillsAdd(533, 0,0, 0,0);             // Raptor Riding
          c.SkillsAdd(554, 0,0, 0,0);             // Undead Horsemanship
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(125, 5,5, 0,0);             // Orc Racial
          c.SkillsAdd(315, 0,0, 0,0);             // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(152, 0,0, 0,0);             // Ram Riding
          c.SkillsAdd(354, 5,5, 0,0);             // Demonology
          c.SkillsAdd(173, 5,1, 0,0);             // Daggers
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(228, 5,1, 0,0);             // Wands
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 300,300, 0,0);         // Language: Orcish
          c.SkillsAdd(137, 0,0, 0,0);             // Language: Thalassian
          c.SkillsAdd(140, 0,0, 0,0);             // Language: Titan
          c.SkillsAdd(149, 0,0, 0,0);             // Wolf Riding
          c.SkillsAdd(313, 0,0, 0,0);             // Language: Gnomish
          c.SkillsAdd(593, 5,5, 0,0);             // Destruction
          c.SkillsAdd(759, 0,0, 0,0);             // Language: Draenei
          c.SkillsAdd(197, 0,0, 0,0);             // Tailoring
          c.SkillsAdd(111, 0,0, 0,0);             // Language: Dwarven
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
          c.SpellsAdd(20573, 0);                  // Hardiness
          c.SpellsAdd(20574, 0);                  // Axe Specialization
          c.SpellsAdd(20575, 0);                  // Command
          c.SpellsAdd(33702, 0);                  // Blood Fury
          c.SpellsAdd(687, 0);                    // Demon Skin
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
          c.SpellsAdd(5009, 0);                   // Wands
          c.SpellsAdd(5019, 0);                   // Shoot
          c.SpellsAdd(669, 0);                    // Language Orcish
          c.SpellsAdd(686, 0);                    // Shadow Bolt

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 686, $00000000);      // Spell: Shadow Bolt
          c.SetActionButtons(2, 687, $00000000);      // Spell: Demon Skin
          c.SetActionButtons(3, 33702, $00000000);    // Spell: Blood Fury
          c.SetActionButtons(10, 159, $80000000);     // Item: Refreshing Spring Water
          c.SetActionButtons(11, 117, $80000000);     // Item: Tough Jerky

end;

procedure RACE_UNDEAD_CLASS_WARRIOR(var c:TCharData);
begin
          c.max_health                 :=70;
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

          c.attack_power               :=27;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=9;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=4.66;
          c.max_damage                 :=6.66;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=0.0;
          c.max_ranged_damage          :=0.0;

          c.stat[0]                    :=22;      // strength
          c.stat[1]                    :=18;      // agility
          c.stat[2]                    :=23;      // stamina
          c.stat[3]                    :=18;      // intellect
          c.stat[4]                    :=25;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,3, 6125,1, $00000000);       // Brawler's Harness
          c.ItemsAdd($FF,6, 139,1, $00000000);        // Brawler's Pants
          c.ItemsAdd($FF,7, 140,1, $00000000);        // Brawler's Boots
          c.ItemsAdd($FF,15, 25,1, $00000000);        // Worn Shortsword
          c.ItemsAdd($FF,16, 2362,1, $00000000);      // Worn Wooden Shield
          c.ItemsAdd($FF,23, 4604,4, $00000000);      // Forest Mushroom Cap
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
          c.SkillsAdd(673, 300,300, 0,0);         // Language: Gutterspeak
          c.SkillsAdd(95, 5,1, 0,0);              // Defense
          c.SkillsAdd(333, 0,0, 0,0);             // Enchanting
          c.SkillsAdd(55, 5,1, 0,0);              // Two-Handed Swords
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
          c.SkillsAdd(136, 5,0, 0,0);             // Staves
          c.SkillsAdd(54, 5,0, 0,0);              // Maces
          c.SkillsAdd(533, 0,0, 0,0);             // Raptor Riding
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
          c.SkillsAdd(220, 5,5, 0,0);             // Racial - Undead
          c.SkillsAdd(226, 5,0, 0,0);             // Crossbows
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 300,300, 0,0);         // Language: Orcish
          c.SkillsAdd(433, 1,1, 0,0);             // Shield
          c.SkillsAdd(137, 0,0, 0,0);             // Language: Thalassian
          c.SkillsAdd(473, 1,0, 0,0);             // Fist Weapons
          c.SkillsAdd(140, 0,0, 0,0);             // Language: Titan
          c.SkillsAdd(149, 0,0, 0,0);             // Wolf Riding
          c.SkillsAdd(313, 0,0, 0,0);             // Language: Gnomish
          c.SkillsAdd(413, 1,1, 0,0);             // Mail

          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(17737, 0);                  // Language Gutterspeak
          c.SpellsAdd(107, 0);                    // Block
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(5301, 0);                   // Defensive State (DND)
          c.SpellsAdd(32215, 0);                  // Victorious State
          c.SpellsAdd(202, 0);                    // Two-Handed Swords
          c.SpellsAdd(9077, 0);                   // Leather
          c.SpellsAdd(2457, 0);                   // Battle Stance
          c.SpellsAdd(78, 0);                     // Heroic Strike
          c.SpellsAdd(201, 0);                    // One-Handed Swords
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
          c.SpellsAdd(5227, 0);                   // Underwater Breathing
          c.SpellsAdd(7744, 0);                   // Will of the Forsaken
          c.SpellsAdd(20577, 0);                  // Cannibalize
          c.SpellsAdd(20579, 0);                  // Shadow Resistance
          c.SpellsAdd(669, 0);                    // Language Orcish
          c.SpellsAdd(9116, 0);                   // Shield
          c.SpellsAdd(8737, 0);                   // Mail

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(72, 6603, $00000000);    // Spell: Attack
          c.SetActionButtons(73, 78, $00000000);      // Spell: Heroic Strike
          c.SetActionButtons(74, 20577, $00000000);   // Spell: Cannibalize
          c.SetActionButtons(83, 4604, $80000000);    // Item: Forest Mushroom Cap
          c.SetActionButtons(84, 6603, $00000000);    // Spell: Attack
          c.SetActionButtons(96, 6603, $00000000);    // Spell: Attack
          c.SetActionButtons(108, 6603, $00000000);   // Spell: Attack

end;
procedure RACE_UNDEAD_CLASS_ROGUE(var c:TCharData);
begin
          c.max_health                 :=65;
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

          c.attack_power               :=23;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=12;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=3.63;
          c.max_damage                 :=4.63;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=5.54;
          c.max_ranged_damage          :=9.54;

          c.stat[0]                    :=20;      // strength
          c.stat[1]                    :=21;      // agility
          c.stat[2]                    :=22;      // stamina
          c.stat[3]                    :=18;      // intellect
          c.stat[4]                    :=25;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,3, 2105,1, $00000000);       // Thug Shirt
          c.ItemsAdd($FF,6, 120,1, $00000000);        // Thug Pants
          c.ItemsAdd($FF,7, 121,1, $00000000);        // Thug Boots
          c.ItemsAdd($FF,15, 2092,1, $00000000);      // Worn Dagger
          c.ItemsAdd($FF,17, 25861,1, $00000000);     // Crude Throwing Axe
          c.ItemsAdd($FF,23, 4604,4, $00000000);      // Forest Mushroom Cap
          c.ItemsAdd($FF,24, 6948,1, $0001);      // Hearthstone

          c.SkillsAdd(415, 1,1, 0,0);             // Cloth
          c.SkillsAdd(633, 5,0, 0,0);             // Lockpicking
          c.SkillsAdd(202, 0,0, 0,0);             // Engineering
          c.SkillsAdd(356, 0,0, 0,0);             // Fishing
          c.SkillsAdd(171, 0,0, 0,0);             // Alchemy
          c.SkillsAdd(182, 0,0, 0,0);             // Herbalism
          c.SkillsAdd(673, 300,300, 0,0);         // Language: Gutterspeak
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
          c.SkillsAdd(54, 5,0, 0,0);              // Maces
          c.SkillsAdd(533, 0,0, 0,0);             // Raptor Riding
          c.SkillsAdd(554, 0,0, 0,0);             // Undead Horsemanship
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(46, 5,0, 0,0);              // Guns
          c.SkillsAdd(315, 0,0, 0,0);             // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(152, 0,0, 0,0);             // Ram Riding
          c.SkillsAdd(173, 5,1, 0,0);             // Daggers
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(220, 5,5, 0,0);             // Racial - Undead
          c.SkillsAdd(226, 5,0, 0,0);             // Crossbows
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 300,300, 0,0);         // Language: Orcish
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

          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(17737, 0);                  // Language Gutterspeak
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(16092, 0);                  // Defensive State (DND)
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(2567, 0);                   // Thrown
          c.SpellsAdd(2764, 0);                   // Throw
          c.SpellsAdd(21184, 0);                  // Rogue Passive (DND)
          c.SpellsAdd(1752, 0);                   // Sinister Strike
          c.SpellsAdd(203, 0);                    // Unarmed
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
          c.SpellsAdd(5227, 0);                   // Underwater Breathing
          c.SpellsAdd(7744, 0);                   // Will of the Forsaken
          c.SpellsAdd(20577, 0);                  // Cannibalize
          c.SpellsAdd(20579, 0);                  // Shadow Resistance
          c.SpellsAdd(669, 0);                    // Language Orcish
          c.SpellsAdd(2098, 0);                   // Eviscerate
          c.SpellsAdd(9077, 0);                   // Leather

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 1752, $00000000);     // Spell: Sinister Strike
          c.SetActionButtons(2, 2098, $00000000);     // Spell: Eviscerate
          c.SetActionButtons(3, 2764, $00000000);     // Spell: Throw
          c.SetActionButtons(4, 20577, $00000000);    // Spell: Cannibalize
          c.SetActionButtons(11, 4604, $80000000);    // Item: Forest Mushroom Cap

end;
procedure RACE_UNDEAD_CLASS_PRIEST(var c:TCharData);
begin
          c.max_health                 :=62;
          c.power_type                 :=POWER_MANA;
          c.max_power[POWER_MANA]      :=130;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=1900;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=0;
          c.base_mana                  :=110;
          c.base_health                :=32;

          c.attack_power               :=9;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=8;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=2.22;
          c.max_damage                 :=4.22;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=0.0;
          c.max_ranged_damage          :=0.0;

          c.stat[0]                    :=19;      // strength
          c.stat[1]                    :=18;      // agility
          c.stat[2]                    :=21;      // stamina
          c.stat[3]                    :=20;      // intellect
          c.stat[4]                    :=28;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,3, 53,1, $00000000);         // Neophyte's Shirt
          c.ItemsAdd($FF,4, 6144,1, $00000000);       // Neophyte's Robe
          c.ItemsAdd($FF,6, 52,1, $00000000);         // Neophyte's Pants
          c.ItemsAdd($FF,7, 51,1, $00000000);         // Neophyte's Boots
          c.ItemsAdd($FF,15, 36,1, $00000000);        // Worn Mace
          c.ItemsAdd($FF,23, 4604,4, $00000000);      // Forest Mushroom Cap
          c.ItemsAdd($FF,24, 159,2, $00000000);       // Refreshing Spring Water
          c.ItemsAdd($FF,25, 6948,1, $0001);      // Hearthstone

          c.SkillsAdd(415, 1,1, 0,0);             // Cloth
          c.SkillsAdd(202, 0,0, 0,0);             // Engineering
          c.SkillsAdd(356, 0,0, 0,0);             // Fishing
          c.SkillsAdd(171, 0,0, 0,0);             // Alchemy
          c.SkillsAdd(182, 0,0, 0,0);             // Herbalism
          c.SkillsAdd(673, 300,300, 0,0);         // Language: Gutterspeak
          c.SkillsAdd(95, 5,1, 0,0);              // Defense
          c.SkillsAdd(333, 0,0, 0,0);             // Enchanting
          c.SkillsAdd(713, 0,0, 0,0);             // Kodo Riding
          c.SkillsAdd(129, 0,0, 0,0);             // First Aid
          c.SkillsAdd(185, 0,0, 0,0);             // Cooking
          c.SkillsAdd(162, 5,1, 0,0);             // Unarmed
          c.SkillsAdd(165, 0,0, 0,0);             // Leatherworking
          c.SkillsAdd(186, 0,0, 0,0);             // Mining
          c.SkillsAdd(136, 5,0, 0,0);             // Staves
          c.SkillsAdd(54, 5,1, 0,0);              // Maces
          c.SkillsAdd(533, 0,0, 0,0);             // Raptor Riding
          c.SkillsAdd(554, 0,0, 0,0);             // Undead Horsemanship
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(315, 0,0, 0,0);             // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(152, 0,0, 0,0);             // Ram Riding
          c.SkillsAdd(173, 5,0, 0,0);             // Daggers
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(220, 5,5, 0,0);             // Racial - Undead
          c.SkillsAdd(228, 5,1, 0,0);             // Wands
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 300,300, 0,0);         // Language: Orcish
          c.SkillsAdd(137, 0,0, 0,0);             // Language: Thalassian
          c.SkillsAdd(140, 0,0, 0,0);             // Language: Titan
          c.SkillsAdd(149, 0,0, 0,0);             // Wolf Riding
          c.SkillsAdd(313, 0,0, 0,0);             // Language: Gnomish
          c.SkillsAdd(613, 5,0, 0,0);             // Discipline
          c.SkillsAdd(78, 5,0, 0,0);              // Shadow Magic
          c.SkillsAdd(759, 0,0, 0,0);             // Language: Draenei
          c.SkillsAdd(197, 0,0, 0,0);             // Tailoring
          c.SkillsAdd(56, 5,5, 0,0);              // Holy
          c.SkillsAdd(111, 0,0, 0,0);             // Language: Dwarven
          c.SkillsAdd(113, 0,0, 0,0);             // Language: Darnassian
          c.SkillsAdd(115, 0,0, 0,0);             // Language: Taurahe
          c.SkillsAdd(138, 0,0, 0,0);             // Language: Draconic
          c.SkillsAdd(141, 0,0, 0,0);             // Language: Old Tongue
          c.SkillsAdd(142, 1,0, 0,0);             // Survival
          c.SkillsAdd(148, 0,0, 0,0);             // Horse Riding
          c.SkillsAdd(150, 0,0, 0,0);             // Tiger Riding
          c.SkillsAdd(164, 0,0, 0,0);             // Blacksmithing

          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(17737, 0);                  // Language Gutterspeak
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(203, 0);                    // Unarmed
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
          c.SpellsAdd(5227, 0);                   // Underwater Breathing
          c.SpellsAdd(7744, 0);                   // Will of the Forsaken
          c.SpellsAdd(20577, 0);                  // Cannibalize
          c.SpellsAdd(20579, 0);                  // Shadow Resistance
          c.SpellsAdd(5009, 0);                   // Wands
          c.SpellsAdd(5019, 0);                   // Shoot
          c.SpellsAdd(669, 0);                    // Language Orcish
          c.SpellsAdd(2050, 0);                   // Lesser Heal
          c.SpellsAdd(585, 0);                    // Smite

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 585, $00000000);      // Spell: Smite
          c.SetActionButtons(2, 2050, $00000000);     // Spell: Lesser Heal
          c.SetActionButtons(3, 20577, $00000000);    // Spell: Cannibalize
          c.SetActionButtons(10, 159, $80000000);     // Item: Refreshing Spring Water
          c.SetActionButtons(11, 4604, $80000000);    // Item: Forest Mushroom Cap

end;
procedure RACE_UNDEAD_CLASS_MAGE(var c:TCharData);
begin
          c.max_health                 :=62;
          c.power_type                 :=POWER_MANA;
          c.max_power[POWER_MANA]      :=135;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=2900;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=0;
          c.base_mana                  :=100;
          c.base_health                :=32;

          c.attack_power               :=9;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=8;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=4.86;
          c.max_damage                 :=6.86;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=0.0;
          c.max_ranged_damage          :=0.0;

          c.stat[0]                    :=19;      // strength
          c.stat[1]                    :=18;      // agility
          c.stat[2]                    :=21;      // stamina
          c.stat[3]                    :=21;      // intellect
          c.stat[4]                    :=27;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,3, 6096,1, $00000000);       // Apprentice's Shirt
          c.ItemsAdd($FF,4, 6140,1, $00000000);       // Apprentice's Robe
          c.ItemsAdd($FF,6, 1395,1, $00000000);       // Apprentice's Pants
          c.ItemsAdd($FF,7, 55,1, $00000000);         // Apprentice's Boots
          c.ItemsAdd($FF,15, 35,1, $00000000);        // Bent Staff
          c.ItemsAdd($FF,23, 4604,4, $00000000);      // Forest Mushroom Cap
          c.ItemsAdd($FF,24, 159,2, $00000000);       // Refreshing Spring Water
          c.ItemsAdd($FF,25, 6948,1, $0001);      // Hearthstone

          c.SkillsAdd(8, 5,5, 0,0);               // Fire
          c.SkillsAdd(315, 0,0, 0,0);             // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(152, 0,0, 0,0);             // Ram Riding
          c.SkillsAdd(415, 1,1, 0,0);             // Cloth
          c.SkillsAdd(202, 0,0, 0,0);             // Engineering
          c.SkillsAdd(356, 0,0, 0,0);             // Fishing
          c.SkillsAdd(171, 0,0, 0,0);             // Alchemy
          c.SkillsAdd(182, 0,0, 0,0);             // Herbalism
          c.SkillsAdd(673, 300,300, 0,0);         // Language: Gutterspeak
          c.SkillsAdd(95, 5,1, 0,0);              // Defense
          c.SkillsAdd(333, 0,0, 0,0);             // Enchanting
          c.SkillsAdd(713, 0,0, 0,0);             // Kodo Riding
          c.SkillsAdd(6, 5,5, 0,0);               // Frost
          c.SkillsAdd(759, 0,0, 0,0);             // Language: Draenei
          c.SkillsAdd(197, 0,0, 0,0);             // Tailoring
          c.SkillsAdd(165, 0,0, 0,0);             // Leatherworking
          c.SkillsAdd(43, 5,0, 0,0);              // Swords
          c.SkillsAdd(186, 0,0, 0,0);             // Mining
          c.SkillsAdd(136, 5,1, 0,0);             // Staves
          c.SkillsAdd(533, 0,0, 0,0);             // Raptor Riding
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
          c.SkillsAdd(220, 5,5, 0,0);             // Racial - Undead
          c.SkillsAdd(228, 5,1, 0,0);             // Wands
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 300,300, 0,0);         // Language: Orcish
          c.SkillsAdd(137, 0,0, 0,0);             // Language: Thalassian
          c.SkillsAdd(140, 0,0, 0,0);             // Language: Titan
          c.SkillsAdd(149, 0,0, 0,0);             // Wolf Riding
          c.SkillsAdd(313, 0,0, 0,0);             // Language: Gnomish

          c.SpellsAdd(133, 0);                    // Fireball
          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(17737, 0);                  // Language Gutterspeak
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(168, 0);                    // Frost Armor
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
          c.SpellsAdd(5227, 0);                   // Underwater Breathing
          c.SpellsAdd(7744, 0);                   // Will of the Forsaken
          c.SpellsAdd(20577, 0);                  // Cannibalize
          c.SpellsAdd(20579, 0);                  // Shadow Resistance
          c.SpellsAdd(5009, 0);                   // Wands
          c.SpellsAdd(5019, 0);                   // Shoot
          c.SpellsAdd(669, 0);                    // Language Orcish

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 133, $00000000);      // Spell: Fireball
          c.SetActionButtons(2, 168, $00000000);      // Spell: Frost Armor
          c.SetActionButtons(3, 20577, $00000000);    // Spell: Cannibalize
          c.SetActionButtons(10, 159, $80000000);     // Item: Refreshing Spring Water
          c.SetActionButtons(11, 4604, $80000000);    // Item: Forest Mushroom Cap

end;
procedure RACE_UNDEAD_CLASS_WARLOCK(var c:TCharData);
begin
          c.max_health                 :=63;
          c.power_type                 :=POWER_MANA;
          c.max_power[POWER_MANA]      :=110;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=1600;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=0;
          c.base_mana                  :=90;
          c.base_health                :=23;

          c.attack_power               :=9;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=8;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=2.03;
          c.max_damage                 :=3.03;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=0.0;
          c.max_ranged_damage          :=0.0;

          c.stat[0]                    :=19;      // strength
          c.stat[1]                    :=18;      // agility
          c.stat[2]                    :=22;      // stamina
          c.stat[3]                    :=20;      // intellect
          c.stat[4]                    :=27;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,4, 6129,1, $00000000);       // Acolyte's Robe
          c.ItemsAdd($FF,6, 1396,1, $00000000);       // Acolyte's Pants
          c.ItemsAdd($FF,7, 59,1, $00000000);         // Acolyte's Shoes
          c.ItemsAdd($FF,15, 2092,1, $00000000);      // Worn Dagger
          c.ItemsAdd($FF,23, 4604,4, $00000000);      // Forest Mushroom Cap
          c.ItemsAdd($FF,24, 159,2, $00000000);       // Refreshing Spring Water
          c.ItemsAdd($FF,25, 6948,1, $0001);      // Hearthstone

          c.SkillsAdd(355, 5,0, 0,0);             // Affliction
          c.SkillsAdd(415, 1,1, 0,0);             // Cloth
          c.SkillsAdd(202, 0,0, 0,0);             // Engineering
          c.SkillsAdd(356, 0,0, 0,0);             // Fishing
          c.SkillsAdd(171, 0,0, 0,0);             // Alchemy
          c.SkillsAdd(182, 0,0, 0,0);             // Herbalism
          c.SkillsAdd(673, 300,300, 0,0);         // Language: Gutterspeak
          c.SkillsAdd(95, 5,1, 0,0);              // Defense
          c.SkillsAdd(333, 0,0, 0,0);             // Enchanting
          c.SkillsAdd(713, 0,0, 0,0);             // Kodo Riding
          c.SkillsAdd(129, 0,0, 0,0);             // First Aid
          c.SkillsAdd(185, 0,0, 0,0);             // Cooking
          c.SkillsAdd(162, 5,1, 0,0);             // Unarmed
          c.SkillsAdd(165, 0,0, 0,0);             // Leatherworking
          c.SkillsAdd(43, 5,0, 0,0);              // Swords
          c.SkillsAdd(186, 0,0, 0,0);             // Mining
          c.SkillsAdd(136, 5,0, 0,0);             // Staves
          c.SkillsAdd(533, 0,0, 0,0);             // Raptor Riding
          c.SkillsAdd(554, 0,0, 0,0);             // Undead Horsemanship
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(315, 0,0, 0,0);             // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(152, 0,0, 0,0);             // Ram Riding
          c.SkillsAdd(354, 5,5, 0,0);             // Demonology
          c.SkillsAdd(173, 5,1, 0,0);             // Daggers
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(220, 5,5, 0,0);             // Racial - Undead
          c.SkillsAdd(228, 5,1, 0,0);             // Wands
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 300,300, 0,0);         // Language: Orcish
          c.SkillsAdd(137, 0,0, 0,0);             // Language: Thalassian
          c.SkillsAdd(140, 0,0, 0,0);             // Language: Titan
          c.SkillsAdd(149, 0,0, 0,0);             // Wolf Riding
          c.SkillsAdd(313, 0,0, 0,0);             // Language: Gnomish
          c.SkillsAdd(593, 5,5, 0,0);             // Destruction
          c.SkillsAdd(759, 0,0, 0,0);             // Language: Draenei
          c.SkillsAdd(197, 0,0, 0,0);             // Tailoring
          c.SkillsAdd(111, 0,0, 0,0);             // Language: Dwarven
          c.SkillsAdd(113, 0,0, 0,0);             // Language: Darnassian
          c.SkillsAdd(115, 0,0, 0,0);             // Language: Taurahe
          c.SkillsAdd(138, 0,0, 0,0);             // Language: Draconic
          c.SkillsAdd(141, 0,0, 0,0);             // Language: Old Tongue
          c.SkillsAdd(142, 1,0, 0,0);             // Survival
          c.SkillsAdd(148, 0,0, 0,0);             // Horse Riding
          c.SkillsAdd(150, 0,0, 0,0);             // Tiger Riding
          c.SkillsAdd(164, 0,0, 0,0);             // Blacksmithing

          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(17737, 0);                  // Language Gutterspeak
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(203, 0);                    // Unarmed
          c.SpellsAdd(687, 0);                    // Demon Skin
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
          c.SpellsAdd(5227, 0);                   // Underwater Breathing
          c.SpellsAdd(7744, 0);                   // Will of the Forsaken
          c.SpellsAdd(20577, 0);                  // Cannibalize
          c.SpellsAdd(20579, 0);                  // Shadow Resistance
          c.SpellsAdd(5009, 0);                   // Wands
          c.SpellsAdd(5019, 0);                   // Shoot
          c.SpellsAdd(669, 0);                    // Language Orcish
          c.SpellsAdd(686, 0);                    // Shadow Bolt

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 686, $00000000);      // Spell: Shadow Bolt
          c.SetActionButtons(2, 687, $00000000);      // Spell: Demon Skin
          c.SetActionButtons(3, 20577, $00000000);    // Spell: Cannibalize
          c.SetActionButtons(10, 159, $80000000);     // Item: Refreshing Spring Water
          c.SetActionButtons(11, 4604, $80000000);    // Item: Forest Mushroom Cap

end;

procedure RACE_TAUREN_CLASS_WARRIOR(var c:TCharData);
begin
          c.max_health                 :=84;
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

          c.attack_power               :=39;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=6;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=11.08;
          c.max_damage                 :=13.08;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=0.0;
          c.max_ranged_damage          :=0.0;

          c.stat[0]                    :=28;      // strength
          c.stat[1]                    :=15;      // agility
          c.stat[2]                    :=24;      // stamina
          c.stat[3]                    :=15;      // intellect
          c.stat[4]                    :=22;      // spirit
		  
          c.ammo_id                    :=0;

          c.ItemsAdd($FF,3, 6125,1, $00000000);       // Brawler's Harness
          c.ItemsAdd($FF,6, 139,1, $00000000);        // Brawler's Pants
          c.ItemsAdd($FF,15, 2361,1, $00000000);      // Battleworn Hammer
          c.ItemsAdd($FF,23, 6948,1, $0001);      // Hearthstone
          c.ItemsAdd($FF,24, 4540,4, $00000000);      // Tough Hunk of Bread

          c.SkillsAdd(229, 0,0, 0,0);             // Polearms
          c.SkillsAdd(257, 5,0, 0,0);             // Protection
          c.SkillsAdd(293, 0,0, 0,0);             // Plate Mail
          c.SkillsAdd(46, 5,0, 0,0);              // Guns
          c.SkillsAdd(315, 0,0, 0,0);             // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(415, 1,1, 0,0);             // Cloth
          c.SkillsAdd(256, 5,0, 0,0);             // Fury
          c.SkillsAdd(202, 0,0, 0,0);             // Engineering
          c.SkillsAdd(356, 0,0, 0,0);             // Fishing
          c.SkillsAdd(171, 0,0, 0,0);             // Alchemy
          c.SkillsAdd(182, 0,0, 15,0);            // Herbalism
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
          c.SkillsAdd(160, 5,1, 0,0);             // Two-Handed Maces
          c.SkillsAdd(165, 0,0, 0,0);             // Leatherworking
          c.SkillsAdd(43, 5,0, 0,0);              // Swords
          c.SkillsAdd(186, 0,0, 0,0);             // Mining
          c.SkillsAdd(98, 0,0, 0,0);              // Language: Common
          c.SkillsAdd(136, 5,0, 0,0);             // Staves
          c.SkillsAdd(54, 5,1, 0,0);              // Maces
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(129, 0,0, 0,0);             // First Aid
          c.SkillsAdd(185, 0,0, 0,0);             // Cooking
          c.SkillsAdd(162, 5,1, 0,0);             // Unarmed
          c.SkillsAdd(44, 5,1, 0,0);              // Axes
          c.SkillsAdd(111, 0,0, 0,0);             // Language: Dwarven
          c.SkillsAdd(113, 0,0, 0,0);             // Language: Darnassian
          c.SkillsAdd(115, 300,300, 0,0);         // Language: Taurahe
          c.SkillsAdd(118, 0,0, 0,0);             // Dual Wield
          c.SkillsAdd(138, 0,0, 0,0);             // Language: Draconic
          c.SkillsAdd(141, 0,0, 0,0);             // Language: Old Tongue
          c.SkillsAdd(142, 1,0, 0,0);             // Survival
          c.SkillsAdd(164, 0,0, 0,0);             // Blacksmithing
          c.SkillsAdd(172, 5,0, 0,0);             // Two-Handed Axes
          c.SkillsAdd(173, 5,0, 0,0);             // Daggers
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(226, 5,0, 0,0);             // Crossbows
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 300,300, 0,0);         // Language: Orcish
          c.SkillsAdd(124, 5,5, 0,0);             // Tauren Racial
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
          c.SpellsAdd(199, 0);                    // Two-Handed Maces
          c.SpellsAdd(198, 0);                    // One-Handed Maces
          c.SpellsAdd(203, 0);                    // Unarmed
          c.SpellsAdd(196, 0);                    // One-Handed Axes
          c.SpellsAdd(670, 0);                    // Language Taurahe
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
          c.SpellsAdd(669, 0);                    // Language Orcish
          c.SpellsAdd(20550, 0);                  // Endurance
          c.SpellsAdd(20551, 0);                  // Nature Resistance
          c.SpellsAdd(20552, 0);                  // Cultivation
          c.SpellsAdd(20549, 0);                  // War Stomp
          c.SpellsAdd(9116, 0);                   // Shield
          c.SpellsAdd(8737, 0);                   // Mail

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(72, 6603, $00000000);    // Spell: Attack
          c.SetActionButtons(73, 78, $00000000);      // Spell: Heroic Strike
          c.SetActionButtons(74, 20549, $00000000);   // Spell: War Stomp
          c.SetActionButtons(83, 4540, $80000000);    // Item: Tough Hunk of Bread
          c.SetActionButtons(84, 6603, $00000000);    // Spell: Attack
          c.SetActionButtons(96, 6603, $00000000);    // Spell: Attack
          c.SetActionButtons(108, 6603, $00000000);   // Spell: Attack

end;
procedure RACE_TAUREN_CLASS_HUNTER(var c:TCharData);
begin
          c.max_health                 :=80;
          c.power_type                 :=POWER_MANA;
          c.max_power[POWER_MANA]      :=80;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=2000;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=2300;
          c.base_mana                  :=65;
          c.base_health                :=26;

          c.attack_power               :=25;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=10;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=4.57;
          c.max_damage                 :=6.57;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=6.64;
          c.max_ranged_damage          :=11.64;

          c.stat[0]                    :=25;      // strength
          c.stat[1]                    :=18;      // agility
          c.stat[2]                    :=23;      // stamina
          c.stat[3]                    :=15;      // intellect
          c.stat[4]                    :=23;      // spirit

          c.ammo_id                    :=2516;

          c.ItemsAdd($FF,3, 127,1, $00000000);        // Trapper's Shirt
          c.ItemsAdd($FF,6, 6126,1, $00000000);       // Trapper's Pants
          c.ItemsAdd($FF,15, 37,1, $00000000);        // Worn Axe
          c.ItemsAdd($FF,17, 2508,1, $00000000);      // Old Blunderbuss
          c.ItemsAdd($FF,19, 2102,1, $00000000);      // Small Ammo Pouch
          c.ItemsAdd($FF,23, 6948,1, $0001);      // Hearthstone
          c.ItemsAdd($FF,24, 159,2, $00000000);       // Refreshing Spring Water
          c.ItemsAdd($FF,25, 117,4, $00000000);       // Tough Jerky
          c.ItemsAdd(19,0, 2516,200, $00000000);

          c.SkillsAdd(415, 1,1, 0,0);             // Cloth
          c.SkillsAdd(202, 0,0, 0,0);             // Engineering
          c.SkillsAdd(356, 0,0, 0,0);             // Fishing
          c.SkillsAdd(171, 0,0, 0,0);             // Alchemy
          c.SkillsAdd(182, 0,0, 15,0);            // Herbalism
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
          c.SkillsAdd(98, 0,0, 0,0);              // Language: Common
          c.SkillsAdd(136, 5,0, 0,0);             // Staves
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(229, 0,0, 0,0);             // Polearms
          c.SkillsAdd(46, 5,1, 0,0);              // Guns
          c.SkillsAdd(315, 0,0, 0,0);             // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(173, 5,0, 0,0);             // Daggers
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(226, 5,0, 0,0);             // Crossbows
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 300,300, 0,0);         // Language: Orcish
          c.SkillsAdd(124, 5,5, 0,0);             // Tauren Racial
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
          c.SkillsAdd(111, 0,0, 0,0);             // Language: Dwarven
          c.SkillsAdd(113, 0,0, 0,0);             // Language: Darnassian
          c.SkillsAdd(115, 300,300, 0,0);         // Language: Taurahe
          c.SkillsAdd(118, 0,0, 0,0);             // Dual Wield
          c.SkillsAdd(138, 0,0, 0,0);             // Language: Draconic
          c.SkillsAdd(141, 0,0, 0,0);             // Language: Old Tongue
          c.SkillsAdd(142, 1,0, 0,0);             // Survival
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
          c.SpellsAdd(669, 0);                    // Language Orcish
          c.SpellsAdd(20550, 0);                  // Endurance
          c.SpellsAdd(20551, 0);                  // Nature Resistance
          c.SpellsAdd(20552, 0);                  // Cultivation
          c.SpellsAdd(20549, 0);                  // War Stomp
          c.SpellsAdd(9077, 0);                   // Leather
          c.SpellsAdd(196, 0);                    // One-Handed Axes
          c.SpellsAdd(670, 0);                    // Language Taurahe
          c.SpellsAdd(75, 0);                     // Auto Shot

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 2973, $00000000);     // Spell: Raptor Strike
          c.SetActionButtons(2, 75, $00000000);       // Spell: Auto Shot
          c.SetActionButtons(3, 20549, $00000000);    // Spell: War Stomp
          c.SetActionButtons(10, 159, $80000000);     // Item: Refreshing Spring Water
          c.SetActionButtons(11, 117, $80000000);     // Item: Tough Jerky
          c.SetActionButtons(75, 20549, $00000000);   // Spell: War Stomp

end;
procedure RACE_TAUREN_CLASS_SHAMAN(var c:TCharData);
begin
          c.max_health                 :=81;
          c.power_type                 :=POWER_MANA;
          c.max_power[POWER_MANA]      :=71;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=1900;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=0;
          c.base_mana                  :=55;
          c.base_health                :=27;

          c.attack_power               :=34;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=5;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=5.61;
          c.max_damage                 :=7.61;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=4.0;
          c.max_ranged_damage          :=7.0;

          c.stat[0]                    :=26;      // strength
          c.stat[1]                    :=15;      // agility
          c.stat[2]                    :=23;      // stamina
          c.stat[3]                    :=16;      // intellect
          c.stat[4]                    :=24;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,3, 154,1, $00000000);        // Primitive Mantle
          c.ItemsAdd($FF,6, 153,1, $00000000);        // Primitive Kilt
          c.ItemsAdd($FF,15, 36,1, $00000000);        // Worn Mace
          c.ItemsAdd($FF,23, 6948,1, $0001);      // Hearthstone
          c.ItemsAdd($FF,24, 4604,4, $00000000);      // Forest Mushroom Cap
          c.ItemsAdd($FF,25, 159,2, $00000000);       // Refreshing Spring Water

          c.SkillsAdd(315, 0,0, 0,0);             // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(373, 5,0, 0,0);             // Enhancement
          c.SkillsAdd(374, 5,5, 0,0);             // Restoration
          c.SkillsAdd(375, 5,5, 0,0);             // Elemental Combat
          c.SkillsAdd(415, 1,1, 0,0);             // Cloth
          c.SkillsAdd(202, 0,0, 0,0);             // Engineering
          c.SkillsAdd(356, 0,0, 0,0);             // Fishing
          c.SkillsAdd(171, 0,0, 0,0);             // Alchemy
          c.SkillsAdd(182, 0,0, 15,0);            // Herbalism
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
          c.SkillsAdd(98, 0,0, 0,0);              // Language: Common
          c.SkillsAdd(136, 5,1, 0,0);             // Staves
          c.SkillsAdd(54, 5,1, 0,0);              // Maces
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(129, 0,0, 0,0);             // First Aid
          c.SkillsAdd(185, 0,0, 0,0);             // Cooking
          c.SkillsAdd(162, 5,1, 0,0);             // Unarmed
          c.SkillsAdd(44, 5,0, 0,0);              // Axes
          c.SkillsAdd(111, 0,0, 0,0);             // Language: Dwarven
          c.SkillsAdd(113, 0,0, 0,0);             // Language: Darnassian
          c.SkillsAdd(115, 300,300, 0,0);         // Language: Taurahe
          c.SkillsAdd(118, 5,0, 0,0);             // Dual Wield
          c.SkillsAdd(138, 0,0, 0,0);             // Language: Draconic
          c.SkillsAdd(141, 0,0, 0,0);             // Language: Old Tongue
          c.SkillsAdd(142, 1,0, 0,0);             // Survival
          c.SkillsAdd(164, 0,0, 0,0);             // Blacksmithing
          c.SkillsAdd(172, 5,0, 0,0);             // Two-Handed Axes
          c.SkillsAdd(173, 5,0, 0,0);             // Daggers
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 300,300, 0,0);         // Language: Orcish
          c.SkillsAdd(124, 5,5, 0,0);             // Tauren Racial
          c.SkillsAdd(433, 1,1, 0,0);             // Shield
          c.SkillsAdd(137, 0,0, 0,0);             // Language: Thalassian
          c.SkillsAdd(473, 1,0, 0,0);             // Fist Weapons
          c.SkillsAdd(140, 0,0, 0,0);             // Language: Titan
          c.SkillsAdd(149, 0,0, 0,0);             // Wolf Riding
          c.SkillsAdd(313, 0,0, 0,0);             // Language: Gnomish
          c.SkillsAdd(413, 0,0, 0,0);             // Mail

          c.SpellsAdd(331, 0);                    // Healing Wave
          c.SpellsAdd(403, 0);                    // Lightning Bolt
          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(107, 0);                    // Block
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(9077, 0);                   // Leather
          c.SpellsAdd(227, 0);                    // Staves
          c.SpellsAdd(198, 0);                    // One-Handed Maces
          c.SpellsAdd(203, 0);                    // Unarmed
          c.SpellsAdd(670, 0);                    // Language Taurahe
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
          c.SpellsAdd(27763, 0);                  // Totem
          c.SpellsAdd(8386, 0);                   // Attacking
          c.SpellsAdd(669, 0);                    // Language Orcish
          c.SpellsAdd(20550, 0);                  // Endurance
          c.SpellsAdd(20551, 0);                  // Nature Resistance
          c.SpellsAdd(20552, 0);                  // Cultivation
          c.SpellsAdd(20549, 0);                  // War Stomp
          c.SpellsAdd(9116, 0);                   // Shield

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 403, $00000000);      // Spell: Lightning Bolt
          c.SetActionButtons(2, 331, $00000000);      // Spell: Healing Wave
          c.SetActionButtons(3, 20549, $00000000);    // Spell: War Stomp
          c.SetActionButtons(10, 159, $80000000);     // Item: Refreshing Spring Water
          c.SetActionButtons(11, 4604, $80000000);    // Item: Forest Mushroom Cap
          c.SetActionButtons(75, 20549, $00000000);   // Spell: War Stomp

end;
procedure RACE_TAUREN_CLASS_DRUID(var c:TCharData);
begin
          c.max_health                 :=78;
          c.power_type                 :=POWER_MANA;
          c.max_power[POWER_MANA]      :=67;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=2900;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=0;
          c.base_mana                  :=50;
          c.base_health                :=34;

          c.attack_power               :=32;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=5;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=9.63;
          c.max_damage                 :=11.63;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=0.0;
          c.max_ranged_damage          :=0.0;

          c.stat[0]                    :=26;      // strength
          c.stat[1]                    :=15;      // agility
          c.stat[2]                    :=22;      // stamina
          c.stat[3]                    :=17;      // intellect
          c.stat[4]                    :=24;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,4, 6139,1, $00000000);       // Novice's Robe
          c.ItemsAdd($FF,6, 6124,1, $00000000);       // Novice's Pants
          c.ItemsAdd($FF,15, 35,1, $00000000);        // Bent Staff
          c.ItemsAdd($FF,23, 159,2, $00000000);       // Refreshing Spring Water
          c.ItemsAdd($FF,24, 4536,4, $00000000);      // Shiny Red Apple
          c.ItemsAdd($FF,25, 6948,1, $0001);      // Hearthstone

          c.SkillsAdd(134, 0,0, 0,0);             // Feral Combat
          c.SkillsAdd(415, 1,1, 0,0);             // Cloth
          c.SkillsAdd(202, 0,0, 0,0);             // Engineering
          c.SkillsAdd(356, 0,0, 0,0);             // Fishing
          c.SkillsAdd(171, 0,0, 0,0);             // Alchemy
          c.SkillsAdd(182, 0,0, 15,0);            // Herbalism
          c.SkillsAdd(673, 0,0, 0,0);             // Language: Gutterspeak
          c.SkillsAdd(95, 5,1, 0,0);              // Defense
          c.SkillsAdd(333, 0,0, 0,0);             // Enchanting
          c.SkillsAdd(713, 0,0, 0,0);             // Kodo Riding
          c.SkillsAdd(129, 0,0, 0,0);             // First Aid
          c.SkillsAdd(185, 0,0, 0,0);             // Cooking
          c.SkillsAdd(162, 5,1, 0,0);             // Unarmed
          c.SkillsAdd(160, 5,0, 0,0);             // Two-Handed Maces
          c.SkillsAdd(165, 0,0, 0,0);             // Leatherworking
          c.SkillsAdd(186, 0,0, 0,0);             // Mining
          c.SkillsAdd(98, 0,0, 0,0);              // Language: Common
          c.SkillsAdd(136, 5,1, 0,0);             // Staves
          c.SkillsAdd(54, 5,1, 0,0);              // Maces
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(573, 5,5, 0,0);             // Restoration
          c.SkillsAdd(315, 0,0, 0,0);             // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(173, 5,0, 0,0);             // Daggers
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(574, 5,5, 0,0);             // Balance
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 300,300, 0,0);         // Language: Orcish
          c.SkillsAdd(124, 5,5, 0,0);             // Tauren Racial
          c.SkillsAdd(137, 0,0, 0,0);             // Language: Thalassian
          c.SkillsAdd(473, 1,0, 0,0);             // Fist Weapons
          c.SkillsAdd(140, 0,0, 0,0);             // Language: Titan
          c.SkillsAdd(149, 0,0, 0,0);             // Wolf Riding
          c.SkillsAdd(313, 0,0, 0,0);             // Language: Gnomish
          c.SkillsAdd(414, 1,1, 0,0);             // Leather
          c.SkillsAdd(759, 0,0, 0,0);             // Language: Draenei
          c.SkillsAdd(197, 0,0, 0,0);             // Tailoring
          c.SkillsAdd(111, 0,0, 0,0);             // Language: Dwarven
          c.SkillsAdd(113, 0,0, 0,0);             // Language: Darnassian
          c.SkillsAdd(115, 300,300, 0,0);         // Language: Taurahe
          c.SkillsAdd(138, 0,0, 0,0);             // Language: Draconic
          c.SkillsAdd(141, 0,0, 0,0);             // Language: Old Tongue
          c.SkillsAdd(142, 1,0, 0,0);             // Survival
          c.SkillsAdd(164, 0,0, 0,0);             // Blacksmithing

          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(203, 0);                    // Unarmed
          c.SpellsAdd(227, 0);                    // Staves
          c.SpellsAdd(198, 0);                    // One-Handed Maces
          c.SpellsAdd(5185, 0);                   // Healing Touch
          c.SpellsAdd(21651, 0);                  // Opening
          c.SpellsAdd(21652, 0);                  // Closing
          c.SpellsAdd(8386, 0);                   // Attacking
          c.SpellsAdd(9125, 0);                   // Generic
          c.SpellsAdd(7266, 0);                   // Duel
          c.SpellsAdd(7267, 0);                   // Grovel
          c.SpellsAdd(7355, 0);                   // Stuck
          c.SpellsAdd(27764, 0);                  // Fetish
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
          c.SpellsAdd(5176, 0);                   // Wrath
          c.SpellsAdd(669, 0);                    // Language Orcish
          c.SpellsAdd(20550, 0);                  // Endurance
          c.SpellsAdd(20551, 0);                  // Nature Resistance
          c.SpellsAdd(20552, 0);                  // Cultivation
          c.SpellsAdd(20549, 0);                  // War Stomp
          c.SpellsAdd(9077, 0);                   // Leather
          c.SpellsAdd(670, 0);                    // Language Taurahe

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 5176, $00000000);     // Spell: Wrath
          c.SetActionButtons(2, 5185, $00000000);     // Spell: Healing Touch
          c.SetActionButtons(3, 20549, $00000000);    // Spell: War Stomp
          c.SetActionButtons(10, 159, $80000000);     // Item: Refreshing Spring Water
          c.SetActionButtons(11, 4536, $80000000);    // Item: Shiny Red Apple
          c.SetActionButtons(72, 6603, $00000000);    // Spell: Attack
          c.SetActionButtons(75, 20549, $00000000);   // Spell: War Stomp
          c.SetActionButtons(84, 6603, $00000000);    // Spell: Attack
          c.SetActionButtons(96, 6603, $00000000);    // Spell: Attack
          c.SetActionButtons(108, 6603, $00000000);   // Spell: Attack

end;

procedure RACE_TROLL_CLASS_WARRIOR(var c:TCharData);
begin
          c.max_health                 :=70;
          c.power_type                 :=POWER_RAGE;
          c.max_power[POWER_MANA]      :=0;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=2000;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=1800;
          c.base_mana                  :=0;
          c.base_health                :=20;

          c.attack_power               :=31;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=13;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=5.43;
          c.max_damage                 :=7.43;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=5.67;
          c.max_ranged_damage          :=9.67;

          c.stat[0]                    :=24;      // strength
          c.stat[1]                    :=22;      // agility
          c.stat[2]                    :=23;      // stamina
          c.stat[3]                    :=16;      // intellect
          c.stat[4]                    :=21;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,3, 6125,1, $00000000);       // Brawler's Harness
          c.ItemsAdd($FF,6, 139,1, $00000000);        // Brawler's Pants
          c.ItemsAdd($FF,15, 37,1, $00000000);        // Worn Axe
          c.ItemsAdd($FF,16, 2362,1, $00000000);      // Worn Wooden Shield
          c.ItemsAdd($FF,17, 25861,1, $00000000);     // Crude Throwing Axe
          c.ItemsAdd($FF,23, 117,4, $00000000);       // Tough Jerky
          c.ItemsAdd($FF,24, 6948,1, $0001);      // Hearthstone

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
          c.SkillsAdd(733, 5,5, 0,0);             // Racial - Troll
          c.SkillsAdd(176, 5,1, 5,0);             // Thrown
          c.SkillsAdd(129, 0,0, 0,0);             // First Aid
          c.SkillsAdd(185, 0,0, 0,0);             // Cooking
          c.SkillsAdd(162, 5,1, 0,0);             // Unarmed
          c.SkillsAdd(160, 5,0, 0,0);             // Two-Handed Maces
          c.SkillsAdd(165, 0,0, 0,0);             // Leatherworking
          c.SkillsAdd(43, 5,0, 0,0);              // Swords
          c.SkillsAdd(186, 0,0, 0,0);             // Mining
          c.SkillsAdd(98, 0,0, 0,0);              // Language: Common
          c.SkillsAdd(136, 5,0, 0,0);             // Staves
          c.SkillsAdd(54, 5,0, 0,0);              // Maces
          c.SkillsAdd(533, 0,0, 0,0);             // Raptor Riding
          c.SkillsAdd(554, 0,0, 0,0);             // Undead Horsemanship
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(229, 0,0, 0,0);             // Polearms
          c.SkillsAdd(257, 5,0, 0,0);             // Protection
          c.SkillsAdd(293, 0,0, 0,0);             // Plate Mail
          c.SkillsAdd(46, 5,0, 0,0);              // Guns
          c.SkillsAdd(315, 300,300, 0,0);         // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(152, 0,0, 0,0);             // Ram Riding
          c.SkillsAdd(173, 5,1, 0,0);             // Daggers
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(226, 5,0, 0,0);             // Crossbows
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 300,300, 0,0);         // Language: Orcish
          c.SkillsAdd(433, 1,1, 0,0);             // Shield
          c.SkillsAdd(137, 0,0, 0,0);             // Language: Thalassian
          c.SkillsAdd(473, 1,0, 0,0);             // Fist Weapons
          c.SkillsAdd(140, 0,0, 0,0);             // Language: Titan
          c.SkillsAdd(149, 0,0, 0,0);             // Wolf Riding
          c.SkillsAdd(313, 0,0, 0,0);             // Language: Gnomish
          c.SkillsAdd(413, 1,1, 0,0);             // Mail
          c.SkillsAdd(414, 1,1, 0,0);             // Leather
          c.SkillsAdd(45, 5,0, 5,0);              // Bows
          c.SkillsAdd(26, 5,5, 0,0);              // Arms
          c.SkillsAdd(759, 0,0, 0,0);             // Language: Draenei
          c.SkillsAdd(197, 0,0, 0,0);             // Tailoring
          c.SkillsAdd(44, 5,1, 0,0);              // Axes
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

          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(107, 0);                    // Block
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(5301, 0);                   // Defensive State (DND)
          c.SpellsAdd(32215, 0);                  // Victorious State
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(20555, 0);                  // Regeneration
          c.SpellsAdd(20557, 0);                  // Beast Slaying
          c.SpellsAdd(20558, 0);                  // Throwing Specialization
          c.SpellsAdd(23301, 0);                  // Berserking
          c.SpellsAdd(26290, 0);                  // Bow Specialization
          c.SpellsAdd(26296, 0);                  // Berserking
          c.SpellsAdd(2567, 0);                   // Thrown
          c.SpellsAdd(2764, 0);                   // Throw
          c.SpellsAdd(203, 0);                    // Unarmed
          c.SpellsAdd(7341, 0);                   // Language Troll
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
          c.SpellsAdd(669, 0);                    // Language Orcish
          c.SpellsAdd(9116, 0);                   // Shield
          c.SpellsAdd(8737, 0);                   // Mail
          c.SpellsAdd(9077, 0);                   // Leather
          c.SpellsAdd(2457, 0);                   // Battle Stance
          c.SpellsAdd(78, 0);                     // Heroic Strike
          c.SpellsAdd(196, 0);                    // One-Handed Axes

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(72, 6603, $00000000);    // Spell: Attack
          c.SetActionButtons(73, 78, $00000000);      // Spell: Heroic Strike
          c.SetActionButtons(74, 2764, $00000000);    // Spell: Throw
          c.SetActionButtons(75, 26296, $00000000);   // Spell: Berserking
          c.SetActionButtons(83, 117, $80000000);     // Item: Tough Jerky
          c.SetActionButtons(84, 6603, $00000000);    // Spell: Attack
          c.SetActionButtons(96, 6603, $00000000);    // Spell: Attack
          c.SetActionButtons(108, 6603, $00000000);   // Spell: Attack

end;
procedure RACE_TROLL_CLASS_HUNTER(var c:TCharData);
begin
          c.max_health                 :=66;
          c.power_type                 :=POWER_MANA;
          c.max_power[POWER_MANA]      :=81;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=2000;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=2091;
          c.base_mana                  :=65;
          c.base_health                :=26;

          c.attack_power               :=28;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=17;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=5.0;
          c.max_damage                 :=7.0;
          c.min_offhand_damage         :=2.5;
          c.max_offhand_damage         :=2.5;
          c.min_ranged_damage          :=10.09;
          c.max_ranged_damage          :=17.39;

          c.stat[0]                    :=21;      // strength
          c.stat[1]                    :=25;      // agility
          c.stat[2]                    :=22;      // stamina
          c.stat[3]                    :=16;      // intellect
          c.stat[4]                    :=22;      // spirit

          c.ammo_id                    :=2512;

          c.ItemsAdd($FF,3, 127,1, $00000000);        // Trapper's Shirt
          c.ItemsAdd($FF,6, 6126,1, $00000000);       // Trapper's Pants
          c.ItemsAdd($FF,15, 37,1, $00000000);        // Worn Axe
          c.ItemsAdd($FF,17, 2504,1, $00000000);      // Worn Shortbow
          c.ItemsAdd($FF,19, 2101,1, $00000000);      // Light Quiver
          c.ItemsAdd($FF,23, 4604,4, $00000000);      // Forest Mushroom Cap
          c.ItemsAdd($FF,24, 159,2, $00000000);       // Refreshing Spring Water
          c.ItemsAdd($FF,25, 6948,1, $0001);      // Hearthstone
          c.ItemsAdd(19,0, 2512,200, $00000000);

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
          c.SkillsAdd(733, 5,5, 0,0);             // Racial - Troll
          c.SkillsAdd(176, 5,0, 5,0);             // Thrown
          c.SkillsAdd(129, 0,0, 0,0);             // First Aid
          c.SkillsAdd(185, 0,0, 0,0);             // Cooking
          c.SkillsAdd(261, 5,0, 0,0);             // Beast Training
          c.SkillsAdd(162, 5,1, 0,0);             // Unarmed
          c.SkillsAdd(165, 0,0, 0,0);             // Leatherworking
          c.SkillsAdd(43, 5,0, 0,0);              // Swords
          c.SkillsAdd(186, 0,0, 0,0);             // Mining
          c.SkillsAdd(51, 5,5, 0,0);              // Survival
          c.SkillsAdd(98, 0,0, 0,0);              // Language: Common
          c.SkillsAdd(136, 5,0, 0,0);             // Staves
          c.SkillsAdd(533, 0,0, 0,0);             // Raptor Riding
          c.SkillsAdd(554, 0,0, 0,0);             // Undead Horsemanship
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(229, 0,0, 0,0);             // Polearms
          c.SkillsAdd(46, 5,0, 0,0);              // Guns
          c.SkillsAdd(315, 300,300, 0,0);         // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(152, 0,0, 0,0);             // Ram Riding
          c.SkillsAdd(173, 5,0, 0,0);             // Daggers
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(226, 5,0, 0,0);             // Crossbows
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 300,300, 0,0);         // Language: Orcish
          c.SkillsAdd(137, 0,0, 0,0);             // Language: Thalassian
          c.SkillsAdd(473, 1,0, 0,0);             // Fist Weapons
          c.SkillsAdd(140, 0,0, 0,0);             // Language: Titan
          c.SkillsAdd(149, 0,0, 0,0);             // Wolf Riding
          c.SkillsAdd(313, 0,0, 0,0);             // Language: Gnomish
          c.SkillsAdd(413, 0,0, 0,0);             // Mail
          c.SkillsAdd(414, 1,1, 0,0);             // Leather
          c.SkillsAdd(45, 5,1, 5,0);              // Bows
          c.SkillsAdd(759, 0,0, 0,0);             // Language: Draenei
          c.SkillsAdd(197, 0,0, 0,0);             // Tailoring
          c.SkillsAdd(44, 5,1, 0,0);              // Axes
          c.SkillsAdd(50, 5,0, 0,0);              // Beast Mastery
          c.SkillsAdd(111, 0,0, 0,0);             // Language: Dwarven
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
          c.SpellsAdd(20554, 0);                  // Berserking
          c.SpellsAdd(20555, 0);                  // Regeneration
          c.SpellsAdd(20557, 0);                  // Beast Slaying
          c.SpellsAdd(20558, 0);                  // Throwing Specialization
          c.SpellsAdd(23301, 0);                  // Berserking
          c.SpellsAdd(26290, 0);                  // Bow Specialization
          c.SpellsAdd(203, 0);                    // Unarmed
          c.SpellsAdd(2973, 0);                   // Raptor Strike
          c.SpellsAdd(7341, 0);                   // Language Troll
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
          c.SpellsAdd(669, 0);                    // Language Orcish
          c.SpellsAdd(9077, 0);                   // Leather
          c.SpellsAdd(264, 0);                    // Bows
          c.SpellsAdd(196, 0);                    // One-Handed Axes
          c.SpellsAdd(75, 0);                     // Auto Shot

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 2973, $00000000);     // Spell: Raptor Strike
          c.SetActionButtons(2, 75, $00000000);       // Spell: Auto Shot
          c.SetActionButtons(3, 20554, $00000000);    // Spell: Berserking
          c.SetActionButtons(10, 159, $80000000);     // Item: Refreshing Spring Water
          c.SetActionButtons(11, 4604, $80000000);    // Item: Forest Mushroom Cap
          c.SetActionButtons(75, 20554, $00000000);   // Spell: Berserking

end;
procedure RACE_TROLL_CLASS_ROGUE(var c:TCharData);
begin
          c.max_health                 :=65;
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

          c.attack_power               :=29;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=16;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=4.31;
          c.max_damage                 :=5.31;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=6.06;
          c.max_ranged_damage          :=10.06;

          c.stat[0]                    :=22;      // strength
          c.stat[1]                    :=25;      // agility
          c.stat[2]                    :=22;      // stamina
          c.stat[3]                    :=16;      // intellect
          c.stat[4]                    :=21;      // spirit  

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,3, 6136,1, $00000000);       // Thug Shirt
          c.ItemsAdd($FF,6, 6137,1, $00000000);       // Thug Pants
          c.ItemsAdd($FF,7, 6138,1, $00000000);       // Thug Boots
          c.ItemsAdd($FF,15, 2092,1, $00000000);      // Worn Dagger
          c.ItemsAdd($FF,17, 25861,1, $00000000);     // Crude Throwing Axe
          c.ItemsAdd($FF,23, 117,4, $00000000);       // Tough Jerky
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
          c.SkillsAdd(733, 5,5, 0,0);             // Racial - Troll
          c.SkillsAdd(176, 5,1, 5,0);             // Thrown
          c.SkillsAdd(38, 5,5, 0,0);              // Combat
          c.SkillsAdd(39, 5,0, 0,0);              // Subtlety
          c.SkillsAdd(129, 0,0, 0,0);             // First Aid
          c.SkillsAdd(185, 0,0, 0,0);             // Cooking
          c.SkillsAdd(40, 5,0, 0,0);              // Poisons
          c.SkillsAdd(162, 5,1, 0,0);             // Unarmed
          c.SkillsAdd(165, 0,0, 0,0);             // Leatherworking
          c.SkillsAdd(43, 5,0, 0,0);              // Swords
          c.SkillsAdd(186, 0,0, 0,0);             // Mining
          c.SkillsAdd(98, 0,0, 0,0);              // Language: Common
          c.SkillsAdd(54, 5,0, 0,0);              // Maces
          c.SkillsAdd(533, 0,0, 0,0);             // Raptor Riding
          c.SkillsAdd(554, 0,0, 0,0);             // Undead Horsemanship
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(46, 5,0, 0,0);              // Guns
          c.SkillsAdd(315, 300,300, 0,0);         // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(152, 0,0, 0,0);             // Ram Riding
          c.SkillsAdd(173, 5,1, 0,0);             // Daggers
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(226, 5,0, 0,0);             // Crossbows
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 300,300, 0,0);         // Language: Orcish
          c.SkillsAdd(137, 0,0, 0,0);             // Language: Thalassian
          c.SkillsAdd(473, 1,0, 0,0);             // Fist Weapons
          c.SkillsAdd(140, 0,0, 0,0);             // Language: Titan
          c.SkillsAdd(149, 0,0, 0,0);             // Wolf Riding
          c.SkillsAdd(253, 5,5, 0,0);             // Assassination
          c.SkillsAdd(313, 0,0, 0,0);             // Language: Gnomish
          c.SkillsAdd(414, 1,1, 0,0);             // Leather
          c.SkillsAdd(45, 5,0, 5,0);              // Bows
          c.SkillsAdd(759, 0,0, 0,0);             // Language: Draenei
          c.SkillsAdd(197, 0,0, 0,0);             // Tailoring
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

          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(16092, 0);                  // Defensive State (DND)
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(20555, 0);                  // Regeneration
          c.SpellsAdd(20557, 0);                  // Beast Slaying
          c.SpellsAdd(20558, 0);                  // Throwing Specialization
          c.SpellsAdd(23301, 0);                  // Berserking
          c.SpellsAdd(26290, 0);                  // Bow Specialization
          c.SpellsAdd(26297, 0);                  // Berserking
          c.SpellsAdd(2567, 0);                   // Thrown
          c.SpellsAdd(2764, 0);                   // Throw
          c.SpellsAdd(21184, 0);                  // Rogue Passive (DND)
          c.SpellsAdd(1752, 0);                   // Sinister Strike
          c.SpellsAdd(203, 0);                    // Unarmed
          c.SpellsAdd(7341, 0);                   // Language Troll
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
          c.SpellsAdd(669, 0);                    // Language Orcish
          c.SpellsAdd(2098, 0);                   // Eviscerate
          c.SpellsAdd(9077, 0);                   // Leather

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 1752, $00000000);     // Spell: Sinister Strike
          c.SetActionButtons(2, 2098, $00000000);     // Spell: Eviscerate
          c.SetActionButtons(3, 2764, $00000000);     // Spell: Throw
          c.SetActionButtons(4, 26297, $00000000);    // Spell: Berserking
          c.SetActionButtons(11, 117, $80000000);     // Item: Tough Jerky
          c.SetActionButtons(76, 26297, $00000000);   // Spell: Berserking

end;
procedure RACE_TROLL_CLASS_PRIEST(var c:TCharData);
begin
          c.max_health                 :=62;
          c.power_type                 :=POWER_MANA;
          c.max_power[POWER_MANA]      :=128;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=1900;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=0;
          c.base_mana                  :=110;
          c.base_health                :=32;

          c.attack_power               :=11;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=12;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=2.49;
          c.max_damage                 :=4.49;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=0.0;
          c.max_ranged_damage          :=0.0;

          c.stat[0]                    :=21;      // strength
          c.stat[1]                    :=22;      // agility
          c.stat[2]                    :=21;      // stamina
          c.stat[3]                    :=18;      // intellect
          c.stat[4]                    :=24;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,3, 53,1, $00000000);         // Neophyte's Shirt
          c.ItemsAdd($FF,4, 6144,1, $00000000);       // Neophyte's Robe
          c.ItemsAdd($FF,6, 52,1, $00000000);         // Neophyte's Pants
          c.ItemsAdd($FF,15, 36,1, $00000000);        // Worn Mace
          c.ItemsAdd($FF,23, 4540,4, $00000000);      // Tough Hunk of Bread
          c.ItemsAdd($FF,24, 159,2, $00000000);       // Refreshing Spring Water
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
          c.SkillsAdd(733, 5,5, 0,0);             // Racial - Troll
          c.SkillsAdd(129, 0,0, 0,0);             // First Aid
          c.SkillsAdd(185, 0,0, 0,0);             // Cooking
          c.SkillsAdd(162, 5,1, 0,0);             // Unarmed
          c.SkillsAdd(165, 0,0, 0,0);             // Leatherworking
          c.SkillsAdd(186, 0,0, 0,0);             // Mining
          c.SkillsAdd(98, 0,0, 0,0);              // Language: Common
          c.SkillsAdd(136, 5,0, 0,0);             // Staves
          c.SkillsAdd(54, 5,1, 0,0);              // Maces
          c.SkillsAdd(533, 0,0, 0,0);             // Raptor Riding
          c.SkillsAdd(554, 0,0, 0,0);             // Undead Horsemanship
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(315, 300,300, 0,0);         // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(152, 0,0, 0,0);             // Ram Riding
          c.SkillsAdd(173, 5,0, 0,0);             // Daggers
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(228, 5,1, 0,0);             // Wands
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 300,300, 0,0);         // Language: Orcish
          c.SkillsAdd(137, 0,0, 0,0);             // Language: Thalassian
          c.SkillsAdd(140, 0,0, 0,0);             // Language: Titan
          c.SkillsAdd(149, 0,0, 0,0);             // Wolf Riding
          c.SkillsAdd(313, 0,0, 0,0);             // Language: Gnomish
          c.SkillsAdd(613, 5,0, 0,0);             // Discipline
          c.SkillsAdd(78, 5,0, 0,0);              // Shadow Magic
          c.SkillsAdd(759, 0,0, 0,0);             // Language: Draenei
          c.SkillsAdd(197, 0,0, 0,0);             // Tailoring
          c.SkillsAdd(56, 5,5, 0,0);              // Holy
          c.SkillsAdd(111, 0,0, 0,0);             // Language: Dwarven
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
          c.SpellsAdd(20554, 0);                  // Berserking
          c.SpellsAdd(20555, 0);                  // Regeneration
          c.SpellsAdd(20557, 0);                  // Beast Slaying
          c.SpellsAdd(20558, 0);                  // Throwing Specialization
          c.SpellsAdd(23301, 0);                  // Berserking
          c.SpellsAdd(26290, 0);                  // Bow Specialization
          c.SpellsAdd(203, 0);                    // Unarmed
          c.SpellsAdd(198, 0);                    // One-Handed Maces
          c.SpellsAdd(7341, 0);                   // Language Troll
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
          c.SpellsAdd(669, 0);                    // Language Orcish
          c.SpellsAdd(2050, 0);                   // Lesser Heal
          c.SpellsAdd(585, 0);                    // Smite

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 585, $00000000);      // Spell: Smite
          c.SetActionButtons(2, 2050, $00000000);     // Spell: Lesser Heal
          c.SetActionButtons(3, 20554, $00000000);    // Spell: Berserking
          c.SetActionButtons(10, 159, $80000000);     // Item: Refreshing Spring Water
          c.SetActionButtons(11, 4540, $80000000);    // Item: Tough Hunk of Bread
          c.SetActionButtons(75, 20554, $00000000);   // Spell: Berserking

end;
procedure RACE_TROLL_CLASS_SHAMAN(var c:TCharData);
begin
          c.max_health                 :=67;
          c.power_type                 :=POWER_MANA;
          c.max_power[POWER_MANA]      :=72;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=1900;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=0;
          c.base_mana                  :=55;
          c.base_health                :=27;

          c.attack_power               :=26;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=12;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=4.53;
          c.max_damage                 :=6.53;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=0.0;
          c.max_ranged_damage          :=0.0;

          c.stat[0]                    :=22;      // strength
          c.stat[1]                    :=22;      // agility
          c.stat[2]                    :=22;      // stamina
          c.stat[3]                    :=17;      // intellect
          c.stat[4]                    :=23;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,3, 6134,1, $00000000);       // Primitive Mantle
          c.ItemsAdd($FF,6, 6135,1, $00000000);       // Primitive Kilt
          c.ItemsAdd($FF,15, 36,1, $00000000);        // Worn Mace
          c.ItemsAdd($FF,23, 117,4, $00000000);       // Tough Jerky
          c.ItemsAdd($FF,24, 159,2, $00000000);       // Refreshing Spring Water
          c.ItemsAdd($FF,25, 6948,1, $0001);      // Hearthstone

          c.SkillsAdd(373, 5,0, 0,0);             // Enhancement
          c.SkillsAdd(374, 5,5, 0,0);             // Restoration
          c.SkillsAdd(375, 5,5, 0,0);             // Elemental Combat
          c.SkillsAdd(415, 1,1, 0,0);             // Cloth
          c.SkillsAdd(202, 0,0, 0,0);             // Engineering
          c.SkillsAdd(356, 0,0, 0,0);             // Fishing
          c.SkillsAdd(171, 0,0, 0,0);             // Alchemy
          c.SkillsAdd(182, 0,0, 0,0);             // Herbalism
          c.SkillsAdd(673, 0,0, 0,0);             // Language: Gutterspeak
          c.SkillsAdd(95, 5,1, 0,0);              // Defense
          c.SkillsAdd(333, 0,0, 0,0);             // Enchanting
          c.SkillsAdd(713, 0,0, 0,0);             // Kodo Riding
          c.SkillsAdd(733, 5,5, 0,0);             // Racial - Troll
          c.SkillsAdd(129, 0,0, 0,0);             // First Aid
          c.SkillsAdd(185, 0,0, 0,0);             // Cooking
          c.SkillsAdd(162, 5,1, 0,0);             // Unarmed
          c.SkillsAdd(160, 5,0, 0,0);             // Two-Handed Maces
          c.SkillsAdd(165, 0,0, 0,0);             // Leatherworking
          c.SkillsAdd(186, 0,0, 0,0);             // Mining
          c.SkillsAdd(98, 0,0, 0,0);              // Language: Common
          c.SkillsAdd(136, 5,1, 0,0);             // Staves
          c.SkillsAdd(54, 5,1, 0,0);              // Maces
          c.SkillsAdd(533, 0,0, 0,0);             // Raptor Riding
          c.SkillsAdd(554, 0,0, 0,0);             // Undead Horsemanship
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(315, 300,300, 0,0);         // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(152, 0,0, 0,0);             // Ram Riding
          c.SkillsAdd(173, 5,0, 0,0);             // Daggers
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 300,300, 0,0);         // Language: Orcish
          c.SkillsAdd(433, 1,1, 0,0);             // Shield
          c.SkillsAdd(137, 0,0, 0,0);             // Language: Thalassian
          c.SkillsAdd(473, 1,0, 0,0);             // Fist Weapons
          c.SkillsAdd(140, 0,0, 0,0);             // Language: Titan
          c.SkillsAdd(149, 0,0, 0,0);             // Wolf Riding
          c.SkillsAdd(313, 0,0, 0,0);             // Language: Gnomish
          c.SkillsAdd(413, 0,0, 0,0);             // Mail
          c.SkillsAdd(414, 1,1, 0,0);             // Leather
          c.SkillsAdd(759, 0,0, 0,0);             // Language: Draenei
          c.SkillsAdd(197, 0,0, 0,0);             // Tailoring
          c.SkillsAdd(44, 5,0, 0,0);              // Axes
          c.SkillsAdd(111, 0,0, 0,0);             // Language: Dwarven
          c.SkillsAdd(113, 0,0, 0,0);             // Language: Darnassian
          c.SkillsAdd(115, 0,0, 0,0);             // Language: Taurahe
          c.SkillsAdd(118, 5,0, 0,0);             // Dual Wield
          c.SkillsAdd(138, 0,0, 0,0);             // Language: Draconic
          c.SkillsAdd(141, 0,0, 0,0);             // Language: Old Tongue
          c.SkillsAdd(142, 1,0, 0,0);             // Survival
          c.SkillsAdd(148, 0,0, 0,0);             // Horse Riding
          c.SkillsAdd(150, 0,0, 0,0);             // Tiger Riding
          c.SkillsAdd(164, 0,0, 0,0);             // Blacksmithing
          c.SkillsAdd(172, 5,0, 0,0);             // Two-Handed Axes

          c.SpellsAdd(331, 0);                    // Healing Wave
          c.SpellsAdd(403, 0);                    // Lightning Bolt
          c.SpellsAdd(9078, 0);                   // Cloth
          c.SpellsAdd(107, 0);                    // Block
          c.SpellsAdd(204, 0);                    // Defense
          c.SpellsAdd(81, 0);                     // Dodge
          c.SpellsAdd(522, 0);                    // SPELLDEFENSE (DND)
          c.SpellsAdd(20554, 0);                  // Berserking
          c.SpellsAdd(20555, 0);                  // Regeneration
          c.SpellsAdd(20557, 0);                  // Beast Slaying
          c.SpellsAdd(20558, 0);                  // Throwing Specialization
          c.SpellsAdd(23301, 0);                  // Berserking
          c.SpellsAdd(26290, 0);                  // Bow Specialization
          c.SpellsAdd(203, 0);                    // Unarmed
          c.SpellsAdd(227, 0);                    // Staves
          c.SpellsAdd(198, 0);                    // One-Handed Maces
          c.SpellsAdd(7341, 0);                   // Language Troll
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
          c.SpellsAdd(27763, 0);                  // Totem
          c.SpellsAdd(3365, 0);                   // Opening
          c.SpellsAdd(3050, 0);                   // Detect
          c.SpellsAdd(6477, 0);                   // Opening
          c.SpellsAdd(6478, 0);                   // Opening
          c.SpellsAdd(6603, 0);                   // Attack
          c.SpellsAdd(6233, 0);                   // Closing
          c.SpellsAdd(6246, 0);                   // Closing
          c.SpellsAdd(6247, 0);                   // Opening
          c.SpellsAdd(669, 0);                    // Language Orcish
          c.SpellsAdd(9116, 0);                   // Shield
          c.SpellsAdd(9077, 0);                   // Leather

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 403, $00000000);      // Spell: Lightning Bolt
          c.SetActionButtons(2, 331, $00000000);      // Spell: Healing Wave
          c.SetActionButtons(3, 20554, $00000000);    // Spell: Berserking
          c.SetActionButtons(10, 159, $80000000);     // Item: Refreshing Spring Water
          c.SetActionButtons(11, 117, $80000000);     // Item: Tough Jerky
          c.SetActionButtons(75, 20554, $00000000);   // Spell: Berserking

end;
procedure RACE_TROLL_CLASS_MAGE(var c:TCharData);
begin
          c.max_health                 :=62;
          c.power_type                 :=POWER_MANA;
          c.max_power[POWER_MANA]      :=119;
          c.max_power[POWER_RAGE]      :=1000;
          c.max_power[POWER_FOCUS]     :=100;
          c.max_power[POWER_ENERGY]    :=100;
          c.max_power[POWER_HAPPINESS] :=0;

          c.mainhand_attack_time       :=2900;
          c.offhand_attack_time        :=2000;
          c.ranged_attack_time         :=0;
          c.base_mana                  :=100;
          c.base_health                :=32;

          c.attack_power               :=11;
          c.attack_power_mod           :=0;
          c.ranged_attack_power        :=12;
          c.ranged_attack_power_mod    :=0;

          c.min_damage                 :=5.28;
          c.max_damage                 :=7.28;
          c.min_offhand_damage         :=0.0;
          c.max_offhand_damage         :=0.0;
          c.min_ranged_damage          :=0.0;
          c.max_ranged_damage          :=0.0;

          c.stat[0]                    :=21;      // strength
          c.stat[1]                    :=22;      // agility
          c.stat[2]                    :=21;      // stamina
          c.stat[3]                    :=19;      // intellect
          c.stat[4]                    :=23;      // spirit

          c.ammo_id                    :=0;

          c.ItemsAdd($FF,3, 6096,1, $00000000);       // Apprentice's Shirt
          c.ItemsAdd($FF,4, 6140,1, $00000000);       // Apprentice's Robe
          c.ItemsAdd($FF,6, 1395,1, $00000000);       // Apprentice's Pants
          c.ItemsAdd($FF,7, 55,1, $00000000);         // Apprentice's Boots
          c.ItemsAdd($FF,15, 35,1, $00000000);        // Bent Staff
          c.ItemsAdd($FF,23, 117,4, $00000000);       // Tough Jerky
          c.ItemsAdd($FF,24, 159,2, $00000000);       // Refreshing Spring Water
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
          c.SkillsAdd(733, 5,5, 0,0);             // Racial - Troll
          c.SkillsAdd(6, 5,5, 0,0);               // Frost
          c.SkillsAdd(129, 0,0, 0,0);             // First Aid
          c.SkillsAdd(185, 0,0, 0,0);             // Cooking
          c.SkillsAdd(237, 5,0, 0,0);             // Arcane
          c.SkillsAdd(162, 5,1, 0,0);             // Unarmed
          c.SkillsAdd(165, 0,0, 0,0);             // Leatherworking
          c.SkillsAdd(43, 5,0, 0,0);              // Swords
          c.SkillsAdd(186, 0,0, 0,0);             // Mining
          c.SkillsAdd(98, 0,0, 0,0);              // Language: Common
          c.SkillsAdd(136, 5,1, 0,0);             // Staves
          c.SkillsAdd(533, 0,0, 0,0);             // Raptor Riding
          c.SkillsAdd(554, 0,0, 0,0);             // Undead Horsemanship
          c.SkillsAdd(762, 0,0, 0,0);             // Riding
          c.SkillsAdd(769, 5,0, 0,0);             // Internal
          c.SkillsAdd(8, 5,5, 0,0);               // Fire
          c.SkillsAdd(315, 300,300, 0,0);         // Language: Troll
          c.SkillsAdd(139, 0,0, 0,0);             // Language: Demon Tongue
          c.SkillsAdd(152, 0,0, 0,0);             // Ram Riding
          c.SkillsAdd(173, 5,0, 0,0);             // Daggers
          c.SkillsAdd(183, 5,5, 0,0);             // GENERIC (DND)
          c.SkillsAdd(228, 5,1, 0,0);             // Wands
          c.SkillsAdd(755, 0,0, 0,0);             // Jewelcrafting
          c.SkillsAdd(393, 0,0, 0,0);             // Skinning
          c.SkillsAdd(109, 300,300, 0,0);         // Language: Orcish
          c.SkillsAdd(137, 0,0, 0,0);             // Language: Thalassian
          c.SkillsAdd(140, 0,0, 0,0);             // Language: Titan
          c.SkillsAdd(149, 0,0, 0,0);             // Wolf Riding
          c.SkillsAdd(313, 0,0, 0,0);             // Language: Gnomish
          c.SkillsAdd(759, 0,0, 0,0);             // Language: Draenei
          c.SkillsAdd(197, 0,0, 0,0);             // Tailoring
          c.SkillsAdd(111, 0,0, 0,0);             // Language: Dwarven
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
          c.SpellsAdd(20554, 0);                  // Berserking
          c.SpellsAdd(20555, 0);                  // Regeneration
          c.SpellsAdd(20557, 0);                  // Beast Slaying
          c.SpellsAdd(20558, 0);                  // Throwing Specialization
          c.SpellsAdd(23301, 0);                  // Berserking
          c.SpellsAdd(26290, 0);                  // Bow Specialization
          c.SpellsAdd(168, 0);                    // Frost Armor
          c.SpellsAdd(203, 0);                    // Unarmed
          c.SpellsAdd(227, 0);                    // Staves
          c.SpellsAdd(133, 0);                    // Fireball
          c.SpellsAdd(7341, 0);                   // Language Troll
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
          c.SpellsAdd(669, 0);                    // Language Orcish

          c.SetActionButtons(0, 6603, $00000000);     // Spell: Attack
          c.SetActionButtons(1, 133, $00000000);      // Spell: Fireball
          c.SetActionButtons(2, 168, $00000000);      // Spell: Frost Armor
          c.SetActionButtons(3, 20554, $00000000);    // Spell: Berserking
          c.SetActionButtons(10, 159, $80000000);     // Item: Refreshing Spring Water
          c.SetActionButtons(11, 117, $80000000);     // Item: Tough Jerky
          c.SetActionButtons(75, 20554, $00000000);   // Spell: Berserking

end;

end.
