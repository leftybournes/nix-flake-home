{
  description = "A flake for leftybournes' systems";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
        nixpkgs,
        nixos-hardware,
        ...
    }:
    let
      system = "x86_64-linux";
      user = "vader";
      username = "Anakin Skywalker";
    in
      {
        formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt;

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
              ./hosts/death-star

              ./common.nix
              ./cosmic.nix
              ./llm.nix
              ./podman.nix
              ./extrahosts.nix
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
              ./hosts/executor

              ./common.nix
              ./gnome.nix
              ./llm.nix
              ./podman.nix
              ./extrahosts.nix
            ];
          };

          resolute = nixpkgs.lib.nixosSystem {
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
              ./hosts/resolute

              ./common.nix
              ./docker.nix
              ./extrahosts.nix
              ./gnome.nix
              ./llm.nix

              nixos-hardware.nixosModules.tuxedo-infinitybook-pro14-gen10-amd
            ];
          };
        };
      };
}
