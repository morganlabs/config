inputs:
with inputs;
let
  mkSystem =
    {
      system ? "x86_64-linux",
      hostname,
    }:
    let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      myLib = import ../lib { inherit (pkgs) lib; };
      vars = import ../vars.nix pkgs;

      lib = pkgs.lib.extend (_: prev: home-manager.lib // prev // myLib);

      baseConfig =
        { ... }:
        with lib;
        {
          programs.git.enable = mkForce true;
          networking.hostName = mkForce hostname;
          nix.settings.experimental-features = mkDefault [
            "nix-command"
            "flakes"
          ];
        };

      homeManager = import ./homeManager.nix hostname;
    in
    with lib;
    nixpkgs.lib.nixosSystem {
      inherit system pkgs;

      specialArgs = {
        inherit inputs vars lib;
      };

      modules = [
        ../nixosModules
        (../hosts + "/${hostname}/configuration.nix")
        (../hosts + "/${hostname}/hardware-configuration.nix")
        (baseConfig)
        (homeManager)
      ];
    };
in
mkSystem
