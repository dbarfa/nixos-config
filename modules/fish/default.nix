{...}: {
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
}
