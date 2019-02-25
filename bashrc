# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
#alias xavier="ssh pionen@192.168.10.243"
#alias kronos="ssh fundacion@192.168.10.240"
alias nave="tmux new -s pionen"
alias dnfcheckupdate="su -c 'dnf --refresh check-update'"
alias dnfcleancache="su -c 'dnf clean dbcache expire-cache metadata' && su -c 'dnf makecache'"
alias dnfgetupgrades="su -c 'dnf --downloadonly upgrade'"

# Keep track of what I did today :)
alias did="vim +'normal Go' +'r!date' ~/did.md"

# Keep track of what I have to do :)
alias todo="vim +'normal Go' +'r!date' ~/todo.md"

# Keep track of my battery life :(
alias bat="vim +'normal Go' +'r!date' ~/bat.md"

# Snippet to use powerline by default on bash
if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bash/powerline.sh
fi

# Python virtualenvwrapper settings
export PATH=/usr/bin:$PATH
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv-3
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/projects
source /usr/bin/virtualenvwrapper-3.sh

# Preserve bash history in multiple terminal windows
# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a;
history -c; history -r"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# pipsi
export PATH="$HOME/.local/bin:$PATH"
