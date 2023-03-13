{ lib, inputs, nixpkgs, home-manager, user }:

let
  system = "x86_64-linux";

  pkgs = import nixpkgs {
    inherit system;
  };

  lib = nixpkgs.lib;
in {
  death-star = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs user;
      host = {
        hostName = "death-star";
      };
    };

    modules = [
      ./death-star
      ./configuration.nix
      ./flatpak.nix

      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit user;
          host = {
            hostName = "death-star";
          };
        };

        home-manager.users.${user} = {
      	  imports = [
            ./home.nix
	        ];
        };
      }
    ];
  };
}
  
