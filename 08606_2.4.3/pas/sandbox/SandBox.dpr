program SandBox;

uses
  Forms,
  Unit1 in 'Unit1.pas',

  LbBigInt in 'libs\TPLockBox\LbBigInt.pas',
  LbRandom in 'libs\TPLockBox\LbRandom.pas',
  LbCipher in 'libs\TPLockBox\LbCipher.pas',
  LbUtils in 'libs\TPLockBox\LbUtils.pas',
  LbConst in 'libs\TPLockBox\LbConst.pas',
  LbClass in 'libs\TPLockBox\LbClass.pas',
  LbProc in 'libs\TPLockBox\LbProc.pas',
  LbString in 'libs\TPLockBox\LbString.pas',

  Convert in 'libs\Convert.pas',
  SRP6_LockBox in 'libs\SRP6_LockBox.pas',

  Logs in 'Logs.pas',
  Sockets in 'Sockets.pas',

  Struct in 'Struct.pas',
  Defines in 'Defines.pas',
  NetMessages in 'common\NetMessages.pas',
  NetMessagesStr in 'common\NetMessagesStr.pas',
  UpdateFields in 'common\UpdateFields.pas',
  Responses in 'responses\Responses.pas',
  {$I responses\Responses.inc}

  UpdatePacket in 'common\UpdatePacket.pas',
  PacketBuilding in 'common\PacketBuilding.pas',
  TMSGStruct in 'tmsg\TMSGStruct.pas',
  TMSGBuilder in 'tmsg\TMSGBuilder.pas',
  TMSGParser in 'tmsg\TMSGParser.pas',
  TMSGBufGets in 'tmsg\TMSGBufGets.pas',

  CharsConstsAlliance in 'CharsConstsAlliance.pas',
  CharsConstsHorde in 'CharsConstsHorde.pas',
  CharsConsts in 'CharsConsts.pas',

  DB in 'DB.pas',
  OpCodesProcTable in 'OpCodesProcTable.pas',
  Commands in 'Commands.pas',
  AuthServer in 'AuthServer.pas',
  CharServer in 'CharServer.pas',
  WorldServer in 'WorldServer.pas',

  ClassConnection in 'ClassConnection.pas',
  ClassCharList in 'ClassCharList.pas',
  ClassWorld in 'ClassWorld.pas',

  SysUtils,
  Windows;

{$R *.res}

var
  Hor, Ver: Integer;
  DesctopHandle: HWND;
  DesctopDC: HDC;

begin
  DesctopHandle:= GetDesktopWindow;
  DesctopDC:= GetDC(DesctopHandle);
  try
    try
      Hor:= GetDeviceCaps(DesctopDC, HORZRES);
      Ver:= GetDeviceCaps(DesctopDC, VERTRES);
    finally
      if ReleaseDC(DesctopHandle, DesctopDC) = 0 then
        RaiseLastOSError;
    end;
  except
    Hor:= 1024;
    Ver:= 768;
  end;

  Application.Initialize;
  Application.Title:= 'WoWCore';
  Application.CreateForm(TMainForm, MainForm);

  MainForm.Height:= Ver -24*2 -8;
  MainForm.Width:= Hor div 2 -8;
  MainForm.Top:= 5;
  MainForm.Left:= Hor -MainForm.Width -5;

  Application.Run;
end.
