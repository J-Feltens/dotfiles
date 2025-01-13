echo "Deploying dotfiles from git repo to system may overwrite system files."
read -p "Continue? (y/n) " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo test
fi
