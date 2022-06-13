#!/bin/sh
nm-applet &
pgrep volctl || /usr/bin/volctl &
batsignal -b
