{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    alacritty-theme.url = "github:alexghr/alacritty-theme.nix";
      };

    outputs = inputs@{ nixpkgs, home-manager, alacritty-theme, ... }: {
      nixosConfigurations = {
        # TODO please change the hostname to your own
        prohmakas = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./configuration.nix

            ({ config, pkgs, ... }: {
              # install the overlay
              nixpkgs.overlays = [ alacritty-theme.overlays.default ];
              # https://github.com/alexghr/alacritty-theme.nix
            })
            
            # make home-manager as a module of nixos
            # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              # TODO replace ryan with your own username
              home-manager.users.pereira = import ./home.nix;

              # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
            }
          ];
        };
      };
    };
  }
