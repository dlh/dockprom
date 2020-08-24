#!/bin/bash

unset IFS
for var in $(compgen -e)
do
    if [[ "$var" = CRON* ]]
    then
        echo "${!var}" >> /etc/crontabs/root
    fi
done

crond -f
