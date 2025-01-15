function ls-size --description "ls using eza with column for total directory ls-size"
    if command -q eza
        echo
        eza -l --total-size -o --header --no-user $argv
        echo
    else
        # Fallback to the default ls if eza isn't installed
        command ls $argv
    end
end
