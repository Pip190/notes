@echo off
chcp 65001
for /f %%a in ('powershell -command "Get-Date -Format 'yyyy-MM-dd HH:mm:ss'"') do set "formattedDateTime=%%a"
set "defaultCommitMessage=%formattedDateTime%"
set "notesFolder=%USERPROFILE%\Desktop\notes"
cd "%notesFolder%"
git pull
git add .
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
echo                                                    上传成功
pause