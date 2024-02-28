{ pkgs, lib, ... }:
let
  wallpaperPath = "~/nixos-config/wallpapers/wp1.png";
in
{
  xsession.windowManager.i3 = {
    enable = true;

    config = rec {
      modifier = "Mod4";

      window = {
        border = 2;
        titlebar = false;
      };

      workspaceAutoBackAndForth = true;

      gaps = {
        inner = 15;
        outer = 5;
      };

      keybindings = lib.mkOptionDefault {
        "${modifier}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
        "${modifier}+b" = "exec ${pkgs.brave}/bin/brave";
      };

      startup = [
        {
          command = "${pkgs.feh}/bin/feh --bg-scale ${wallpaperPath}";
          always = true;
          notification = false;
        }
        {
          command = "xset r rate 190 75";
          always = true;
          notification = false;
        }
      ];
    };
  };
}
