@echo off
rem you can download the cmd-line delphi 2007 compiler from http://wowcore.ru/downloads/RAD2007.rar, 33mb
del *.dcu /s
del SandBox*.exe
D:\WoWCore\RAD2007\bin\dcc32.exe SandBox.dpr -U"D:\WoWCore\RAD2007\lib"
