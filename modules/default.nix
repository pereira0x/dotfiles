{ config, pkgs, ... }:

{
  imports = [
    ./starship.nix
    ./alacritty.nix
    ./git.nix
    ./zsh.nix
    ./zoxide.nix
    ./picom.nix
  ];
}
