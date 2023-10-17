{ config, pkgs, lib, ... }:

{
  services.picom = {
    enable = true;
    backend = "glx";
    shadow = true;
    vSync = true;
    activeOpacity = 0.95;
    inactiveOpacity = 0.5;
    fade = true;
    fadeDelta = 2;
    opacityRules = [
      "100:class_g = 'Alacritty' && focused"
      "50:class_g = 'Alacritty' && !focused"
      "100:class_g = 'Rofi'"
    ];
    settings = {
      blur = {
        method = "kawase";
        size = 50;
        deviation = 7.0;
      };
    };
  };
}
