{ config, pkgs, ... }:

{
  home = {
    username = "pereira";
    homeDirectory = "/home/pereira";
    packages = with pkgs; [
      # Applications
      spotify # music player
      brave # browser
      wine # windows emulator

      # system
      pywal # color scheme generator
      rofi # window switcher, application launcher and dmenu replacement
      rofi-calc # calculator
      networkmanager_dmenu # network manager
      xfce.thunar # file manager
      picom # compositor
      libnotify # notification library
      nerdfonts # fonts
      polybar # status bar

      # cyber security
      nmap # network scanner
      wireshark # network protocol analyzer
      sqlmap # sql injection
      metasploit # exploit framework
      burpsuite # web vulnerability scanner
      gdb # debugger
      ghidra-bin # reverse engineering
      stegsolve # steganography
      ltrace # library call tracer
      zsteg # steganography

      # utilities
      wget # download files
      zathura # document viewer
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
      killall # kill processes by name
      flameshot # screenshot tool
      cava # audio visualizer
      gotop # system monitor
      neofetch # system info
      openssl # cryptography toolkit
      lxappearance # gtk theme switcher
      calcurse # calendar and scheduling

      # development
      vscode # code editor
      nixpkgs-fmt # nix formatter
      python3 # programming language
      wkhtmltopdf # html to pdf (PhDMS)
      rustup # rust programming language
      gcc # c compiler
      mdbook # create book from markdown
      deadnix
      statix

    ];
  };

  imports = [
    ../../modules
  ];

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  home.stateVersion = "23.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
