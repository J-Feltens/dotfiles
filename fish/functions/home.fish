function home --description "attempts to connect to wireguard and ssh into jaycorn"
	wg-up
	ssh jaycorn@192.168.199.21
end
