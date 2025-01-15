echo "Deploying dotfiles from git repo to system may overwrite system files."
read -p "Continue? (y/n) " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	cp -rf ~/dotfiles/nvim ~/.config/
	cp -rf ~/dotfiles/fish ~/.config/
	cp -rf ~/dotfiles/tmux ~/.config/
	cp -rf ~/dotfiles/starship ~/.config/

	echo 'Done :)'
else
	echo Aborting...
fi
