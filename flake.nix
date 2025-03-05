{
  description = "A flake for leftybournes' system";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    inputs@{ self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      user = "vader";
      username = "Anakin Skywalker";
    in
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
      nixosConfigurations = {
        endor = nixpkgs.lib.nixosSystem {
          specialArgs = {
            # hostname = "endor";
            inherit (nixpkgs) lib;
            inherit
              inputs
              nixpkgs
              user
              username
              ;
          };

          inherit system;

          modules = [
            ./common.nix
            ./gnome.nix
            ./flatpak.nix
            ./hosts/endor
          ] ++ nixpkgs.lib.optional (builtins.pathExists ./extrahosts.nix) ./extrahosts.nix;
        };

        executor = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit (nixpkgs) lib;
            inherit
              inputs
              nixpkgs
              user
              username
              ;
          };

          inherit system;

          modules = [
            ./common.nix
            ./gnome.nix
            ./flatpak.nix
            ./hosts/executor
          ] ++ nixpkgs.lib.optional (builtins.pathExists ./extrahosts.nix) ./extrahosts.nix;
        };
      };
    };
}
