function ls-kind --description "Use eza for a fancier ls"
    if command -q eza
        echo
        eza -l --sort=type -o --header --no-user $argv
        echo
    else
        # Fallback to the default ls if eza isn't installed
        command ls $argv
    end
end
