@echo off
rem you can download the cmd-line delphi 2007 compiler from http://wowcore.ru/downloads/CLI2007.rar
del *.dcu /s
del SandBox.2007.exe
del SandBox.exe
\WoWCore\CLI\D2007\bin\dcc32.exe SandBox.dpr
rename SandBox.exe SandBox.2007.exe
