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


# ref: https://github.com/mooz/percol
function exists { which $1 &> /dev/null }
if exists peco; then
    function peco_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }

    zle -N peco_select_history
    bindkey '^R' peco_select_history

    # repository viewer
    function re {
        cd $(ls -d $HOME/GitHub/* | peco)
    }
fi

export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin


eval "$(hub alias -s)"
