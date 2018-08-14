#!/bin/bash
# Purpose: center-message.sh - Display centered text in the screen in reverse video
# Author: Vivek Gite 
# ---------------------------------------------------------------------------------
# Find out current screen width and hight
_COLUMNS=$(tput cols)
_LINES=$(tput lines)
 
# Set default message if $1 input not provided
_MESSAGE="${1:-Linux Shell Scripting Tutorial v2.0}"
 
# Calculate x and y coordinates so that we can display $MESSAGE
# centered in the screen 
#x=$(( $_LINES / 2 ))
y=$(( ( $_COLUMNS - ${#_MESSAGE} )  / 2 ))
# set x and y position
#tput cup $x $y
tput cuf $y
# Alright display message stored in $_MESSAGE
echo "${_MESSAGE}"
 
tput sgr0
