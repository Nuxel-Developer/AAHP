#!/bin/bash

# variáveis
ARCH_URL="https://aur.archlinux.org/"
INIT_COMMAND="--init"
COMMAND=${1}
COMMAND2=${2}

# funçôes
function git_clone() {
    git clone ${ARCH_URL}/$*.git
}

function log_err() {
    echo -e "\033[0;31mERROR:\033[0m $*"
}

function start() {
    if [[ "${COMMAND}" == "${INIT_COMMAND}" ]]; then
        printf "Name of the app: "
        read app_name
        if [ "${app_name}" != "" ]; then
            git_clone "${app_name}"
            cd_folder ./${app_name}
            if [ "$COMMAND2" == "-na" ]; then
                echo -e "Starting makepkg..."
                exec makepkg -si
            elif [ "$COMMAND2" == "--noanswer" ]; then
                echo -e "Starting makepkg..."
                exec makepkg -si
            else
                printf "Start the MakePkg? (y/n): "
                read answer
                if [[ "$answer" == "y" ]]; then
                    echo "Starting makepkg..."
                    exec makepkg -si
                else
                    echo "Cancelling and exiting..."
                    exit 0
                fi
            fi
            
        else
            log_err "The name cannot be null!"
        fi
    elif [[ "${COMMAND}" == "--help" ]]; then
        help
    else
        log_err "No command found. Try to execute $0 --help"
    fi
}

function cd_folder() {
    [[ -d $* ]] && cd $*
}

function help(){
    echo -e "Usage: AAHP.sh --init [Options]\nOptions:"
    echo ""
    echo -e "   -na, --noanswer : Use to start MakePkg automatically witout asking for confirmation"
    echo ""
}

# inicializando o script
start
