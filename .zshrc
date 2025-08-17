# https://scottspence.com/posts/speeding-up-my-zsh-shell
DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_COMPFIX="true"

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# Theme configuration
ZSH_THEME="spaceship"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_USE_ASYNC=1

# Plugins configuration
plugins=(
    git
    gcloud
    docker
    direnv
    brew
    tmux
    kubectl
    kubectx
    docker-compose
    zsh-autosuggestions
    zsh-syntax-highlighting  # Always last!
)
source $ZSH/oh-my-zsh.sh
source ~/.zshrc_custom
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#757575'

# Spaceship prompt configuration
SPACESHIP_PROMPT_ASYNC=true
SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_CHAR_SYMBOL="⚡"

# Only load what you actually use
SPACESHIP_PROMPT_ORDER=(
    time
    user
    dir
    git
    line_sep
    char
)



# Editor configuration based on SSH connection
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='lvim'
fi

# Compilation flags
export ARCHFLAGS="-arch $(uname -m)"

# Starship prompt
[[ -f ~/.config/zsh/starship.zsh ]] && source ~/.config/zsh/starship.zsh
eval "$(starship init zsh)"
eval "$(atuin init zsh)"


fpath+=~/.zfunc;
# Smarter completion initialization
autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi

zstyle ':completion:*' menu select
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | zsh

export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Added by Windsurf
export PATH="/Users/luc.nguyen/.codeium/windsurf/bin:$PATH"
