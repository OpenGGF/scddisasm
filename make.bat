@echo off

set REGION=1
set OUTPUT=scdbuilt.iso

if not exist out mkdir out
if not exist out\files mkdir out\files
if not exist out\misc mkdir out\misc
del /q out\files\*.* > nul 2>&1
if %REGION%==0 (set REGIONDIR=japan)
if %REGION%==1 (set REGIONDIR=usa)
if %REGION%==2 (set REGIONDIR=europe)
for %%F in (ATTACK.MMD ENDING.MMD BADEND.STM GOODEND.STM PTEST.STM) do copy "original\%REGIONDIR%\%%F" "out\files\%%F" > nul
if not "%REGION%"=="1" (
    for %%F in (BRAMMAIN.MMD COME__.MMD PTEST.MMD THANKS_D.BIN THANKS_M.MMD) do copy "original\%REGIONDIR%\%%F" "out\files\%%F" > nul
)

cd src

set ASM68K=..\bin\asm68k.exe /q /p /o ae-,l.,ow+ /e REGION=%REGION%
set AS=..\bin\asw.exe -q -xx -n -A -L -U -E -i .
set P2BIN=..\bin\p2bin.exe

if %REGION%==0 (set FMVWAV="FMV\Data\Opening (Japan, Europe).wav")
if %REGION%==1 (set FMVWAV="FMV\Data\Opening (USA).wav")
if %REGION%==2 (set FMVWAV="FMV\Data\Opening (Japan, Europe).wav")

%AS% "Sound Drivers\FM\_Driver.asm"
if exist "Sound Drivers\FM\_Driver.p" (
    %P2BIN% "Sound Drivers\FM\_Driver.p" "..\out\misc\fm_driver.bin"
    del "Sound Drivers\FM\_Driver.p" > nul
) else (
    echo **************************************************************************************
    echo *                                                                                    *
    echo * FM sound driver failed to build. See "Sound Drivers\FM\_Driver.log" for more info. *
    echo *                                                                                    *
    echo **************************************************************************************
)

%ASM68K% "DA Garden\Track Titles.asm", "..\out\files\PLANET_D.BIN", "DA Garden\Track Titles.sym"
..\bin\dumpasmsym.exe -m asm "DA Garden\Track Titles.sym" -o "DA Garden\Track Title Labels.inc"
if exist "DA Garden\Track Titles.sym" ( del "DA Garden\Track Titles.sym" > nul )
%ASM68K% "DA Garden\Main.asm", "..\out\files\PLANET_M.MMD", , "DA Garden\Main.lst"
%ASM68K% "DA Garden\Sub.asm", "..\out\files\PLANET_S.BIN", , "DA Garden\Sub.lst"

