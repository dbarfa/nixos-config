{
  description = "dbarfa's NixOS Flake";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
	url = "github:nix-community/home-manager";
	inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  outputs = imputs@{ self, nixpkgs,home-manager,... }: 
    let 
    	vars = { user = "dbarfa"; };
    in {
    	nixosConfigurations = {
      	    dbarfa = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
	    specialArgs = inputs;
            modules = [
              ./configuration.nix
	      home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;

                home-manager.users.dbarfa = import ./home.nix;
              }
            ];
          };
        };
      };
