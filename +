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
  cp -rf ~/dotfiles/nvim ~/.config/
  cp -rf ~/dotfiles/fish ~/.config/
  cp -rf ~/dotfiles/tmux ~/.config/
  cp -rf ~/dotfiles/starship ~/.config/

  echo 'Done :)'
else
  echo "Aborting..."
  exit 1
fi

