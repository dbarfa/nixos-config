{ config, pkgs, lib , ... }: 
{
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod1";
      # Use kitty as default terminal
      terminal = "ghostty"; 
      startup = [
      ];
    };
  };
}
