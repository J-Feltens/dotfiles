$DIR="~/dotfiles"

echo "Upsyncing system files to git repo may overwrite repository."
read -p "Continue? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	cp -rf ~/.config/nvim ~/$DIR/dotfiles
	cp -rf ~/.config/fish ~/$DIR/dotfiles
	cp -rf ~/.config/tmux ~/$DIR/dotfiles

	# copy current starship theme into theme directory	
	cp -rf ~/.config/starship.toml ~/.config/starship/active_starship.toml
	cp -rf ~/.config/starship ~/$DIR/dotfiles
	echo 'Done :)'
else
	echo Aborting...
fi
