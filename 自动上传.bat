@echo off

echo.
echo                                      GitHub自动上传脚本
echo ===================================================================================
echo.

set /p branch=master
set /p change=上传
echo.
cd "C:\Users\ASUS\Desktop\notes"

git pull
git add .
git commit -m %change%
git push origin %branch%

echo.
echo ===================================================================================
echo                                      更新完毕
echo.

pause