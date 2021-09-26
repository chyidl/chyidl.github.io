#!/usr/bin/env sh

######################################################################
# @author      : chyiyaqing (404@gmail.com)
# @file        : show_process_score
# @created     : Sunday Sep 26, 2021 23:19:25 CST
#
# @description : 查看当前系统中所有进程OOM优先级的得分
######################################################################

for proc in $(find /proc -maxdepth 1 -regex '/proc/[0-9]+'); do
    printf "%2d %5d %s\n" \
        "$(cat $proc/oom_score)" \
        "$(basename $proc)" \
        "$(cat $proc/cmdline | tr '\0' ' ' | head -c 50)"
done 2>/dev/null | sort -nr | head -n 10
