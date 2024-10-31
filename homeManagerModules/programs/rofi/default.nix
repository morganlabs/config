{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.homeManagerModules.programs.rofi;
in
with lib;
{
  options.homeManagerModules.programs.rofi = {
    enable = mkEnableOption "Enable programs.rofi";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ kora-icon-theme ];

    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;

      # font = "MonaspiceNe Nerd Font Mono 16";
      theme = import ./theme.nix { inherit config; };
      extraConfig = import ./config.nix;
    };
  };
}
