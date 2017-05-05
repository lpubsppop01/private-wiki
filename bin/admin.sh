#! /bin/sh
# -*- coding: utf-8-unix -*-

# Filename: admin.sh
# Author: lpubsppop01
# Created: 2017/05/04 17:12:36
# Last modified: 2017/05/05 16:52:06

# Required:
# * PHP grasmash/yaml-cli (to edit YAML file)

APP_NAME=private-wiki
WORK_DIR=$HOME/$APP_NAME
PID_FILE=../$APP_NAME.pid
LOG_FILE=../$APP_NAME.log
YAML_FILE=../$APP_NAME.yaml

function kill_matched() {
    for MATCHED_PID in $(ps -a | awk "/^ +$1|^ +[0-9]+ +$1/{ print \$1; }"); do
        echo kill $MATCHED_PID
        kill $MATCHED_PID
    done
}

function init() {
    git config --local core.quotepath false
    $WORK_DIR/bin/git-set-file-times.pl $WORK_DIR
    if [ ! -f $YAML_FILE ]; then
        read -sp "Login password: " password
        tty -s && echo
        passwordHash=`jingo -# $password`
        jingo -s > $YAML_FILE
        yaml-cli update:value $YAML_FILE application.title "Private Wiki"
        yaml-cli update:value $YAML_FILE application.repository .
        yaml-cli update:value $YAML_FILE application.remote origin
        yaml-cli update:value $YAML_FILE authentication.local.enabled true
        yaml-cli update:value $YAML_FILE authentication.local.accounts.0.username lpubsppop01
        yaml-cli update:value $YAML_FILE authentication.local.accounts.0.passwordHash $passwordHash
        yaml-cli update:value $YAML_FILE authentication.local.accounts.0.email lpubsppop01@gmail.com
        yaml-cli update:value $YAML_FILE pages.title.fromFilename false
        yaml-cli update:value $YAML_FILE pages.title.fromContent true
        sed "s/: '\(true\|false\)'$/: \1/g" $YAML_FILE > $YAML_FILE.tmp
        mv -f $YAML_FILE.tmp $YAML_FILE
    fi
    echo "$APP_NAME files are initialized"
}

function start() {
    test -f $PID_FILE && echo "$APP_NAME is already running" && exit 1
    touch $PID_FILE $LOG_FILE
    eval `ssh-agent`
    ssh-add ~/.ssh/id_rsa
    echo $SSH_AGENT_PID >> $PID_FILE
    nohup jingo -c $YAML_FILE > $LOG_FILE &
    echo $! >> $PID_FILE
    echo "Jingo pid $(tail -n 1 $PID_FILE)"
    echo "$APP_NAME is started"
}

function stop() {
    test ! -f $PID_FILE && echo "$APP_NAME is not running" && exit 1
    for PID in `cat $PID_FILE`; do
        kill_matched $PID
    done
    rm -f $PID_FILE
    echo "$APP_NAME is stopped"
}

function main() {
    BACKUP_DIR=`pwd`
    cd $WORK_DIR

    case $1 in
        'init' )
            init
            ;;
        'start' )
            start
            ;;
        'stop' )
            stop
            ;;
        * )
            echo "Usage: $0 init|start|stop"
            ;;
    esac

    cd $BACKUP_DIR
}

main $*

# admin.sh ends here
