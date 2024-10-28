{
  config,
  pkgs,
  lib,
  vars,
  ...
}:
let
  cfg = config.nixosModules.default.locale;
in
with lib;
{
  options.nixosModules.default.locale = {
    enable = mkEnableOption "Enable default.locale";
  };

  config = mkIf cfg.enable {
    services.xserver.xkb.layout = mkDefault "gb";
    time.timeZone = mkDefault "Europe/London";
    console.keyMap = mkDefault "uk";
    i18n = {
      defaultLocale = mkDefault "en_GB.UTF-8";
      extraLocaleSettings = {
        LC_ADDRESS = mkDefault "en_GB.UTF-8";
        LC_IDENTIFICATION = mkDefault "en_GB.UTF-8";
        LC_MEASUREMENT = mkDefault "en_GB.UTF-8";
        LC_MONETARY = mkDefault "en_GB.UTF-8";
        LC_NAME = mkDefault "en_GB.UTF-8";
        LC_NUMERIC = mkDefault "en_GB.UTF-8";
        LC_PAPER = mkDefault "en_GB.UTF-8";
        LC_TELEPHONE = mkDefault "en_GB.UTF-8";
        LC_TIME = mkDefault "en_GB.UTF-8";
      };
    };
  };
}
