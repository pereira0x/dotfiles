{
  description = "pereira's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05"; # 
      inputs.nixpkgs.follows = "nixpkgs";
    };

    alacritty-theme.url = "github:alexghr/alacritty-theme.nix";
  };

  outputs = inputs@{ ... }:
    let
      user = "pereira";
      host = "prohmakas";
    in
    {
      nixosConfigurations = {
        ${host} = inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/${host}/configuration.nix
            {
              # https://github.com/alexghr/alacritty-theme.nix
              nixpkgs.overlays = [ inputs.alacritty-theme.overlays.default ];
            }
            # make home-manager as a module of nixos
            # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${user} = import ./hosts/${host}/home.nix;

            }
          ];
        };
      };
    };
}
