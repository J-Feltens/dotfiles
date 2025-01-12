if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting 'Moinsen ;)'

### ALIASES
alias pw='dcli password'
alias jvnc='x11vnc -display :1 -auth guess -forever -loop -noxdamage -repeat - passwd pwd -rfbport 5901'
alias obsidian='~/Obsidian'
alias fs='starship init fish | source'

# init starship prompt on startup
#
# starship init fish | source
