# nixos-config

Personal NixOS configuration utilizing Flakes and home-manager.

## Structure

- `./flake.nix`: Entry point.
- `./user/configuration.nix`: System environment configuration.
- `./user/home.nix`: User environment configuration using home-manager.
- `./modules/*/default.nix`: Setup of programs with custom configurations/hm.
- `./modules/nvim`: Neovim plugins installed via Nix and managed with Lua.

----
## Installation notes on hypervisor WIP
* Download minimal NixOS: https://nixos.org/download.html
* Install/Enable hypervisor(Hyper-V, VMWare, QEMu etc)
* Give VM 8GB RAM, 6 cores+, 100GB+ Disk, Share Network, UEFI
* Boot VM and change password to root
  ```
  $ sudo su
  $ passwd
  ```
* Grab VM ip with `ifconfig` and add it to ssh ip below
* Outside of VM run ssh install command below. on windows run it in Git Bash or WSL.
* without swap the installation might hang.
* if `/dev/sda` is not available, edit accordingly
```
ssh -o PubkeyAuthentication=no -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -p22 root@xx.xx.xx.xx " \
  parted /dev/sda -- mklabel gpt; \
  parted /dev/sda -- mkpart primary 512MiB -8GiB; \
  parted /dev/sda -- mkpart primary linux-swap -8GiB 100\%; \
  parted /dev/sda -- mkpart ESP fat32 1MiB 512MiB; \
  parted /dev/sda -- set 3 esp on; \
  sleep 1; \
  mkfs.ext4 -L nixos /dev/sda1; \
  mkswap -L swap /dev/sda2; \
  mkfs.fat -F 32 -n boot /dev/sda3; \
  sleep 1; \
  mount /dev/disk/by-label/nixos /mnt; \
  mkdir -p /mnt/boot; \
  mount /dev/disk/by-label/boot /mnt/boot; \
  swapon /dev/sda2; \
  nixos-generate-config --root /mnt; \
  sed --in-place '/system\.stateVersion = .*/a \
    nix.package = pkgs.nixUnstable;\n \
    nix.extraOptions = \"experimental-features = nix-command flakes\";\n \
    services.openssh.enable = true;\n \
    services.openssh.settings.PasswordAuthentication = true;\n \
    services.openssh.settings.PermitRootLogin = \"yes\";\n \
    users.users.root.initialPassword = \"root\";\n \
  ' /mnt/etc/nixos/configuration.nix; \
  nixos-install --no-root-passwd && reboot; \
"
```
for more check nixos-help, mitchellh/nixos-config or https://github.com/search?q=language%3ANix+virtualisation.hyperv&type=code 


## Troubleshooting
1. **Issue Description:** `$DISPLAY` is unavailable, preventing the display manager from starting. Running `systemctl status display-manager` results in errors.

   **Solution:** Add the "nomodeset" option to the `configuration.nix` file. This disables kernel mode-setting features, opting for BIOS/UEFI video mode instead.

   ```nix
   boot.loader.kernelParams = [ "nomodeset" ];
   ```
2. **Issue Description:** `command-not-found` feature is not working, executing commands with typos throws errors like:
   ```bash
   $ ifconfif
   DBI connect('dbname=/nix/var/nix/profiles/per-user/root/channels/nixos/programs.sqlite','',...) failed:
   unable to open database file at /run/current-system/sw/bin/command-not-found line 13.
   ```
   instead of
   ```bash
   $ ifconfif
   ifconfif: command not found 
   ```
   **Solution:** Run `sudo nix-channel --update`, this should update the channel and add the `programs.sqlite` dependency. 
