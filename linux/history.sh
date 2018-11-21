#!/bin/bash

cat /dev/null > ~/.bash_history && history -c && history -w && unset HISTFILE && exit

