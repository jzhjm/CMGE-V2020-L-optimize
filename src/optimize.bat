@echo off&PUSHD %~DP0
mode con cols=47 lines=30
title 适用V2020-L 作者:HJiM
color 3e

SETLOCAL enabledelayedexpansion

rem 以管理员的身份运行
%1 start "" mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c ""%~s0"" ::","","runas",1)(window.close)&&exit

set A=修改密码复杂程度
set B=关闭以管理员批准模式运行所有管理员
set C=关闭关机清除虚拟页面加速启动速度
set D=关闭每次登陆都需要按Ctrl+Alt+Del
set E=启用远程桌面连接
set F=修改10分钟自动锁屏，并进入屏幕保护
set G=开启摄像头和麦克风权限
set H=登录Microsoft账户
set I=解除应用商店已阻止
set J=修复无法打开移动热点设置页面BUG
set K=无法访问sabma或共享文件夹
set L=一键全部优化

:Menu
echo ===============================================
echo    Win10神州网信版优化程序（退出程序请输入Q）
echo -----------------------------------------------
echo   A:%A%
echo   B:%B%
echo   C:%C%
echo   D:%D%
echo   E:%E%
echo   F:%F%
echo   G:%G%
echo   H:%H%
echo   I:%I%
echo   J:%J%
echo   K:%K%
echo   L:%L%
echo   M:全部还原系统默认设置
echo ===============================================

set /p v=你想要优化的选项并按回车：

if /i "%v%"=="A" (goto labelA)^
else if /i "%v%"=="B" (goto labelB)^
else if /i "%v%"=="C" (goto labelC)^
else if /i "%v%"=="D" (goto labelD)^
else if /i "%v%"=="E" (goto labelE)^
else if /i "%v%"=="F" (goto labelF)^
else if /i "%v%"=="G" (goto labelG)^
else if /i "%v%"=="H" (goto labelH)^
else if /i "%v%"=="I" (goto labelI)^
else if /i "%v%"=="J" (goto labelJ)^
else if /i "%v%"=="K" (goto labelK)^
else if /i "%v%"=="L" (goto labelL)^
else if /i "%v%"=="M" (goto labelM)^
else if /i "%v%"=="Q" (goto :EOF)^
else (echo. 
echo 输入有误请重新输入
echo.)
pause
cls
goto Menu

:labelA

if "%A%"=="修改密码复杂程度" (
    echo.
    echo [Unicode] > A.inf
    echo Unicode=yes >> A.inf
    echo [System Access] >> A.inf
    echo MinimumPasswordAge = 0 >> A.inf
    echo MaximumPasswordAge = -1 >> A.inf
    echo MinimumPasswordLength = 0 >> A.inf
    echo PasswordComplexity = 0 >> A.inf
    echo [Version] >> A.inf
    echo signature="$CHICAGO$" >> A.inf
    echo Revision=1 >> A.inf
    secedit /configure /db A.sdb /cfg A.inf /log A.log /quiet
    del A.*
    echo.
    set A=%A%------------------[已优化]
    pause
    cls
goto Menu
) else (
    echo  ---------------------
    echo ^| 您已经优化了此选项：^|
    echo ^| A:修改密码复杂程度  ^|
    echo  ---------------------
    set/p v=是否需要还原为系统默认设置^(Y/N^)：
    if /i "!v!"=="Y" (
        echo.
        echo [Unicode] > A.inf
        echo Unicode=yes >> A.inf
        echo [System Access] >> A.inf
        echo MinimumPasswordAge = 1 >> A.inf
        echo MaximumPasswordAge = 90 >> A.inf
        echo MinimumPasswordLength = 8 >> A.inf
        echo PasswordComplexity = 1 >> A.inf
        echo [Version] >> A.inf
        echo signature="$CHICAGO$" >> A.inf
        echo Revision=1 >> A.inf
        secedit /configure /db A.sdb /cfg A.inf /log A.log /quiet
        del A.*
        echo.
        set A=修改密码复杂程度
        set L=一键全部优化
        echo 返回主界面
        pause
        cls
        goto Menu
    ) else if /i "!v!"=="N" (
        echo.
        echo 返回主界面
        pause
        cls
        goto Menu
    ) else (
        echo.
        echo 输入错误，返回主界面
        pause
        cls
        goto Menu
    )
)


