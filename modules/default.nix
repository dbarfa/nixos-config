{ ... }: {
  imports = [ (import ../modules/nvim) ] ++ [ (import ../modules/git) ]
    ++ [ (import ../modules/tmux) ] ++ [ (import ../modules/direnv) ]
    ++ [ (import ../modules/kitty) ] ++ [ (import ../modules/i3) ]
    ++ [ (import ../modules/alacritty) ] ++ [ (import ../modules/fish) ];
}
