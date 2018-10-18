# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
alias servethis="python -c 'import SimpleHTTPServer; SimpleHTTPServer.test()'"

if [ `uname` = "Darwin" ]; then
  alias subl="open -a 'Sublime Text'"
fi

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=5

export UPDATE_DOTFILES_DAYS=3

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(vi-mode docker docker-compose ssh-agent git heroku aws history-substring-search) 

source $ZSH/oh-my-zsh.sh
zsh -f ~/dotfiles/check_for_upgrade.sh

# User configuration

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin:/Library/TeX/texbin"
# export MANPATH="/usr/local/man:$MANPATH"

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

if [ `uname` = "Darwin" ]; then

  export RBENV_ROOT=/usr/local/var/rbenv
  if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
	
  eval `/usr/libexec/path_helper -s`

fi 

export EDITOR='vim'


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Reverse search key bindings for vim mode
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '^A' beginning-of-line
bindkey "^[b" backward-word
bindkey "^[d" kill-word
bindkey "^[f" forward-word

##########################################
# zsh-history-substring-search settings
##########################################
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=""
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=""
setopt HIST_IGNORE_ALL_DUPS
# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
##########################################

#Emacs style line edit key bindings
autoload edit-command-line
zle -N edit-command-line
bindkey '^X^e' edit-command-line

#Line navigation
bindkey '^E' end-of-line
