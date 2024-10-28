{ ... }:
{
  imports = [ ./luks.nix ];

  nixosModules = {
    bundles = {
      default.enable = true;
    };
  };

  system.stateVersion = "24.05";
}
