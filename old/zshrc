[[ -x /usr/libexec/java_home ]] && export JAVA_HOME=$(/usr/libexec/java_home)

# AWS
[[ -d /usr/local/opt/ec2-api-tools/libexec ]] && export EC2_HOME=/usr/local/opt/ec2-api-tools/libexec
[[ -d /usr/local/opt/aws-cfn-tools/libexec ]] && export AWS_CLOUDFORMATION_HOME=/usr/local/opt/aws-cfn-tools/libexec
[[ -d /usr/local/opt/auto-scaling/libexec ]] && export AWS_AUTO_SCALING_HOME=/usr/local/opt/auto-scaling/libexec
[[ -d /usr/local/opt/aws-cloudsearch ]] && export CS_HOME=/usr/local/opt/aws-cloudsearch
[[ -f $HOME/.aws ]] && source $HOME/.aws
[[ -f $HOME/.aws.credentials ]] && export AWS_CREDENTIAL_FILE="$HOME/.aws.credentials"
[[ -d $HOME/go ]] && export GOPATH=$HOME/go

# PATH
typeset -gxU path
[[ -d /usr/local/bin ]] && path=(/usr/local/bin $path)
[[ -d /usr/local/sbin ]] && path=(/usr/local/sbin $path)
[[ -d ~/.bin ]] && path=($path ~/.bin)

# rbenv
whence rbenv >/dev/null && eval "$(rbenv init - --no-rehash zsh)"

# virtualenvwrapper
export PROJECT_HOME=$HOME/projects
[[ -f /usr/local/bin/virtualenvwrapper.sh ]] && source /usr/local/bin/virtualenvwrapper.sh

# ls and grep colors
export CLICOLOR=1
export GREP_OPTIONS="--color=auto"

# the only alias I need
alias gst='git status -sb'

# Functions
clear_history() {
  rm -f $HOME/.{bash_history,lesshst,irb_history,pry_history,rdebug_hist,rediscli_history,timecop-stackcache,viminfo,zsh_history,sh_history}
}

reload_launch_agents() {
  launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.{mysql,redis,mongodb,memcached}.plist
  brew cleanup mysql redis mongodb memcached
  cp /usr/local/Cellar/{mysql,redis,mongodb,memcached}/*/homebrew.mxcl.*.plist ~/Library/LaunchAgents
  launchctl load ~/Library/LaunchAgents/homebrew.mxcl.{mysql,redis,mongodb,memcached}.plist
}

subp() {
  local PROJ="$(basename $(pwd)).sublime-project"
  if [[ ! -f $PROJ ]]; then
    local DEFAULT="$HOME/.sublime-project"
    [[ ! -e $DEFAULT ]] && echo "$DEFAULT not found!" && return 1
    echo "Create $PROJ? \c" && read && [[ ! $REPLY =~ "^(y|Y|Yes|yes)$" ]] && return 0
    ln -fs $DEFAULT $PROJ
  fi
  subl --project $PROJ
}

expand-or-complete-with-dots() {
  echo -n "\e[31m......\e[0m"
  zle expand-or-complete
  zle redisplay
}

# GitHub Flavored Markdown
gfm() {
  curl -X POST -H 'Content-Type:text/x-markdown' --data-binary @- https://api.github.com/markdown/raw
}

# Modules
autoload -Uz colors compinit edit-command-line
colors
compinit

# History
HISTFILE=$HOME/.zsh_history HISTSIZE=SAVEHIST=99999
setopt share_history hist_ignore_dups hist_ignore_space hist_verify

# Spell Check
setopt correct

# Prompt
#[[ -f ~/.zshprompt ]] && source ~/.zshprompt
setopt prompt_subst
PROMPT='%{%F{cyan}%}%c%{%f%}$($HOME/.bin/git-prompt 2>/dev/null) '

# ZLE
zle -N expand-or-complete-with-dots

# Change.org
if [[ $(whoami) = 'change' ]]; then
  if [[ -d $HOME/work/bash_common ]]; then
    export BASH_COMMON_PATH=$HOME/work/bash_common
    path=($path $BASH_COMMON_PATH/bin)
  fi

  if whence hitch >/dev/null; then
    hitch() {
      command hitch "$@"
      [[ -s "$HOME/.hitch_export_authors" ]] && source "$HOME/.hitch_export_authors"
    }
  fi

  # Opscode
  export OPSCODE_USER=chasestubblefield

  # AWS
  [[ -f "$HOME/Drive/work/dot/aws" ]] && source "$HOME/Drive/work/dot/aws"
fi

# automatically enter directories without cd
setopt auto_cd

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# vim mode
bindkey -v

# use incremental search
bindkey "^R" history-incremental-search-backward

# add some readline keys back
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# handy keybindings
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"
bindkey '^[e' edit-command-line

# show dots during tab completion
bindkey '^I' expand-or-complete-with-dots
