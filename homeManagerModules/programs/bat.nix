{
  config,
  pkgs,
  lib,
  vars,
  ...
}:
let
  cfg = config.homeManagerModules.programs.bat;
in
with lib;
{
  options.homeManagerModules.programs.bat = {
    enable = mkEnableOption "Enable programs.bat";
  };

  config = mkIf cfg.enable {
    programs.bat = {
      enable = true;
      config = {
        theme = "Nord";
        style = "full";
      };
    };
  };
}
