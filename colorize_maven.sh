#!/bin/bash

# Written by Mike Ensor (mike@ensor.cc)
# Copywrite 2012
# Use as needed, modify, have fun!
# This is intended to be used for Maven3 + Mac OSX
#
# To use:
# in your ".bashrc" or ".bash_profile" add the following line:
# source ~/<path to script>/colorize-maven.sh
#

c_black=
c_cyan=
c_magenta=
c_red=
c_white=
c_green=
c_yellow=
c_blue=
c_bg_black=
c_bg_cyan=
c_bg_magenta=
c_bg_red=
c_bg_white=
c_bg_green=
c_bg_yellow=
c_bg_blue=
c_end=
c_bold=

xterm_color() {
    #   0   Black
    #   1   Red
    #   2   Green
    #   3   Yellow
    #   4   Blue
    #   5   Magenta
    #   6   Cyan
    #   7   White

    # Yes, this could be a map
    c_bold=`tput bold`
    c_underline_on=`tput smul`
    c_underline_off=`tput rmul`
    c_bg_bold=`tput setab 0`
    c_black=`tput setab 0`
    c_bg_black=`tput setab 0`
    c_cyan=`tput setaf 6`
    c_bg_cyan=`tput setab 6`
    c_magenta=`tput setaf 5`
    c_bg_magenta=`tput setab 5`
    c_red=`tput setaf 1`
    c_bg_red=`tput setab 1`
    c_white=`tput setaf 7`
    c_bg_white=`tput setab 7`
    c_green=`tput setaf 2`
    c_bg_green=`tput setab 2`
    c_yellow=`tput setaf 3`
    c_bg_yellow=`tput setab 3`
    c_blue=`tput setaf 4`
    c_bg_blue=`tput setab 4`
    c_end=`tput sgr0`
}

ansi_color() {
    c_bold=   '[1m'
    c_blue=   '[1;34m'
    c_black=  '[1;30m'
    c_green=  '[1;32m'
    c_magenta='[1;35m'
    c_red=    '[1;31m'
    c_cyan=   '[1;36m'
    c_end=    '[0m'
}

color_maven() {

    # pick color type
    if [ $TERM = 'xterm-color' ]
    then
        xterm_color
    elif [ $TERM = 'xterm' ]
    then
        xterm_color
    else
        echo "${c_red}WARNING:::Terminal '${TERM}' is not supported at this time. Colorized output will not happen for Maven${c_end}"
    fi

    error=${c_bold}${c_red}
    info=${c_white}
    warn=${c_yellow}
    success=${c_green}
    projectname=${c_cyan}
    skipped=${c_white}
    downloading=${c_magenta}
    version=${c_magenta}

    $MAVEN_HOME/bin/mvn $@ | sed -e "" \
        -e "s/(\[INFO\] Building) ([^ ]*) ([^ ]*)/${info}\1${projectname} \2 ${version}\3${c_end}/g" \
        -e "s/(Total time: )([0-9]+[.]*[0-9]*.[^ ]*)/${c_cyan}\1${c_bold}${c_cyan}\2${c_end}/g" \
        -e "s/(Downloading: .*)/${downloading}\1${c_end}/g" \
        -e "s/BUILD FAILURE/${error}BUILD FAILURE${c_end}/g" \
        -e "s/BUILD SUCCESS/${c_green}BUILD SUCCESS${c_end}/g" \
        -e "s/WARNING: ([a-zA-Z0-9.-/\\ :]+)/${warn}WARNING: \1${c_end}/g" \
        -e "s/SEVERE: (.+)/${c_white}${c_bg_red}SEVERE: \1${c_end}/g" \
        -e "s/Caused by: (.+)/${c_white}${c_bg_green}Caused by: \1${c_end}/g" \
        -e "s/Running (.+)/${c_green}Running \1${c_end}/g" \
        -e "s/FAILURE (\[[0-9]+.[:0-9][a-z^ ]*\])/${error}FAILURE \1${c_end}/g" \
        -e "s/SUCCESS (\[[0-9]+.[:0-9]+[a-z^ ]*\])/${success}SUCCESS \1${c_end}/g" \
        -e "s/(\[INFO.*)/${info}\1${c_end}/g" \
        -e "s/INFO: (.+)/${info}INFO: \1${c_end}/g" \
        -e "s/(\[WARN.*)/${warn}\1${c_end}/g" \
        -e "s/(\[ERROR.*)/${error}\1${c_end}/g" \
        -e "s/(<<< FAILURE!)/${error}\1${c_end}/g" \
        -e "s/(\[INFO\] --- [^\(]+)([^ ]+[\)])(.+)*/\1${c_underline_on}${error}\2${c_underline_off}${c_end}\3/g" \
        -e "s/Tests run: ([0-9]+), Failures: ([0-9]+), Errors: ([0-9]+), Skipped: ([0-9]+)/${c_green}Tests run: \1 ${c_end}, Failures: ${warn}\2 ${c_end}, Errors: ${error}\3 ${c_end}, Skipped:  ${skipped}\4 ${c_end}/g"

    echo -ne ${c_end}
}

alias mvn=color_maven