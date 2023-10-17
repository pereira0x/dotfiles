{ config, pkgs, ... }:

{
  services.dunst = {
    enable = true;
    iconTheme = {
      name = "Pop";
      package = pkgs.pop-icon-theme;
    };
    settings = {
      global = {
        monitor = 0;
        geometry = "600x50-50+65";
        shrink = "yes";
        transparency = 10;
        padding = 16;
        horizontal_padding = 16;
        frame_width = 3;
        frame_color = "#cad3f5";
        separator_color = "frame";
        font = "JetBrainsMono Nerd Font 10";
        line_height = 4;
        idle_threshold = 120;
        markup = "full";
        format = ''<b>%s</b>\n%b'';
        alignment = "left";
        vertical_alignment = "center";
        icon_position = "left";
        word_wrap = "yes";
        ignore_newline = "no";
        show_indicators = "yes";
        sort = true;
        stack_duplicates = true;
        startup_notification = false;
        hide_duplicate_count = true;
      };
      urgency_low = {
        background = "#24273a";
        foreground = "#cad3f5";
        timeout = 10;
        icon = "dialog-information";
      };

      urgency_normal = {
        background = "#24273a";
        foreground = "#cad3f5";
        timeout = 10;
        icon = "dialog-information";
      };

      urgency_critical = {
        background = "#24273a";
        foreground = "#cad3f5";
        timeout = 0;
        icon = "dialog-error";
      };
    };
  };
}
