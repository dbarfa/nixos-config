{ pkgs, inputs, ... }:

{
  imports = [ (import ../modules) ];
  home.username = "dbarfa";
  home.homeDirectory = "/home/dbarfa";

  home.packages = with pkgs; [
    ghostty
    ripgrep
    jq
    fzf
    nnn
    bat
    htop
    mpv
    eza

    xclip
    file
    which
    tree
    neofetch
    
    stremio
    brave
    firefox
    obs-studio
    protonvpn-gui
    protonvpn-cli_2
    pavucontrol

    nix-output-monitor
    sysstat
    lm_sensors
    pciutils
    usbutils
    lazygit
    
    # LSP Servers
    pyright
    cmake-language-server
    clang
    #gcc
    vimPlugins.clangd_extensions-nvim
    nil
    rust-analyzer
    ansible-language-server
    nodePackages_latest.dockerfile-language-server-nodejs
    nodePackages.vim-language-server
    nodePackages.typescript
    nodePackages.typescript-language-server
    lua-language-server


    waybar
    rofi-wayland
    wl-clipboard
    wl-clip-persist
    cliphist
    networkmanagerapplet
    xdg-utils
    grim
    slurp
    libnotify
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
      glr = "git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short";
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
