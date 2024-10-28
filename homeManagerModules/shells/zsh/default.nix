{
  config,
  pkgs,
  lib,
  vars,
  ...
}:
let
  cfg = config.homeManagerModules.shells.zsh;
in
with lib;
{
  options.homeManagerModules.shells.zsh = {
    enable = mkEnableOption "Enable shells.zsh";
  };

  imports = [
    ./plugins.nix
    ./aliases.nix
    ./abbreviations.nix
    ./functions.nix
    ./sessionVariables.nix
    ./functions.nix
  ];

  config = mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      autocd = true;
      enableCompletion = true;
      initExtra = ''
        PROMPT="%3~> "
      '';
    };
  };
}
