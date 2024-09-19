# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, profiles, inputs, ... }:

let
  RNLCert = builtins.fetchurl {
    url = "https://rnl.tecnico.ulisboa.pt/ca/cacert/cacert.pem";
    sha256 = "1jiqx6s86hlmpp8k2172ki6b2ayhr1hyr5g2d5vzs41rnva8bl63";
  };
in {
  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Lisbon";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Set your keyboard layout.
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_PT.UTF-8";
    LC_IDENTIFICATION = "pt_PT.UTF-8";
    LC_MEASUREMENT = "pt_PT.UTF-8";
    LC_MONETARY = "pt_PT.UTF-8";
    LC_NAME = "pt_PT.UTF-8";
    LC_NUMERIC = "pt_PT.UTF-8";
    LC_PAPER = "pt_PT.UTF-8";
    LC_TELEPHONE = "pt_PT.UTF-8";
    LC_TIME = "pt_PT.UTF-8";
  };

  security.pki.certificateFiles = [ "${RNLCert}" ];

  # Enable extra NixOS options, specifically the nix command and flakes.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  imports = with profiles; [ core.caddy ];

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "pt";
    xkbVariant = "";
    displayManager.defaultSession = "none+i3";
    windowManager.i3 = { enable = true; };
  };

  # Configure console keymap
  console.keyMap = "pt-latin1";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  virtualisation.docker.enable = true;
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "pereira" ];

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ "openssl-1.1.1w" ];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.pereira = {
    isNormalUser = true;
    description = "pereira";
    extraGroups = [ "networkmanager" "wheel" "docker" ];

    # List of packages installed in the user environment
    # packages with pkgs and
    packages = with pkgs; [
      # web
      firefox
      brave
      tor-browser-bundle-bin

      # media  
      spotify
      discord
      audacity

      # system and graphical
      i3lock-fancy
      xfce.thunar
      xfce.tumbler
      arandr
      zathura

      # dev
      vscode-fhs
      docker-compose
      mysql80
      go
      bruno
      gcc
      gnumake
      mdbook
      valgrind
      bun
      dbeaver

      # tools
      file
      bat
      glow
      gnumake
      tldr
      fd
      tmux
      ripgrep
      remmina
      killall
      htop
      neofetch
      netcat-gnu
      unzip
      lf
      simplescreenrecorder
      psmisc

      # cybersec
      traceroute
      openvpn
      inetutils
      burpsuite
      metasploit
      exploitdb
      gobuster
      enum4linux
      john
      thc-hydra
      nmap
      wireshark
      wpscan

      # agisit
      vagrant

    ];
  };
  programs.nix-ld.enable = true;

  # List of packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # core
    vim
    wget
    curl

    # mvn workaround
    steam-run

    # nix
    nixfmt
    nixpkgs-fmt

    # dev
    python3
    dconf
    nodejs
  ];

  home-manager.users.pereira = { pkgs, ... }: {
    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "23.11";

    # Profiles to import, available in the user's context.
    imports = with profiles;
      [
        # core
        core.git
        core.gitui

        # shell
        shell.zsh
        shell.alacritty
        shell.zoxide
        shell.starship
        shell.eza

        # graphical
        graphical.feh
        graphical.i3
        graphical.flameshot
        graphical.gtk

        nixvim
      ] ++ [ inputs.nixvim.homeManagerModules.nixvim ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
