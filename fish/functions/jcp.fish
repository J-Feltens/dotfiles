function jcp --description "rsync with total progress + recursive flag"
	rsync -ar --info=progress2 $argv
end
