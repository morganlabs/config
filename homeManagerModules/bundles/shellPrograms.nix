{
  config,
  pkgs,
  lib,
  vars,
  ...
}:
let
  cfg = config.homeManagerModules.bundles.shellPrograms;
in
with lib;
{
  options.homeManagerModules.bundles.shellPrograms = {
    enable = mkEnableOption "Enable bundles.shellPrograms";
  };

  config = mkIf cfg.enable {
    homeManagerModules.programs = {
      git.enable = true;
      bat.enable = true;
      eza.enable = true;
      unzip.enable = true;
      pfetch.enable = true;
    };
  };
}
