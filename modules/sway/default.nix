{ config, pkgs, lib, ... }:
let
  leftMonitor = "Microstep MSI G2712 0x000013D2";
  rightMonitor = "Microstep MSI G2712 0x0000089A";
in
{
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod1";
      terminal = "ghostty";
      startup = [
      ];

      output = {
        "${leftMonitor}" = {
          pos = "0 0";
        };
        "${rightMonitor}" = {
          pos = "1920 0";
        };
      };
      
      input = {
        "*" = {
          xkb_options = "ctrl:nocaps";
        };
      };
    };
    extraConfig = ''
      workspace "1" output "${leftMonitor}"
      workspace "2" output "${rightMonitor}"
    '';
  };
}

