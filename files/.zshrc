export PATH="/usr/local/opt/cython/bin:$PATH"

export NODEBREW_ROOT="/usr/local/var/nodebrew"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.nodebrew/current/bin:$PATH"
# Created by `pipx` on 2024-04-12 01:59:27
export PATH="$PATH:/Users/tlh/.local/bin"
export PATH="/usr/local/opt/e2fsprogs/bin:$PATH"
export PATH="/usr/local/opt/e2fsprogs/sbin:$PATH"
export PATH="/usr/local/opt/ccache/libexec:$PATH"
export PATH="/Users/tlh/Library/Python/3.12/bin:$PATH"

alias ll="ls -alh"
alias cd..="cd .."
alias vim="nvim "
alias rm="rm -rvf" # warning, dangerous. Do not replicate. Ever
alias cd...="cd ../.."
alias gita='git add . && git commit -m "$(date +%s)" && git push'



source /usr/local/Cellar/zsh-async/1.8.6/share/zsh/site-functions/async
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-autopair/autopair.zsh
source /usr/local/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/local/share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh
source /usr/local/share/zsh-you-should-use/you-should-use.plugin.zsh
source ~/.iterm2_shell_integration.zsh

fpath+=("$(brew --prefix)/share/zsh/site-functions")

autoload -U promptinit; promptinit
prompt pure

eval "$(fzf --zsh)"

# functions 


brewdesc() {
    brew search "$1" | awk '{print $1}' | while read -r command; do
        if brew desc "$command" >/dev/null 2>&1; then
            brew desc "$command"
        fi
    done
}
 export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion






############################################




