{
  description = "A flake for leftybournes' systems";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
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
          ]
          ++ nixpkgs.lib.optional (builtins.pathExists ./extrahosts.nix) ./extrahosts.nix;
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
          ]
          ++ nixpkgs.lib.optional (builtins.pathExists ./extrahosts.nix) ./extrahosts.nix;
        };
      };
    };
}
