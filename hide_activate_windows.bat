:: https://github.com/OnyxDeveploment/hide-window-activation
:: https://www.freecodecamp.org/news/how-to-get-rid-of-the-activate-windows-watermark-windows-10-pc-activation-message-removal/#heading-how-to-get-rid-of-the-activate-windows-watermark-with-powershell

@echo off
:: Batch file to hide "Activate Windows" watermark by modifying registry keys
:: Run as Administrator for proper execution

:: Check if running as Administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo This script requires Administrator privileges.
    echo Please right-click the file and select "Run as administrator".
    pause
    exit /b
)

:: Set the registry keys to hide the watermark
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform\Activation" /v "Manual" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform\Activation" /v "NotificationDisabled" /t REG_DWORD /d 1 /f

:: Prompt to restart the computer
echo Registry keys have been updated successfully.
echo.
choice /c YN /m "Do you want to restart your computer now to apply changes? (Y/N)"
if errorlevel 2 (
    echo You chose not to restart. Changes will take effect after the next restart.
    pause
    exit /b
)
if errorlevel 1 (
    shutdown /r /t 0
)
