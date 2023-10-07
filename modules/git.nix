{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
      userName = "José Pereira";
      userEmail = "jose.pereira@rnl.tecnico.ulisboa.pt";
      extraConfig = {
        color.ui = true;
        pull.rebase = true;
        init.defaultBranch = "main";
      };
  };
}
