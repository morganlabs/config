{
  config,
  pkgs,
  lib,
  vars,
  ...
}:
let
  cfg = config.nixosModules.connectivity.networkmanager;
in
with lib;
{
  options.nixosModules.connectivity.networkmanager = {
    enable = mkEnableOption "Enable connectivity.networkmanager";

    wifi = {
      enable = mkBoolOption "Enable WiFi support" false;
      useIwd = mkBoolOption "Use IWD over wpa_supplicant for WiFi" true;
    };
  };

  config = mkIf cfg.enable {
    networking = {
      networkmanager = {
        enable = mkForce true;
        wifi.backend = mkForce (mkIfElse cfg.wifi.useIwd "iwd" "wpa_supplicant");
      };
    };
  };
}
