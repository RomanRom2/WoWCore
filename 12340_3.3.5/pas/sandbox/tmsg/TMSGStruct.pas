unit TMSGStruct;

interface

const
  ENUM_CHARS_COUNT                     = 10;
  ENUM_PLAYER_BAGS_COUNT               = 4;  // 3.3.3
  ENUM_PLAYER_ITEMS_COUNT              = 19; // 3.3.3: 20->19

  PLAYER_TUTORIALS_COUNT               = 64;
  PLAYER_SKILLS_COUNT                  = 128;
  PLAYER_SPELLS_COUNT                  = 100;
  PLAYER_ACTION_BUTTONS_COUNT          = 120;
  PLAYER_REPUTATIONS_COUNT             = 128;
  PLAYER_VISIBLE_ITEMS_COUNT           = 19;

  ITEM_NAMES                           = 4;
  CREATURE_NAMES                       = 4;
  CREATURE_MODELS                      = 4;
  GAMEOBJECT_NAMES                     = 7;
  GAMEOBJECT_PARAMS                    = 24;
  GAMEOBJECT_ITEMS                     = 6;

  GOSSIP_MENU_COUNT                    = 12;

  // MOVE FLAGS
  MOVEFLAG_NONE                        = $00000000;
  MOVEFLAG_FORWARD                     = $00000001;
  MOVEFLAG_BACKWARD                    = $00000002;
  MOVEFLAG_MOVE_MASK                   = $00000003;
  MOVEFLAG_STRAFE_LEFT                 = $00000004;
  MOVEFLAG_STRAFE_RIGHT                = $00000008;
  MOVEFLAG_STRAFE_MASK                 = $0000000C;
  MOVEFLAG_LEFT                        = $00000010;
  MOVEFLAG_RIGHT                       = $00000020;
  MOVEFLAG_TURN_MASK                   = $00000030;
  MOVEFLAG_PITCH_UP                    = $00000040;
  MOVEFLAG_PITCH_DOWN                  = $00000080;
  MOVEFLAG_PITCH_MASK                  = $000000C0;
  MOVEFLAG_MOTION_MASK                 = $000000FF;
  MOVEFLAG_WALK                        = $00000100;
  MOVEFLAG_ON_TRANSPORT                = $00000200;
  MOVEFLAG_LEVITATING                  = $00000400;
//  MOVEFLAG_ROOT                        = $00000800; // unapproved
  MOVEFLAG_FALLING                     = $00001000;
  MOVEFLAG_FALLEN_FAR                  = $00002000;
  MOVEFLAG_SWIMMING                    = $00200000;
  MOVEFLAG_ASCENDING                   = $00400000;
  MOVEFLAG_DESCENDING                  = $00800000;
  MOVEFLAG_CAN_FLY                     = $01000000;
  MOVEFLAG_FLYING                      = $02000000;
  MOVEFLAG_FALL_START_ELEVATION        = $04000000;
//  MOVEFLAG_SPLINE_ENABLED              = $08000000; // unapproved
  MOVEFLAG_WATERWALKING                = $10000000;
