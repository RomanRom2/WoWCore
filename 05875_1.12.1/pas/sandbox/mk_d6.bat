@echo off
rem you can download the cmd-line delphi 6 compiler from http://wowcore.ru/downloads/CLI6.rar
del *.dcu /s
del SandBox.6.exe
del SandBox.exe
\WoWCore\CLI\D6\bin\dcc32.exe SandBox.dpr
rename SandBox.exe SandBox.6.exe
