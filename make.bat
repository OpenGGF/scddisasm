@echo off

if not exist out mkdir out

set STANDALONE=0
set DEBUG=0
set REGION=0

set ZONE=1
set ACT=1
set TIME=A
call:BuildFile
set TIME=B
call:BuildFile
set TIME=C
call:BuildFile
set TIME=D
call:BuildFile
set ACT=2
set TIME=A
call:BuildFile
set TIME=B
call:BuildFile
set TIME=C
call:BuildFile
set TIME=D
call:BuildFile
set ACT=3
set TIME=C
call:BuildFile
set TIME=D
call:BuildFile

set ZONE=3
set ACT=1
set TIME=A
call:BuildFile
set TIME=B
call:BuildFile
set TIME=C
call:BuildFile
set TIME=D
call:BuildFile
set ACT=2
set TIME=A
call:BuildFile
set TIME=B
call:BuildFile
set TIME=C
call:BuildFile
set TIME=D
call:BuildFile
set ACT=3
set TIME=C
call:BuildFile
set TIME=D
call:BuildFile

set ZONE=4
set ACT=1
set TIME=A
call:BuildFile
set TIME=B
call:BuildFile
set TIME=C
call:BuildFile
set TIME=D
call:BuildFile
set ACT=2
set TIME=A
call:BuildFile
set TIME=B
call:BuildFile
set TIME=C
call:BuildFile
set TIME=D
call:BuildFile
set ACT=3
set TIME=C
call:BuildFile
set TIME=D
call:BuildFile

set ZONE=5
set ACT=1
set TIME=A
call:BuildFile
set TIME=B
call:BuildFile
set TIME=C
call:BuildFile
set TIME=D
call:BuildFile
set ACT=2
set TIME=A
call:BuildFile
set TIME=B
call:BuildFile
set TIME=C
call:BuildFile
set TIME=D
call:BuildFile
set ACT=3
set TIME=C
call:BuildFile
set TIME=D
call:BuildFile

set ZONE=6
set ACT=1
set TIME=A
call:BuildFile
set TIME=B
call:BuildFile
set TIME=C
call:BuildFile
set TIME=D
call:BuildFile
set ACT=2
set TIME=A
call:BuildFile
set TIME=B
call:BuildFile
set TIME=C
call:BuildFile
set TIME=D
call:BuildFile
set ACT=3
set TIME=C
call:BuildFile
set TIME=D
call:BuildFile

set ZONE=7
set ACT=1
set TIME=A
call:BuildFile
set TIME=B
call:BuildFile
set TIME=C
call:BuildFile
set TIME=D
call:BuildFile
set ACT=2
set TIME=A
call:BuildFile
set TIME=B
call:BuildFile
set TIME=C
call:BuildFile
set TIME=D
call:BuildFile
set ACT=3
set TIME=C
call:BuildFile
set TIME=D
call:BuildFile

set ZONE=8
set ACT=1
set TIME=A
call:BuildFile
set TIME=B
call:BuildFile
set TIME=C
call:BuildFile
set TIME=D
call:BuildFile
set ACT=2
set TIME=A
call:BuildFile
set TIME=B
call:BuildFile
set TIME=C
call:BuildFile
set TIME=D
call:BuildFile
set ACT=3
set TIME=C
call:BuildFile
set TIME=D
call:BuildFile

pause
exit /b

:BuildFile
bin\asm68k /q /p /e STANDALONE=%STANDALONE% /e DEBUG=%DEBUG% /e REGION=%REGION% /o ae-,l.,ow+ src/R%ZONE%%ACT%%TIME%.asm,out/R%ZONE%%ACT%%TIME%.gen,,out/R%ZONE%%ACT%%TIME%.lst
if "%STANDALONE%"=="0" fc /b out\R%ZONE%%ACT%%TIME%.gen original\R%ZONE%%ACT%%TIME%__.MMD
if "%STANDALONE%"=="1" mdromfix out/R%ZONE%%ACT%%TIME%.gen