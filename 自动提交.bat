@echo off
chcp 65001
echo.
echo GitHub自动上传脚本
echo ===================================================================================
echo.

:: 获取当前日期和时间，格式化为 "YYYY-MM-DD HH:MM:SS"
for /f "delims=" %%a in ('wmic os get localdatetime ^| find "."') do set "datetime=%%a"
set "year=%datetime:~0,4%"
set "month=%datetime:~4,2%"
set "day=%datetime:~6,2%"
set "hour=%datetime:~8,2%"
set "minute=%datetime:~10,2%"
set "second=%datetime:~12,2%"
set "formattedDateTime=%year%-%month%-%day% %hour%:%minute%:%second%"

set "defaultCommitMessage=Auto commit - %formattedDateTime%"

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