@echo off
rem you can download the cmd-line delphi xe5 compiler from http://wowcore.ru/downloads/CLIDXE5.rar
del *.dcu /s
del SandBox.XE5.exe
del SandBox.exe
\WoWCore\CLI\DXE5\bin\dcc32.exe SandBox.dpr
rename SandBox.exe SandBox.XE5.exe