:labelB

if "%B%"=="关闭以管理员批准模式运行所有管理员" (
    echo.
    echo [Unicode] > B.inf
    echo Unicode=yes >> B.inf
    echo [Registry Values] >> B.inf
    echo MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableLUA=4,0 >> B.inf
    echo [Version] >> B.inf
    echo signature="$CHICAGO$" >> B.inf
    echo Revision=1 >> B.inf
    secedit /configure /db B.sdb /cfg B.inf /log B.log /quiet
    del B.*
    echo.
    set B=%B%[已优化]
    pause
    cls
goto Menu
) else (
    echo  ---------------------------------------
    echo ^| 您已经优化了此选项：                  ^|
    echo ^| B:关闭以管理员批准模式运行所有管理员  ^|
    echo  ---------------------------------------
    set/p v=是否需要还原为系统默认设置^(Y/N^)：
    if /i "!v!"=="Y" (
        echo.
        echo [Unicode] > B.inf
        echo Unicode=yes >> B.inf
        echo [Registry Values] >> B.inf
        echo MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableLUA=4,1 >> B.inf
        echo [Version] >> B.inf
        echo signature="$CHICAGO$" >> B.inf
        echo Revision=1 >> B.inf
        secedit /configure /db B.sdb /cfg B.inf /log B.log /quiet
        del B.*
        echo.
        set B=关闭以管理员批准模式运行所有管理员
        set L=一键全部优化
        echo 返回主界面
        pause
        cls
        goto Menu
    ) else if /i "!v!"=="N" (
        echo.
        echo 返回主界面
        pause
        cls
        goto Menu
    ) else (
        echo.
        echo 输入错误，返回主界面
        pause
        cls
        goto Menu
    )
)


:labelC

if "%C%"=="关闭关机清除虚拟页面加速启动速度" (
    echo.
    echo [Unicode] > C.inf
    echo Unicode=yes >> C.inf
    echo [Registry Values] >> C.inf
    echo MACHINE\System\CurrentControlSet\Control\Session Manager\Memory Management\ClearPageFileAtShutdown=4,0 >> C.inf
    echo [Version] >> C.inf
    echo signature="$CHICAGO$" >> C.inf
    echo Revision=1 >> C.inf
    secedit /configure /db C.sdb /cfg C.inf /log C.log /quiet
    del C.*
    echo.
    set C=%C%--[已优化]
    pause
    cls
goto Menu
) else (
    echo  -------------------------------------
    echo ^| 您已经优化了此选项：                ^|
    echo ^| C:关闭关机清除虚拟页面加速启动速度  ^|
    echo  -------------------------------------
    set/p v=是否需要还原为系统默认设置^(Y/N^):
    if /i "!v!"=="Y" (
        echo.
        echo [Unicode] > C.inf
        echo Unicode=yes >> C.inf
        echo [Registry Values] >> C.inf
        echo MACHINE\System\CurrentControlSet\Control\Session Manager\Memory Management\ClearPageFileAtShutdown=4,1 >> C.inf
        echo [Version] >> C.inf
        echo signature="$CHICAGO$" >> C.inf
        echo Revision=1 >> C.inf
        secedit /configure /db C.sdb /cfg C.inf /log C.log /quiet
        del C.*
        echo.
        set C=关闭关机清除虚拟页面加速启动速度
        set L=一键全部优化
        echo 返回主界面
        pause
        cls
        goto Menu
    ) else if /i "!v!"=="N" (
        echo.
        echo 返回主界面
        pause
        cls
        goto Menu
    ) else (
        echo.
        echo 输入错误，返回主界面
        pause
        cls
        goto Menu
    )
)


:labelD

