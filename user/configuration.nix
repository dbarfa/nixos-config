{ config, pkgs, ... }:

{
  imports = [ ./desktop/hardware-configuration.nix ];

  nixpkgs.config = { allowUnfree = true; };
  nix = { settings = { experimental-features = [ "nix-command" "flakes" ]; }; };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
  programs = {
    fish.enable = true;
    thunar.enable = true;
    sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };
    steam.enable = true;
  };
  users.defaultUserShell = pkgs.fish;
  users.users.dbarfa = {
    isNormalUser = true;
    description = "dbarfa";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" "video" "docker" "input" ];
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
  };

  environment = {
    systemPackages = with pkgs; [ git wget neovim curl dig grim slurp wl-clipboard mako ];
    localBinInPath = true;
    variables = {
      EDITOR = "nvim";
    };
  };
  services.gnome.gnome-keyring.enable = true;
  networking = {
    hostName = "dev";
    wireguard.enable = true;
    networkmanager.enable = true;
    firewall.checkReversePath = "loose";  
  };
  time = {
    timeZone = "Europe/Brussels";
    hardwareClockInLocalTime = true;
  };

  i18n.defaultLocale = "en_US.UTF-8";

  nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd sway";
        user = "dbarfa";
      };

    }; 
  };

  services.xserver = {
    enable = false;
    #layout = "us";
    #windowManager = { i3.enable = true; };
    #displayManager = {
    #  defaultSession = "none+i3";
    #  lightdm.enable = true;
    #};
    #desktopManager = {
    #  xterm.enable = false;
    #  wallpaper.mode = "fill";
    #};
    videoDrivers = [ "nvidia" ];
    #xkbVariant = "";
    #xkbOptions = "ctrl:nocaps";
  };

  # services.printing.enable = true;

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  boot = {
    loader = { systemd-boot.enable = true; };
    kernelParams = [ ];
  };

  system.stateVersion = "23.11"; # Did you read the comment?
}
