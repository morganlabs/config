{
  config,
  pkgs,
  lib,
  vars,
  ...
}:
let
  cfg = config.nixosModules.bundles.networking;
in
with lib;
{
  options.nixosModules.bundles.networking = {
    enable = mkEnableOption "Enable bundles.networking";
  };

  config = mkIf cfg.enable {
    nixosModules.connectivity = {
      bluetooth.enable = mkDefault true;
      firewall.enable = mkDefault true;
      networkmanager = {
        enable = mkDefault true;
        dns.controld.enable = mkDefault true;
      };
    };
  };
}