//  MOVEFLAG_SAFE_FALLING                = $20000000; // unapproved
//  MOVEFLAG_HOVER                       = $40000000; // unapproved

  ACCOUNT_DATA_TYPE_CONFIG             = 0;
  ACCOUNT_DATA_TYPE_CONFIG_2           = 1;
  ACCOUNT_DATA_TYPE_BINDINGS           = 2;
  ACCOUNT_DATA_TYPE_UNK4               = 3;
  ACCOUNT_DATA_TYPE_MACROS             = 4;
  ACCOUNT_DATA_TYPE_UNK6               = 5;
  ACCOUNT_DATA_TYPE_UNK7               = 6;
  ACCOUNT_DATA_TYPE_COLORS             = 7;
  ACCOUNT_DATA_TYPE_MAX                = 32;

  ACCOUNT_DATA_MASK_CONFIG             = 1 shl ACCOUNT_DATA_TYPE_CONFIG;   // $00000001;
  ACCOUNT_DATA_MASK_CONFIG_2           = 1 shl ACCOUNT_DATA_TYPE_CONFIG_2; // $00000002;
  ACCOUNT_DATA_MASK_BINDINGS           = 1 shl ACCOUNT_DATA_TYPE_BINDINGS; // $00000004;
  ACCOUNT_DATA_MASK_UNK4               = 1 shl ACCOUNT_DATA_TYPE_UNK4;     // $00000008;
  ACCOUNT_DATA_MASK_MACROS             = 1 shl ACCOUNT_DATA_TYPE_MACROS;   // $00000010;
  ACCOUNT_DATA_MASK_UNK6               = 1 shl ACCOUNT_DATA_TYPE_UNK6;     // $00000020;
  ACCOUNT_DATA_MASK_UNK7               = 1 shl ACCOUNT_DATA_TYPE_UNK7;     // $00000040;
  ACCOUNT_DATA_MASK_COLORS             = 1 shl ACCOUNT_DATA_TYPE_COLORS;   // $00000080;

// common types
////////////////////////////////////////////////////////////////////////////////
type
  C2Vector = record
    x,y: single;
  end;
  C3Vector = record
    x,y,z: single;
  end;
  C4Vector = record
    x,y,z,w: single;
  end;
  C4Quaternion = C4Vector;

// CharServer types
////////////////////////////////////////////////////////////////////////////////
type
// AUTH
// -----------------------------------------------------------------------------
  T_SMSG_AUTH_CHALLENGE = record
     unk: longint; // 3.2.2 [1..31]
     ServerSeed: longint;
     Random1: longint; // 3.2.2
     Random2: longint; // 3.2.2
     Random3: longint; // 3.2.2
     Random4: longint; // 3.2.2
     Random5: longint; // 3.3.3
     Random6: longint; // 3.3.3
     Random7: longint; // 3.3.3
     Random8: longint; // 3.3.3
  end;

  T_CMSG_AUTH_SESSION = record
    Build: longint;
    ServerID: longint;
    Login: string;
    Unk2: longint;
    ClientSeed: longint;
    Unk5: longint; // 3.3.5
    Unk6: longint; // 3.3.5
    Unk7: longint; // 3.3.5
    Unk3: longint; // 3.2.2
    Unk4: longint; // 3.2.2
    Digest: array[0..19] of byte; // 20 bytes length for SHA1
    zipLen: longint;
    zipData: array[0..2047] of byte; // array[0..65535] of byte;
  end;

  T_SMSG_AUTH_RESPONSE = record
    ResponseCode: byte;
    Unk1: longint; // BillingTimeRemaining
    Unk2: byte;    // BillingPlanFlags
    Unk3: longint; // BillingTimeRested
    GameType: byte;
  end;

  T_CMSG_PING = record
    Count: longint;
    Ping: longint;
  end;

  T_SMSG_PONG = record
    Count: longint;
  end;

  T_SMSG_LOGOUT_COMPLETE = record
  end;