%ASM68K% "CD Initial Program\IP.asm", "..\out\misc\ip.bin", , "CD Initial Program\IP.lst"
%ASM68K% "CD Initial Program\IPX.asm", "..\out\files\IPX___.MMD",  , "CD Initial Program\IPX.lst"
%ASM68K% "CD System Program\SP.asm", "..\out\misc\sp.bin", , "CD System Program\SP.lst"
%ASM68K% "CD System Program\SPX.asm", "..\out\files\SPX___.BIN", , "CD System Program\SPX.lst"
%ASM68K% "Backup RAM\Initialization\Main.asm", "..\out\files\BRAMINIT.MMD", , "Backup RAM\Initialization\Main.lst"
if "%REGION%"=="1" %ASM68K% "Backup RAM\Main.asm", "..\out\files\BRAMMAIN.MMD", , "Backup RAM\Main.lst"
%ASM68K% "Backup RAM\Sub.asm", "..\out\files\BRAMSUB.BIN", , "Backup RAM\Sub.lst"
%ASM68K% "Mega Drive Init\Main.asm", "..\out\files\MDINIT.MMD", , "Mega Drive Init\Main.lst"
%ASM68K% "Time Warp Cutscene\Main.asm", "..\out\files\WARP__.MMD", , "Time Warp Cutscene\Main.lst"
%ASM68K% "Sound Drivers\PCM\Palmtree Panic.asm", "..\out\files\SNCBNK1B.BIN", , "Sound Drivers\PCM\Palmtree Panic.lst"
%ASM68K% "Sound Drivers\PCM\Collision Chaos.asm", "..\out\files\SNCBNK3B.BIN", , "Sound Drivers\PCM\Collision Chaos.lst"
%ASM68K% "Sound Drivers\PCM\Tidal Tempest.asm", "..\out\files\SNCBNK4B.BIN", , "Sound Drivers\PCM\Tidal Tempest.lst"
%ASM68K% "Sound Drivers\PCM\Quartz Quadrant.asm", "..\out\files\SNCBNK5B.BIN", , "Sound Drivers\PCM\Quartz Quadrant.lst"
%ASM68K% "Sound Drivers\PCM\Wacky Workbench.asm", "..\out\files\SNCBNK6B.BIN", , "Sound Drivers\PCM\Wacky Workbench.lst"
%ASM68K% "Sound Drivers\PCM\Stardust Speedway.asm", "..\out\files\SNCBNK7B.BIN", , "Sound Drivers\PCM\Stardust Speedway.lst"
%ASM68K% "Sound Drivers\PCM\Metallic Madness.asm", "..\out\files\SNCBNK8B.BIN", , "Sound Drivers\PCM\Metallic Madness.lst"
%ASM68K% "Sound Drivers\PCM\Boss.asm", "..\out\files\SNCBNKB1.BIN", , "Sound Drivers\PCM\Boss.lst"
%ASM68K% "Sound Drivers\PCM\Final Boss.asm", "..\out\files\SNCBNKB2.BIN", , "Sound Drivers\PCM\Final Boss.lst"

%ASM68K% "Title Screen\Main.asm", "..\out\files\TITLEM.MMD", , "Title Screen\Main.lst"
%ASM68K% "Title Screen\Sub.asm", "..\out\files\TITLES.BIN", , "Title Screen\Sub.lst"
%ASM68K% /e PROTOTYPE=0 /e H32=0 "Title Screen\Secrets\Sound Test.asm", "..\out\files\SOSEL_.MMD", , "Title Screen\Secrets\Sound Test.lst"
%ASM68K% /e PROTOTYPE=0 /e H32=0 "Title Screen\Secrets\Stage Select.asm", "..\out\files\STSEL_.MMD", , "Title Screen\Secrets\Stage Select.lst"
%ASM68K% /e PROTOTYPE=0 /e H32=1 "Title Screen\Secrets\Best Staff Times.asm", "..\out\files\DUMMY4.MMD", , "Title Screen\Secrets\Best Staff Times.lst"
%ASM68K% /e PROTOTYPE=0 /e H32=0 "Title Screen\Secrets\Special Stage 8 Credits.asm", "..\out\files\SPEEND.MMD", , "Title Screen\Secrets\Special Stage 8 Credits.lst"

if exist "..\out\files\DUMMY5.MMD" (del "..\out\files\DUMMY5.MMD" > nul)
%ASM68K% /e PROTOTYPE=1 /e H32=0 "Title Screen\Secrets\Sound Test (Prototype).asm", "..\out\files\DUMMY5.MMD", , "Title Screen\Secrets\Sound Test (Prototype).lst"
if exist "..\out\files\DUMMY5.MMD" (
    copy "..\out\files\DUMMY5.MMD" "..\out\files\DUMMY6.MMD" > nul
    copy "..\out\files\DUMMY5.MMD" "..\out\files\DUMMY7.MMD" > nul
    copy "..\out\files\DUMMY5.MMD" "..\out\files\DUMMY8.MMD" > nul
    copy "..\out\files\DUMMY5.MMD" "..\out\files\DUMMY9.MMD" > nul
)

