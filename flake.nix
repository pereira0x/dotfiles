{
  description = "Pereira's NixOS configuration";

  inputs = {
    # The nixpkgs version to use.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    # The home-manager version to use.
    home = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { ... }@inputs:
    let
      inherit (inputs.nixpkgs) lib;
      inherit (builtins) listToAttrs attrNames readDir filter;
      inherit (lib) hasSuffix;
      inherit (inputs.nixpkgs.lib.filesystem) listFilesRecursive;
      myLib = (import ./lib { inherit lib; }).myLib;

      sshKeys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIPEQ52WkoKA1oiXE++uLuh/zzxEvgH7oeOuQBBE0VeG pereira@cycki"
      ];

      # Imports every nix module from a directory, recursively.
      mkModules = path: filter (hasSuffix ".nix") (listFilesRecursive path);

      profiles = myLib.rakeLeaves ./profiles;

      # Imports every host defined in a directory.
      mkHosts = dir:
        listToAttrs (map (name: {
          inherit name;
          value = inputs.nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs profiles sshKeys; };
            modules = [
              { networking.hostName = name; }
              { nixpkgs.config.allowUnfree = true; }
              profiles.core.sshd
              inputs.home.nixosModules.home-manager
              { home-manager = { useGlobalPkgs = true; }; }
            ] ++ (mkModules "${dir}/${name}");
          };
        }) (attrNames (readDir dir)));
    in { nixosConfigurations = mkHosts ./hosts; };
}
