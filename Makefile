# nix-shell -p gnumake --command "make {target}"
# Ctrl+R "gnumake" to easily construct nix-shell

_NAME = $(shell whoami)

test:
	sudo nixos-rebuild test --flake ".#$(_NAME)"
switch:
	sudo nixos-rebuild switch --flake ".#$(_NAME)"
