@echo off

set rcb_txt=%server%\pos\rcb.txt
set setup_ini=setup.ini
set pos_ini=pos_set\POSdevice.ini
set yb_ini=pos_set\ybDevice.ini
for /f "delims== tokens=2" %%i in ('find /i "fdbs=" "%setup_ini%"') do set fdbs=%%i
for /f "delims== tokens=2" %%i in ('find /i "�����ʶ=" "%pos_ini%"') do set fdbs1=%%i

:: if fdbs in setup.ini and POSdevice.ini not same, POSdevice.ini is right
if not %fdbs% == %fdbs1% (
sed -i "/fdbs=/s/%fdbs%/%fdbs1%/" %setup_ini%
:: remove sedXXXX temporary files
del sed*
set fdbs=%fdbs%
)

:: get %termid%
for /f "delims=: tokens=2" %%i in ('find /i "%fdbs%:" %rcb_txt%') do set termid=%%i

:: append
:: need to avoid spaces in path
for /f "tokens=3" %%f in ('find /c "ũ����ɨ��" "%yb_ini%"') do set count=%%f
if %count% == 0 (
echo ���ũ���нӿ����� ... �ն˺� %termid%
echo.>> %yb_ini%
echo.>> %yb_ini%
echo [ũ����ɨ��]>> %yb_ini%
echo URL=http://192.168.10.203:8086/api/values>> %yb_ini%
echo �ն˺�=%termid%>> %yb_ini%
echo ��Կ=>> %yb_ini%
)