@echo off
set "server=\\192.168.10.55\s"
set "cmd=%server%\cmd"

call %cmd%\is_xp
if %errorlevel% equ 0 (
set "desktop=%USERPROFILE%\����"
set "alldesktop=C:\Documents and Settings\All Users\����"
) else (
set "desktop=%USERPROFILE%\Desktop"
set "alldesktop=C:\Users\Public\Desktop"
)

del "%alldesktop%\ʮ��ҽ�����������Ϣ����ϵͳ.url" 2> nul
del "%alldesktop%\ҽ�����������Ϣ����ϵͳ.url" 2> nul
copy %server%\public\ʮ��ҽ�����������Ϣ����ϵͳ.lnk "%desktop%\ҽ��.lnk"

pause