%ASM68K% /e PROTOTYPE=0 /e H32=0 /e EASTEREGG=0 "Title Screen\Secrets\Sound Test Image.asm", "..\out\files\NISI.MMD", , "Title Screen\Secrets\Sound Test Image (Fun Is Infinite).lst"
%ASM68K% /e PROTOTYPE=0 /e H32=0 /e EASTEREGG=1 "Title Screen\Secrets\Sound Test Image.asm", "..\out\files\DUMMY0.MMD", , "Title Screen\Secrets\Sound Test Image (M.C. Sonic).lst"
%ASM68K% /e PROTOTYPE=0 /e H32=0 /e EASTEREGG=2 "Title Screen\Secrets\Sound Test Image.asm", "..\out\files\DUMMY1.MMD", , "Title Screen\Secrets\Sound Test Image (Tails).lst"
%ASM68K% /e PROTOTYPE=0 /e H32=0 /e EASTEREGG=3 "Title Screen\Secrets\Sound Test Image.asm", "..\out\files\DUMMY2.MMD", , "Title Screen\Secrets\Sound Test Image (Batman).lst"
%ASM68K% /e PROTOTYPE=0 /e H32=0 /e EASTEREGG=4 "Title Screen\Secrets\Sound Test Image.asm", "..\out\files\DUMMY3.MMD", , "Title Screen\Secrets\Sound Test Image (Cute Sonic).lst"

%ASM68K% "Time Attack\Sub.asm", "..\out\files\ATTACK.BIN", , "Time Attack\Sub.lst"
%ASM68K% "Thank You\Sub.asm", "..\out\files\THANKS_S.BIN", , "Thank You\Sub.lst"
if %REGION%==1 (
    %ASM68K% "Thank You\Main.asm", "..\out\files\THANKS_M.MMD", , "Thank You\Main.lst"
    %ASM68K% "Thank You\Data.asm", "..\out\files\THANKS_D.BIN", , "Thank You\Data.lst"
    %ASM68K% "Comin Soon\Main.asm", "..\out\files\COME__.MMD", , "Comin Soon\Main.lst"
    %ASM68K% "FMV\Main (Pencil Test).asm", "..\out\files\PTEST.MMD", , "FMV\Main (Pencil Test).lst"
)

%ASM68K% "FMV\Main (Opening).asm", "..\out\files\OPEN_M.MMD", , "FMV\Main (Opening).lst"
%ASM68K% "FMV\Sub (Opening).asm", "..\out\files\OPEN_S.BIN", , "FMV\Sub (Opening).lst"
%ASM68K% /e DATAFILE=0 "FMV\Sub (Ending).asm", "..\out\files\GOODEND.BIN", , "FMV\Sub (Good Ending).lst"
%ASM68K% /e DATAFILE=1 "FMV\Sub (Ending).asm", "..\out\files\BADEND.BIN", , "FMV\Sub (Bad Ending).lst"
%ASM68K% "FMV\Sub (Pencil Test).asm", "..\out\files\PTEST.BIN", , "FMV\Sub (Pencil Test).lst"
echo.
echo Making opening FMV STM...
..\bin\MakeSTM.exe "FMV\Data\Opening.gif" %FMVWAV% 0 0 "..\out\files\OPN.STM"

%ASM68K% "Visual Mode\Main.asm", "..\out\files\VM____.MMD", , "Visual Mode\Main.lst"

