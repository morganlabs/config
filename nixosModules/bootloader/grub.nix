{
  config,
  pkgs,
  lib,
  vars,
  ...
}:
let
  cfg = config.nixosModules.bootloader.grub;
in
with lib;
{
  options.nixosModules.bootloader.grub = {
    enable = mkEnableOption "Enable bootloader.grub";
    features.osProber.enable = mkBoolOption "Use OS-Prober" false;
  };

  config = mkIf cfg.enable {
    boot.loader = {
      grub = {
        enable = mkForce true;
        useOSProber = mkDefault cfg.features.osProber.enable;
        device = mkDefault "nodev";
        efiSupport = mkDefault true;
      };

      efi = {
        canTouchEfiVariables = mkDefault true;
        efiSysMountPoint = mkDefault "/boot";
      };
    };
  };
}