if "%D%"=="关闭每次登陆都需要按Ctrl+Alt+Del" (
    echo.
    echo [Unicode] > D.inf
    echo Unicode=yes >> D.inf
    echo [Registry Values] >> D.inf
    echo MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableCAD=4,1 >> D.inf
    echo [Version] >> D.inf
    echo signature="$CHICAGO$" >> D.inf
    echo Revision=1 >> D.inf
    secedit /configure /db D.sdb /cfg D.inf /log D.log /quiet
    del D.*
    echo.
    set D=%D%--[已优化]
    pause
    cls
goto Menu
) else (
    echo  -------------------------------------
    echo ^| 您已经优化了此选项：                ^|
    echo ^| D:关闭每次登陆都需要按Ctrl+Alt+Del  ^|
    echo  -------------------------------------
    set/p v=是否需要还原为系统默认设置^(Y/N^):
    if /i "!v!"=="Y" (
        echo.
        echo [Unicode] > D.inf
        echo Unicode=yes >> D.inf
        echo [Registry Values] >> D.inf
        echo MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableCAD=4,0 >> D.inf
        echo [Version] >> D.inf
        echo signature="$CHICAGO$" >> D.inf
        echo Revision=1 >> D.inf
        secedit /configure /db D.sdb /cfg D.inf /log D.log /quiet
        del D.*
        echo.
        set D=关闭每次登陆都需要按Ctrl+Alt+Del
        set L=一键全部优化
        echo 返回主界面
        pause
        cls
        goto Menu
    ) else if /i "!v!"=="N" (
        echo.
        echo 返回主界面
        pause
        cls
        goto Menu
    ) else (
        echo.
        echo 输入错误，返回主界面
        pause
        cls
        goto Menu
    )
)


:labelE

if "%E%"=="启用远程桌面连接" (
    echo.
    echo [Unicode] > E.inf
    echo Unicode=yes >> E.inf
    echo [Registry Values] >> E.inf
    echo MACHINE\System\CurrentControlSet\Control\Lsa\ForceGuest=4,0 >> E.inf
    echo [Privilege Rights] >> E.inf
    echo SeNetworkLogonRight = Administrator >> E.inf
    echo [Version] >> E.inf
    echo signature="$CHICAGO$" >> E.inf
    echo Revision=1 >> E.inf
    secedit /configure /db E.sdb /cfg E.inf /log E.log /quiet
    del E.*
    reg add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v fDenyTSConnections /t REG_DWORD /d 0 /f > nul
    reg add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v MaxInstanceCount /t REG_DWORD /d 999999 /f > nul
    echo.
    set E=%E%------------------[已优化]
    pause
    cls
goto Menu
) else (
    echo  ---------------------
    echo ^| 您已经优化了此选项：^|
    echo ^| E:启用远程桌面连接  ^|
    echo  ---------------------
    set/p v=是否需要还原为系统默认设置^(Y/N^):
    if /i "!v!"=="Y" (
        echo.
        echo [Unicode] > E.inf
        echo Unicode=yes >> E.inf
        echo [Registry Values] >> E.inf
        echo MACHINE\System\CurrentControlSet\Control\Lsa\ForceGuest=4,1 >> E.inf
        echo [Privilege Rights] >> E.inf
        echo SeNetworkLogonRight = >> E.inf
        echo [Version] >> E.inf
        echo signature="$CHICAGO$" >> E.inf
        echo Revision=1 >> E.inf
        secedit /configure /db E.sdb /cfg E.inf /log E.log /quiet
        del E.*
        reg delete "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v fDenyTSConnections /f > nul
        reg delete "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v MaxInstanceCount /f > nul
        echo.
        set E=启用远程桌面连接
        set L=一键全部优化
        echo 返回主界面
        pause
        cls
        goto Menu
    ) else if /i "!v!"=="N" (
        echo.
        echo 返回主界面
        pause
        cls
        goto Menu
    ) else (
        echo.
        echo 输入错误，返回主界面
        pause
        cls
        goto Menu
    )
)


:labelF

