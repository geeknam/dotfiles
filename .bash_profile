alias k3="workon k3 && cd ~/Projects/K3/kogan3"
export DJANGO_COLORS="error=yellow/blue,blink;notice=magenta"
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/kogan
source /usr/local/bin/virtualenvwrapper.sh
alias kta="ps ax|grep manage.py|awk '{print $1}'|xargs kill -9"

# Android
export ANDROID_HOME=~/android-sdk-linux
export PATH=$PATH:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

#MAVEN
export M2_HOME=/usr/local/apache-maven
export MAVEN_HOME=${M2_HOME}
export M2=${MAVEN_HOME}/bin
export PATH=${PATH}:${M2}
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

# App Engine
export PATH=${PATH}:/home/nam/google_appengine
export PYTHONPATH=/home/nam/google_appengine

export LANG=en_US.utf8

function _update_ps1()
{
    export PS1="$(~/powerline-bash/powerline-bash.py $?)"
}

export PROMPT_COMMAND="_update_ps1"
