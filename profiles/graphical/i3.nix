{ pkgs, config, lib, ... }:
let
  wallpapersDir = "${config.home.homeDirectory}/nixos-config/wallpapers/";
  wallpaper = "wp2.jpg";
  wallpaperPath = "${wallpapersDir}${wallpaper}";
in {
  xsession.windowManager.i3 = {
    enable = true;

    config = rec {
      modifier = "Mod4";

      window = {
        border = 2;
        titlebar = false;
      };

      workspaceAutoBackAndForth = false;

      gaps = {
        inner = 15;
        outer = 5;
      };

      keybindings = lib.mkOptionDefault {
        "${modifier}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
        "${modifier}+b" = "exec ${pkgs.brave}/bin/brave";
        "Print" = "exec ${pkgs.flameshot}/bin/flameshot gui";
        "${modifier}+x" = "exec ${pkgs.i3lock-fancy}/bin/i3lock-fancy";
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