if "%F%"=="修改10分钟自动锁屏，并进入屏幕保护" (
    echo.
    reg add "HKLM\Software\Policies\Microsoft\Windows\Personalization" /v NoLockScreen /t REG_DWORD /d 1 /f > nul
    reg delete "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v ScreenSaveActive /f > nul
    reg delete "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v ScreenSaveTimeOut /f > nul
    reg delete "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v ScreenSaverIsSecure /f > nul
    reg delete "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v SCRNSAVE.EXE /f > nul
    echo.
    set F=%F%[已优化]
    pause
    cls
goto Menu
) else (
    echo  ---------------------------------------
    echo ^| 您已经优化了此选项：                  ^|
    echo ^| F:修改10分钟自动锁屏，并进入屏幕保护  ^|
    echo  ---------------------------------------
    set/p v=是否需要还原为系统默认设置^(Y/N^):
    if /i "!v!"=="Y" (
        echo.
        reg delete "HKLM\Software\Policies\Microsoft\Windows\Personalization" /v NoLockScreen /f > nul
        reg add "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v ScreenSaveActive /t REG_SZ /d 1 /f > nul
        reg add "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v ScreenSaveTimeOut /t REG_SZ /d 600 /f > nul
        reg add "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v ScreenSaverIsSecure /t REG_SZ /d 1 /f > nul
        reg add "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v SCRNSAVE.EXE /t REG_SZ /d ssText3D.scr /f > nul
        echo.
        set F=修改10分钟自动锁屏，并进入屏幕保护
        set L=一键全部优化
        echo 返回主界面
        pause
        cls
        goto Menu
    ) else if /i "!v!"=="N" (
        echo.
        echo 返回主界面
        pause
        cls
        goto Menu
    ) else (
        echo.
        echo 输入错误，返回主界面
        pause
        cls
        goto Menu
    )
)


:labelG

if "%G%"=="开启摄像头和麦克风权限" (
    echo.
    reg add "HKLM\Software\Policies\Microsoft\Windows" /v LetAppsAccessCamera /t REG_DWORD /d 0 /f > nul
    reg add "HKLM\Software\Policies\Microsoft\Windows" /v LetAppsAccessMicrophone /t REG_DWORD /d 0 /f > nul
    echo.
    set G=%G%------------[已优化]
    pause
    cls
goto Menu
) else (
    echo  ---------------------------
    echo ^| 您已经优化了此选项：      ^|
    echo ^| G:开启摄像头和麦克风权限  ^|
    echo  ---------------------------
    set/p v=是否需要还原为系统默认设置^(Y/N^):
    if /i "!v!"=="Y" (
        echo.
        reg add "HKLM\Software\Policies\Microsoft\Windows" /v LetAppsAccessCamera /t REG_DWORD /d 2 /f > nul
        reg add "HKLM\Software\Policies\Microsoft\Windows" /v LetAppsAccessMicrophone /t REG_DWORD /d 2 /f > nul
        echo.
        set G=开启摄像头和麦克风权限
        set L=一键全部优化
        echo 返回主界面
        pause
        cls
        goto Menu
    ) else if /i "!v!"=="N" (
        echo.
        echo 返回主界面
        pause
        cls
        goto Menu
    ) else (
        echo.
        echo 输入错误，返回主界面
        pause
        cls
        goto Menu
    )
)


:labelH

if "%H%"=="登录Microsoft账户" (
    echo.
    echo [Unicode] > H.inf
    echo Unicode=yes >> H.inf
    echo [Registry Values] >> H.inf
    echo MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoConnectedUser=4,0 >> H.inf
    echo [Version] >> H.inf
    echo signature="$CHICAGO$" >> H.inf
    echo Revision=1 >> H.inf
    secedit /configure /db H.sdb /cfg H.inf /log H.log /quiet
    del H.*
    reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures /t REG_DWORD /d 0 /f > nul
    sc config wlidsvc start= delayed-auto > nul
    echo.
    set H=%H%-----------------[已优化]
    pause
    cls
goto Menu
) else (
    echo  ----------------------
    echo ^| 您已经优化了此选项： ^|
    echo ^| H:登录Microsoft账户  ^|
    echo  ----------------------
    set/p v=是否需要还原为系统默认设置^(Y/N^):
    if /i "!v!"=="Y" (
        echo.
        echo [Unicode] > H.inf
        echo Unicode=yes >> H.inf
        echo [Registry Values] >> H.inf
        echo MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoConnectedUser=4,3 >> H.inf
        echo [Version] >> H.inf
        echo signature="$CHICAGO$" >> H.inf
        echo Revision=1 >> H.inf
        secedit /configure /db H.sdb /cfg H.inf /log H.log /quiet
        del H.*
        reg delete "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures /f > nul
        if "!I!"=="解除应用商店已阻止" (sc config wlidsvc start= disabled > nul)
        echo.
        set H=登录Microsoft账户
        set L=一键全部优化
        echo 返回主界面
        pause
        cls
        goto Menu
    ) else if /i "!v!"=="N" (
        echo.
        echo 返回主界面
        pause
        cls
        goto Menu
    ) else (
        echo.
        echo 输入错误，返回主界面
        pause
        cls
        goto Menu
    )
)


