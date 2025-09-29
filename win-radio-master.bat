@echo off
:title

:: Create a JS file
echo var objFolder = (new ActiveXObject("Shell.Application")).BrowseForFolder(0, "Specify the directory to save the files", 0);>>browse_dir.js
echo if (objFolder) WScript.StdOut.Write(objFolder.Self.Path);>>browse_dir.js

title win-radio-master
del /f /s /q %tmp%\*.m3u
cls
IF NOT EXIST "%programfiles(x86)%\streamripper\streamripper.exe" start "get" /wait "http://sourceforge.net/project/showfiles.php?group_id=6172&package_id=258843"

:: Checking the file settings for saving the path for recording
IF NOT EXIST %userprofile%\radio_save_dir goto browse_new_radio_save_dir
IF EXIST %userprofile%\radio_save_dir goto start_radio_save_dir

:: If the file exists, we take the path to save from it.
:start_radio_save_dir
chcp 1251 > nul
for /f "usebackq tokens=* delims=" %%i In ("%userprofile%\radio_save_dir") do set file_save_dir=%%i
chcp 866 > nul

:: Delete the JS file
del /f /s /q browse_dir.js
cls

:: TITLE


echo.
echo RADIO RECORDS
echo.
echo [1] Synthwave - The Future Is Now
echo [2] Ambient Radio - Ambient Chillout Sphere Trance 
echo [3] Synthetic FM - Tuptsu - This Code Is Running Dry
echo [4] AmbientRadio.net (MRG.fm) - A Commercial-Free Listeners-Supported Station
echo [5] Vaporwave - Vaporwave and Sythwave.
echo [6] "Panorama 80 - Synthpop, Pop & New Wave, Italo-Disco, Electro, EBM."
echo [7] Darksynth-Radio - Exquisite handpicked dark synth sound for the soul!
echo [8] prawy brzeg - 7 dzielnic, jedna fala
echo [9] XWAVE Radio - Eclectic, electronic radio. 24/7. Tune in!
echo [a] HardCoreRadio.nl - Hard Core
echo [b] anotherplanet.fm ambient radio - English
echo [c] Ambient Art Sound - Take an ambient break
echo [d] 181.FM - Bluegrass
echo [e] Country - Dustin Lynch - Ridin’ Roads
echo.
echo [0] Exit
echo.
echo ==================================================

SET /P startradio= Enter your choice:

:: CHECK

FOR %%G IN ("1"
            "2"
            "3"
            "4"
            "5"
            "6"
            "7"
            "8"
            "9"
            "a"
            "b"
            "c"
            "d"
            "e"
			"0") DO (
            IF /I "%startradio%"=="%%~G" GOTO start
)

exit



echo.

:start
SET tm=%time%
SET tm=%tm::=.%
SET tm=%tm:,=.%
SET tm=%tm: =0%
SET h=%tm:~0,-9%
SET m=%tm:~3,-6%
SET s=%tm:~6,-3%
SET dt=%date%
SET yyyy=%dt:~-4%
SET mm=%dt:~3,-5%
IF %mm%==01 SET mm=Jan
IF %mm%==02 SET mm=Feb
IF %mm%==03 SET mm=Mar
IF %mm%==04 SET mm=Apr
IF %mm%==05 SET mm=May
IF %mm%==06 SET mm=Jun
IF %mm%==07 SET mm=Jul
IF %mm%==08 SET mm=Aug
IF %mm%==09 SET mm=Sep
IF %mm%==10 SET mm=Oct
IF %mm%==11 SET mm=Nov
IF %mm%==12 SET mm=Dec
SET dd=%dt:~0,-8%

SET sr="%programfiles(x86)%\streamripper\streamripper.exe"
::SET dir="%file_save_dir%\%yyyy%.%dt:~3,-5%[%mm%].%dd%_(%h%.%m%.%s%)"
SET dir="%file_save_dir%\%yyyy%-%dt:~3,-5%-%dd%_-_%h%-%m%"
SET re=127.0.0.1:800

:: URL 

IF %startradio%==1 SET url="https://synthwave.stream.laut.fm/synthwave"
IF %startradio%==2 SET url="https://ambient.stream.laut.fm/ambient"
IF %startradio%==3 SET url="http://stream.syntheticfm.com:8040/live"
IF %startradio%==4 SET url="http://listen.mrg.fm:8888/stream"
IF %startradio%==5 SET url="https://vaporwave.stream.laut.fm/vaporwave"
IF %startradio%==6 SET url="https://panorama80.stream.laut.fm/panorama80"
IF %startradio%==7 SET url="https://darksynthradio.stream.laut.fm/darksynthradio"
IF %startradio%==8 SET url="https://s3.slotex.pl/shoutcast/7166/listen.xtl"
IF %startradio%==9 SET url="http://vps-260b74e9.vps.ovh.net:8000/"
IF %startradio%==a SET url="http://81.18.165.238"
IF %startradio%==b SET url="http://stream.anotherplanet.fm:8000/stream.mp3"
IF %startradio%==c SET url="https://ambientartsound.skydesignltd.com:8000/radio.mp3"
IF %startradio%==d SET url="http://uplink.duplexfx.com:8016/"
IF %startradio%==e SET url="https://country.stream.laut.fm/country"
IF %startradio%==0 goto exit


:: User-Agent
SET ua="VLC/2.2.6 LibVLC/2.2.6"

::To open stream in player
::SET station=%tmp%\%startradio%.m3u
::echo http://%re%>> %station%
::start "radio" /i %station%

:: To open stream in Browser
start explorer %url%

%sr% %url% -u %ua% -d %dir% -i -r %re%



goto start

:: If there is no file with settings for saving paths, create it and send it to the beginning
:browse_new_radio_save_dir
chcp 1251 > nul
FOR /F "tokens=*" %%i IN ('cscript /nologo browse_dir.js') DO SET file_save_dir=%%i
echo %file_save_dir%>%userprofile%\radio_save_dir
chcp 866 > nul
attrib +h %userprofile%\radio_save_dir
goto title

:exit
exit
