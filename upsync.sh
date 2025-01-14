echo "Upsyncing system files to git repo may overwrite repository."
read -p "Continue? (y/n) " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	cp -rf ~/.config/nvim ~/Documents/dotfiles
	cp -rf ~/.config/fish ~/Documents/dotfiles
	cp -rf ~/.config/tmux ~/Documents/dotfiles
	cp -rf ~/.config/starship.toml ~/.config/starship/active_starship.toml
	cp -rf ~/.config/starship ~/Documents/dotfiles
	echo 'Done :)'
else
	echo Aborting...
fi
