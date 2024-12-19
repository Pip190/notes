@echo off
>NUL chcp 65001
:: 获取当前日期和时间，格式化为 "YYYY-MM-DD HH:MM:SS"
rem for /f "delims=" %%a in ('wmic os get localdatetime ^| find "."') do set "datetime=%%a"
for /f "delims=" %%a in ('powershell -Command "Get-Date -Format yyyyMMddHHmmss"') do set "datetime=%%a"
set "year=%datetime:~0,4%"
set "month=%datetime:~4,2%"
set "day=%datetime:~6,2%"
set "hour=%datetime:~8,2%"
set "minute=%datetime:~10,2%"
set "second=%datetime:~12,2%"

echo.
echo        ==========================    拉取成功    ====================
echo.
git pull
echo.
echo        =========================    当前文件状态    ==================
echo.
git status

:: 检查是否有待提交的更改
git diff-index --quiet HEAD --
if %errorlevel% equ 0 (
    echo.
    echo 没有待提交的更改。
    echo.
    timeout /t 5 
    exit /b
)

git add .
echo.
echo        ==========================    添加成功    ====================
echo.
set /p userInput=请输入提交信息：
set "defaultCommitMessage=%USERNAME% %userInput% %year%-%month%-%day% %hour%:%minute%:%second%"
set "notesFolder=%USERPROFILE%\Desktop\notes"
cd "%notesFolder%"
git commit -m "%defaultCommitMessage%"
if errorlevel 1 (
    echo 提交时出现错误。请检查并解决问题。
    pause
    exit /b
)
echo.
echo        ==========================    提交成功    ====================
echo.
git push origin master
if errorlevel 1 (
    echo 推送时出现错误。请检查并解决问题。
    pause
    exit /b
)
echo.
echo        ==========================    上传成功    ====================
echo.
timeout /t 5 