@echo off
rem you can download the cmd-line delphi xe compiler from http://wowcore.ru/downloads/CLIXE.rar
del *.dcu /s
del SandBox.XE.exe
del SandBox.exe
\WoWCore\CLI\DXE\bin\dcc32.exe SandBox.dpr
rename SandBox.exe SandBox.XE.exe
