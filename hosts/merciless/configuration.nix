{ ... }:
{
  imports = [ ./luks.nix ];

  nixosModules = {
    bootloader.grub.enable = true;
    security.doas.enable = true;
    connectivity.ssh.enable = true;
    graphics.amdgpu.enable = true;
    desktop.hyprland.enable = true;
    default.user.features.autologin.enable = true;

    decoration = {
        plymouth.enable = true;
        stylix.enable = true;
    };

    bundles = {
      default.enable = true;
      networking.enable = true;
    };
  };

  system.stateVersion = "24.05";
}
