{
  description = "A flake for leftybournes' systems";

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
            ./flatpak.nix
            ./hosts/death-star
            ./podman.nix
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
            ./flatpak.nix
            ./gnome.nix
            ./hosts/executor
            ./podman.nix
          ] ++ nixpkgs.lib.optional (builtins.pathExists ./extrahosts.nix) ./extrahosts.nix;
        };
      };
    };
}
