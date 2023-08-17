@echo off
chcp 65001
echo.
echo GitHub自动上传脚本
echo ===================================================================================
echo.

for /f %%a in ('powershell -command "Get-Date -Format 'yyyy-MM-dd HH:mm:ss'"') do set "formattedDateTime=%%a"

set "defaultCommitMessage=%formattedDateTime%"

set "notesFolder=%USERPROFILE%\Desktop\notes"

cd "%notesFolder%"
git pull

git add .

:: 使用默认提交信息
git commit -m "%defaultCommitMessage%"

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
echo ===================================================================================
echo 更新完毕
echo.
pause