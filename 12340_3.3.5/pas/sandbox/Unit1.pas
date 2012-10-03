unit Unit1;

interface

uses
  ShellApi,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  Sockets, SRP6_LockBox;

type
  TMainForm = class(TForm)
    PageControl: TPageControl;
    Sheet1: TTabSheet;
    Log: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure NetworkMessageRS(var Msg:TMessage); message WM_ASYNC_RS;
    procedure NetworkMessageWS(var Msg:TMessage); message WM_ASYNC_WS;
    procedure StartServer(Sender: TObject; var Done:Boolean);
  protected
  end;

var
  MainForm: TMainForm;

implementation

uses
  Logs, Convert,
  DB,
  ClassCharList,
  ClassConnection,
  ClassWorld,
  Responses, Defines,
  UpdateFields, PacketBuilding, NetMessages, OpCodesProcTable,
  AuthServer,
  WinSock;

{$R *.dfm}

procedure TMainForm.NetworkMessageRS(var Msg:TMessage);
var
  incoming_sock: longint;
  LoginUser: TLoginUser;
begin
  Case msg.lParam of
    FD_ACCEPT:
      begin
        ux:=SizeOf(LocalAddress);
        incoming_sock:= Accept(RS, @LocalAddress, @ux);

        LoginUser:= TLoginUser.Create;
        LoginUser.Sock:= incoming_sock;
        LoginUser.Addr:= String(inet_ntoa(LocalAddress.sin_addr));
        LoginUser.Port:= LocalAddress.sin_port;

        ListLoginUsers.Add(incoming_sock, LoginUser);
        MainLog('RS: '+strr(LoginUser.Sock)+': '+LoginUser.Addr+':'+strr(LoginUser.Port)+': Incoming connection. Active Connections: '+strr(ListLoginUsers.Count), 1,1,0);
      end;
    FD_CLOSE:
      begin
        incoming_sock:= msg.WParam;

        // check nil

        MainLog('RS: '+strr(ListLoginUsers[incoming_sock].Sock)+': '+ListLoginUsers[incoming_sock].Addr+':'+strr(ListLoginUsers[incoming_sock].Port)+': Disconnected.', 1,0,0);
        ListLoginUsers[incoming_sock].Free;
        ListLoginUsers.Del(incoming_sock);

        Shutdown(incoming_sock, 1);
        CloseSocket(incoming_sock);
      end;
    FD_READ:
      begin
        incoming_sock:=msg.WParam;

        // check nil

        ListLoginUsers[incoming_sock].SockRecv;
      end;
  End;
end;
procedure TMainForm.NetworkMessageWS(var Msg:TMessage);
var
  incoming_sock: longint;
  WorldUser: TWorldUser;
begin
  Case msg.lParam of
    FD_ACCEPT:
      begin
        ux:= SizeOf(LocalAddress);
        incoming_sock:= Accept(WS, @LocalAddress, @ux);

        WorldUser:= TWorldUser.Create;
        WorldUser.Sock:= incoming_sock;
        WorldUser.Addr:= String(inet_ntoa(LocalAddress.sin_addr));
        WorldUser.Port:= LocalAddress.sin_port;

        ListWorldUsers.Add(incoming_sock, WorldUser);
        MainLog('WS: '+strr(WorldUser.Sock)+': '+WorldUser.Addr+':'+strr(WorldUser.Port)+': Incoming connection. Active Connections: '+strr(ListWorldUsers.Count), 1,1,0);

        OpCodeProc[SMSG_AUTH_CHALLENGE](WorldUser);
      end;
    FD_CLOSE:
      begin
        incoming_sock:= msg.WParam;

        // check nil

        MainLog('WS: '+strr(ListWorldUsers[incoming_sock].Sock)+': '+ListWorldUsers[incoming_sock].Addr+':'+strr(ListWorldUsers[incoming_sock].Port)+': Disconnected.', 1,0,0);
        ListWorldUsers[incoming_sock].Free;
        ListWorldUsers.Del(incoming_sock);

        Shutdown(incoming_sock, 1);
        CloseSocket(incoming_sock);
      end;
    FD_READ:
      begin
        incoming_sock:= msg.WParam;

        // check nil

        ListWorldUsers[incoming_sock].SockRecv;
      end;
  End;
end;

procedure TMainForm.StartServer(Sender: TObject; var Done:Boolean);
var
  f: textfile;
  s: string;
  i: longint;
begin
  Application.OnIdle:= nil;

  MainForm.Caption:= 'WoWCore: SandBox. ';
  Application.Title:= 'SandBox';
  MainForm.PageControl.ActivePage.PageControl.TabIndex:= 0;
  MainLog('Starting SandBox '+UPDATEFIELDS_VERSION+'.'+UPDATEFIELDS_BUILD+'.'+APP_BUILD+' ...', 1,0,1);

  {$I-}
  AssignFile(f, 'SandBox.wtf');
  Reset(f);
  ReadLn(f, REALM_ADDR);
  ReadLn(f, s);
  i:= vall(s);
  if i<>0 then RS_PORT:= i;
  ReadLn(f, s);
  i:= vall(s);
  if i<>0 then WS_PORT:= i;
  CloseFile(f);
  {$I+}

  if IOResult<>0 then
  begin
    REALM_ADDR:= 'localhost';
    RS_PORT:= 3724;
    WS_PORT:= 7000;
  end;
  REALM_ADDR:= trim(REALM_ADDR);

  SRP6_init();

  // DB Chars
  ListChars:= TListChars.Create;

  // Worlds
  World:= TWorld.Create;

  // Active Connections
  ListLoginUsers:= TListLoginUsers.Create;
  ListWorldUsers:= TListWorldUsers.Create;

  LoadAllResponses;

  if not BuildSocketsRS then
  begin
    MainLog('RS: Can''t build port ', 1,0,0);
    exit;
  end;

  if not BuildSocketsWS then
  begin
    MainLog('WS: Can''t build port ', 1,0,0);
    exit;
  end;

  MainLog('SandBox started at ['+REALM_ADDR+']. Use any same Login and Password to logon.', 1,1,1);
end;
procedure TMainForm.FormCreate(Sender: TObject);
begin
  Application.OnIdle:= StartServer;
end;
procedure TMainForm.FormDestroy(Sender: TObject);
begin
  ListLoginUsers.Free;
  ListWorldUsers.Free;

  SRP6_free();

  ListChars.Free;
  World.Free;
end;

initialization

end.
