{ config, pkgs, ... }:

{

  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