// CHAR LIST
// -----------------------------------------------------------------------------
  TCharEnumInfoItem = record
    entry: longint;
    displayID: longint;
    inventoryType: longint;
    auraID: longint;
  end;
  TCharEnumInfo = record
    GUID: uInt64;
    name: string;
    raceID: byte;
    classID: byte;
    sexID: byte;
    skinID: byte;
    faceID: byte;
    hairStyleID: byte;
    hairColorID: byte;
    facialHairStyleID: byte;
    outfitID: byte;
    experienceLevel: byte;
    zoneID: longint;
    mapID: longint;
    position: C3Vector;
    guildID: longint;
    flags: longint;
    flags2: longint; // 3.0.1 (8471_0.4.3)
    restInfo: byte;
    petDisplayInfoID: longint;
    petExperienceLevel: longint;
    petCreatureFamilyID: longint;
    inventory: array[0..ENUM_PLAYER_BAGS_COUNT-1, 0..ENUM_PLAYER_ITEMS_COUNT-1] of TCharEnumInfoItem;
  end;
  T_SMSG_CHAR_ENUM = record
    Count: byte;
    Enum: array[0..ENUM_CHARS_COUNT-1] of TCharEnumInfo;
  end;

  T_CMSG_CHAR_CREATE = record
    name: string;
    raceID: byte;
    classID: byte;
    sexID: byte;
    skinID: byte;
    faceID: byte;
    hairStyleID: byte;
    hairColorID: byte;
    facialHairStyleID: byte;
    outfitID: byte;
  end;

  T_SMSG_CHAR_CREATE = record
    ResponseCode: byte;
  end;

  T_CMSG_CHAR_DELETE = record
    CharGUID: uInt64;
  end;

  T_SMSG_CHAR_DELETE = record
    ResponseCode: byte;
  end;

// RESPONSES
// -----------------------------------------------------------------------------
  T_CMSG_ITEM_QUERY_SINGLE = record
    Entry: longint;
  end;

  TItemBonus = record
    StatID: longint;
    StatCount: longint;
  end;
  TItemDamageStat = record
    Min: single;
    Max: single;
    TypeID: longint;
  end;
  TSpellStat = record
    SpellID: longint;
    TriggerSpellID: longint;
    Charges: longint;
    Cooldown: longint;
    Category: longint;
    CategoryCooldown: longint;
  end;
  TItemSocket = record
    ID: longint;
    Unk: longint;
  end;
  T_SMSG_ITEM_QUERY_SINGLE_RESPONSE = record
    Entry: longint;

    ClassID: longint;
    SubClassID: longint;
    Unk1: longint; // 2.0.3
    Name: array[0..ITEM_NAMES-1] of string;
    DisplayInfoID: longint;
    OverallQualityID: longint;
    Flags: longint;
    Faction: longint; // 3.2.0
    BuyPrice: longint;
    SellPrice: longint;
    InventoryTypeID: longint;
    AllowableClassID: longint;
    AllowableRaceID: longint;
    Level: longint;
    RequiredLevel: longint;
    RequiredSkill: longint;
    RequiredSkillRank: longint;
    RequiredSpell: longint;
    RequiredHonorRank: longint;
    RequiredCityRank: longint;
    RequiredReputationFaction: longint;
    RequiredReputationRank: longint;
    Stackable: longint;
    MaxStackCount: longint;
    ContainerSlots: longint;
    BonusCount: longint; // 3.0.1 - max 10
    Bonus: array[0..9] of TItemBonus;
    StatScalingDistribution: longint; // 3.0.1
    StatScalingValue: longint; // 3.0.1
    DamageStat: array[0..4] of TItemDamageStat;
    Resistance: array[0..6] of longint;
    Delay: longint;
    AmmoType: longint;
    ModRanged: single; // 1.10.0
    SpellStat: array[0..4] of TSpellStat;
    Bonding: longint;
    Description: string;
    PageTextID: longint;
    PageLanguageID: longint;
    PageMaterial: longint;
    StartQuestID: longint;
    LockID: longint;
    LockMaterial: longint;
    Sheath: longint;
    Extra: longint;
    Suffix: longint; // 2.0.3
    Block: longint;
    SetID: longint;
    MaxDurability: longint;
    Area: longint;
    Map: longint;
    BagFamily: longint; // 1.11.0
    ToolID: longint; // BC 2.0.3
    Socket: array[0..2] of TItemSocket; // BC 2.0.3
    SocketBonus: longint; // BC 2.0.3
    GemProperties: longint; // BC 2.0.3
