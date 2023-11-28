{ ... }: {
  imports = [ (import ../modules/nvim) ]
    ++ [(import ../modules/git)]
    ++ [(import ../modules/tmux)]
    ++ [(import ../modules/direnv)]
    ++ [(import ../modules/fish)];
}
