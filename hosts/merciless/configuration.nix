{ ... }:
{
  imports = [ ./luks.nix ];

  nixosModules = {
    bootloader.grub.enable = true;
    security.doas.enable = true;

    connectivity = {
      networkmanager.enable = true;
      bluetooth.enable = true;
      firewall.enable = true;
    };

    bundles = {
      default.enable = true;
    };
  };

  system.stateVersion = "24.05";
}