//    ExtendedCost: longint; // BC 2.0.3, removed in 2.4.0 PTR
//    ReqArenaRank: longint; // BC 2.0.3, removed in 2.4.0 PTR
    RequiredDisenchantSkill: longint; // BC
    ArmorDamageModifier: single; // BC 2.1.x
    Duration: longint; // BC 2.1.x
    LimitCategory: longint; // 3.0.1
    HolidayID: longint; // 3.1.0
  end;

  T_CMSG_CREATURE_QUERY = record
    Entry: longint;
    GUID: uInt64;
  end;

  T_SMSG_CREATURE_QUERY_RESPONSE = record
    Entry: longint;
    Name: array[0..CREATURE_NAMES-1] of string;
    GuildName: string;
    AssistName: string; // BC 2.3.0
    Flags: longint;
    TypeID: longint;
    Family: longint;
    Rank: longint;
    Unk1: longint; // removed in 3.0.1-3.0.9, back in 3.1.0
    SpellDataID: longint;
    DisplayID: array[0..CREATURE_MODELS-1] of longint; // BC 2.2.0
    Unk3: single; // BC 2.0.3
    Unk4: single; // BC 2.0.3
    Civilian: byte; // BC 2.3.0: word->bytes
    Unk5_1: longint; // 3.1.0
    Unk5_2: longint; // 3.1.0
    Unk5_3: longint; // 3.1.0
    Unk5_4: longint; // 3.1.0
    Unk6: longint; // 3.1.0
    Unk7: longint; // 3.2.0
    Unk8: longint; // 3.2.0

    GossipID: longint;
    Greetings: string;
    EmoteID: longint;
    EmoteDelay: longint;
  end;

  T_CMSG_GAMEOBJECT_QUERY = record
    Entry: longint;
    GUID: uInt64;
  end;

  T_SMSG_GAMEOBJECT_QUERY_RESPONSE = record
    Entry: longint;
    TypeID: longint;
    DisplayID: longint;
    Name: array[0..GAMEOBJECT_NAMES-1] of string; // 1.12.0: +1, BC: +2
    Param: array[0..GAMEOBJECT_PARAMS-1] of longint; // 1.12.0: +8
    ParamFloat: single;
    Item: array[0..GAMEOBJECT_ITEMS-1] of longint; // 3.1.0
  end;

  T_CMSG_NPC_TEXT_QUERY = record
    Entry: longint;
    GUID: uInt64;
  end;

  TNPCTextEmoteTPL = record
    Delay: longint;
    Emote: longint;
  end;
  NPCTextItemTPL = record
    Probability: single;
    Text0: string;
    Text1: string;
    Language: longint;
    Emote: array[0..2] of TNPCTextEmoteTPL;
  end;
  T_SMSG_NPC_TEXT_UPDATE = record
    Entry: longint;
    NPCText: array[0..7] of NPCTextItemTPL;
  end;

// CHANNEL + CHAT
// -----------------------------------------------------------------------------
  T_CMSG_JOIN_CHANNEL = record
    CategoryID: longint;
    TypeID: byte;
    VoiceEnabled: byte;
    Name: string;
    VoiceName: string;
  end;

  T_SMSG_CHANNEL_NOTIFY = record
    TypeID: byte;
    Name: string;
    VoiceID: byte; // 3.0.1
    CategoryID: longint;
  end;

  T_CMSG_MESSAGECHAT = record
    TypeID: longint;
    LangID: longint;
    ChannelName: string;
    WhisperName: string;
    Text: string;
  end;

  T_CMSG_ZONEUPDATE = record
    AreaID: longint;
  end;

  T_SMSG_EXPLORATION_EXPERIENCE = record
    AreaID: longint;
    XP: longint;
  end;

