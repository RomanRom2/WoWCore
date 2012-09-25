unit Logs;
 
interface

uses
  Forms, SysUtils;

procedure MainLog(ls: string; console: byte =1; b: byte =0; e: byte =0);

implementation

uses
  Unit1, Sockets, Convert;

const
  LOG_FILE = 'SandBox.log';

procedure MainLog(ls: string; console: byte =1; b: byte =0; e: byte =0);
var
  i: byte;
  ft: textfile;
  o: string;
begin
{$I-}
  assign(ft, LOG_FILE);
  append(ft);
  if IOResult <> 0 then
    rewrite(ft);

  if b>0 then
    for i:= 1 to b do
    begin
      if console > 0 then
        MainForm.Log.lines.add('');
      writeln(ft, '');
    end;

  o:= DateToStr(Date)+', '+TimeToStr(Time)+': '+ls;
  if console > 0 then
    MainForm.Log.lines.add(o);

  writeln(ft, o);

  if e > 0 then
    for i:= 1 to e do
    begin
      if console > 0 then
        MainForm.Log.lines.add('');
      writeln(ft,'');
    end;

  flush(ft);
  close(ft);
{$I+}
  IOResult;
end;

end.
