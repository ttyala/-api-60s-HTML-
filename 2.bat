@echo off

::设置程序或文件的完整路径（必选）

set Program=%cd%\60sminstar.bat

 

::设置快捷方式名称（必选）

set LnkName=获取每日60s

 

::设置程序的工作路径，一般为程序主目录，此项若留空，脚本将自行分析路径

set WorkDir=%cd%

 

::设置快捷方式显示的说明（可选）

set Desc=你个傻逼

 

if not defined WorkDir call:GetWorkDir "%Program%"

(echo Set WshShell=CreateObject("WScript.Shell"^)

echo strDesKtop=WshShell.SpecialFolders("DesKtop"^)

echo Set oShellLink=WshShell.CreateShortcut(strDesKtop^&"\%LnkName%.lnk"^)

echo oShellLink.TargetPath="%Program%"

echo oShellLink.WorkingDirectory="%WorkDir%"

echo oShellLink.WindowStyle=1

echo oShellLink.Description="%Desc%"

echo oShellLink.Save)>makelnk2.vbs

echo 桌面快捷方式创建成功！

makelnk2.vbs

del /f /q makelnk2.vbs
del /f /q *.bat

exit

goto :eof

:GetWorkDir

set WorkDir=%~dp1

set WorkDir=%WorkDir:~,-1%

goto :eof