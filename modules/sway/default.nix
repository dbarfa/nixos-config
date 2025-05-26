{ pkgs, lib, ... }:
let
  leftMonitor = "Microstep MSI G2712 0x000013D2";
  rightMonitor = "Microstep MSI G2712 0x0000089A";
  activeMonitor = "$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')";
in
{
  wayland.windowManager.sway = {
    enable = true;

    config = rec {
      modifier = "Mod1";
      terminal = "ghostty";
      startup = [ 
        { command = "${pkgs.protonvpn-gui}/bin/protonvpn-app"; }
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

      focus = {
        followMouse = false;
      };

      gaps.inner = 5;

      workspaceOutputAssign = [
        { output = leftMonitor;  workspace = "1"; }
        { output = rightMonitor; workspace = "2"; }
      ];

      window = {
        border = 2;
        titlebar = false;
      };

      keybindings = lib.mkOptionDefault {
        # rofi: dmenu
        #"${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -show drun -monitor ${activeMonitor}";
        # rofi: clipboard

        # audio keyboard volume knob
        "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_SINK@ 5%+";
        "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_SINK@ 5%-";
        "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_SINK@ toggle";
      };
    };

    extraOptions = [
      # nvidia gpu
      "--unsupported-gpu"
    ];
    extraConfig = ''
    '';
  };
}
