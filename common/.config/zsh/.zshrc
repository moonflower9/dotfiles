# show dotfiles
setopt GLOBDOTS

# apply pywal theme
[ -f ~/.cache/wal/sequences ] && cat ~/.cache/wal/sequences

# source global shell alias file
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/alias" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/alias"

# syntax highlighting
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] &&
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# welcome
print -P "it's %F{2}$(date +'%I:%M%P')   %F{3}${$(uptime -p)#up}   %F{4}$(uname -r)%f"

# set up prompt
PROMPT=$'\n'"%K{0}%F{7} $SHELL %f%k %K{8}%F{0} %n %f%k %K{4}%F{7} %~ %f%k ❯ "
