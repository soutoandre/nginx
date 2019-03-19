#!/bin/bash

LOG_DIR="/var/log/nginx"
FILE_LOG="access.log"

if [ -f $LOG_DIR/$FILE_LOG ]
then
	echo "$LOG_DIR/$FILE_LOG existe."
        echo "### Total de requisições por http_status ###"
        grep "HTTP/[0-2].[0-2]" $LOG_DIR/$FILE_LOG |awk '{print $12, $13, $15}' | sort | uniq -c | sort -rn |mailx -s "Report http_status"  {{ FROM_EMAIL_ADDRESS }}       
else
	echo "$LOG_DIR/$FILE_LOG não existe." |mailx -s "Report http_status"  {{ FROM_EMAIL_ADDRESS }} 
fi

