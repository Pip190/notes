@echo off
>NUL chcp 65001
:: 获取当前日期和时间，格式化为 "YYYY-MM-DD HH:MM:SS"
for /f "tokens=2-4 delims=/ " %%a in ('powershell -Command "Get-Date -Format yyyy-MM-dd HH:mm:ss"') do ( 
       set "year=%%a" 
       set "month=%%b" 
       set "day=%%c" 
   ) 
   for /f "tokens=1-3 delims=: " %%a in ('powershell -Command "Get-Date -Format HH:mm:ss"') do ( 
       set "hour=%%a" 
       set "minute=%%b" 
       set "second=%%c" 
   ) 
   set "defaultCommitMessage=%USERNAME%  %year%-%month%-%day% %hour%:%minute%:%second%"
set "notesFolder=%USERPROFILE%\Desktop\notes"
cd "%notesFolder%"
echo.
echo ==========================    拉取成功    ====================
echo.
git pull
echo.
echo =========================    当前文件状态    ==================
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
echo ==========================    添加成功    ====================
echo.
git commit -m "%defaultCommitMessage%"
if errorlevel 1 (
    echo 提交时出现错误。请检查并解决问题。
    pause
    exit /b
)
echo.
echo ==========================    提交成功    ====================
echo.
git push origin master
if errorlevel 1 (
    echo 推送时出现错误。请检查并解决问题。
    pause
    exit /b
)
echo.
echo ==========================    上传成功    ====================
echo.
timeout /t 5 