switch:
	sudo nixos-rebuild switch --flake ".#$(shell whoami)"
