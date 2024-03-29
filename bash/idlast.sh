#!/bin/bash
#
# vim:ft=sh

############### Variables ###############

############### Functions ###############

############### Main Part ###############

idlast(){
    #local id=${1::17}
    local id=$1
    [ ${#id} -lt 17 ] && echo 17 numbers, assohole! && return 69
    local factor=(7 9 10 5 8 4 2 1 6 3 7 9 10 5 8 4 2)
    local last=(1 0 X 9 8 7 6 5 4 3 2)

    local i sum=0
    for i in `seq 0 16`
    do
        let sum+=$((${id:$i:1} * ${factor[$i]}))
    done

    echo ${last[$(($sum%11))]}
}
