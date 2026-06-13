# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
#zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit
setopt auto_cd

zinit cdreplay -q


# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias la='ls -la'
#alias vim='nvim'
# alias nvim='~/nvim.appimage'
alias nvim='~/nvim-static/AppRun'
alias nvid='~/neovide.AppImage'
alias obsidian='~/.appimage/Obsidian-1.12.4.AppImage'
alias c='clear'
alias alacritty='~/.cargo/bin/alacritty'
alias kitty='~/.local/kitty.app/bin/kitty'
# alias tmux='~/tmux.appimage'
alias tmux='~/tmux-static/AppRun'
alias zellij='~/zellij'
export PATH=/home/fharifen/.local/bin/:/home/fharifen/.cargo/bin:$PATH
alias zed='~/.local/bin/zed'
alias godot='/home/fharifen/./Godot'
alias cmatrix='/home/fharifen/Downloads/cmatrix/build/cmatrix'

alias fc='make fclean; clear'
alias gc='git checkout'
alias gp='git push'
alias gstat='git status'
alias gco='git commit -m'
alias gl='git log'
alias gadd='git add'
alias fzf="fzf --style full --preview 'fzf-preview.sh {}' --bind 'focus:transform-header:file --brief {}'"
alias rmfzf='rm -i $(fzf -m)'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/jandedobbeleer.omp.json)"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH=$HOME/.local/bin:$PATH
export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$HOME/local/lib/pkgconfig:$PKG_CONFIG_PATH
export PATH=$HOME/local/bin:$PATH
export PATH="$HOME/bin:$PATH"
export PATH=~/bin:$PATH
# export EDITOR=~/nvim.appimage 
export EDITOR=~/nvim-static/AppRun
source ~/.fzf.zsh

export HOMEBREW_PREFIX="$HOME/.homebrew"
export PATH="$HOMEBREW_PREFIX/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

#
# if [ -z "$TMUX" ]; then
#     tmux attach-session -t $(tmux list-sessions -F "#{session_name}:#{session_last_attached}" | sort -t: -k2 -n | tail -n1 | cut -d: -f1) || tmux new-session
# fi

alias cclean='bash ~/Cleaner_42.sh'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fnm
FNM_PATH="/home/fharifen/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/develop/flutter/bin:$PATH"
export FZF_DEFAULT_OPTS="--bind='ctrl-e:accept-non-empty'"
