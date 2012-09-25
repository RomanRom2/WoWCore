unit Sockets;

interface

uses
  Winsock, Messages, Windows, Forms;

Const
  WM_ASYNC_RS = WM_USER+10;
  WM_ASYNC_WS = WM_USER+20;

Var
  RS, WS: TSocket;
  RS_PORT: longint = 3724;
  WS_PORT: longint = 7000;

  wsa: WSAData;
  sin: TSockAddrIn;
  ux: u_int;
  LocalAddress: TSockAddr;
 
function BuildSocketsRS: boolean;
function BuildSocketsWS: boolean;

implementation

uses
  Unit1,
  Logs, Convert;

function BuildSocketsRS: boolean;
var
  i: longint;
  e: boolean;
begin
  result:= false;

  WSAStartUp($101, wsa);

  e:= false;
  RS:= socket(AF_INET, SOCK_STREAM, IPPROTO_IP);
  sin.sin_family:= AF_INET;
  sin.sin_port:= htons(RS_PORT);
  sin.sin_addr.s_addr:= INADDR_ANY; // inet_addr('127.0.0.1');
  WSAAsyncSelect(RS, MainForm.Handle, WM_ASYNC_RS, FD_ACCEPT or FD_READ or FD_CLOSE);

//  Block:=0;
//  IOCtlSocket(WS, FIONBIO, Block);

  i:= bind(RS, sin, sizeof(sin));
  if i <> 0 then begin MainLog('Error while BIND port', 1,0,0); e:= true; end;
  i:= listen(RS, SOMAXCONN);
  if i <> 0 then begin MainLog('Error while LISTEN port', 1,0,0); e:= true; end;
  if not e then
  begin
    MainLog('RS: Opened port '+strr(RS_PORT), 1,0,0);
    result:= true;
  end;
end;
function BuildSocketsWS: boolean;
var
  i: longint;
  e: boolean;
begin
  result:= false;

  WSAStartUp($101, wsa);

  e:= false;
  WS:= socket(AF_INET, SOCK_STREAM, IPPROTO_IP);
  sin.sin_family:= AF_INET;
  sin.sin_port:= htons(WS_PORT);
  sin.sin_addr.s_addr:= INADDR_ANY;
  WSAAsyncSelect(WS, MainForm.Handle, WM_ASYNC_WS, FD_ACCEPT or FD_READ or FD_CLOSE);

  i:= bind(WS, sin,sizeof(sin));
  if i<>0 then begin MainLog('Error while BIND port', 1,0,0); e:= true; end;
  i:= listen(WS, SOMAXCONN);
  if i<>0 then begin MainLog('Error while LISTEN port', 1,0,0); e:= true; end;
  if not e then
  begin
    MainLog('WS: Opened port '+strr(WS_PORT), 1,0,0);
    result:= true;
  end;
end;

end.
