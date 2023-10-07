{ config, pkgs, ... }:

{
  home = {
    username = "pereira";
    homeDirectory = "/home/pereira";
    packages = with pkgs; [
      polybar # status bar
      brave # browser
      flameshot # screenshot tool
      cava # audio visualizer
      gotop # system monitor
      vscode # code editor
      nixpkgs-fmt # nix formatter
      neofetch # system info
      ranger # terminal file manager
      zip # compression and file packaging
      unzip # decompression
      exa # A modern replacement for ‘ls’
      file # determine file type
      which # locate a command
      tree # list contents of directories in a tree-like format
      glow # markdown previewer in terminal
      btop # replacement of htop/nmon
      iftop # network monitoring
      bat # A cat clone with wings.
      tldr # man pages with practical examples
      neovim # text editor
      killall # kill processes by name
      xfce.thunar # file manager
      rofi # window switcher, application launcher and dmenu replacement
      pywal # color scheme generator
      calc # arbitrary precision calculator
      networkmanager_dmenu # network manager
      nerdfonts
      spotify
      wget
      picom
    ];
  };

  imports = [
    ./modules
  ];

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  home.stateVersion = "23.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
