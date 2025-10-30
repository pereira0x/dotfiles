{ config, lib, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      window = { opacity = 0.75; };
      font = {
        size = 12;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
      terminal.shell.program = "${pkgs.zsh}/bin/zsh";
      colors = {
        draw_bold_text_with_bright_colors = true;
      };
    };
  };
}
