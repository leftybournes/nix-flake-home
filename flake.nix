{
  description = "A flake for leftybournes' system";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.follows = "nixos-cosmic/nixpkgs";

    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
  };

  outputs = inputs @ { self, nixpkgs, nixos-cosmic, ... }:
    let
      system = "x86_64-linux";
      user = "vader";
      username = "Anakin Skywalker";
    in
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
      nixosConfigurations = {
        endor = nixpkgs.lib.nixosSystem {
          specialArgs = {
            # hostname = "endor";
            inherit (nixpkgs) lib;
            inherit inputs nixpkgs user username nixos-cosmic;
          };

          inherit system;

          modules = [
            {
              nix.settings = {
                substituters = [ "https://cosmic.cachix.org/" ];
                trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
              };
            }
            nixos-cosmic.nixosModules.default
            ./common.nix
            # ./gnome.nix
            ./cosmic.nix
            ./flatpak.nix
            ./hosts/endor
          ];
        };
        
        executor = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit (nixpkgs) lib;
            inherit inputs nixpkgs user username;
          };

          inherit system;

          modules = [
            ./common.nix
            ./gnome.nix
            ./flatpak.nix
            ./hosts/executor
          ];
        };
      };
    };
}