%ASM68K% /e DEMO=0 "Level\Palmtree Panic\Act 1 Present.asm", "..\out\files\R11A__.MMD", , "Level\Palmtree Panic\Act 1 Present.lst"
%ASM68K% /e DEMO=0 "Level\Palmtree Panic\Act 2 Present.asm", "..\out\files\R12A__.MMD", , "Level\Palmtree Panic\Act 2 Present.lst"
%ASM68K% /e DEMO=0 "Level\Palmtree Panic\Act 2 Past.asm", "..\out\files\R12B__.MMD", , "Level\Palmtree Panic\Act 2 Past.lst"
%ASM68K% /e DEMO=0 "Level\Palmtree Panic\Act 2 Good Future.asm", "..\out\files\R12C__.MMD", , "Level\Palmtree Panic\Act 2 Good Future.lst"
%ASM68K% /e DEMO=0 "Level\Palmtree Panic\Act 2 Bad Future.asm", "..\out\files\R12D__.MMD", , "Level\Palmtree Panic\Act 2 Bad Future.lst"
%ASM68K% /e DEMO=0 "Level\Palmtree Panic\Act 3 Good Future.asm", "..\out\files\R13C__.MMD", , "Level\Palmtree Panic\Act 3 Good Future.lst"
%ASM68K% /e DEMO=0 "Level\Palmtree Panic\Act 3 Bad Future.asm", "..\out\files\R13D__.MMD", , "Level\Palmtree Panic\Act 3 Bad Future.lst"
%ASM68K% /e DEMO=1 "Level\Palmtree Panic\Act 1 Present.asm", "..\out\files\DEMO11A.MMD", , "Level\Palmtree Panic\Act 1 Present (Demo).lst"
%ASM68K% /e DEMO=0 "Level\Palmtree Panic\Act 1 Past.asm", "..\out\files\R11B__.MMD", , "Level\Palmtree Panic\Act 1 Past.lst"
%ASM68K% /e DEMO=0 "Level\Palmtree Panic\Act 1 Good Future.asm", "..\out\files\R11C__.MMD", , "Level\Palmtree Panic\Act 1 Good Future.lst"
%ASM68K% /e DEMO=0 "Level\Palmtree Panic\Act 1 Bad Future.asm", "..\out\files\R11D__.MMD", , "Level\Palmtree Panic\Act 1 Bad Future.lst"

