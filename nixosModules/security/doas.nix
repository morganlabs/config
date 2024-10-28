{
  config,
  pkgs,
  lib,
  vars,
  ...
}:
let
  cfg = config.nixosModules.security.doas;
in
with lib;
{
  options.nixosModules.security.doas = {
    enable = mkEnableOption "Enable security.doas";

    rules = mkListOfOption types.attrs "Doas' rules" [
      {
        groups = [ "wheel" ];
        keepEnv = true;
        persist = true;
      }
    ];
  };

  config = mkIf cfg.enable {
    security.sudo.enable = mkDefault false;
    security.doas = {
      enable = mkForce true;
      extraRules = mkDefault cfg.rules;
    };
  };
}
