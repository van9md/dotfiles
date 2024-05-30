#!/bin/bash
ip route | grep -q '10.0.0.0' \
&& echo '{"text":"Connected","class":"connected","percentage":100}' \
|| echo '{"text":"Disconnected","class":"disconnected","percentage":0}'
