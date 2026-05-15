{
  description = "Multi-platform Nix configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin }: {
    darwinConfigurations."Wim-Wenigerkinds-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      specialArgs = { inherit self; };
      modules = [
        ./modules/common.nix
        ./hosts/macbook
      ];
    };

    nixosConfigurations."nixos-dell-optiplex" = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit self; };
      modules = [
        ./modules/common.nix
        ./hosts/nixos-dell-optiplex
      ];
    };
  };
}
