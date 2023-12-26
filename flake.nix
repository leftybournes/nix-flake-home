{
    description = "A flake for leftybournes' system";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager/master";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs @ { self, nixpkgs, home-manager, ... }:
        let
            user = "vader";
            username = "Anakin Skywalker";
        in {
            formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
            nixosConfigurations = (
                import ./hosts {
                    inherit (nixpkgs) lib;
                    inherit inputs nixpkgs home-manager user username;
                }
            );
        };
}
