# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, profiles, ... }:

{
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

  # Enable extra NixOS options, specifically the nix command and flakes.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "pt";
    xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "pt-latin1";

  # Enable CUPS to print documents.
  services.printing.enable = true;

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
  nixpkgs.config.allowUnfree = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.pereira = {
    isNormalUser = true;
    description = "pereira";
    extraGroups = [ "networkmanager" "wheel" ];

    # List of packages installed in the user environment
    packages = with pkgs; [
      firefox
      brave
      spotify
      vscode
      nixfmt
      nixpkgs-fmt
    ];
  };

  # List of packages installed in system profile.
  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    curl
    steam-run
  ];

  home-manager.users.pereira = { pkgs, ... }: {
    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "23.11";

    # Profiles to import, available in the user's context.
    imports = with profiles; [
      # core
      core.git

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
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
