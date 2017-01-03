# Path to your oh-my-zsh installation.
export ZSH=/Users/<INSERT_USER>/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="agnoster"
ZSH_THEME="therynamo"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

#export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"

# export MANPATH="/usr/local/man:$MANPATH"
export PATH=~/Development/bin:$PATH

#rbenv path
export PATH="$HOME/.rbenv/bin:$PATH"

#rust path
export PATH="/Users/<INSERT_USER>/.cargo/bin:$PATH"

#pyenv vars
export PYENV_VERSION="2.7.8"

#Homebrew api key
export HOMEBREW_GITHUB_API_TOKEN="<INSERT_GIT_TOKEN>"

#JavaHome
export JAVA_HOME=$(/usr/libexec/java_home)

#Gradle Options
export GRADLE_OPTS="-Xms2048m -Xmx4096m -XX:MaxPermSize=512m"

#Catalina Options
export CATALINA_HOME="/Users/<INSERT_USER>/Utilities/apache-tomcat-7.0.63"

# Go Vars
export GOPATH="/Users/z001931/.go"

zstyle ':completion:*:*:git:*' script ~/.git-completion.zsh

source /usr/local/Cellar/nvm/0.24.0/nvm.sh
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

############################################### ALIASES ################################################

#Standard aliases
alias cl="clear"
alias refresh="source ~/.zshrc"
alias syspref="sudo \"/Applications/System Preferences.app/Contents/MacOS/System Preferences\""
alias hgrep="history | grep $1"
alias allproc="ps aux | less"
alias tl="tree -L"
alias peg="ps -ef | grep $1"
alias kc="kubectl"

#Tomcat
alias killtc='ps -fe | grep tomcat | grep -v grep | awk "{print \$2}" | xargs kill -9'

#Git commands
alias showunknown="git log --name-status -1 -U $1"

#Postgres SQL DB's
alias startpostgres="lunchy start postgres"
alias stoppostgres="lunchy stop postgres"

#####Rails aliases#######
#Changes version of rails argument 1 is target rbenv ruby version argument 2 is target rails version
alias changerailsv="RBENV_VERSION=$1 rbenv exec gem install rails --version $2"
alias killrails="kill -9 $(lsof -wni tcp:3000 -t)"
alias guard="bundle exec guard"

#Selenium Server Alias
alias starthub="java -jar ~/apps/Selenium/selenium-server-standalone-2.44.0.jar -port 4444 -role hub -nodeTimeout 600"
alias startnode="java -jar ~/apps/Selenium/selenium-server-standalone-2.44.0.jar -role node -hub http://localhost:4444/grid/register"
alias killsel='ps -fe | grep selenium | grep -v grep | awk "{print \$2}" | xargs kill -9'

#Python Aliases
alias pythserve="python -m SimpleHTTPServer $1"

#Docker Aliases
alias dm="docker-machine"
alias dock="docker"
alias dc="docker-compose"
alias startGraphana="docker run -i -p 3000:3000 grafana/grafana"
alias dockerdangle=killdangle

#Node Alias
alias killPhantom="ps -fe | grep phatnomjs | grep -v grep | awk "{print \$2}" | xargs kill -9"

# Webpack Alias
alias wds="webpack-dev-server"

#Rust Alias
alias rc="rustc"
alias crun="cargo run"

#### ALIAS FUNCTIONS ######
killdangle() {
  docker rmi $(docker images -f 'dangling=true' -q)
}

########### RBENV ZSH ######################
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)";
fi
#############################################

#################### VISUAL STUDIO CODE #################
visual() { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}
########################################################

################## PYENV ########################
eval "$(pyenv init -)"
################################################

# Use .nvmrc if exists
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" != "N/A" ] && [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/z001931/Pictures/google-cloud-sdk/path.zsh.inc ]; then
  source '/Users/<USER_PATH>/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/z001931/Pictures/google-cloud-sdk/completion.zsh.inc ]; then
  source '/Users/<USER_PATH>/google-cloud-sdk/completion.zsh.inc'
fi
