@echo off
rem you can download the cmd-line delphi 4 compiler from http://wowcore.ru/downloads/CLI4.rar
del *.dcu /s
del SandBox.4.exe
del SandBox.exe
\WoWCore\CLI\D4\bin\dcc32.exe SandBox.dpr
rename SandBox.exe SandBox.4.exe
