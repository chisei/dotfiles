export ZSH=$HOME/.oh-my-zsh
if [ -r $ZSH/oh-my-zsh.sh ]
then
    plugins=(git)
    export ZSH_THEME="robbyrussell"
    source $ZSH/oh-my-zsh.sh
fi

export EDITOR=/usr/bin/vim

if [ -r $HOME/dotfiles/.aliases ]
then
    source $HOME/dotfiles/.aliases
fi

if [ -r $HOME/.aliases ]
then
    source $HOME/.aliases
fi

DISABLE_AUTO_TITLE=true

# vcs_info
#autoload -Uz vcs_info
#zstyle ':vcs_info:*' enable git svn hg bzr           # new
#zstyle ':vcs_info:*' formats '(%s)-[%b]'
#zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
#zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r' # new
#zstyle ':vcs_info:bzr:*' use-simple true             # new
#precmd () {
    #psvar=()
    #LANG=en_US.UTF-8 vcs_info
    #[[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
#}
#RPROMPT="${time} %{$fg[magenta]%}%{$reset_color%}%1(v|%F{green}%1v%f|)%{$reset_color%}"
#RPROMPT="%1(v|%F{green}%1v%f|)"
#PROMPT="%{$fg[magenta]%}[%n@%m %c] %{$reset_color%}"

bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

if [ -r /usr/local/opt/nvm/nvm.sh ]; then
    export NVM_DIR="$HOME/.nvm"
    . "/usr/local/opt/nvm/nvm.sh"
fi

# ref: https://github.com/creationix/nvm#zsh
autoload -U add-zsh-hook
load-nvmrc() {
    local node_version="$(nvm version)"

    if [ -e "./.nvmrc" ]; then
        local nvmrc_node_version=$(nvm version "$(cat .nvmrc)")
    elif [ -e "./.node-version" ]; then
        local nvmrc_node_version=$(nvm version "$(cat .node-version)")
    fi

    if [ "$nvmrc_node_version" != "" ]; then
        if [ "$nvmrc_node_version" != "N/A" ] && [ "$nvmrc_node_version" != "$node_version" ]; then
            nvm install ${nvmrc_node_version}
        fi
    elif [ "$node_version" != "$(nvm version default)" ]; then
        [ "$nvmrc_node_version" != "$node_version" ]
        nvm use default
    fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