%ASM68K% /e DEMO=0 "Level\Wacky Workbench\Act 1 Present.asm", "..\out\files\R61A__.MMD", , "Level\Wacky Workbench\Act 1 Present.lst"
%ASM68K% /e DEMO=0 "Level\Wacky Workbench\Act 1 Past.asm", "..\out\files\R61B__.MMD", , "Level\Wacky Workbench\Act 1 Past.lst"
%ASM68K% /e DEMO=0 "Level\Wacky Workbench\Act 1 Good Future.asm", "..\out\files\R61C__.MMD", , "Level\Wacky Workbench\Act 1 Good Future.lst"
%ASM68K% /e DEMO=0 "Level\Wacky Workbench\Act 1 Bad Future.asm", "..\out\files\R61D__.MMD", , "Level\Wacky Workbench\Act 1 Bad Future.lst"
%ASM68K% /e DEMO=0 "Level\Wacky Workbench\Act 2 Present.asm", "..\out\files\R62A__.MMD", , "Level\Wacky Workbench\Act 2 Present.lst"
%ASM68K% /e DEMO=0 "Level\Wacky Workbench\Act 2 Past.asm", "..\out\files\R62B__.MMD", , "Level\Wacky Workbench\Act 2 Past.lst"
%ASM68K% /e DEMO=0 "Level\Wacky Workbench\Act 2 Good Future.asm", "..\out\files\R62C__.MMD", , "Level\Wacky Workbench\Act 2 Good Future.lst"
%ASM68K% /e DEMO=0 "Level\Wacky Workbench\Act 2 Bad Future.asm", "..\out\files\R62D__.MMD", , "Level\Wacky Workbench\Act 2 Bad Future.lst"
%ASM68K% /e DEMO=0 "Level\Wacky Workbench\Act 3 Good Future.asm", "..\out\files\R63C__.MMD", , "Level\Wacky Workbench\Act 3 Good Future.lst"
%ASM68K% /e DEMO=0 "Level\Wacky Workbench\Act 3 Bad Future.asm", "..\out\files\R63D__.MMD", , "Level\Wacky Workbench\Act 3 Bad Future.lst"
%ASM68K% /e DEMO=0 "Level\Collision Chaos\Act 1 Present.asm", "..\out\files\R31A__.MMD", , "Level\Collision Chaos\Act 1 Present.lst"
%ASM68K% /e DEMO=0 "Level\Collision Chaos\Act 1 Past.asm", "..\out\files\R31B__.MMD", , "Level\Collision Chaos\Act 1 Past.lst"
%ASM68K% /e DEMO=0 "Level\Collision Chaos\Act 1 Good Future.asm", "..\out\files\R31C__.MMD", , "Level\Collision Chaos\Act 1 Good Future.lst"
%ASM68K% /e DEMO=0 "Level\Collision Chaos\Act 1 Bad Future.asm", "..\out\files\R31D__.MMD", , "Level\Collision Chaos\Act 1 Bad Future.lst"
%ASM68K% /e DEMO=0 "Level\Collision Chaos\Act 2 Present.asm", "..\out\files\R32A__.MMD", , "Level\Collision Chaos\Act 2 Present.lst"
%ASM68K% /e DEMO=0 "Level\Collision Chaos\Act 2 Past.asm", "..\out\files\R32B__.MMD", , "Level\Collision Chaos\Act 2 Past.lst"
%ASM68K% /e DEMO=0 "Level\Collision Chaos\Act 2 Good Future.asm", "..\out\files\R32C__.MMD", , "Level\Collision Chaos\Act 2 Good Future.lst"
%ASM68K% /e DEMO=0 "Level\Collision Chaos\Act 2 Bad Future.asm", "..\out\files\R32D__.MMD", , "Level\Collision Chaos\Act 2 Bad Future.lst"
%ASM68K% /e DEMO=0 "Level\Collision Chaos\Act 3 Good Future.asm", "..\out\files\R33C__.MMD", , "Level\Collision Chaos\Act 3 Good Future.lst"
%ASM68K% /e DEMO=0 "Level\Collision Chaos\Act 3 Bad Future.asm", "..\out\files\R33D__.MMD", , "Level\Collision Chaos\Act 3 Bad Future.lst"
%ASM68K% /e DEMO=0 "Level\Tidal Tempest\Act 1 Present.asm", "..\out\files\R41A__.MMD", , "Level\Tidal Tempest\Act 1 Present.lst"
%ASM68K% /e DEMO=0 "Level\Tidal Tempest\Act 1 Past.asm", "..\out\files\R41B__.MMD", , "Level\Tidal Tempest\Act 1 Past.lst"
%ASM68K% /e DEMO=0 "Level\Tidal Tempest\Act 1 Good Future.asm", "..\out\files\R41C__.MMD", , "Level\Tidal Tempest\Act 1 Good Future.lst"
%ASM68K% /e DEMO=0 "Level\Tidal Tempest\Act 1 Bad Future.asm", "..\out\files\R41D__.MMD", , "Level\Tidal Tempest\Act 1 Bad Future.lst"
%ASM68K% /e DEMO=0 "Level\Tidal Tempest\Act 2 Present.asm", "..\out\files\R42A__.MMD", , "Level\Tidal Tempest\Act 2 Present.lst"
%ASM68K% /e DEMO=0 "Level\Tidal Tempest\Act 2 Past.asm", "..\out\files\R42B__.MMD", , "Level\Tidal Tempest\Act 2 Past.lst"
%ASM68K% /e DEMO=0 "Level\Tidal Tempest\Act 2 Good Future.asm", "..\out\files\R42C__.MMD", , "Level\Tidal Tempest\Act 2 Good Future.lst"
%ASM68K% /e DEMO=0 "Level\Tidal Tempest\Act 2 Bad Future.asm", "..\out\files\R42D__.MMD", , "Level\Tidal Tempest\Act 2 Bad Future.lst"
%ASM68K% /e DEMO=0 "Level\Tidal Tempest\Act 3 Good Future.asm", "..\out\files\R43C__.MMD", , "Level\Tidal Tempest\Act 3 Good Future.lst"
%ASM68K% /e DEMO=0 "Level\Tidal Tempest\Act 3 Bad Future.asm", "..\out\files\R43D__.MMD", , "Level\Tidal Tempest\Act 3 Bad Future.lst"
%ASM68K% /e DEMO=1 "Level\Tidal Tempest\Act 3 Good Future.asm", "..\out\files\DEMO43C.MMD", , "Level\Tidal Tempest\Act 3 Good Future (Demo).lst"
%ASM68K% /e DEMO=0 "Level\Quartz Quadrant\Act 1 Present.asm", "..\out\files\R51A__.MMD", , "Level\Quartz Quadrant\Act 1 Present.lst"
%ASM68K% /e DEMO=0 "Level\Quartz Quadrant\Act 1 Past.asm", "..\out\files\R51B__.MMD", , "Level\Quartz Quadrant\Act 1 Past.lst"
%ASM68K% /e DEMO=0 "Level\Quartz Quadrant\Act 1 Good Future.asm", "..\out\files\R51C__.MMD", , "Level\Quartz Quadrant\Act 1 Good Future.lst"
%ASM68K% /e DEMO=0 "Level\Quartz Quadrant\Act 1 Bad Future.asm", "..\out\files\R51D__.MMD", , "Level\Quartz Quadrant\Act 1 Bad Future.lst"
%ASM68K% /e DEMO=0 "Level\Quartz Quadrant\Act 2 Present.asm", "..\out\files\R52A__.MMD", , "Level\Quartz Quadrant\Act 2 Present.lst"
%ASM68K% /e DEMO=0 "Level\Quartz Quadrant\Act 2 Past.asm", "..\out\files\R52B__.MMD", , "Level\Quartz Quadrant\Act 2 Past.lst"
%ASM68K% /e DEMO=0 "Level\Quartz Quadrant\Act 2 Good Future.asm", "..\out\files\R52C__.MMD", , "Level\Quartz Quadrant\Act 2 Good Future.lst"
%ASM68K% /e DEMO=0 "Level\Quartz Quadrant\Act 2 Bad Future.asm", "..\out\files\R52D__.MMD", , "Level\Quartz Quadrant\Act 2 Bad Future.lst"
%ASM68K% /e DEMO=0 "Level\Quartz Quadrant\Act 3 Good Future.asm", "..\out\files\R53C__.MMD", , "Level\Quartz Quadrant\Act 3 Good Future.lst"
%ASM68K% /e DEMO=0 "Level\Quartz Quadrant\Act 3 Bad Future.asm", "..\out\files\R53D__.MMD", , "Level\Quartz Quadrant\Act 3 Bad Future.lst"
%ASM68K% /e DEMO=0 "Level\Stardust Speedway\Act 1 Present.asm", "..\out\files\R71A__.MMD", , "Level\Stardust Speedway\Act 1 Present.lst"
%ASM68K% /e DEMO=0 "Level\Stardust Speedway\Act 1 Past.asm", "..\out\files\R71B__.MMD", , "Level\Stardust Speedway\Act 1 Past.lst"
%ASM68K% /e DEMO=0 "Level\Stardust Speedway\Act 1 Good Future.asm", "..\out\files\R71C__.MMD", , "Level\Stardust Speedway\Act 1 Good Future.lst"
%ASM68K% /e DEMO=0 "Level\Stardust Speedway\Act 1 Bad Future.asm", "..\out\files\R71D__.MMD", , "Level\Stardust Speedway\Act 1 Bad Future.lst"
%ASM68K% /e DEMO=0 "Level\Stardust Speedway\Act 2 Present.asm", "..\out\files\R72A__.MMD", , "Level\Stardust Speedway\Act 2 Present.lst"
%ASM68K% /e DEMO=0 "Level\Stardust Speedway\Act 2 Past.asm", "..\out\files\R72B__.MMD", , "Level\Stardust Speedway\Act 2 Past.lst"
%ASM68K% /e DEMO=0 "Level\Stardust Speedway\Act 2 Good Future.asm", "..\out\files\R72C__.MMD", , "Level\Stardust Speedway\Act 2 Good Future.lst"
%ASM68K% /e DEMO=0 "Level\Stardust Speedway\Act 2 Bad Future.asm", "..\out\files\R72D__.MMD", , "Level\Stardust Speedway\Act 2 Bad Future.lst"
%ASM68K% /e DEMO=0 "Level\Stardust Speedway\Act 3 Good Future.asm", "..\out\files\R73C__.MMD", , "Level\Stardust Speedway\Act 3 Good Future.lst"
%ASM68K% /e DEMO=0 "Level\Stardust Speedway\Act 3 Bad Future.asm", "..\out\files\R73D__.MMD", , "Level\Stardust Speedway\Act 3 Bad Future.lst"
%ASM68K% /e DEMO=0 "Level\Metallic Madness\Act 1 Present.asm", "..\out\files\R81A__.MMD", , "Level\Metallic Madness\Act 1 Present.lst"
%ASM68K% /e DEMO=0 "Level\Metallic Madness\Act 1 Past.asm", "..\out\files\R81B__.MMD", , "Level\Metallic Madness\Act 1 Past.lst"
%ASM68K% /e DEMO=0 "Level\Metallic Madness\Act 1 Good Future.asm", "..\out\files\R81C__.MMD", , "Level\Metallic Madness\Act 1 Good Future.lst"
%ASM68K% /e DEMO=0 "Level\Metallic Madness\Act 1 Bad Future.asm", "..\out\files\R81D__.MMD", , "Level\Metallic Madness\Act 1 Bad Future.lst"
%ASM68K% /e DEMO=0 "Level\Metallic Madness\Act 2 Present.asm", "..\out\files\R82A__.MMD", , "Level\Metallic Madness\Act 2 Present.lst"
%ASM68K% /e DEMO=1 "Level\Metallic Madness\Act 2 Present.asm", "..\out\files\DEMO82A.MMD", , "Level\Metallic Madness\Act 2 Present (Demo).lst"
%ASM68K% /e DEMO=0 "Level\Metallic Madness\Act 2 Past.asm", "..\out\files\R82B__.MMD", , "Level\Metallic Madness\Act 2 Past.lst"
%ASM68K% /e DEMO=0 "Level\Metallic Madness\Act 2 Good Future.asm", "..\out\files\R82C__.MMD", , "Level\Metallic Madness\Act 2 Good Future.lst"
%ASM68K% /e DEMO=0 "Level\Metallic Madness\Act 2 Bad Future.asm", "..\out\files\R82D__.MMD", , "Level\Metallic Madness\Act 2 Bad Future.lst"
%ASM68K% /e DEMO=0 "Level\Metallic Madness\Act 3 Good Future.asm", "..\out\files\R83C__.MMD", , "Level\Metallic Madness\Act 3 Good Future.lst"
%ASM68K% /e DEMO=0 "Level\Metallic Madness\Act 3 Bad Future.asm", "..\out\files\R83D__.MMD", , "Level\Metallic Madness\Act 3 Bad Future.lst"

%ASM68K% "Special Stage\Stage Data.asm", "Special Stage\Stage Data.bin", "Special Stage\Stage Data.sym"
..\bin\dumpasmsym.exe -m asm "Special Stage\Stage Data.sym" -o "Special Stage\Stage Data Labels.inc"
if exist "Special Stage\Stage Data.sym" ( del "Special Stage\Stage Data.sym" > nul )
%ASM68K% "Special Stage\Main.asm", "..\out\files\SPMM__.MMD", , "Special Stage\Main.lst"
%ASM68K% "Special Stage\Sub.asm", "..\out\files\SPSS__.BIN", , "Special Stage\Sub.lst"

echo.
echo Compiling filesystem...
..\bin\mkisofs.exe -quiet -abstract ABS.TXT -biblio BIB.TXT -copyright CPY.TXT -A "SEGA ENTERPRISES" -V "SONIC_CD___" -publisher "SEGA ENTERPRISES" -p "SEGA ENTERPRISES" -sysid "MEGA_CD" -iso-level 1 -o ..\out\misc\files.bin ..\out\files

%ASM68K% main.asm, ..\out\%OUTPUT%
del ..\out\misc\files.bin > nul

pause
