:: Create lnk of pos.bat to desktop if not exist

:create_lnk
echo ��������ݷ�ʽ ...
call %cmd%\is_xp
if %errorlevel% equ 0 (
set "pos_lnk_old=%USERPROFILE%\����\%pos_exe%.lnk"
set "pos_lnk=%USERPROFILE%\����\%pos_bat%.lnk"
) else (
set "pos_lnk_old=%USERPROFILE%\Desktop\%pos_exe%.lnk"
set "pos_lnk=%USERPROFILE%\Desktop\%pos_bat%.lnk"
)
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%pos_lnk_old%" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%pos_path%\%pos_bat%" >> %SCRIPT%
echo oLink.IconLocation = "%pos_path%\%pos_exe%" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del %SCRIPT%

exit /b %errorlevel%