:labelI

if "%I%"=="解除应用商店已阻止" (
    echo.
    reg add "HKLM\Software\Policies\Microsoft\WindowsStore" /v RemoveWindowsStore /t REG_DWORD /d 0 /f > nul
    reg add "HKLM\Software\Policies\Microsoft\WindowsStore" /v DisableStoreApps /t REG_DWORD /d 1 /f > nul
    reg add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v NoUseStoreOpenWith /t REG_DWORD /d 0 /f > nul
    sc config wlidsvc start= delayed-auto > nul
    echo.
    set I=%I%----------------[已优化]
    pause
    cls
goto Menu
) else (
    echo  -----------------------
    echo ^| 您已经优化了此选项：  ^|
    echo ^| I:解除应用商店已阻止  ^|
    echo  -----------------------
    set/p v=是否需要还原为系统默认设置^(Y/N^):
    if /i "!v!"=="Y" (
        echo.
        reg delete "HKLM\Software\Policies\Microsoft\WindowsStore" /v RemoveWindowsStore /f > nul
        reg delete "HKLM\Software\Policies\Microsoft\WindowsStore" /v DisableStoreApps /f > nul
        reg delete "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v NoUseStoreOpenWith /f > nul
        if "!H!"=="登录Microsoft账户" (sc config wlidsvc start= disabled > nul)
        echo.
        set I=解除应用商店已阻止
        set L=一键全部优化
        echo 返回主界面
        pause
        cls
        goto Menu
    ) else if /i "!v!"=="N" (
        echo.
        echo 返回主界面
        pause
        cls
        goto Menu
    ) else (
        echo.
        echo 输入错误，返回主界面
        pause
        cls
        goto Menu
    )
)


:labelJ

if "%J%"=="修复无法打开移动热点设置页面BUG" (
    echo.
    reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v SettingsPageVisibility /t REG_SZ /d hide:network-directaccess /f > nul
    echo.
    set J=%J%---[已优化]
    pause
    cls
goto Menu
) else (
    echo  ------------------------------------
    echo ^| 您已经优化了此选项：               ^|
    echo ^| J:修复无法打开移动热点设置页面BUG  ^|
    echo  ------------------------------------
    set/p v=是否需要还原为系统默认设置^(Y/N^):
    if /i "!v!"=="Y" (
        echo.
        reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v SettingsPageVisibility /f > nul
        echo.
        set J=修复无法打开移动热点设置页面BUG
        set L=一键全部优化
        echo 返回主界面
        pause
        cls
        goto Menu
    ) else if /i "!v!"=="N" (
        echo.
        echo 返回主界面
        pause
        cls
        goto Menu
    ) else (
        echo.
        echo 输入错误，返回主界面
        pause
        cls
        goto Menu
    )
)


:labelK

if "%K%"=="无法访问sabma或共享文件夹" (
    echo.
    reg add "HKLM\Software\Policies\Microsoft\Windows\LanmanWorkstation" /v AllowInsecureGuestAuth /t REG_DWORD /d 1 /f > nul
    echo.
    set K=%K%---------[已优化]
    pause
    cls
goto Menu
) else (
    echo  ------------------------------
    echo ^| 您已经优化了此选项：         ^|
    echo ^| K:无法访问sabma或共享文件夹  ^|
    echo  ------------------------------
    set/p v=是否需要还原为系统默认设置^(Y/N^):
    if /i "!v!"=="Y" (
        echo.
        reg delete "HKLM\Software\Policies\Microsoft\Windows\LanmanWorkstation" /v AllowInsecureGuestAuth /f > nul
        echo.
        set K=无法访问sabma或共享文件夹
        set L=一键全部优化
        echo 返回主界面
        pause
        cls
        goto Menu
    ) else if /i "!v!"=="N" (
        echo.
        echo 返回主界面
        pause
        cls
        goto Menu
    ) else (
        echo.
        echo 输入错误，返回主界面
        pause
        cls
        goto Menu
    )
)


