:: Copy pos.bat to local d:\KSOA POS\
:cp_pos_bat
echo ��װ pos.bat ...
copy /Y "%server%\pos\pos.bat" > nul
exit /b %errorlevel%