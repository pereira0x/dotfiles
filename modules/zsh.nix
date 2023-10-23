{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      ls = "exa";
      u = "sudo nixos-rebuild switch";
      cd = "z";
      ":q" = "exit";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "aliases"];
      theme = "robbyrussell";
    };
    enableCompletion = true;
    enableAutosuggestions = true;
    autocd = true;
    #plugins = [
    #  {
    #    name = "powerlevel10k";
    #    src = pkgs.zsh-powerlevel10k;
    #    file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    #  }
    #];
  };
}
