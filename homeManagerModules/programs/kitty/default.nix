{
  config,
  pkgs,
  lib,
  osConfig,
  ...
}:
let
  cfg = config.homeManagerModules.programs.kitty;
in
with lib;
{
  options.homeManagerModules.programs.kitty = {
    enable = mkEnableOption "Enable programs.kitty";
  };

  config = mkIf cfg.enable {
    stylix.targets.kitty.enable = true;
    programs.kitty = {
      enable = true;
      settings = import ./config.nix;

      shellIntegration.enableBashIntegration = osConfig.programs.bash.enable;
      shellIntegration.enableZshIntegration = osConfig.programs.zsh.enable;
      shellIntegration.enableFishIntegration = osConfig.programs.fish.enable;
    };
  };
}
