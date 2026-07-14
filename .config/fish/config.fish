## Set values
# Set greeting
set -U fish_greeting

## Functions
# Fish command history
function history
    builtin history --show-time='%F %T '
end

function backup --argument filename
    cp $filename $filename.bak
end

## Useful aliases
# Replace ls with eza
alias ls='eza -al --color=always --group-directories-first --icons=always' # preferred listing
alias la='eza -a --color=always --group-directories-first --icons=always'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons=always'  # long format
alias lt='eza -aT --color=always --group-directories-first --icons=always' # tree listing
alias l.="eza -a | grep -e '^\.'"                                          # show only dotfiles

# Updating
alias update='sudo pacman -Syu'

# Get fastest mirrors
alias mirror="sudo cachyos-rate-mirrors"

# Cleanup orphaned packages
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'

# Fastfetch
alias ff='fastfetch'