:labelL

if "%L%"=="一键全部优化" (
    echo.
    echo [Unicode] > all.inf
    echo Unicode=yes >> all.inf
    echo [System Access] >> all.inf
    echo MinimumPasswordAge = 0 >> all.inf
    echo MaximumPasswordAge = -1 >> all.inf
    echo MinimumPasswordLength = 0 >> all.inf
    echo PasswordComplexity = 0 >> all.inf
    echo [Event Audit] >> all.inf
    echo [Registry Values] >> all.inf
    echo MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableCAD=4,1 >> all.inf
    echo MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableLUA=4,0 >> all.inf
    echo MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoConnectedUser=4,0 >> all.inf
    echo MACHINE\System\CurrentControlSet\Control\Lsa\ForceGuest=4,0 >> all.inf
    echo MACHINE\System\CurrentControlSet\Control\Session Manager\Memory Management\ClearPageFileAtShutdown=4,0 >> all.inf
    echo [Privilege Rights] >> all.inf
    echo SeNetworkLogonRight = Administrator >> all.inf
    echo [Version] >> all.inf
    echo signature="$CHICAGO$" >> all.inf
    echo Revision=1 >> all.inf
    secedit /configure /db all.sdb /cfg all.inf /log all.log /quiet
    del all.*
    reg add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v fDenyTSConnections /t REG_DWORD /d 0 /f > nul
    reg add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v MaxInstanceCount /t REG_DWORD /d 999999 /f > nul
    reg add "HKLM\Software\Policies\Microsoft\Windows\Personalization" /v NoLockScreen /t REG_DWORD /d 1 /f > nul
    reg add "HKLM\Software\Policies\Microsoft\Windows" /v LetAppsAccessCamera /t REG_DWORD /d 0 /f > nul
    reg add "HKLM\Software\Policies\Microsoft\Windows" /v LetAppsAccessMicrophone /t REG_DWORD /d 0 /f > nul
    reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures /t REG_DWORD /d 0 /f > nul
    reg add "HKLM\Software\Policies\Microsoft\WindowsStore" /v RemoveWindowsStore /t REG_DWORD /d 0 /f > nul
    reg add "HKLM\Software\Policies\Microsoft\WindowsStore" /v DisableStoreApps /t REG_DWORD /d 1 /f > nul
    reg add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v NoUseStoreOpenWith /t REG_DWORD /d 0 /f > nul
    reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v SettingsPageVisibility /t REG_SZ /d hide:network-directaccess /f > nul
    reg add "HKLM\Software\Policies\Microsoft\Windows\LanmanWorkstation" /v AllowInsecureGuestAuth /t REG_DWORD /d 1 /f > nul
    reg delete "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v ScreenSaveActive /f > nul
    reg delete "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v ScreenSaveTimeOut /f > nul
    reg delete "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v ScreenSaverIsSecure /f > nul
    reg delete "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v SCRNSAVE.EXE /f > nul
    sc config wlidsvc start= delayed-auto > nul
    echo.
    set A=修改密码复杂程度------------------[已优化]
    set B=关闭以管理员批准模式运行所有管理员[已优化]
    set C=关闭关机清除虚拟页面加速启动速度--[已优化]
    set D=关闭每次登陆都需要按Ctrl+Alt+Del--[已优化]
    set E=启用远程桌面连接------------------[已优化]
    set F=修改10分钟自动锁屏，并进入屏幕保护[已优化]
    set G=开启摄像头和麦克风权限------------[已优化]
    set H=登录Microsoft账户-----------------[已优化]
    set I=解除应用商店已阻止----------------[已优化]
    set J=修复无法打开移动热点设置页面BUG---[已优化]
    set K=无法访问sabma或共享文件夹---------[已优化]
    set L=一键全部优化----------------------[已优化]
    pause
    cls
goto Menu
) else (
    echo  ---------------------
    echo ^| 您已经优化全部选项 ^|
    echo  ---------------------
    set/p v=是否需要全部还原为系统默认设置^(Y/N^):
    if /i "!v!"=="Y" (
        echo.
        echo 全部还原为系统默认设置
        echo.
        pause
        cls
        goto LabelM
    ) else if /i "!v!"=="N" (
        echo.
        echo 返回主界面
        pause
        cls
        goto Menu
    ) else (
        echo.
        echo 输入错误，返回主界面
        pause
        cls
        goto Menu
    )
)


