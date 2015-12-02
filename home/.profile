# pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# pyenv-virtualenv
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Go
[[ -d $HOME/projects/go ]] && export GOPATH=$HOME/projects/go
[[ -d $GOPATH/bin ]] && export PATH=$GOPATH/bin:$PATH

# Homebrew GitHub API Token
export HOMEBREW_GITHUB_API_TOKEN=8dd0bebc481ecbfc544822ea06558e40b2dd80bb

# JAVA
[[ -x /usr/libexec/java_home ]] && export JAVA_HOME=$(/usr/libexec/java_home)

# personal bin
[[ -d $HOME/.bin ]] && export PATH=$HOME/.bin:$PATH
