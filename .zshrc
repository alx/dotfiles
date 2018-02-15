export ZSH=/home/alx/.oh-my-zsh
export PATH="$PATH:/usr/bin:/usr/local/bin:/bin:$HOME/bin:$HOME/.rvm/bin"

ZSH_THEME="robbyrussell"
plugins=(git zsh-256color)

export EDITOR='vim'

source $ZSH/oh-my-zsh.sh

man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Are we on a terminal?
if [ -t 0 ];
then
    stty sane
    stty stop ''
    stty start ''
    stty werase ''
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
