unit OpCodesProcTable;

interface

uses
  ClassConnection,
  NetMessages, NetMessagesStr;

type
  TOpCodeProc = procedure(var sender: TWorldUser);

var
  OpCodeProc: array[0..TECH_OPCODE] of TOpCodeProc;

procedure cmd_MSG_NULL_ACTION(var sender: TWorldUser);

implementation

uses
  Logs, Convert,
  CharServer, WorldServer;

procedure cmd_MSG_NULL_ACTION(var sender: TWorldUser);
var
  pkt_len, opcode: word;
begin
  pkt_len:= sender.RBuf[1]+256*sender.RBuf[0];
  opcode:= sender.RBuf[2]+256*sender.RBuf[3];
  MainLog(NetMsgStr(opcode)+', '+strr(pkt_len)+' bytes of data',1,1,0);
  sender.printRecvBuf(pkt_len+2);
end;
procedure InitOpCodeProc;
var
  i: longint;
begin
  for i:= 0 to TECH_OPCODE do @OpCodeProc[i]:=        @cmd_MSG_NULL_ACTION;

  // Char Server
  @OpCodeProc[SMSG_AUTH_CHALLENGE]:=                  @cmd_SMSG_AUTH_CHALLENGE;
  @OpCodeProc[CMSG_AUTH_SESSION]:=                    @cmd_CMSG_AUTH_SESSION;
  @OpCodeProc[CMSG_CHAR_ENUM]:=                       @cmd_CMSG_CHAR_ENUM;
  @OpCodeProc[CMSG_CHAR_CREATE]:=                     @cmd_CMSG_CHAR_CREATE;
  @OpCodeProc[CMSG_CHAR_DELETE]:=                     @cmd_CMSG_CHAR_DELETE;
  @OpCodeProc[CMSG_PING]:=                            @cmd_CMSG_PING;
  @OpCodeProc[CMSG_ITEM_QUERY_SINGLE]:=               @cmd_CMSG_ITEM_QUERY_SINGLE;
  @OpCodeProc[CMSG_CREATURE_QUERY]:=                  @cmd_CMSG_CREATURE_QUERY;
  @OpCodeProc[CMSG_GAMEOBJECT_QUERY]:=                @cmd_CMSG_GAMEOBJECT_QUERY;
  @OpCodeProc[CMSG_JOIN_CHANNEL]:=                    @cmd_CMSG_JOIN_CHANNEL;
  @OpCodeProc[CMSG_LOGOUT_REQUEST]:=                  @cmd_CMSG_LOGOUT_REQUEST;
  @OpCodeProc[CMSG_DESTROYITEM]:=                     @cmd_CMSG_DESTROYITEM;
  @OpCodeProc[CMSG_NPC_TEXT_QUERY]:=                  @cmd_CMSG_NPC_TEXT_QUERY;
  @OpCodeProc[CMSG_ZONEUPDATE]:=                      @cmd_CMSG_ZONEUPDATE;

  // World Server
  @OpCodeProc[CMSG_PLAYER_LOGIN]:=                    @cmd_CMSG_PLAYER_LOGIN;
  @OpCodeProc[CMSG_REQUEST_ACCOUNT_DATA]:=            @cmd_CMSG_REQUEST_ACCOUNT_DATA;
  @OpCodeProc[CMSG_UPDATE_ACCOUNT_DATA]:=             @cmd_CMSG_UPDATE_ACCOUNT_DATA;
  @OpCodeProc[MSG_MOVE_WORLDPORT_ACK]:=               @cmd_MSG_MOVE_WORLDPORT_ACK;
  @OpCodeProc[CMSG_NAME_QUERY]:=                      @cmd_CMSG_NAME_QUERY;
  @OpCodeProc[CMSG_QUERY_TIME]:=                      @cmd_CMSG_QUERY_TIME;
  @OpCodeProc[CMSG_MESSAGECHAT]:=                     @cmd_CMSG_MESSAGECHAT;
  @OpCodeProc[MSG_MOVE_SET_FACING]:=                  @cmd_MSG_MOVE_PLAYER;
  @OpCodeProc[MSG_MOVE_START_STRAFE_LEFT]:=           @cmd_MSG_MOVE_PLAYER;
  @OpCodeProc[MSG_MOVE_START_STRAFE_RIGHT]:=          @cmd_MSG_MOVE_PLAYER;
  @OpCodeProc[MSG_MOVE_STOP_STRAFE]:=                 @cmd_MSG_MOVE_PLAYER;
  @OpCodeProc[MSG_MOVE_START_FORWARD]:=               @cmd_MSG_MOVE_PLAYER;
  @OpCodeProc[MSG_MOVE_START_BACKWARD]:=              @cmd_MSG_MOVE_PLAYER;
  @OpCodeProc[MSG_MOVE_HEARTBEAT]:=                   @cmd_MSG_MOVE_PLAYER;
  @OpCodeProc[MSG_MOVE_STOP]:=                        @cmd_MSG_MOVE_PLAYER;
  @OpCodeProc[MSG_MOVE_JUMP]:=                        @cmd_MSG_MOVE_PLAYER;
  @OpCodeProc[MSG_MOVE_START_TURN_RIGHT]:=            @cmd_MSG_MOVE_PLAYER;
  @OpCodeProc[MSG_MOVE_START_TURN_LEFT]:=             @cmd_MSG_MOVE_PLAYER;
  @OpCodeProc[MSG_MOVE_STOP_TURN]:=                   @cmd_MSG_MOVE_PLAYER;
  @OpCodeProc[MSG_MOVE_SET_PITCH]:=                   @cmd_MSG_MOVE_PLAYER;
  @OpCodeProc[MSG_MOVE_FALL_LAND]:=                   @cmd_MSG_MOVE_PLAYER;
  @OpCodeProc[MSG_MOVE_START_SWIM]:=                  @cmd_MSG_MOVE_PLAYER;
  @OpCodeProc[MSG_MOVE_STOP_SWIM]:=                   @cmd_MSG_MOVE_PLAYER;
  @OpCodeProc[MSG_MOVE_START_ASCEND]:=                @cmd_MSG_MOVE_PLAYER;
  @OpCodeProc[MSG_MOVE_STOP_ASCEND]:=                 @cmd_MSG_MOVE_PLAYER;
  @OpCodeProc[MSG_MOVE_START_DESCEND]:=               @cmd_MSG_MOVE_PLAYER;
  @OpCodeProc[CMSG_SET_SELECTION]:=                   @cmd_CMSG_SET_SELECTION;
  @OpCodeProc[CMSG_AREATRIGGER]:=                     @cmd_CMSG_AREATRIGGER;
  @OpCodeProc[CMSG_SWAP_INV_ITEM]:=                   @cmd_CMSG_SWAP_INV_ITEM;
  @OpCodeProc[CMSG_AUTOEQUIP_ITEM]:=                  @cmd_CMSG_AUTOEQUIP_ITEM;
  @OpCodeProc[CMSG_ATTACKSWING]:=                     @cmd_CMSG_ATTACKSWING;
  @OpCodeProc[CMSG_ATTACKSTOP]:=                      @cmd_CMSG_ATTACKSTOP;
  @OpCodeProc[CMSG_QUESTGIVER_STATUS_QUERY]:=         @cmd_CMSG_QUESTGIVER_STATUS_QUERY;
  @OpCodeProc[CMSG_QUESTGIVER_HELLO]:=                @cmd_CMSG_QUESTGIVER_HELLO;
  @OpCodeProc[CMSG_STANDSTATECHANGE]:=                @cmd_CMSG_STANDSTATECHANGE;
  @OpCodeProc[CMSG_SETSHEATHED]:=                     @cmd_CMSG_SETSHEATHED;
  @OpCodeProc[CMSG_GOSSIP_SELECT_OPTION]:=            @cmd_CMSG_GOSSIP_SELECT_OPTION;
  @OpCodeProc[CMSG_CAST_SPELL]:=                      @cmd_CMSG_CAST_SPELL;
end;

begin
  InitOpCodeProc;
end.
