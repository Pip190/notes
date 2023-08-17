@@echo off
chcp 65001
echo.
echo                                      GitHub自动上传脚本
echo ===================================================================================
echo.

set /p change=请输入commit名：
echo.
cd "%USERPROFILE%\Desktop\notes"

git pull
git add .
git commit -m %change%
git push origin master

echo.
echo ===================================================================================
echo                                      更新完毕
echo.

pause
echo "--------上传完成--------"
pause