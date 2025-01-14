echo "Deploying dotfiles from git repo to system may overwrite system files."
read -p "Continue? (y/n) " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	cp -rf ~/Documents/dotfiles/nvim ~/.config/
	cp -rf ~/Documents/dotfiles/fish ~/.config/
	cp -rf ~/Documents/dotfiles/tmux ~/.config/
	cp -rf ~/Documents/dotfiles/starship ~/.config/

	echo 'Done :)'
else
	echo Aborting...
fi
