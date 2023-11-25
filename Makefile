# nix-shell -p gnumake --command "make {target}"

_NAME = $(shell whoami)

test:
	sudo nixos-rebuild test --flake ".#$(_NAME)"
switch:
	sudo nixos-rebuild switch --flake ".#$(_NAME)"
