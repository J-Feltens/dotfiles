if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_prompt_pwd_dir_length 0

set -U fish_greeting 'Moinsen ;)'

### ALIASES
alias pw='dcli password'
alias jvnc='x11vnc -display :0 -auth guess -forever -loop -noxdamage -repeat -passwd pwd -rfbport 5901'
alias obsidian='~/Obsidian'
alias fs='starship init fish | source && clear'
alias tk='tmux kill-server'                    # kill tmux server
alias bat='batcat'

# init starship prompt on startup
#
# starship init fish | source
