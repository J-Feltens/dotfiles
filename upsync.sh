#!/bin/bash

# Message about deployment
echo "Deploying dotfiles from git repo to system may overwrite system files."

# Default flag for auto-confirmation
YES_FLAG=false

# Parse options
while getopts ":y" opt; do
  case $opt in
    y)
      YES_FLAG=true
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

# Prompt for confirmation if -y is not provided
if ! $YES_FLAG; then
  read -p "Continue? (y/n) " -n 1 -r
  echo    # Move to a new line
fi

# Check confirmation
if $YES_FLAG || [[ $REPLY =~ ^[Yy]$ ]]; then
  # Deployment commands
	cp -rf ~/.config/nvim ~/dotfiles
	cp -rf ~/.config/fish ~/dotfiles
	cp -rf ~/.config/tmux ~/dotfiles

	# copy current starship theme into theme directory	
	cp -rf ~/.config/starship.toml ~/.config/starship/active_starship.toml
	cp -rf ~/.config/starship ~/dotfiles
	echo 'Done :)'
else
	echo Aborting...
fi
