{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      format = "$username[@](bold green)$hostname$directory$all";

      username = {
        show_always = true;
        format = "[\\[](bold bright-red)[$user]($style)";
        style_user = "bold yellow";
        style_root = "bold red";
      };

      hostname = {
        ssh_only = false;
        format = "[$hostname]($style) ";
        style = "bold cyan";
      };

      directory = {
        format =
          "[$path]($style)[$read_only]($read_only_style)[\\]](bold bright-red) ";
      };
    };
  };
}
