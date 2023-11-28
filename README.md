# nixos-config

Personal NixOS configuration utilizing Flakes and home-manager.

## Structure

- `./flake.nix`: Entry point.
- `./user/configuration.nix`: System environment configuration.
- `./user/home.nix`: User environment configuration using home-manager.
- `./modules/*/default.nix`: Setup of programs with custom configurations/hm.
- `./modules/nvim`: Neovim plugins installed via Nix and managed with Lua.
