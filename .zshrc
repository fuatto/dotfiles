
# # Load starship
# eval "$(starship init zsh)"

# oh-my-posh
# eval "$(oh-my-posh --init --shell zsh --config ~/.poshthemes/pure.omp.json)"


# # The following lines were added by compinstall
#
# zstyle ':completion:*' completer _complete _ignored _approximate
# # zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
#
# autoload -Uz compinit
# compinit
# # End of lines added by compinstall


# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
#

# # Path to your oh-my-zsh installation.
# export ZSH="/Users/phatnguyen/.oh-my-zsh"

# Add config for z
. /usr/local/etc/profile.d/z.sh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="sorin"

# St list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  colorize
  docker

  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-completions
)


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR="/usr/local/bin/nvim"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Add config for bat
export BAT_THEME="OneHalfDark"

# Add go to PATH
export GOROOT="/usr/local/go"
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export GO111MODULE=auto
export GOPRIVATE=code.in.spdigital.sg/sp-digital/athena

# Add elixir to PATH
export PATH="$PATH:/path/to/elixir/bin"

# # Add /usr/local/bin to PATH
# export PATH="/usr/local/bin:$PATH"

# nvm path
lazynvm() {
  unset -f nvm node npm
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
}

nvm() {
  lazynvm 
  nvm $@
}

node() {
  lazynvm
  node $@
}

npm() {
  lazynvm
  npm $@
}


export TERM=xterm-256color
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Add link for openssl@3
export PATH="/usr/local/opt/openssl@3/bin:$PATH"

# Add ncurses
export PATH="/usr/local/opt/ncurses/bin:$PATH"

# Add doom emacs
export PATH=~/.emacs.d/bin:$PATH
 
fpath=(~/zsh $fpath)
autoload -Uz kp fp bip bup bcp ll


# autoload -Uz promptinit
#     promptinit
# prompt powerlevel10k

autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

# Define an init function and append to zvm_after_init_commands to fix zvm issue
function my_init() {
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}
zvm_after_init_commands+=(my_init)

alias vim=nvim

# zsh-syntax-highlighting
# source /Users/phatnguyen/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/phatnguyen/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/phatnguyen/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/phatnguyen/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/phatnguyen/google-cloud-sdk/completion.zsh.inc'; fi

# Credentials for google apps
# export GOOGLE_APPLICATION_CREDENTIALS="/Users/phatnguyen/Downloads/IAP-Test-cbe57e7b5a90.json"
# export GOOGLE_APPLICATION_CREDENTIALS="/Users/phatnguyen/Downloads/IAP-Test-cbe57e7b5a90.json"
# export GOOGLE_APPLICATION_CREDENTIALS="$HOME/Downloads/test_pubsub_sa_credentials.json"
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/Downloads/hardy-symbol-206908-aebb1619eeb4.json"
export PATH="/usr/local/opt/sqlite/bin:$PATH"

# python3 path
export PATH="/Users/phatnguyen/Library/Python/3.7/bin:$PATH"

# load direnv
eval "$(direnv hook zsh)"

# Load prezto
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# FZF config must be loaded b4 p10k-instant-prompt
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
