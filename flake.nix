{
  description = "A flake for leftybournes' systems";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
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
        death-star = nixpkgs.lib.nixosSystem {
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
            ./cosmic.nix
            ./docker.nix
            ./flatpak.nix
            ./hosts/death-star
          ];
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
            ./docker.nix
            ./flatpak.nix
            ./gnome.nix
            ./hosts/executor
          ];
        };
      };
    };
}
