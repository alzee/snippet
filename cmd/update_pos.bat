@echo off

set "start=10000"
set "cmd=%server%\cmd"
set "update_log=pos_update.log"
echo ϵͳ������ ... �Եȣ�����رձ����ڣ�
if not exist %update_log% echo %start%> %update_log%
for /F %%i in (%update_log%) do set /a ver=%%i+1
goto :%ver%
exit /b

:10001
call %cmd%\cp_pos_bat
call %cmd%\create_lnk
call %cmd%\copy %server%\pos\ybDevice.702.dll ybDevice.dll
call %cmd%\rm_alipay_logs
call %cmd%\cp_sed
call %cmd%\append_rcb
call %cmd%\del_old_files
echo 10001>> %update_log%

REM ɾ��������ļ�
:10002
call %cmd%\is_xp
if %errorlevel% equ 0 (
set "desktop=%USERPROFILE%\����"
) else (
set "desktop=%USERPROFILE%\Desktop"
)
del "%desktop%\ybdevice314.exe" 2>nul
del "%desktop%\��������314.exe" 2>nul
del "%desktop%\ybDevice.exe" 2>nul
echo 10002>> %update_log%

REM �� pos.bat �м����˰汾�ţ�����ԭ�ļ�
:10003
call %cmd%\cp_pos_bat
echo 10003>> %update_log%

REM ��� "UNC ·������֧��"
:10004

REM �� 10.203 �滻Ϊ 200.9
:10005
