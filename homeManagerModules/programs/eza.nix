{
  config,
  pkgs,
  lib,
  vars,
  osConfig,
  ...
}:
let
  cfg = config.homeManagerModules.programs.eza;

  osPrograms = osConfig.programs;
in
with lib;
{
  options.homeManagerModules.programs.eza = {
    enable = mkEnableOption "Enable programs.eza";
  };

  config = mkIf cfg.enable {
    programs.eza = {
      enable = true;
      git = true;
      icons = "auto";
      extraOptions = [
        "-b"
        "-h"
        "--long"
        "--all"
        "--group-directories-first"
      ];

      enableBashIntegration = osPrograms.bash.enable;
      enableZshIntegration = osPrograms.zsh.enable;
    };
  };
}
