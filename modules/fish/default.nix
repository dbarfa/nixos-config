{ ... }: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      function fish_greeting
      end
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
}
