{ config, pkgs, ... }:

{
  home.username = "dbarfa";
  home.homeDirectory = "/home/dbarfa";

  home.packages = with pkgs; [
    ripgrep
    jq
    fzf
    nnn
    bat
    tmux
    htop
    mpv
    eza
    gcc

    file
    which
    tree
    neofetch

    alacritty

    nix-output-monitor

    sysstat
    lm_sensors
    pciutils
    usbutils

    firefox
    discord
    obsidian
    stremio
    gparted
    solaar
    lazygit
  ];

  home.sessionVariables = {
    LANG = "en_US.UTF-8";
    LC_CTYPE = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    EDITOR = "nvim";
  };
  
  programs.neovim = {
    enable = true;
    withNodeJs = true;
    extraConfig = ":luafile ~/nixos/nvim/init.lua";
  };

  programs.git = {
    enable = true;
    userName = "dbarfa";
    userEmail = "contact@dbarfa.com";
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';

    shellAliases = {
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gs = "git status";

      lg = "lazygit";
      ls = "eza";
      cat = "bat";
    };
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gs = "git status";

      lg = "lazygit";
      ls = "eza";
      cat = "bat";
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
