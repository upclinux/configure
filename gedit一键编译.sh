#!/bin/sh

# 此脚本用于 gedit 的“外部工具”插件，可自行指定快捷键
# 适用于<单文件>的 C/C++/Python/bash
# 注意：你的程序结尾需要一个暂停语句，否则运行起来，一闪而过

dir=$GEDIT_CURRENT_DOCUMENT_DIR
filename=$GEDIT_CURRENT_DOCUMENT_NAME
for ex in c cpp py sh; do
    name=`basename "$filename" .$ex`
    echo "$dir/$name.$ex == $GEDIT_CURRENT_DOCUMENT_PATH"
    if [ "$dir/$name.$ex" == "$GEDIT_CURRENT_DOCUMENT_PATH" ]; then
        lang=$ex
        break
    fi
done
echo $lang
f="$dir/$name"

case $lang in
    c)
        gcc "$path" -o "$name"
        gnome-terminal -e "$f" --working-directory=$dir
        ;;
    cpp)
        g++ "$path" -o "$name"
        gnome-terminal -e "$f" --working-directory=$dir
        ;;
    py)
        gnome-terminal -e "python \"$filename\"" --working-directory=$dir
        ;;
    sh)
        chmod +x $filename
        gnome-terminal -e "./$filename" --working-directory=$dir
    ;;
esac
