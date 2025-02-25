function jpy --description "starts the jmath environment using ipython"
	cd ~/dotfiles/jpython && source venv/bin/activate.fish && ipython -i jmath.py
end
