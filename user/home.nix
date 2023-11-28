{ pkgs, ... }:

{
  imports = [ (import ../modules) ];
  home.username = "dbarfa";
  home.homeDirectory = "/home/dbarfa";

  home.packages = with pkgs; [
    ripgrep
    jq
    fzf
    nnn
    bat
    htop
    mpv
    eza
    gcc

    xclip
    file
    which
    tree
    neofetch

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

    # LSP Servers
    nodePackages_latest.pyright
    cmake-language-server
    nil
    rust-analyzer
    ansible-language-server
    nodePackages_latest.dockerfile-language-server-nodejs
    nodePackages.vim-language-server
    lua-language-server
  ];

  home.sessionVariables = {
    LANG = "en_US.UTF-8";
    LC_CTYPE = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    EDITOR = "nvim";
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
