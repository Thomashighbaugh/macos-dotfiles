#  _______ _______ _______ ______ ______
# |__     |     __|   |   |   __ \      |
# |     __|__     |       |      <   ---|
# |_______|_______|___|___|___|__|______|
# --------------------------------------------------- #

# --------------------- Aliases --------------------- #
alias ll="ls -alh"
alias cd..="cd .."
alias vim="nvim "
alias rm="rm -rvf" # warning, dangerous. Do not replicate. Ever
alias cd...="cd ../.."
alias gita='git add . && git commit -m "$(date +%s)" && git push'
alias bs="brew search --eval-all --desc "
alias bi="brew install "
alias bup="brew update && brew upgrade && brew cleanup"
# --------------------------------------------------- #

# --------------------- Plugins --------------------- #
source /usr/local/Cellar/zsh-async/1.8.6/share/zsh/site-functions/async
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-autopair/autopair.zsh
source /usr/local/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/local/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/local/share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh
source /usr/local/share/zsh-you-should-use/you-should-use.plugin.zsh
source ~/.iterm2_shell_integration.zsh

# --------------------------------------------------- #

# ------------------ ZSH Functions ------------------ #
autoload -U promptinit
promptinit
prompt pure

eval "$(fzf --zsh)"

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi
# --------------------------------------------------- #

# ------------------ zsh completion ----------------- #
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

zstyle -e ':completion:*:approximate:*' \
  max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:*:xdvi:*' menu yes select
zstyle ':completion:*:*:xdvi:*' file-sort time
# --------------------------------------------------- #

# ------------------- zsh options ------------------- #
setopt ALWAYS_TO_END     # Move cursor to the end of a completed word
setopt AUTO_CD           # Auto changes to a directory without typing cd
setopt AUTO_LIST         # Automatic list choices on ambiguous completion
setopt AUTO_MENU         # Show completion menu on successive tab press
setopt AUTO_MENU         # Show completion menu on succesive tab press
setopt AUTO_NAME_DIRS    # Auto add variable-stored paths to ~ list
setopt AUTO_PARAM_SLASH  # If completed parameter is a directory, add a trailing slash
setopt BG_NICE           # Run all background jobs at a lower priority
setopt COMPLETE_IN_WORD  # Allow completion from within a word
setopt EXTENDED_GLOB     # Extended globbing
setopt EXTENDED_HISTORY  # Record timestamp of command in HISTFILE
setopt GLOB_DOTS         # Don't require a leading '.' in a filename to be matched explicitly
setopt HIST_BEEP         # Beep when accessing non-existent history
setopt HIST_IGNORE_DUPS  # Don't record an entry that was just recorded again
setopt HIST_VERIFY       # Don't execute immediately upon history lookup
setopt MENU_COMPLETE     # Do not autoselect the first completion entry
setopt NO_CASE_GLOB      # Case insensitive globbing
setopt NUMERIC_GLOB_SORT # Sort filenames numerically when it makes sense
setopt PATH_DIRS         # Perform path search even on command names with slashes
setopt PROMPT_SUBST      # Perform parameter expansion, command substitution, and arithmetic expansion in prompts
setopt SHARE_HISTORY     # Share history between sessions
# --------------------------------------------------- #
