#!/bin/bash

script_help=$( cat << EOF
This script helps me setup new machines

Usages:
	#0: ${0} <flag>
EOF
)

main() {
    if [[ ! "$#" -gt 0 ]]; then
        echo -e "INFO: Please provide the file you want to update to Catppuccin v0.1.1"
    else
        while [ "$1" != "" ]; do
            case $1 in
            -d | --dots)
                # file=$2
                shift
                ;;
			-h | --help)
				echo "$script_help"
				exit 0
				;;
            *)
                echo "ERROR: command ($1) not recognized"
                ;;
            esac
            shift
        done
    fi
}

main "$@"
