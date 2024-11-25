@echo off
>NUL chcp 65001
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
git commit -m "测试提交"
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