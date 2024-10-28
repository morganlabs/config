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
    i18n =
      let
        localeStr = "en_GB.UTF-8";
      in
      {
        defaultLocale = mkDefault localeStr;
        extraLocaleSettings = {
          LC_ADDRESS = mkDefault localeStr;
          LC_IDENTIFICATION = mkDefault localeStr;
          LC_MEASUREMENT = mkDefault localeStr;
          LC_MONETARY = mkDefault localeStr;
          LC_NAME = mkDefault localeStr;
          LC_NUMERIC = mkDefault localeStr;
          LC_PAPER = mkDefault localeStr;
          LC_TELEPHONE = mkDefault localeStr;
          LC_TIME = mkDefault localeStr;
        };
      };
  };
}
