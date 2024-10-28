{
  description = "My Nix configuration flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { ... }@inputs:
    let
      mkSystem = import ./mkSystem inputs;
    in
    {
      homeManagerModules.default = ./homeManagerModules;

      nixosConfigurations = {
        # MERCILESS - KoruSe & SNITCHXV
        # Custom Build
        # Ryzen 7 5800X
        # AMD Radeon RX 6650 XT
        # 512GB NVMe SSD
        # 48GB (2x8gb, 2x16gb) DDR4-3200
        merciless = mkSystem {
          hostname = "merciless";
        };
      };
    };
}
