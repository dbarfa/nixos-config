{ ... }: {
  imports = [ (import ../modules/nvim) ] ++ [ (import ../modules/git) ]
    ++ [ (import ../modules/tmux) ] ++ [ (import ../modules/direnv) ]
    ++ [ (import ../modules/kitty) ] ++ [ (import ../modules/sway) ]
    ++ [ (import ../modules/alacritty) ] ++ [ (import ../modules/fish) ];
}
