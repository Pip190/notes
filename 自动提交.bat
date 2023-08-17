@echo off
chcp 65001
for /f %%a in ('powershell -command "Get-Date -Format 'yyyy-MM-dd HH:mm:ss'"') do set "formattedDateTime=%%a"
set "defaultCommitMessage=%formattedDateTime%"
set "notesFolder=%USERPROFILE%\Desktop\notes"
cd "%notesFolder%"
git pull
git add .
echo.
echo====================    拉取、添加成功    ================
echo.
git commit -m "%defaultCommitMessage%"
echo.
echo====================    提交成功    ====================
echo.
if errorlevel 1 (
    echo 提交时出现错误。请检查并解决问题。
    pause
    exit /b
)
git push origin master
if errorlevel 1 (
    echo 推送时出现错误。请检查并解决问题。
    pause
    exit /b
)
echo.
echo====================    上传成功    ====================
echo.
pause