#!/bin/bash

# 设置UTF-8
export LANG=zh_CN.UTF-8

# 获取当前日期时间 YYYYMMDDHHMMSS
datetime=$(date +"%Y%m%d%H%M%S")

year=${datetime:0:4}
month=${datetime:4:2}
day=${datetime:6:2}
hour=${datetime:8:2}
minute=${datetime:10:2}
second=${datetime:12:2}


echo
echo "    ==========================    拉取成功    ===================="
echo

git pull

echo
echo "    =========================    当前文件状态    =================="
echo

git status


# 检查是否有待提交更改
git diff-index --quiet HEAD --

if [ $? -eq 0 ]; then
    echo
    echo "没有待提交的更改。"
    echo
    sleep 5
    exit 0
fi


git add .

echo
echo "    ==========================    添加成功    ===================="
echo


read -p "请输入提交信息：" userInput


defaultCommitMessage="$USER $userInput $year-$month-$day $hour:$minute:$second"


# notes目录
notesFolder="$HOME/桌面/notes"


cd "$notesFolder" || {
    echo "目录不存在：$notesFolder"
    exit 1
}


git commit -m "$defaultCommitMessage"


if [ $? -ne 0 ]; then
    echo "提交时出现错误，请检查并解决问题。"
    read -p "按回车退出..."
    exit 1
fi


echo
echo "    ==========================    提交成功    ===================="
echo


git push origin master


if [ $? -ne 0 ]; then
    echo "推送时出现错误，请检查并解决问题。"
    read -p "按回车退出..."
    exit 1
fi


echo
echo "    ==========================    上传成功    ===================="
echo

sleep 5