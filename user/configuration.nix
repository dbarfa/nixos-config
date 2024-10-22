{ config, pkgs, ... }:

{
  imports = [ ./vmware/hardware-configuration.nix ];

  nixpkgs.config = { allowUnfree = true; };

  nix = { settings = { experimental-features = [ "nix-command" "flakes" ]; }; };
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  environment.localBinInPath = true;

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  users.users.dbarfa = {
    isNormalUser = true;
    description = "dbarfa";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" "video" "docker" ];
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-kde ];
    xdgOpenUsePortal = true;
    wlr = { enable = true; };
  };

  environment.systemPackages = with pkgs; [ git wget neovim curl dig ];

  environment.variables.EDITOR = "nvim";

  networking.networkmanager.enable = true;
  networking.hostName = "dbarfa";

  time.timeZone = "Europe/Brussels";
  time.hardwareClockInLocalTime = true;

  i18n.defaultLocale = "en_US.UTF-8";

  nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  services.xserver = {
    enable = true;
    layout = "us";
    windowManager = { i3.enable = true; };
    displayManager = {
      defaultSession = "none+i3";
      lightdm.enable = true;
    };
    desktopManager = {
      xterm.enable = false;
      wallpaper.mode = "fill";
    };
    xkbVariant = "";
    xkbOptions = "ctrl:nocaps";
  };

  # services.printing.enable = true;

  # sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # hardware.opengl = {
  #   enable = true;
  #   driSupport = true;
  #   driSupport32Bit = true;
  # };

  virtualisation.vmware.guest.enable = true;

  #services.xserver.videoDrivers = [ "nvidia" ];
  #hardware.nvidia = {
  #  modesetting.enable = true;
  #
  #    powerManagement.enable = false;
  #    powerManagement.finegrained = false;
  #
  #    open = false;
  #    nvidiaSettings = true;
  #    package = config.boot.kernelPackages.nvidiaPackages.stable;
  #  };

  boot = {
    loader = { systemd-boot.enable = true; };
    # remove nomodeset for vmware
    #kernelParams = ["nomodeset"];
  };

  system.stateVersion = "23.11"; # Did you read the comment?
}