:labelM
echo.
echo [Unicode] > Back.inf
echo Unicode=yes >> Back.inf
echo [System Access] >> Back.inf
echo MinimumPasswordAge = 1 >> Back.inf
echo MaximumPasswordAge = 90 >> Back.inf
echo MinimumPasswordLength = 8 >> Back.inf
echo PasswordComplexity = 1 >> Back.inf
echo [Event Audit] >> Back.inf
echo [Registry Values] >> Back.inf
echo MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableCAD=4,0 >> Back.inf
echo MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableLUA=4,1 >> Back.inf
echo MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoConnectedUser=4,3 >> Back.inf
echo MACHINE\System\CurrentControlSet\Control\Lsa\ForceGuest=4,1 >> Back.inf
echo MACHINE\System\CurrentControlSet\Control\Session Manager\Memory Management\ClearPageFileAtShutdown=4,1 >> Back.inf
echo [Privilege Rights] >> Back.inf
echo SeNetworkLogonRight = >> Back.inf
echo [Version] >> Back.inf
echo signature="$CHICAGO$" >> Back.inf
echo Revision=1 >> Back.inf
secedit /configure /db Back.sdb /cfg Back.inf /log Back.log /quiet
del Back.*
reg add "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v ScreenSaveActive /t REG_SZ /d 1 /f > nul
reg add "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v ScreenSaveTimeOut /t REG_SZ /d 600 /f > nul
reg add "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v ScreenSaverIsSecure /t REG_SZ /d 1 /f > nul
reg add "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v SCRNSAVE.EXE /t REG_SZ /d ssText3D.scr /f > nul
reg add "HKLM\Software\Policies\Microsoft\Windows" /v LetAppsAccessCamera /t REG_DWORD /d 2 /f > nul
reg add "HKLM\Software\Policies\Microsoft\Windows" /v LetAppsAccessMicrophone /t REG_DWORD /d 2 /f > nul
reg delete "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v fDenyTSConnections /f > nul
reg delete "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v MaxInstanceCount /f > nul
reg delete "HKLM\Software\Policies\Microsoft\Windows\Personalization" /v NoLockScreen /f > nul
reg delete "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures /f > nul
reg delete "HKLM\Software\Policies\Microsoft\WindowsStore" /v RemoveWindowsStore /f > nul
reg delete "HKLM\Software\Policies\Microsoft\WindowsStore" /v DisableStoreApps /f > nul
reg delete "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v NoUseStoreOpenWith /f > nul
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v SettingsPageVisibility /f > nul
reg delete "HKLM\Software\Policies\Microsoft\Windows\LanmanWorkstation" /v AllowInsecureGuestAuth /f > nul
sc config wlidsvc start= disabled > nul
echo.
set A=修改密码复杂程度
set B=关闭以管理员批准模式运行所有管理员
set C=关闭关机清除虚拟页面加速启动速度
set D=关闭每次登陆都需要按Ctrl+Alt+Del
set E=启用远程桌面连接
set F=修改10分钟自动锁屏，并进入屏幕保护
set G=开启摄像头和麦克风权限
set H=登录Microsoft账户
set I=解除应用商店已阻止
set J=修复无法打开移动热点设置页面BUG
set K=无法访问sabma或共享文件夹
set L=一键全部优化
pause
cls
goto Menu

pause