unit Responses;

interface

uses
  TMSGStruct;

var
  ItemTPL: array of T_SMSG_ITEM_QUERY_SINGLE_RESPONSE;
  CreatureTPL: array of T_SMSG_CREATURE_QUERY_RESPONSE;
  GameObjectTPL: array of T_SMSG_GAMEOBJECT_QUERY_RESPONSE;
  NPCTextTPL: array of T_SMSG_NPC_TEXT_UPDATE;

type
  TAreaTrigger=record
    Entry: longint;
    trigger_continent_id: longint;
    trigger_posx,trigger_posy,trigger_posz: single;
    trigger_radius,trigger_box_length,trigger_box_width,trigger_box_height,trigger_box_yaw: single;
    action: longint;
    target_map, target_zone: longint;
    target_posx, target_posy, target_posz, target_posf: single;
    trigger_title: string;
  end;

var
  AreaTriggerDBC: array of TAreaTrigger;

procedure LoadAllResponses;

implementation

uses
  Items1, Items2, Items3, Items4, Items5, Items6, Items7, Items8, Items9, Items10, 
  Items11, Items12, Items13, Items14, Items15, Items16, Items17, Items18, Items19, Items20, 
  Items21, Items22, Items23, Items24, Items25, Items26, Items27, Items28, Items29, Items30, 
  Items31, Items32, Items33, Items34, Items35, Items36, Items37, Items38, Items39, Items40, 
  Items41, Items42, Items43, Items44, Items45, Items46, Items47, Items48, Items49, Items50, 
  Items51, Items52, Items53, Items54, Items55, Items56, Items57, Items58, Items59, Items60, 
  Items61, Items62, Items63, Items64, Items65, Items66, Items67, Items68, Items69, Items70, 
  Items71, Items72, Items73, Items74, Items75, Items76, 

  Creatures1, Creatures2, Creatures3, Creatures4, Creatures5, Creatures6, Creatures7, Creatures8, Creatures9, Creatures10, 
  Creatures11, Creatures12, Creatures13, Creatures14, Creatures15, Creatures16, Creatures17, Creatures18, Creatures19, Creatures20, 
  Creatures21, Creatures22, Creatures23, Creatures24, Creatures25, Creatures26, Creatures27, Creatures28, Creatures29, Creatures30, 
  Creatures31, Creatures32, Creatures33, Creatures34, Creatures35, Creatures36, Creatures37, Creatures38, Creatures39, Creatures40, 
  

  GameObjects1, GameObjects2, GameObjects3, GameObjects4, GameObjects5, GameObjects6, GameObjects7, GameObjects8, GameObjects9, GameObjects10, 
  GameObjects11, GameObjects12, GameObjects13, GameObjects14, GameObjects15, GameObjects16, GameObjects17, GameObjects18, GameObjects19, GameObjects20, 
  GameObjects21, GameObjects22, GameObjects23, GameObjects24, GameObjects25, GameObjects26, GameObjects27, GameObjects28, GameObjects29, GameObjects30, 
  GameObjects31, GameObjects32, GameObjects33, GameObjects34, GameObjects35, GameObjects36, GameObjects37, GameObjects38, GameObjects39, GameObjects40, 
  GameObjects41, GameObjects42, GameObjects43, GameObjects44, GameObjects45, GameObjects46, GameObjects47, GameObjects48, GameObjects49, GameObjects50, 
  GameObjects51, GameObjects52, GameObjects53, GameObjects54, GameObjects55, GameObjects56, GameObjects57, GameObjects58, GameObjects59, GameObjects60, 
  GameObjects61, GameObjects62, GameObjects63, GameObjects64, GameObjects65, GameObjects66, GameObjects67, GameObjects68, GameObjects69, GameObjects70, 
  GameObjects71, GameObjects72, GameObjects73, GameObjects74, GameObjects75, GameObjects76, GameObjects77, GameObjects78, GameObjects79, GameObjects80, 
  GameObjects81, GameObjects82, GameObjects83, GameObjects84, GameObjects85, GameObjects86, GameObjects87, GameObjects88, GameObjects89, GameObjects90, 
  GameObjects91, GameObjects92, GameObjects93, GameObjects94, GameObjects95, GameObjects96, GameObjects97, GameObjects98, GameObjects99, GameObjects100, 
  GameObjects101, GameObjects102, GameObjects103, GameObjects104, GameObjects105, GameObjects106, GameObjects107, GameObjects108, GameObjects109, GameObjects110, 
  GameObjects111, GameObjects112, GameObjects113, GameObjects114, GameObjects115, GameObjects116, GameObjects117, GameObjects118, GameObjects119, GameObjects120, 
  GameObjects121, GameObjects122, GameObjects123, GameObjects124, GameObjects125, GameObjects126, GameObjects127, GameObjects128, GameObjects129, GameObjects130, 
  GameObjects131, GameObjects132, GameObjects133, GameObjects134, GameObjects135, GameObjects136, GameObjects137, GameObjects138, GameObjects139, GameObjects140, 
  GameObjects141, GameObjects142, GameObjects143, GameObjects144, GameObjects145, GameObjects146, GameObjects147, GameObjects148, GameObjects149, GameObjects150, 
  GameObjects151, GameObjects152, GameObjects153, GameObjects154, GameObjects155, GameObjects156, GameObjects157, GameObjects158, GameObjects159, GameObjects160, 
  GameObjects161, GameObjects162, GameObjects163, GameObjects164, GameObjects165, 

  AreaTriggers1, AreaTriggers2, AreaTriggers3, AreaTriggers4, AreaTriggers5, 

  Logs, Convert;

