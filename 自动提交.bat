@echo off
chcp 65001
echo.
echo GitHub自动上传脚本
echo ===================================================================================
echo.

:: 获取当前日期和时间作为默认提交信息
for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set "currentDate=%%c-%%a-%%b")
for /f "tokens=1-2 delims=: " %%a in ('time /t') do (set "currentTime=%%a%%b")
set "defaultCommitMessage=Auto commit - %currentDate% %currentTime%"

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