unit Defines;

interface

const
  APP_BUILD = '2400';

  GAME_TYPE_CLASSIC                    = 0;
  GAME_TYPE_BK                         = 1;
  GAME_TYPE_WOTLK                      = 2;
  GAME_TYPE_CATA                       = 3;

  // Char Server
  // ===========================================================================
  RESPONSE_SUCCESS                     = $00;
  RESPONSE_FAILURE                     = $01;
  RESPONSE_CANCELLED                   = $02;
  RESPONSE_DISCONNECTED                = $03;
  RESPONSE_FAILED_TO_CONNECT           = $04;
  RESPONSE_CONNECTED                   = $05;
  RESPONSE_VERSION_MISMATCH            = $06;

  CSTATUS_CONNECTING                   = $07;
  CSTATUS_NEGOTIATING_SECURITY         = $08;
  CSTATUS_NEGOTIATION_COMPLETE         = $09;
  CSTATUS_NEGOTIATION_FAILED           = $0A;
  CSTATUS_AUTHENTICATING               = $0B;

  AUTH_OK                              = $0C;
  AUTH_FAILED                          = $0D;
  AUTH_REJECT                          = $0E;
  AUTH_BAD_SERVER_PROOF                = $0F;
  AUTH_UNAVAILABLE                     = $10;
  AUTH_SYSTEM_ERROR                    = $11;
  AUTH_BILLING_ERROR                   = $12;
  AUTH_BILLING_EXPIRED                 = $13;
  AUTH_VERSION_MISMATCH                = $14;
  AUTH_UNKNOWN_ACCOUNT                 = $15;
  AUTH_INCORRECT_PASSWORD              = $16;
  AUTH_SESSION_EXPIRED                 = $17;
  AUTH_SERVER_SHUTTING_DOWN            = $18;
  AUTH_ALREADY_LOGGING_IN              = $19;
  AUTH_LOGIN_SERVER_NOT_FOUND          = $1A;
  AUTH_WAIT_QUEUE                      = $1B;
  AUTH_BANNED                          = $1C;
  AUTH_ALREADY_ONLINE                  = $1D;
  AUTH_NO_TIME                         = $1E;
  AUTH_DB_BUSY                         = $1F;
  AUTH_SUSPENDED                       = $20;
  AUTH_PARENTAL_CONTROL                = $21;
  AUTH_LOCKED_ENFORCED                 = $22;

  // enum REALM_LIST_RESULT
  REALM_LIST_IN_PROGRESS               = $22;
  REALM_LIST_SUCCESS                   = $23;
  REALM_LIST_FAILED                    = $24;
  REALM_LIST_INVALID                   = $25;
  REALM_LIST_REALM_NOT_FOUND           = $26;
  LAST_REALM_LIST_RESULT               = $27;

  // enum ACCOUNT_CREATE_RESULT
  ACCOUNT_CREATE_IN_PROGRESS           = $27;
  ACCOUNT_CREATE_SUCCESS               = $28;
  ACCOUNT_CREATE_FAILED                = $29;
  LAST_ACCOUNT_CREATE_RESULT           = $2A;

  // enum CHAR_LIST_RESULT
  CHAR_LIST_RETRIEVING                 = $2A;
  CHAR_LIST_RETRIEVED                  = $2B;
  CHAR_LIST_FAILED                     = $2C;
  LAST_CHAR_LIST_RESULT                = $2D;

  // enum CHAR_CREATE_RESULT
  CHAR_CREATE_IN_PROGRESS              = $2D;
  CHAR_CREATE_SUCCESS                  = $2E;
  CHAR_CREATE_ERROR                    = $2F;
  CHAR_CREATE_FAILED                   = $30;
  CHAR_CREATE_NAME_IN_USE              = $31;
  CHAR_CREATE_DISABLED                 = $32;
  CHAR_CREATE_PVP_TEAMS_VIOLATION      = $33;
  CHAR_CREATE_SERVER_LIMIT             = $34;
  CHAR_CREATE_ACCOUNT_LIMIT            = $35;
  CHAR_CREATE_SERVER_QUEUE             = $36;
  CHAR_CREATE_ONLY_EXISTING            = $37;
  LAST_CHAR_CREATE_RESULT              = $38;

  // enum CHAR_DELETE_RESULT
  CHAR_DELETE_IN_PROGRESS              = $38;
  CHAR_DELETE_SUCCESS                  = $39;
  CHAR_DELETE_FAILED                   = $3A;
  LAST_CHAR_DELETE_RESULT              = $3B;

  // enum CHAR_LOGIN_RESULT
  CHAR_LOGIN_IN_PROGRESS               = $3B;
  CHAR_LOGIN_SUCCESS                   = $3C;
  CHAR_LOGIN_NO_WORLD                  = $3D;
  CHAR_LOGIN_DUPLICATE_CHARACTER       = $3E;
  CHAR_LOGIN_NO_INSTANCES              = $3F;
  CHAR_LOGIN_FAILED                    = $40;
  CHAR_LOGIN_DISABLED                  = $41;
  LAST_CHAR_LOGIN_RESULT               = $42;

  // enum CHAR_NAME_RESULT
  CHAR_NAME_NO_NAME                    = $42;
  CHAR_NAME_TOO_SHORT                  = $43;
  CHAR_NAME_TOO_LONG                   = $44;
  CHAR_NAME_STARTS_WITH_GRAVE          = $45;
  CHAR_NAME_TWO_GRAVES                 = $46;
  CHAR_NAME_INVALID_CHARACTER          = $47;
  CHAR_NAME_MIXED_LANGUAGES            = $48;
  CHAR_NAME_PROFANE                    = $49;
  CHAR_NAME_RESERVED                   = $4A;
  CHAR_NAME_FAILURE                    = $4B;
  CHAR_NAME_SUCCESS                    = $4C;
  LAST_CHAR_NAME_RESULT                = $4D;

  // chat system
  LANG_UNIVERSAL                       = 0;
  LANG_ORCISH                          = 1;
  LANG_DARNASSIAN                      = 2;
  LANG_TAURAHE                         = 3;
  LANG_DWARVISH                        = 6;
  LANG_COMMON                          = 7;
  LANG_DEMONIC                         = 8;
  LANG_TITAN                           = 9;
  LANG_THELASSIAN                      = 10;
  LANG_DRACONIC                        = 11;
  LANG_KALIMAG                         = 12;
  LANG_GNOMISH                         = 13;
  LANG_TROLL                           = 14;
  LANG_GUTTERSPEAK                     = 33;
  LANG_DRAENEI                         = 35;
  LANG_ZOMBIE                          = 36;
  LANG_GNOMISH_BINARY                  = 37;
  LANG_GOBLIN_BINARY                   = 38;
  LANG_WORGEN                          = 39;
  LANG_GOBLIN                          = 40;

  CHAT_MSG_SAY                                   = 0;
  CHAT_MSG_PARTY                                 = 1;
  CHAT_MSG_RAID                                  = 2;
  CHAT_MSG_GUILD                                 = 3;
  CHAT_MSG_OFFICER                               = 4;
  CHAT_MSG_YELL                                  = 5;
  CHAT_MSG_WHISPER                               = 6;
  CHAT_MSG_WHISPER_INFORM                        = 7;
  CHAT_MSG_EMOTE                                 = 8;
  CHAT_MSG_TEXT_EMOTE                            = 9;
  CHAT_MSG_SYSTEM                                = 10;
  CHAT_MSG_MONSTER_SAY                           = 11;
  CHAT_MSG_MONSTER_YELL                          = 12;
  CHAT_MSG_MONSTER_EMOTE                         = 13;
  CHAT_MSG_CHANNEL                               = 14;
  CHAT_MSG_CHANNEL_JOIN                          = 15;
  CHAT_MSG_CHANNEL_LEAVE                         = 16;
  CHAT_MSG_CHANNEL_LIST                          = 17;
  CHAT_MSG_CHANNEL_NOTICE                        = 18;
  CHAT_MSG_CHANNEL_NOTICE_USER                   = 19;
  CHAT_MSG_AFK                                   = 20;
  CHAT_MSG_DND                                   = 21;
  CHAT_MSG_IGNORED                               = 22;
  CHAT_MSG_SKILL                                 = 23;
  CHAT_MSG_LOOT                                  = 24;
  CHAT_MSG_COMBAT_MISC_INFO                      = 25;
  CHAT_MSG_MONSTER_WHISPER                       = 26;
  CHAT_MSG_COMBAT_SELF_HITS                      = 27;
  CHAT_MSG_COMBAT_SELF_MISSES                    = 28;
  CHAT_MSG_COMBAT_PET_HITS                       = 29;
  CHAT_MSG_COMBAT_PET_MISSES                     = 30;
  CHAT_MSG_COMBAT_PARTY_HITS                     = 31;
  CHAT_MSG_COMBAT_PARTY_MISSES                   = 32;
  CHAT_MSG_COMBAT_FRIENDLYPLAYER_HITS            = 33;
  CHAT_MSG_COMBAT_FRIENDLYPLAYER_MISSES          = 34;
  CHAT_MSG_COMBAT_HOSTILEPLAYER_HITS             = 35;
  CHAT_MSG_COMBAT_HOSTILEPLAYER_MISSES           = 36;
  CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS          = 37;
  CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES        = 38;
  CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS         = 39;
  CHAT_MSG_COMBAT_CREATURE_VS_PARTY_MISSES       = 40;
  CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS      = 41;
  CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES    = 42;
  CHAT_MSG_COMBAT_FRIENDLY_DEATH                 = 43;
  CHAT_MSG_COMBAT_HOSTILE_DEATH                  = 44;
  CHAT_MSG_COMBAT_XP_GAIN                        = 45;
  CHAT_MSG_SPELL_SELF_DAMAGE                     = 46;
  CHAT_MSG_SPELL_SELF_BUFF                       = 47;
  CHAT_MSG_SPELL_PET_DAMAGE                      = 48;
  CHAT_MSG_SPELL_PET_BUFF                        = 49;
  CHAT_MSG_SPELL_PARTY_DAMAGE                    = 50;
  CHAT_MSG_SPELL_PARTY_BUFF                      = 51;
  CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE           = 52;
  CHAT_MSG_SPELL_FRIENDLYPLAYER_BUFF             = 53;
  CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE            = 54;
  CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF              = 55;
  CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE         = 56;
  CHAT_MSG_SPELL_CREATURE_VS_SELF_BUFF           = 57;
  CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE        = 58;
  CHAT_MSG_SPELL_CREATURE_VS_PARTY_BUFF          = 59;
  CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE     = 60;
  CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF       = 61;
  CHAT_MSG_SPELL_TRADESKILLS                     = 62;
  CHAT_MSG_SPELL_DAMAGESHIELDS_ON_SELF           = 63;
  CHAT_MSG_SPELL_DAMAGESHIELDS_ON_OTHERS         = 64;
  CHAT_MSG_SPELL_AURA_GONE_SELF                  = 65;
  CHAT_MSG_SPELL_AURA_GONE_PARTY                 = 66;
  CHAT_MSG_SPELL_AURA_GONE_OTHER                 = 67;
  CHAT_MSG_SPELL_ITEM_ENCHANTMENTS               = 68;
  CHAT_MSG_SPELL_BREAK_AURA                      = 69;
  CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE            = 70;
  CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS             = 71;
  CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE           = 72;
  CHAT_MSG_SPELL_PERIODIC_PARTY_BUFFS            = 73;
  CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE  = 74;
  CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_BUFFS   = 75;
  CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE   = 76;
  CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS    = 77;
  CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE        = 78;
  CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS         = 79;
  CHAT_MSG_SPELL_FAILED_LOCALPLAYER              = 80;
  CHAT_MSG_COMBAT_HONOR_GAIN                     = 81;
  CHAT_MSG_BG_SYSTEM_NEUTRAL                     = 82;
  CHAT_MSG_BG_SYSTEM_ALLIANCE                    = 83;
  CHAT_MSG_BG_SYSTEM_HORDE                       = 84;
  CHAT_MSG_CHANNEL1                              = 85;
  CHAT_MSG_CHANNEL2                              = 86;
  CHAT_MSG_CHANNEL3                              = 87;
  CHAT_MSG_CHANNEL4                              = 88;
  CHAT_MSG_CHANNEL5                              = 89;
  CHAT_MSG_CHANNEL6                              = 90;
  CHAT_MSG_CHANNEL7                              = 91;
  CHAT_MSG_CHANNEL8                              = 92;
  CHAT_MSG_CHANNEL9                              = 93;
  CHAT_MSG_CHANNEL10                             = 94;
  CHAT_MSG_END                                   = 95;

  // chanell notify type
  CHAT_NOTIFY_JOINED                   = $00;
  CHAT_NOTIFY_LEAVE                    = $01;
  CHAT_NOTIFY_YOU_JOINED               = $02;
  CHAT_NOTIFY_YOU_LEFT                 = $03;
  CHAT_NOTIFY_WRONG_PASS               = $04;
  CHAT_NOTIFY_NOT_ON                   = $05;
  CHAT_NOTIFY_NOT_MODERATOR            = $06;
  CHAT_NOTIFY_SET_PASS                 = $07;
  CHAT_NOTIFY_CHANGE_OWNER             = $08;
  CHAT_NOTIFY_NOT_ON2                  = $09;
  CHAT_NOTIFY_NOT_OWNER                = $0A;
  CHAT_NOTIFY_WHO_OWNER                = $0B;
  CHAT_NOTIFY_MODE_CHANGE              = $0C;
  CHAT_NOTIFY_ENABLE_ANNOUNCE          = $0D;
  CHAT_NOTIFY_DISABLE_ANNOUNCE         = $0E;
  CHAT_NOTIFY_MODERATED                = $0F;
  CHAT_NOTIFY_UNMODERATED              = $10;
  CHAT_NOTIFY_MUTED                    = $11;
  CHAT_NOTIFY_KICKED                   = $12;
  CHAT_NOTIFY_YOU_ARE_BANNED           = $13;
  CHAT_NOTIFY_BANNED                   = $14;
  CHAT_NOTIFY_UNBANNED                 = $15;
  CHAT_NOTIFY_UNK16                    = $16;
  CHAT_NOTIFY_ALREADY_ON               = $17;
  CHAT_NOTIFY_INVITED                  = $18;
  CHAT_NOTIFY_WRONG_ALLIANCE           = $19;
  // ...
  CHAT_NOTIFY_YOU_INVITED              = $1D;

  GENDER_MALE                          = 0;
  GENDER_FEMALE                        = 1;
  GENDER_NONE                          = 2;
  GenderStr: array[0..2] of string = (
  'Male',
  'Female',
  'None'
  );

  RACE_NONE                            = 0;
  RACE_HUMAN                           = 1;
  RACE_ORC                             = 2;
  RACE_DWARF                           = 3;
  RACE_NIGHT_ELF                       = 4;
  RACE_UNDEAD                          = 5;
  RACE_TAUREN                          = 6;
  RACE_GNOME                           = 7;
  RACE_TROLL                           = 8;
  RACE_GOBLIN                          = 9;
  RACE_BLOOD_ELF                       = 10;
  RACE_DRAENEI                         = 11;
  RACE_WORGEN                          = 22;
  RaceStr: array[0..22] of string = (
  'N/A',
  'Human',
  'Orc',
  'Dwarf',
  'Night Elf',
  'Undead',
  'Tauren',
  'Gnome',
  'Troll',
  'Goblin',
  'Blood Elf',
  'Draenei',
  'N/A 12',
  'N/A 13',
  'N/A 14',
  'N/A 15',
  'N/A 16',
  'N/A 17',
  'N/A 18',
  'N/A 19',
  'N/A 20',
  'N/A 21',
  'Worgen'
  );

  CLASS_WARRIOR                        = 1;
  CLASS_PALADIN                        = 2;
  CLASS_HUNTER                         = 3;
  CLASS_ROGUE                          = 4;
  CLASS_PRIEST                         = 5;
  CLASS_DEATHKNIGHT                    = 6;
  CLASS_SHAMAN                         = 7;
  CLASS_MAGE                           = 8;
  CLASS_WARLOCK                        = 9;
  CLASS_UNK10                          = 10;
  CLASS_DRUID                          = 11;
  ClassStr: array[0..11] of string = (
  'N/A',
  'Warrior',
  'Paladin',
  'Hunter',
  'Rogue',
  'Priest',
  'Dark Knight',
  'Shaman',
  'Mage',
  'Warlock',
  'Unk10',
  'Druid'
  );

  // World Server
  // ===========================================================================
  GUID_TYPE_ITEM                       = $1000000000000000;
  GUID_TYPE_CONTAINER                  = $2000000000000000;
  GUID_TYPE_UNIT                       = $3000000000000000;
  GUID_TYPE_PET                        = $3300000000000000;
  GUID_TYPE_GAMEOBJECT                 = $5000000000000000;
  GUID_TYPE_DYNAMICOBJECT              = $6000000000000000;
  GUID_TYPE_CORPSE                     = $7000000000000000;
  GUID_TYPE_PLAYER_CORPSE              = $7700000000000000;
  GUID_TYPE_PLAYER                     = $0000000000000000;
  GUID_TYPE_GROUP                      = $FFFF000000000000;

  WO_ITEM                              = 1;
  WO_CONTAINER                         = 2;
  WO_UNIT                              = 3;
  WO_PLAYER                            = 4;
  WO_GAMEOBJECT                        = 5;
  WO_DYNAMICOBJECT                     = 6;
  WO_CORPSE                            = 7;

  TYPE_OBJECT                          = 1;
  TYPE_ITEM                            = 2;
  TYPE_CONTAINER                       = 4 + TYPE_ITEM;
  TYPE_UNIT                            = 8;
  TYPE_PLAYER                          = 16;
  TYPE_GAMEOBJECT                      = 32;
  TYPE_DYNAMICOBJECT                   = 64;
  TYPE_CORPSE                          = 128;
  TYPE_AIGROUP                         = 256;
  TYPE_AREATRIGGER                     = 512;

  POWER_MANA                           = 0;
  POWER_RAGE                           = 1;
  POWER_FOCUS                          = 2;
  POWER_ENERGY                         = 3;
  POWER_HAPPINESS                      = 4;
  POWER_RUNES                          = 5;
  POWER_RUNIC                          = 6;
  PowerStr: array[0..6] of string = (
  'Mana',
  'Rage',
  'Focus',
  'Energy',
  'Happiness',
  'Runes',
  'Runic'
  );

  STAT_STRENGTH                        = 0;
  STAT_AGILITY                         = 1;
  STAT_STAMINA                         = 2;
  STAT_INTELLECT                       = 3;
  STAT_SPIRIT                          = 4;
  STAT_MAX                             = 4;
  StatStr: array[0..4] of string = (
  'Strength',
  'Agility',
  'Stamina',
  'Intellect',
  'Spirit'
  );

  RESISTANCE_MAX                       = 6;

  UNIT_NPC_FLAG_NONE                   = 0;
  UNIT_NPC_FLAG_GOSSIP                 = 1;
  UNIT_NPC_FLAG_QUESTGIVER             = 2;
  UNIT_NPC_FLAG_VENDOR                 = 4;
  UNIT_NPC_FLAG_TAXIVENDOR             = 8;
  UNIT_NPC_FLAG_TRAINER                = 16;
  UNIT_NPC_FLAG_SPIRITHEALER           = 32;
  UNIT_NPC_FLAG_GUARD                  = 64;
  UNIT_NPC_FLAG_INNKEEPER              = 128;
  UNIT_NPC_FLAG_BANKER                 = 256;
  UNIT_NPC_FLAG_PETITIONER             = 512;
  UNIT_NPC_FLAG_TABARDVENDOR           = 1024;
  UNIT_NPC_FLAG_BATTLEFIELDPERSON      = 2048;
  UNIT_NPC_FLAG_AUCTIONEER             = 4096;
  UNIT_NPC_FLAG_STABLE                 = 8192;
  UNIT_NPC_FLAG_ARMORER                = 16384;

  GOSSIP_ACTION_GOSSIP                 = $00;
  GOSSIP_ACTION_VENDOR                 = $01;
  GOSSIP_ACTION_TAXI                   = $02;
  GOSSIP_ACTION_TRAINER                = $03;
  GOSSIP_ACTION_HEALER                 = $04;
  GOSSIP_ACTION_INNKEEPER              = $05;
  GOSSIP_ACTION_BANKER                 = $06;
  GOSSIP_ACTION_PETITION               = $07;
  GOSSIP_ACTION_TABARD                 = $08;
  GOSSIP_ACTION_BATTLEMASTER           = $09;
  GOSSIP_ACTION_AUCTIONER              = $0A;
  GOSSIP_ACTION_GOSSIP2                = $0B;
  GOSSIP_ACTION_GOSSIP3                = $0C;

  SPELL_TARGET_FLAG_SELF               = $0000;
  SPELL_TARGET_FLAG_UNIT               = $0002;
  SPELL_TARGET_FLAG_ITEM               = $0010;
  SPELL_TARGET_FLAG_SOURCE_LOCATION    = $0020;
  SPELL_TARGET_FLAG_DEST_LOCATION      = $0040;
  SPELL_TARGET_FLAG_PVP_CORPSE         = $0200;
  SPELL_TARGET_FLAG_OBJECT             = $0800;
  SPELL_TARGET_FLAG_TRADE_ITEM         = $1000;
  SPELL_TARGET_FLAG_STRING             = $2000;
  SPELL_TARGET_FLAG_UNKNOWN            = $4000;
  SPELL_TARGET_FLAG_CORPSE             = $8000;

  // Inventory
  INVTYPE_NON_EQUIP                    = 0;
  INVTYPE_HEAD                         = 1;
  INVTYPE_NECK                         = 2;
  INVTYPE_SHOULDERS                    = 3;
  INVTYPE_BODY                         = 4; // cloth robes only
  INVTYPE_CHEST                        = 5;
  INVTYPE_WAIST                        = 6;
  INVTYPE_LEGS                         = 7;
  INVTYPE_FEET                         = 8;
  INVTYPE_WRISTS                       = 9;
  INVTYPE_HANDS                        = 10;
  INVTYPE_FINGER                       = 11;
  INVTYPE_TRINKET                      = 12;
  INVTYPE_WEAPON                       = 13;
  INVTYPE_SHIELD                       = 14;
  INVTYPE_RANGED                       = 15;
  INVTYPE_CLOAK                        = 16;
  INVTYPE_TWOHAND_WEAPON               = 17;
  INVTYPE_BAG                          = 18;
  INVTYPE_TABARD                       = 19;
  INVTYPE_ROBE                         = 20;
  INVTYPE_WEAPONMAINHAND               = 21;
  INVTYPE_WEAPONOFFHAND                = 22;
  INVTYPE_HOLDABLE                     = 23;
  INVTYPE_AMMO                         = 24;
  INVTYPE_THROWN                       = 25;
  INVTYPE_RANGEDRIGHT                  = 26;
  INVTYPE_QUIVER                       = 27;
  INVTYPE_RELIC                        = 28;

  EQUIPMENT_SLOT_HEAD                  = 0;
  EQUIPMENT_SLOT_NECK                  = 1;
  EQUIPMENT_SLOT_SHOULDERS             = 2;
  EQUIPMENT_SLOT_BODY                  = 3;
  EQUIPMENT_SLOT_CHEST                 = 4;
  EQUIPMENT_SLOT_WAIST                 = 5;
  EQUIPMENT_SLOT_LEGS                  = 6;
  EQUIPMENT_SLOT_FEET                  = 7;
  EQUIPMENT_SLOT_WRISTS                = 8;
  EQUIPMENT_SLOT_HANDS                 = 9;
  EQUIPMENT_SLOT_FINGER1               = 10;
  EQUIPMENT_SLOT_FINGER2               = 11;
  EQUIPMENT_SLOT_TRINKET1              = 12;
  EQUIPMENT_SLOT_TRINKET2              = 13;
  EQUIPMENT_SLOT_BACK                  = 14;
  EQUIPMENT_SLOT_MAINHAND              = 15;
  EQUIPMENT_SLOT_OFFHAND               = 16;
  EQUIPMENT_SLOT_RANGED                = 17;
  EQUIPMENT_SLOT_TABARD                = 18;

  EQUIP_SLOT_TYPE: array [EQUIPMENT_SLOT_HEAD..EQUIPMENT_SLOT_TABARD] of set of byte = (
    [INVTYPE_HEAD],                                                         // 0:  EQUIPMENT_SLOT_HEAD
    [INVTYPE_NECK],                                                         // 1:  EQUIPMENT_SLOT_NECK
    [INVTYPE_SHOULDERS],                                                    // 2:  EQUIPMENT_SLOT_SHOULDERS
    [INVTYPE_BODY],                                                         // 3:  EQUIPMENT_SLOT_BODY
    [INVTYPE_CHEST,INVTYPE_ROBE],                                           // 4:  EQUIPMENT_SLOT_CHEST
    [INVTYPE_WAIST],                                                        // 5:  EQUIPMENT_SLOT_WAIST
    [INVTYPE_LEGS],                                                         // 6:  EQUIPMENT_SLOT_LEGS
    [INVTYPE_FEET],                                                         // 7:  EQUIPMENT_SLOT_FEET
    [INVTYPE_WRISTS],                                                       // 8:  EQUIPMENT_SLOT_WRISTS
    [INVTYPE_HANDS],                                                        // 9:  EQUIPMENT_SLOT_HANDS
    [INVTYPE_FINGER],                                                       // 10: EQUIPMENT_SLOT_FINGER1
    [INVTYPE_FINGER],                                                       // 11: EQUIPMENT_SLOT_FINGER2
    [INVTYPE_TRINKET],                                                      // 12: EQUIPMENT_SLOT_TRINKET1
    [INVTYPE_TRINKET],                                                      // 13: EQUIPMENT_SLOT_TRINKET2
    [INVTYPE_CLOAK],                                                        // 14: EQUIPMENT_SLOT_BACK
    [INVTYPE_WEAPON,INVTYPE_TWOHAND_WEAPON,INVTYPE_WEAPONMAINHAND],         // 15: EQUIPMENT_SLOT_MAINHAND
    [INVTYPE_WEAPON,INVTYPE_SHIELD,INVTYPE_WEAPONOFFHAND,INVTYPE_HOLDABLE], // 16: EQUIPMENT_SLOT_OFFHAND
    [INVTYPE_RANGED,INVTYPE_AMMO,INVTYPE_THROWN,INVTYPE_RANGEDRIGHT],       // 17: EQUIPMENT_SLOT_RANGED
    [INVTYPE_TABARD]                                                        // 18: EQUIPMENT_SLOT_TABARD
  );

  MaxContainerSlot                     = 40;
  MaxInventorySlot                     = 113;

  InventoryEquipSlotsCount             = 19;
  InventoryBagSlotsCount               = 4;
  InventoryPackSlotsCount              = 16; // (PLAYER_FIELD_BANK_SLOT_1 - PLAYER_FIELD_PACK_SLOT_1) div 2
  InventoryBankSlotsCount              = 24; // (PLAYER_FIELD_BANKBAG_SLOT_1 - PLAYER_FIELD_BANK_SLOT_1) div 2
  InventoryBankBagSlotsCount           = 6;  // (PLAYER_FIELD_VENDORBUYBACK_SLOT_1 - PLAYER_FIELD_BANKBAG_SLOT_1) div 2
  InventoryVendorBuyBackSlotsCount     = 12; // (PLAYER_FIELD_KEYRING_SLOT_1 - PLAYER_FIELD_VENDORBUYBACK_SLOT_1) div 2
  InventoryKeyRingSlotsCount           = 32; // (PLAYER_FARSIGHT - PLAYER_FIELD_KEYRING_SLOT_1) div 2

  InventoryEquipSlotStart              = 0;
  InventoryBagSlotStart                = InventoryEquipSlotStart         +InventoryEquipSlotsCount;
  InventoryPackSlotStart               = InventoryBagSlotStart           +InventoryBagSlotsCount;
  InventoryBankSlotStart               = InventoryPackSlotStart          +InventoryPackSlotsCount;
  InventoryBankBagSlotStart            = InventoryBankSlotStart          +InventoryBankSlotsCount;
  InventoryVendorBuyBackSlotStart      = InventoryBankBagSlotStart       +InventoryBankBagSlotsCount;
  InventoryKeyRingSlot                 = InventoryVendorBuyBackSlotStart +InventoryVendorBuyBackSlotsCount;

  EQUIP_ERR_OK                                   = 0;
  EQUIP_ERR_YOU_MUST_REACH_LEVEL_N               = 1;
  EQUIP_ERR_SKILL_ISNT_ENOUGH_TO_USE_ITEM        = 2;
  EQUIP_ERR_ITEM_DOESNT_GO_TO_SLOT               = 3;
  EQUIP_ERR_BAG_FULL                             = 4;
  EQUIP_ERR_PUT_NONEMPTY_BAG_TO_OTHER_BAG        = 5;
  EQUIP_ERR_CANT_TRADE_EQUIPPED_BAGS             = 6;
  EQUIP_ERR_ONLY_AMMO_CAN_GO_HERE                = 7;
  EQUIP_ERR_NO_REQUIRED_PROFICIENCY              = 8;
  EQUIP_ERR_NO_EQUIPMENT_SLOT_AVAILABLE          = 9;
  EQUIP_ERR_YOU_CAN_NEVER_USE_THAT_ITEM          = 10;
  EQUIP_ERR_YOU_CAN_NEVER_USE_THAT_ITEM2         = 11;
  EQUIP_ERR_NO_EQUIPMENT_SLOTS_IS_AVAILABLE      = 12;
  EQUIP_ERR_CANT_EQUIP_WITH_TWO_HANDED           = 13;
  EQUIP_ERR_CANT_DUAL_WIELD_YET                  = 14;
  EQUIP_ERR_ITEM_DOESNT_GO_INTO_BAG              = 15;
  EQUIP_ERR_ITEM_DOESNT_GO_INTO_BAG2             = 16;
  EQUIP_ERR_CANT_CARRY_MORE_OF_THIS              = 17;
  EQUIP_ERR_NO_EQUIPMENT_SLOT_AVAILABLE2         = 18;
  EQUIP_ERR_ITEM_CANT_STACK                      = 19;
  EQUIP_ERR_ITEM_CANT_BE_EQUIPPED                = 20;
  EQUIP_ERR_ITEMS_CANT_BE_SWAPPED                = 21;
  EQUIP_ERR_SLOT_IS_EMPTY                        = 22;
  EQUIP_ERR_ITEM_NOT_FOUND                       = 23;
  EQUIP_ERR_CANT_DROP_SOULBOUND                  = 24;
  EQUIP_ERR_OUT_OF_RANGE                         = 25;
  EQUIP_ERR_TRIED_TO_SPLIT_MORE_THAN_COUNT       = 26;
  EQUIP_ERR_COULDNT_SPLIT_ITEMS                  = 27;
  EQUIP_ERR_BAG_FULL2                            = 28;
  EQUIP_ERR_NOT_ENOUGH_MONEY                     = 29;
  EQUIP_ERR_NOT_A_BAG                            = 30;
  EQUIP_ERR_CAN_ONLY_DO_WITH_EMPTY_BAGS          = 31;
  EQUIP_ERR_DONT_OWN_THAT_ITEM                   = 32;
  EQUIP_ERR_CAN_EQUIP_ONLY1_QUIVER               = 33;
  EQUIP_ERR_MUST_PURCHASE_THAT_BAG_SLOT          = 34;
  EQUIP_ERR_TOO_FAR_AWAY_FROM_BANK               = 35;
  EQUIP_ERR_ITEM_LOCKED                          = 36;
  EQUIP_ERR_YOU_ARE_STUNNED                      = 37;
  EQUIP_ERR_YOU_ARE_DEAD                         = 38;
  EQUIP_ERR_CANT_DO_RIGHT_NOW                    = 39;
  EQUIP_ERR_BAG_FULL3                            = 40;
  EQUIP_ERR_CAN_EQUIP_ONLY1_QUIVER2              = 41;
  EQUIP_ERR_CAN_EQUIP_ONLY1_AMMO_POUCH           = 42;
  EQUIP_ERR_STACKABLE_CANT_BE_WRAPPED            = 43;
  EQUIP_ERR_EQUIPPED_CANT_BE_WRAPPED             = 44;
  EQUIP_ERR_WRAPPED_CANT_BE_WRAPPED              = 45;
  EQUIP_ERR_BOUND_CANT_BE_WRAPPED                = 46;
  EQUIP_ERR_UNIQUE_CANT_BE_WRAPPED               = 47;
  EQUIP_ERR_BAGS_CANT_BE_WRAPPED                 = 48;
  EQUIP_ERR_ALREADY_LOOTED                       = 49;
  EQUIP_ERR_INVENTORY_FULL                       = 50;
  EQUIP_ERR_BANK_FULL                            = 51;
  EQUIP_ERR_ITEM_IS_CURRENTLY_SOLD_OUT           = 52;
  EQUIP_ERR_BAG_FULL4                            = 53;
  EQUIP_ERR_ITEM_NOT_FOUND2                      = 54;
  EQUIP_ERR_ITEM_CANT_STACK2                     = 55;
  EQUIP_ERR_BAG_FULL5                            = 56;
  EQUIP_ERR_ITEM_SOLD_OUT                        = 57;
  EQUIP_ERR_OBJECT_IS_BUSY                       = 58;
  EQUIP_ERR_NONE                                 = 59;
  EQUIP_ERR_CANT_DO_IN_COMBAT                    = 60;
  EQUIP_ERR_CANT_DO_WHILE_DISARMED               = 61;
  EQUIP_ERR_NONE2                                = 62;
  EQUIP_ERR_ITEM_RANK_NOT_ENOUGH                 = 63;
  EQUIP_ERR_ITEM_REPUTATION_NOT_ENOUGH           = 64;
  EQUIP_ERR_CANT_EQUIP_ANOTHER_BAG_OF_THAT_TYPE  = 65;
  EQUIP_ERR_CANT_LOOT                            = 66;

  ITEM_PUSH_FROM_LOOT                  = 0;
  ITEM_PUSH_FROM_ITEM                  = 1;
  ITEM_PUSH_TYPE_RECEIVE               = 0;
  ITEM_PUSH_TYPE_CREATE                = 1;
  ITEM_PUSH_DISPLAY_OFF                = 0;
  ITEM_PUSH_DISPLAY_ON                 = 1;

implementation

end.
