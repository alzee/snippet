:del_old_files
if not exist %windir%\system32\forfiles.exe call %cmd%\cp_forfiles
echo ɾ������־�ļ����������Ҫ3�������ң����ĵȴ�������رձ����ڣ���
forfiles /p "%pos_path%\Logs" /D -60 /C "cmd /c del @path"
exit /b %errorlevel%