procedure LoadAllResponses;
var
  i, b, e, c: longint;
begin
  SetLength(ItemTPL, 54807);
  LoadItems1;
  LoadItems2;
  LoadItems3;
  LoadItems4;
  LoadItems5;
  LoadItems6;
  LoadItems7;
  LoadItems8;
  LoadItems9;
  LoadItems10;
  LoadItems11;
  LoadItems12;
  LoadItems13;
  LoadItems14;
  LoadItems15;
  LoadItems16;
  LoadItems17;
  LoadItems18;
  LoadItems19;
  LoadItems20;
  LoadItems21;
  LoadItems22;
  LoadItems23;
  LoadItems24;
  LoadItems25;
  LoadItems26;
  LoadItems27;
  LoadItems28;
  LoadItems29;
  LoadItems30;
  LoadItems31;
  LoadItems32;
  LoadItems33;
  LoadItems34;
  LoadItems35;
  LoadItems36;
  LoadItems37;
  LoadItems38;
  LoadItems39;
  LoadItems40;
  LoadItems41;
  LoadItems42;
  LoadItems43;
  LoadItems44;
  LoadItems45;
  LoadItems46;
  LoadItems47;
  LoadItems48;
  LoadItems49;
  LoadItems50;
  LoadItems51;
  LoadItems52;
  LoadItems53;
  LoadItems54;
  LoadItems55;
  LoadItems56;
  LoadItems57;
  LoadItems58;
  LoadItems59;
  LoadItems60;
  LoadItems61;
  LoadItems62;
  LoadItems63;
  LoadItems64;
  LoadItems65;
  LoadItems66;
  LoadItems67;
  LoadItems68;
  LoadItems69;
  LoadItems70;
  LoadItems71;
  LoadItems72;
  LoadItems73;
  LoadItems74;
  LoadItems75;
  LoadItems76;
  b:= 0; e:= 0; c:= 0;
  for i:= 0 to Length(ItemTPL)-1 do
    if ItemTPL[i].Entry <> 0 then
    begin
      inc(c);
      if b = 0 then b:= i;
      e:= i;
    end;
  MainLog('DB: '+strr(c)+' Items loaded ['+strr(b)+'..'+strr(e)+']');

  SetLength(CreatureTPL, 40704);
  LoadCreatures1;
  LoadCreatures2;
  LoadCreatures3;
  LoadCreatures4;
  LoadCreatures5;
  LoadCreatures6;
  LoadCreatures7;
  LoadCreatures8;
  LoadCreatures9;
  LoadCreatures10;
  LoadCreatures11;
  LoadCreatures12;
  LoadCreatures13;
  LoadCreatures14;
  LoadCreatures15;
  LoadCreatures16;
  LoadCreatures17;
  LoadCreatures18;
  LoadCreatures19;
  LoadCreatures20;
  LoadCreatures21;
  LoadCreatures22;
  LoadCreatures23;
  LoadCreatures24;
  LoadCreatures25;
  LoadCreatures26;
  LoadCreatures27;
  LoadCreatures28;
  LoadCreatures29;
  LoadCreatures30;
  LoadCreatures31;
  LoadCreatures32;
  LoadCreatures33;
  LoadCreatures34;
  LoadCreatures35;
  LoadCreatures36;
  LoadCreatures37;
  LoadCreatures38;
  LoadCreatures39;
  LoadCreatures40;
  b:= 0; e:= 0; c:= 0;
  for i:= 0 to Length(CreatureTPL)-1 do
    if CreatureTPL[i].Entry <> 0 then
    begin
      inc(c);
      if b = 0 then b:= i;
      e:= i;
    end;
  MainLog('DB: '+strr(c)+' Creatures loaded ['+strr(b)+'..'+strr(e)+']');

  SetLength(GameObjectTPL, 210132);
  LoadGameObjects1;
  LoadGameObjects2;
  LoadGameObjects3;
  LoadGameObjects4;
  LoadGameObjects5;
  LoadGameObjects6;
  LoadGameObjects7;
  LoadGameObjects8;
  LoadGameObjects9;
  LoadGameObjects10;
  LoadGameObjects11;
  LoadGameObjects12;
  LoadGameObjects13;
  LoadGameObjects14;
  LoadGameObjects15;
  LoadGameObjects16;
  LoadGameObjects17;
  LoadGameObjects18;
  LoadGameObjects19;
  LoadGameObjects20;
  LoadGameObjects21;
  LoadGameObjects22;
  LoadGameObjects23;
  LoadGameObjects24;
  LoadGameObjects25;
  LoadGameObjects26;
  LoadGameObjects27;
  LoadGameObjects28;
  LoadGameObjects29;
  LoadGameObjects30;
  LoadGameObjects31;
  LoadGameObjects32;
  LoadGameObjects33;
  LoadGameObjects34;
  LoadGameObjects35;
  LoadGameObjects36;
  LoadGameObjects37;
  LoadGameObjects38;
  LoadGameObjects39;
  LoadGameObjects40;
  LoadGameObjects41;
  LoadGameObjects42;
  LoadGameObjects43;
  LoadGameObjects44;
  LoadGameObjects45;
  LoadGameObjects46;
  LoadGameObjects47;
  LoadGameObjects48;
  LoadGameObjects49;
  LoadGameObjects50;
  LoadGameObjects51;
  LoadGameObjects52;
  LoadGameObjects53;
  LoadGameObjects54;
  LoadGameObjects55;
  LoadGameObjects56;
  LoadGameObjects57;
  LoadGameObjects58;
  LoadGameObjects59;
  LoadGameObjects60;
  LoadGameObjects61;
  LoadGameObjects62;
  LoadGameObjects63;
  LoadGameObjects64;
  LoadGameObjects65;
  LoadGameObjects66;
  LoadGameObjects67;
  LoadGameObjects68;
  LoadGameObjects69;
  LoadGameObjects70;
  LoadGameObjects71;
  LoadGameObjects72;
  LoadGameObjects73;
  LoadGameObjects74;
  LoadGameObjects75;
  LoadGameObjects76;
  LoadGameObjects77;
  LoadGameObjects78;
  LoadGameObjects79;
  LoadGameObjects80;
  LoadGameObjects81;
  LoadGameObjects82;
  LoadGameObjects83;
  LoadGameObjects84;
  LoadGameObjects85;
  LoadGameObjects86;
  LoadGameObjects87;
  LoadGameObjects88;
  LoadGameObjects89;
  LoadGameObjects90;
  LoadGameObjects91;
  LoadGameObjects92;
  LoadGameObjects93;
  LoadGameObjects94;
  LoadGameObjects95;
  LoadGameObjects96;
  LoadGameObjects97;
  LoadGameObjects98;
  LoadGameObjects99;
  LoadGameObjects100;
  LoadGameObjects101;
  LoadGameObjects102;
  LoadGameObjects103;
  LoadGameObjects104;
  LoadGameObjects105;
  LoadGameObjects106;
  LoadGameObjects107;
  LoadGameObjects108;
  LoadGameObjects109;
  LoadGameObjects110;
  LoadGameObjects111;
  LoadGameObjects112;
  LoadGameObjects113;
  LoadGameObjects114;
  LoadGameObjects115;
  LoadGameObjects116;
  LoadGameObjects117;
  LoadGameObjects118;
  LoadGameObjects119;
  LoadGameObjects120;
  LoadGameObjects121;
  LoadGameObjects122;
  LoadGameObjects123;
  LoadGameObjects124;
  LoadGameObjects125;
  LoadGameObjects126;
  LoadGameObjects127;
  LoadGameObjects128;
  LoadGameObjects129;
  LoadGameObjects130;
  LoadGameObjects131;
  LoadGameObjects132;
  LoadGameObjects133;
  LoadGameObjects134;
  LoadGameObjects135;
  LoadGameObjects136;
  LoadGameObjects137;
  LoadGameObjects138;
  LoadGameObjects139;
  LoadGameObjects140;
  LoadGameObjects141;
  LoadGameObjects142;
  LoadGameObjects143;
  LoadGameObjects144;
  LoadGameObjects145;
  LoadGameObjects146;
  LoadGameObjects147;
  LoadGameObjects148;
  LoadGameObjects149;
  LoadGameObjects150;
  LoadGameObjects151;
  LoadGameObjects152;
  LoadGameObjects153;
  LoadGameObjects154;
  LoadGameObjects155;
  LoadGameObjects156;
  LoadGameObjects157;
  LoadGameObjects158;
  LoadGameObjects159;
  LoadGameObjects160;
  LoadGameObjects161;
  LoadGameObjects162;
  LoadGameObjects163;
  LoadGameObjects164;
  LoadGameObjects165;
  b:= 0; e:= 0; c:= 0;
  for i:= 0 to Length(GameObjectTPL)-1 do
    if GameObjectTPL[i].Entry <> 0 then
    begin
      inc(c);
      if b = 0 then b:= i;
      e:= i;
    end;
  MainLog('DB: '+strr(c)+' GameObjects loaded ['+strr(b)+'..'+strr(e)+']');

  SetLength(AreaTriggerDBC, 5873);
  LoadAreaTriggers1;
  LoadAreaTriggers2;
  LoadAreaTriggers3;
  LoadAreaTriggers4;
  LoadAreaTriggers5;
  b:= 0; e:= 0; c:= 0;
  for i:= 0 to Length(AreaTriggerDBC)-1 do
    if AreaTriggerDBC[i].Entry <> 0 then
    begin
      inc(c);
      if b = 0 then b:= i;
      e:= i;
    end;
  MainLog('DB: '+strr(c)+' AreaTriggers loaded ['+strr(b)+'..'+strr(e)+']');

end;

end.

