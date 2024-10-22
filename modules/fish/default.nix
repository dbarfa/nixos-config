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
      gl = "git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short";
      lg = "lazygit";
      ls = "eza";
      cat = "bat";
    };
  };
}
