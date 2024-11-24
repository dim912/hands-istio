#!/bin/bash
#nohup curl pay-service > /dev/null 2>&1&
echo $(hostname -i)  ui-service-v1 > /usr/share/nginx/html/index.html
nohup bash -c 'while true; do curl pay-service; sleep 0.1 ; done > /dev/null 2>&1&'
nohup bash -c 'while true; do curl credit-service; sleep 1 ; done > /dev/null 2>&1&'