// WorldServer types
////////////////////////////////////////////////////////////////////////////////
  T_CMSG_PLAYER_LOGIN = record
    GUID: uInt64;
  end;

  T_CMSG_DESTROYITEM = record
    Bag: byte;
    Slot: byte;
    Count: longint;
  end;

  T_SMSG_CHARACTER_LOGIN_FAILED = record
    ResponseCode: byte;
  end;

  T_SMSG_ACCOUNT_DATA_TIMES = record
    AccountData_CurrentUnixDateTime: longint;
    AccountData_BitMaskCount: byte;
    AccountData_BitMask: longint;
    AccountData_UnixDateTime: array[0..ACCOUNT_DATA_TYPE_MAX-1] of longint;
  end;

  T_CMSG_REQUEST_ACCOUNT_DATA = record
    AccountData_Type: longint;
    AccountData_UnixDateTime: longint;
    zipLen: longint;
    zipData: array[0..1024*16] of byte;
  end;

  T_CMSG_UPDATE_ACCOUNT_DATA = record
    AccountData_Type: longint;
    AccountData_UnixDateTime: longint;
    zipLen: longint;
    zipData: array[0..1024*16] of byte;
  end;

  T_SMSG_UPDATE_ACCOUNT_DATA = record
    GUID: uInt64; // 3.x
    AccountData_Type: longint;
    AccountData_UnixDateTime: longint;
    zipLen: longint;
    zipData: array[0..1024*16] of byte;
  end;

  T_SMSG_UPDATE_ACCOUNT_DATA_COMPLETE = record
    AccountData_Type: longint;
    AccountData_Unk: longint; // UnixDateTime?
  end;

  T_SMSG_TUTORIAL_FLAGS = record
    tmp: array[0..PLAYER_TUTORIALS_COUNT-1] of byte;
  end;

  TInitialSpellsRecord = record
    ID: longint; // 3.2.0: word->long
    Flags: word;
  end;
  TInitialCooldownsRecord = record
  end;
  T_SMSG_INITIAL_SPELLS = record
    sexID: byte;
    SpellCount: word;
    Spell: array of TInitialSpellsRecord;
    CooldownCount: word;
    Cooldown: array of TInitialCooldownsRecord;
  end;

  TActionButtonRecord = record
    SpellID: longword;
    Flags: longword;
  end;
  T_SMSG_ACTION_BUTTONS = record
    Unk: byte; // 3.2.0
    Button: array[0..PLAYER_ACTION_BUTTONS_COUNT-1] of TActionButtonRecord;
  end;

  T_SMSG_LOGIN_SETTIMESPEED = record
    DateTimeVal: longint;
    DateTimeMod: single;
    Unk: longint; // 3.2.2
  end;

  T_SMSG_FORCE_RUN_SPEED_CHANGE = record
    GUID: uInt64;
    Count: longint;
    unk: byte; // BC 2.1.0
    Value: single;
  end;

  T_SMSG_FORCE_SWIM_SPEED_CHANGE = record
    GUID: uInt64;
    Count: longint;
    Value: single;
  end;

  T_SMSG_FORCE_FLIGHT_SPEED_CHANGE = record
    GUID: uInt64;
    Count: longint;
    Value: single;
  end;

  T_SMSG_ATTACKSTART = record
    AttackerGUID: uInt64;
    TargetGUID: uInt64;
  end;

  T_SMSG_ATTACKSTOP = record
    AttackerGUID: uInt64;
    TargetGUID: uInt64;
    Following: longint;
  end;

  T_SMSG_TRANSFER_PENDING = record
    WorldID: longint;
  end;

  T_SMSG_NEW_WORLD = record
    MapID: longint;
    Position: C3Vector;
    Facing: single;
  end;

  T_MSG_MOVE_TELEPORT_ACK = record
    GUID: uInt64;
    MoveCount: longint;
    MoveFlags: longint;
    MoveFlags2: word; // BC 2.3.0; 3.0.1: byte->word
    MoveStartTime: longint;
    Position: C3Vector;
    Facing: single;
    Unk: longint;
  end;

  T_SMSG_MESSAGECHAT = record
    TypeID: byte;
    LangID: longint;
    OriginatorGUID: uInt64;
    TargetName: string;
    Text: string;
  end;

  T_CMSG_CAST_SPELL = record
    SpellCastCount: byte; // 3.0.1
    SpellID: longint;
    Unk: byte; // 2.3.0
    TargetFlags: longint; // 2.4.0: word->long
    TargetGUID: uInt64;
    TargetPosition: C3Vector;
  end;

  T_SMSG_SPELL_START = record
    CasterGUID: uInt64;
    CasterLinkedGUID: uInt64;
    SpellID: longint;
    SpellCastCount: byte; // 3.0.1
    CastFlags: longint; // 3.0.1: word->long
    Duration: longint;
    TargetFlags: longint; // 3.0.1: word->long
    TargetGUID: uInt64;
    TargetPosition: C3Vector;
  end;

  T_SMSG_SPELL_GO = record
    CasterGUID: uInt64;
    CasterLinkedGUID: uInt64;
    SpellCastCount: byte; // 3.0.1
    SpellID: longint;
    CastFlags: longint; // 3.0.1: word->long
    CastStartTime: longint; // BC 2.4.0
    AffectedTarget: array of uInt64;
    ResistedTarget: array of uInt64;
    TargetFlags: longint; // 3.0.1: word->long
    TargetGUID: uInt64;
    TargetPosition: C3Vector;
  end;

  T_SMSG_DESTROY_OBJECT = record
    GUID: uInt64;
  end;

  TTransportInfo = record
    GUID: uInt64;
    Position: C3Vector;
    Facing: single;
    Timestamp: longint; // 3.0.1
  end;
  TSplineFaceData = record
    spot: C3Vector;
    guid: longword;
    facing: single;
  end;
  C3Point = record
    IsPathPoint: boolean;
    Position: C3Vector;
  end;
  C3Spline_CatmullRom = record
    cachedLength: single;
    points: array of C3Point;
    cachedSegLength: array of single;
    splineMode: byte; // MODE_LINEAR = 0, MODE_CATMULLROM = 1
  end;
  TMoveSpline = record
    flags: longword;
    face: TSplineFaceData;
    start: longword;
    current: longword;
    duration: longword;
    spline: C3Spline_CatmullRom;
  end;
  TMovementInfo = record
    m_lastNetMsgID: longword;
    m_guid: longword;
    m_position: C3Vector;
    m_prev_position: C3Vector;
    m_facing: single;
    m_pitch: single;
    m_moveFlags: longword;
    m_moveFlags2: word; // 3.0.1: byte->word
    m_prev_moveFlags: longword;
    m_moveStartTime: longword;
    m_cosAnchorPitch: single;
    m_sinAnchorPitch: single;
    m_fallenTime: longword;
    m_fallStartElevation: single;
    m_currentSpeed: single;
    m_walkSpeed: single;
    m_runSpeed: single;
    m_runBackSpeed: single;
    m_swimSpeed: single;
    m_swimBackSpeed: single;
    m_turnRate: single;
    m_jumpVelocity: single;
    m_spline: TMoveSpline;
    Transport: TTransportInfo;
    m_timeSkipped: longword;
  end;
  T_MSG_MOVE_STATE = record
    GUID: uInt64;
    MovementInfo: TMovementInfo;
  end;

  T_CMSG_NAME_QUERY = record
    GUID: uInt64;
  end;

  T_SMSG_NAME_QUERY_RESPONSE = record
    GUID: uInt64; // 3.2.2: uInt64->GUID
    Unk: byte; // 3.2.2
    Name: string;
    GuildName: string;
    raceID: byte;
    sexID: byte;
    classID: byte;
    LocaleNamesPresent: byte; // 2.4.0
    LocaleName: array[0..4] of string; // 2.4.0
  end;

  T_SMSG_QUERY_TIME_RESPONSE = record
    DateTimeValue: longint;
    Unk: longint; // 3.x
  end;

  T_CMSG_SET_SELECTION = record
    GUID: uInt64;
  end;

  T_CMSG_AREATRIGGER = record
    TriggerID: longint;
  end;

  T_CMSG_SWAP_INV_ITEM = record
    DstSlot: byte;
    SrcSlot: byte;
  end;

  T_CMSG_AUTOEQUIP_ITEM = record
    Bag: byte;
    Slot: byte;
  end;

  T_SMSG_INVENTORY_CHANGE_FAILURE = record
    ResponseCode: byte;
    InventoryItemGUID: uInt64;
    InventoryGUID: uInt64;
    Unk: byte;
  end;

  T_CMSG_QUESTGIVER_STATUS_QUERY = record
    GUID: uInt64;
  end;

  T_SMSG_QUESTGIVER_STATUS = record
    GUID: uInt64;
    Status: byte;
  end;

  T_CMSG_QUESTGIVER_HELLO = record
    GUID: uInt64;
  end;

  T_SMSG_QUESTGIVER_QUEST_LIST = record
    GUID: uInt64;
    GreetingsText: string;
    EmoteID: longint;
    EmoteDelay: longint;
    Unk: byte;
  end;

  T_CMSG_STANDSTATECHANGE = record
    StandStateID: longint;
  end;

  T_SMSG_STANDSTATE_UPDATE = record
    StandStateID: byte;
  end;

  T_CMSG_SETSHEATHED = record
    SheathedID: byte;
  end;

  T_SMSG_GOSSIP_COMPLETE = record

  end;

  GossipMenuRecord = record
    Option: longint;
    IconID: byte;
    InputBox: byte;
    PayCost: longint; // BC 2.0.1
    Title: string;
    PayText: string; // BC 2.0.1
  end;
  QuestMenuRecord = record
    ID: longint;
    Status: longint;
    BaseLevel: longint;
    Title: string;
  end;
  T_SMSG_GOSSIP_MESSAGE = record
    GUID: uInt64;
    Entry: longint; // BC 2.4.0
    NPCTextID: longint;
    GossipMenu: array of GossipMenuRecord;
    QuestMenu: array of QuestMenuRecord;
  end;

  T_CMSG_GOSSIP_SELECT_OPTION = record
    GUID: uInt64;
    Entry: longint; // BC 2.4.0
    Option: longint;
  end;

  T_SMSG_ITEM_PUSH_RESULT = record
    GUID: uInt64;
    PushFrom: longint;
    PushType: longint;
    PushDisplay: longint;
    ItemBag: byte;
    ItemSlot: longint;
    ItemEntry: longint;
    ItemTime: longint;
    ItemSuffix: longint;
    ItemCount: longint;
  end;

  T_SMSG_TIME_SYNC_REQ = record
    Count: longint;
  end;

  T_SMSG_MOTD = record
    LinesCount: longint;
    Lines: string;
  end;

  T_SMSG_MOVE_SET_CAN_FLY = record
    GUID: uInt64;
    Count: longint;
  end;

  T_SMSG_MOVE_UNSET_CAN_FLY = record
    GUID: uInt64;
    Count: longint;
  end;

  TAddonInfo = record
    TypeID: byte;
    isInfoBlockPresent: byte;
    isPublicKeyPresent: byte;
    PublicKeyData: array[0..255] of byte;
    Flags: longint;
    isURLPresent: byte;
    URLText: string;
  end;
  TBannedAddonInfo = record
    Unk1: longint;
    Unk2_1: array[0..15] of byte;
    Unk2_2: array[0..15] of byte;
    Unk3: longint;
    Unk4: longint;
  end;
  T_SMSG_ADDON_INFO = record
    Count: longint;
    Info: array of TAddonInfo;
    BannedCount: longint;
    BannedInfo: array of TBannedAddonInfo;
  end;

  TClientAddonInfo = record
    Name: string;
    Enabled: byte;
    CRC: longint;
    Unk: longint;
  end;
  T_CLIENT_ADDON_INFO = record
    Count: longint;
    Info: array of TClientAddonInfo;
    CRC: longint;
  end;

  T_CMSG_UI_TIME_REQUEST = record

  end;

  T_SMSG_UI_TIME = record
    DateTimeValue: longint;
  end;

implementation

end.
