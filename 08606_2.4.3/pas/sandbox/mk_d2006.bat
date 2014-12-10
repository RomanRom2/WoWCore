@echo off
rem you can download the cmd-line delphi 2006 compiler from http://wowcore.ru/downloads/CLI2006.rar
del *.dcu /s
del SandBox.2006.exe
del SandBox.exe
\WoWCore\CLI\D2006\bin\dcc32.exe SandBox.dpr
rename SandBox.exe SandBox.2006.exe
