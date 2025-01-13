function ls --description "Use eza for a fancier ls"
    if command -q eza
        eza -l -o --header --no-user $argv
    else
        # Fallback to the default ls if eza isn't installed
        command ls $argv
    end
end
