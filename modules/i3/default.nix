{ pkgs, lib, ... }:
let
  leftMonitor = "DP-2";
  rightMonitor = "DP-4";
in
{
  xsession.windowManager.i3 = {
    enable = true;

    config = rec {
      modifier = "Mod1";
      terminal = "ghostty";
      startup = [
        { command = "${pkgs.protonvpn-gui}/bin/protonvpn-app"; always = true; }
      ];


      focus = {
        followMouse = false;
      };

      window = {
        border = 2;
        titlebar = false;
      };

      keybindings = lib.mkOptionDefault {
        "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5%";
        "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5%";
        "XF86AudioMute"        = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle";
        # "${modifier}+d" = "exec rofi -show drun";
      };
    };

    extraConfig = ''
      # Assign workspaces to specific outputs
      workspace 1 output ${leftMonitor}
      workspace 2 output ${rightMonitor}

      # For NVIDIA, if needed
      # exec --no-startup-id nvidia-settings --load-config-only
    '';
  };
}
