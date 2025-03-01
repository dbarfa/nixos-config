{ ... }: {
  programs.git = {
    enable = true;
    userName = "Daniel-George Barfa";
    userEmail = "contact@dbarfa.com";
    extraConfig = { 
      safe = {
        directory = "*";
      };
      diff = {
        algorithm = "histogram";
        colorMoved = "plain";
        mnemonicPrefix = true;
        renames = true;
      };
      column.ui = "auto";
      branch.sort = "-committerdate";
      tag.sort = "version:refname";
      push = {
        default = "simple";
        autoSetupRemote = false;
      };
      commit.verbose = true;
    };
  };
}
