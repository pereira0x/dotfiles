{
  description = "Nix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    home = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ ... }:
    let
      myLib = (import ./lib { inherit lib; }).myLib;

      inherit (builtins) listToAttrs attrNames readDir filter;
      inherit (inputs.nixpkgs) lib;
      inherit (lib) hasSuffix;
      inherit (inputs.nixpkgs.lib.filesystem) listFilesRecursive;

      sshKeys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIPEQ52WkoKA1oiXE++uLuh/zzxEvgH7oeOuQBBE0VeG pereira@cycki"
      ];

      system = "x86_64-linux";

      allModules = mkModules ./modules;

      # Imports every nix module from a directory, recursively.
      mkModules = path: filter (hasSuffix ".nix") (listFilesRecursive path);

      profiles = myLib.rakeLeaves ./profiles;

      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      # Imports every host defined in a directory.
      mkHosts = dir:
        listToAttrs (map (name: {
          inherit name;
          value = inputs.nixpkgs.lib.nixosSystem {
            inherit system pkgs;
            specialArgs = {
              inherit inputs profiles sshKeys;
              hostName = name;
            };
            modules = [
              { networking.hostName = name; }
              inputs.home.nixosModules.home-manager
              { home-manager = { useGlobalPkgs = true; }; }
            ] ++ allModules ++ (mkModules "${dir}/${name}");
          };
        }) (attrNames (readDir dir)));
    in {
      nixosConfigurations = mkHosts ./hosts;

      # Use Alejandra to format .nix files
      formatter.x86_64-linux =
        inputs.nixpkgs.legacyPackages.x86_64-linux.alejandra;
    };
}
