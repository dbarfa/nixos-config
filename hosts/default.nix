{
  inputs,
  nixpkgs,
  vars,
  home-manager,
  ...
}: let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  lib = nixpkgs.lib;
in {
  dbarfa = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs vars; };
    modules = [
      ./configuration.nix
      home-manager.nixosModules.home-manager {
        home-manager = {
          extraSpecialArgs = { inherit inputs; };
          useGlobalPkgs = true;
          useUserPackages = true;
	  users.${vars.user} = {
	  imports = [
              ../home/home.nix
            ];
	  };
	  };
	}
    ];
  };
}

	  

