#!/bin/bash
#nohup curl pay-service > /dev/null 2>&1&
echo $(hostname -i)  pay-app-v1 > /usr/share/nginx/html/index.html
