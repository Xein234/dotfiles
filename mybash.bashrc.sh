####funtionality####
set -o vi

#alias wd='cd /home/xein/Dev/Python/MIT/6.0002/PS1/'
alias v='nvim'
alias con='setxkbmap -option caps:swapescape'
alias cof='setxkbmap -option'
export EDITOR=nvim
export VISUAL=nvim
export IPYTHONDIR='~/.config/ipython'
alias sudo='sudo '
alias ll='ls -lA'
 #From the bash manual:
 #If the last character of the alias value is a space or tab character, then
 #the next command word following the alias is also checked for alias expansion

####security####
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -I'

####aesthetics####
export PS1="\[\033[01;32m\]▶\[\033[01;37m\]\W\[\033[01;32m\] \$\[\033[00m\]"
export PS2="\[\033[01;32m\]▶\[\033[00m\]"
