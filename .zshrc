# Path to your oh-my-zsh configuration.
# export ZSH=~/.oh-my-zsh
export PATH=$HOME/bin:/usr/local/bin:$PATH

clear && neofetch

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="spaceship"
# set ZSH_THEME="af-magic"
# ZSH_THEME="random"

# SPACESHIP_CONDA_VERBOSE=false
# SPACESHIP_BATTERY_SHOW=always

##########################################
# Load External configuration files
##########################################

# Load the Aliases file
if [ -e ~/.zsh_files/aliases.zsh ]; then
     source ~/.zsh_files/aliases.zsh
fi

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

if [[ ! -d ~/.zplug ]];then
  git clone https://github.com/zplug/zplug ~/.zplug
fi
source ~/.zplug/init.zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "MichaelAquilina/zsh-you-should-use"
zplug "changyuheng/fz", defer:1
zplug "rupa/z", use:z.sh
zplug "powerline/powerline"
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load 

##########################################
# zsh-autosuggestion
##########################################

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# source ~/.oh-my-zsh/oh-my-zsh.sh

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git
#	colorize
#	z
#	alias-finder
#	battery
#	)

# User configuration

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# alias cend="conda deactivate"
alias ns="nordvpn status"
alias ncn="nordvpn connect"
alias nd="nordvpn d"
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias zc='rg  . | fzf | awk -F: '\''{print $1}'\'' | xargs -l code'
alias zv='rg  . | fzf | awk -F: '\''{print $1}'\'' | xargs -l vim'
alias zp='rg . | fzf'
alias texpad='open /Applications/Texpad.app'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


# Activates tmux session by default
tmux attach &> /dev/null


if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ "$TERM" != screen ]] && [[ "$TERM" != tmux ]] && [ -z "$TMUX" ]; then
	exec tmux
fi

# find dot files in FZF search
# export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# Enable colors and change prompt:
# autoload -U colors && colors	# Load colors
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd    	# Automatically cd into typed directory.

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
# autoload -U compinit
# zstyle ':completion:*' menu select
# zmodload zsh/complist
# compinit
# _comp_options+=(globdots)		# Include hidden files.

# Applies ripgrep to fzf for faster file finding in the terminal
# if type rg &> /dev/null; then
#   export FZF_DEFAULT_OPTS='-m --height 50% --border'
# fi

# Load syntax highlighting; should be last.
# source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="/usr/local/sbin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/joe/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/joe/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/joe/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/joe/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Shell function 
freload() { while (( $# )); do; unfunction $1; autoload -U $1; shift; done }

# Adding my functions file to the function path 
fpath=( ~/.zshfn "${fpath[@]}" )
# autoloading the functions I have made
autoload -Uz $fpath[1]/*(.:t)


