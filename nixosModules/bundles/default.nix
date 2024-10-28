{
  config,
  pkgs,
  lib,
  vars,
  ...
}:
let
  cfg = config.nixosModules.bundles.default;
in
with lib;
{
  options.nixosModules.bundles.default = {
    enable = mkEnableOption "Enable bundles.default";
  };

  config = mkIf cfg.enable {
    nixosModules.default = {
      user.enable = mkDefault true;
      locale.enable = mkDefault true;
    };
  };
}
