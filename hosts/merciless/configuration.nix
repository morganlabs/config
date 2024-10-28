{ ... }:
{
  imports = [ ./luks.nix ];

  nixosModules = {
    bootloader.grub.enable = true;

    bundles = {
      default.enable = true;
    };
  };

  system.stateVersion = "24.05";
}
