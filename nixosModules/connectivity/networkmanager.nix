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
    dns.controld.enable = mkBoolOption "Use the ControlD DNS" true;

    wifi = {
      enable = mkBoolOption "Enable WiFi support" false;
      useIwd = mkBoolOption "Use IWD over wpa_supplicant for WiFi" true;
    };
  };

  config =
    mkIf cfg.enable {
      networking.networkmanager = {
        enable = mkForce true;
        wifi.backend = mkForce (mkIfElse cfg.wifi.useIwd "iwd" "wpa_supplicant");
      };
    }
    // mkIf cfg.dns.controld.enable {
      networking = {
        networkmanager.dns = "none";
        nameservers = [
          "76.76.2.2#ControlD"
          "76.76.10.2#ControlD"
          "2606:1a40::2#ControlD"
          "2606:1a40:1::2#ControlD"
        ];
      };

      services.resolved = {
        enable = true;
        dnssec = "true";
        domains = [ "~." ];
        extraConfig = ''
          DNSOverTLS=opportunistic
          MulticastDNS=resolve
        '';
        llmnr = "true";
      };
    };
}
