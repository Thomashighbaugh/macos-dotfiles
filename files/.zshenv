# ---------------------- Cargo ---------------------- #
if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi
# --------------------------------------------------- #

# ----------------------- PATH ---------------------- #
export PATH="/usr/local/opt/cython/bin:$PATH"
export NODEBREW_ROOT="/usr/local/var/nodebrew"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.nodebrew/current/bin:$PATH"
export PATH="$PATH:/Users/tlh/.local/bin"
export PATH="/usr/local/opt/e2fsprogs/bin:$PATH"
export PATH="/usr/local/opt/e2fsprogs/sbin:$PATH"
export PATH="/usr/local/opt/ccache/libexec:$PATH"
export PATH="/Users/tlh/Library/Python/3.12/bin:$PATH"
# --------------------------------------------------- #

# --------------- Node Version Manager -------------- #
if [ -n "$NVM_DIR" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
fi
# --------------------------------------------------- #

# ----------------------- pnpm ---------------------- #
export PNPM_HOME="/Users/tlh/Library/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# --------------------------------------------------- #
