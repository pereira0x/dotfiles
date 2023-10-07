{ config, pkgs, ... }:

{

  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  programs.zsh = {
    enable = true;
    shellAliases = {
      ls = "exa";
      update = "sudo nixos-rebuild switch";
      cd = "z";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };
}
