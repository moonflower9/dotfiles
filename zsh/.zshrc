# history
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt append_history        # append on exit instead of overwriting
setopt inc_append_history    # write each command as it runs
setopt share_history         # share history across concurrent shells
setopt hist_ignore_all_dups  # drop older duplicates
setopt hist_reduce_blanks    # squeeze extra blanks
setopt hist_verify           # show expanded history before running

# source global shell alias file
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/alias" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/alias"

# autosuggestions (must be sourced before syntax highlighting)
[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] &&
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# suggest from history first, then fall back to completion
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Right arrow accepts the suggestion (falls back to normal cursor motion when
# there is no suggestion, since accept at end-of-buffer is a no-op otherwise).
bindkey "^[[C" autosuggest-accept

# syntax highlighting (must be sourced last)
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] &&
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# environment (set here so non-login interactive shells get them too)
export EDITOR="nvim"
export BROWSER="firefox"

# add local binaries to PATH
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# set up prompt
PROMPT="%F{8}%n %F{#ff8800}%~%f $ "
