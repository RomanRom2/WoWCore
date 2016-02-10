@echo off
rem you can download the cmd-line delphi 5 compiler from http://wowcore.ru/downloads/CLI5.rar
del *.dcu /s
del SandBox.5.exe
del SandBox.exe
\WoWCore\CLI\D5\bin\dcc32.exe SandBox.dpr
rename SandBox.exe SandBox.5.exe
