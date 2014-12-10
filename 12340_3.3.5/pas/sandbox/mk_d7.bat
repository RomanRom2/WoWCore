@echo off
rem you can download the cmd-line delphi 7 compiler from http://wowcore.ru/downloads/CLI7.rar
del *.dcu /s
del SandBox.7.exe
del SandBox.exe
\WoWCore\CLI\D7\bin\dcc32.exe SandBox.dpr
rename SandBox.exe SandBox.7.exe
