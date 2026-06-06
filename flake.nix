{
  description = "A flake for leftybournes' systems";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    hermes-agent.url = "github:NousResearch/hermes-agent";
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      hermes-agent,
      sops-nix,
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
              hermes-agent
              sops-nix
              ;
          };

          inherit system;

          modules = [
            hermes-agent.nixosModules.default
            sops-nix.nixosModules.sops

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
              hermes-agent
              sops-nix
              ;
          };

          inherit system;

          modules = [
            hermes-agent.nixosModules.default
            sops-nix.nixosModules.sops

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
