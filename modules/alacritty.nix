{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      import = [
        pkgs.alacritty-theme.thelovelace
      ];
      window = {
        opacity = 0.75;
      };
      font = {
        size = 12;
        draw_bold_text_with_bright_colors = true;
        normal = {
          family = "JetbrainsMono Nerd Font";
          style = "Regular";
        };
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
      shell.program = "${pkgs.zsh}/bin/zsh";

    };
  };
}
