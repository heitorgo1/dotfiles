# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/heitor/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="avit"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
# COMPLETION_WAITING_DOTS="true"

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
plugins=(
  git
  zsh-autosuggestions
  dotenv
)

source $ZSH/oh-my-zsh.sh


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# start aliases
alias extract="tar -xzf"
alias ping="prettyping --nolegend"
alias mirror-screen="xrandr --output HDMI-0 --scale 0.711x0.711 --auto --same-as LVDS"
alias cast-screen="xrandr --output HDMI-0 --auto --left-of LVDS"
alias k='kubectl'
alias g='git'
alias gs='git status'
alias ga='git add --all'
alias gm='git commit'
alias glog='git log --graph --all'
alias glogo='git log --graph --all --oneline'
alias jsn='jsonnet'
alias jsnfmt='jsonnetfmt'
alias ccat='pygmentize -g'
alias cdir='source cdir.sh'
alias vi='vim'
alias tf='terraform'
alias tg='terragrunt'
alias gping='/home/heitor/.asdf/installs/rust/1.68.2/bin/gping'
alias nvim='/home/heitor/Applications/nvim.appimage'
#alias workon='pyenv activate'
#alias deactivate='pyenv deactivate'
# end aliases

# zsh autosuggestions
export ZSH_AUTOSUGGEST_USE_ASYNC=yes
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=white,bold'

# dir cache
#################
DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=20

setopt AUTO_PUSHD PUSHD_SILENT PUSHD_TO_HOME

## Remove duplicate entries
setopt PUSHD_IGNORE_DUPS

## This reverts the +/- operators.
setopt PUSHD_MINUS
###########################

### file manager zsh
#####################
cdUndoKey() {
  popd
  zle       reset-prompt
  echo
  ls
  zle       reset-prompt
}

cdParentKey() {
  pushd ..
  zle      reset-prompt
  echo
  ls
  zle       reset-prompt
}

zle -N                 cdParentKey
zle -N                 cdUndoKey
bindkey '^[[1;3A'      cdParentKey
bindkey '^[[1;3D'      cdUndoKey
#######################
#

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/google-cloud-sdk/path.zsh.inc' ]; then source '/opt/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/google-cloud-sdk/completion.zsh.inc' ]; then source '/opt/google-cloud-sdk/completion.zsh.inc'; fi

# Load functions from .functions file
source ~/.functions
# Load fzf key bindings
source /usr/share/fzf/key-bindings.zsh

eval `dircolors /home/heitor/.dir_colors/dircolors`

# start env variables
# Android
export ANDROID_HOME=/home/heitor/android/android-sdk
export ANDROID_AVD_HOME=/home/heitor/.android/avd
export PATH=$PATH:${ANDROID_HOME}/tools
export PATH=$PATH:${ANDROID_HOME}/platform-tools
export PATH=$PATH:${ANDROID_HOME}/emulator
# Java
export JAVA_HOME=/home/heitor/.asdf/installs/java/oracle-17
#export PATH=$PATH:/usr/lib/jvm/java-8-openjdk-amd64/bin
# User binaries
export PATH=$PATH:/usr/local/bin
# Custom scripts
export PATH=$PATH:$HOME/Workspace/scripts
# Tools
export PATH=$PATH:$HOME/Workspace/tools
# Trilium
export PATH=$PATH:/opt/trilium
# Pycharm
export PATH=$PATH:/opt/pycharm-edu-2019.2/bin
# Golang
export PATH=$PATH:/usr/local/go/bin
#export GOPATH=$HOME/workspace/go
export GO111MODULE=auto
export PATH=$PATH:$HOME/Workspace/go/bin
# Google
#export GOOGLE_APPLICATION_CREDENTIALS=/etc/credentials/admobilize-production.json
# Python virtualenv
export WORKON_HOME=~/.virtualenvs
#export VIRTUALENVWRAPPER_PYTHON=/home/heitor/.pyenv/shims/python
# Drone
export DRONE_SERVER=https://dronev1.admobilize.com
export DRONE_TOKEN=kvcUnFfVwxkbmX1RpAkXJz5hiCaatErP
# Istio
export PATH="$PATH:/home/heitor/Workspace/istio-1.5.0/bin"
# Vault
export VAULT_ADDR=https://vault.admobilize.com
export VAULT_TOKEN=s.KRdajIK9JptCMtxlS9Edv73d
# Rust
export PATH="$HOME/.cargo/bin:$PATH"
# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
# Postman
export PATH="/opt/Postman/Postman-1643731990241-old:$PATH"
# Sonar Scanner
export PATH="/opt/sonar-scanner-cli-4.6.2.2472-linux/sonar-scanner-4.6.2.2472-linux/bin:$PATH"
# jmeter
export PATH="/opt/jmeter/apache-jmeter-5.4.3/bin:$PATH"
# rover
export PATH="/home/heitor/.rover/bin:$PATH"
# Rust
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/library

# end env variables

# asdf https://asdf-vm.com/guide/getting-started.html#_3-install-asdf
source $HOME/.asdf/asdf.sh
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit


# Setup virtualenvwrapper (python)
#source /usr/local/bin/virtualenvwrapper.sh
#source /home/heitor/.asdf/shims/virtualenvwrapper.sh
source /home/heitor/.asdf/installs/python/3.11.3/bin/virtualenvwrapper.sh

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

# Avoid pyenv-virtualenv warning message about prompt virtualenv name
#export PYENV_VIRTUALENV_DISABLE_PROMPT=1
#export BASE_PROMPT=$PS1
#function updatePrompt {
#    PYENV_VER=$(pyenv version-name)
#	if [[ "${PYENV_VER}" != "$(pyenv global | paste -sd ':' -)" ]]; then
#		export PS1='(${PYENV_VER%%:*}) '$BASE_PROMPT
#	else
#        export PS1=$BASE_PROMPT
#    fi
#}
#export PROMPT_COMMAND='updatePrompt'
#precmd() { eval '$PROMPT_COMMAND' } # this line is necessary for zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
