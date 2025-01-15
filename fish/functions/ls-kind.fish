function ls-size --description "ls using eza, sorted by file type"

    if command -q eza
        echo
        eza -l --sort=type -o --header --no-user $argv
        echo
    else
        # Fallback to the default ls if eza isn't installed
        command ls $argv
    end
end
