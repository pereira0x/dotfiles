{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      ls = "eza";
      u = "sudo nixos-rebuild switch";
      cd = "z";
      ":q" = "exit";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "aliases" ];
      theme = "robbyrussell";
    };
    enableCompletion = true;
    enableAutosuggestions = true;
    autocd = true;
  };
}
