{
  config,
  pkgs,
  lib,
  vars,
  ...
}:
let
  cfg = config.homeManagerModules.desktop.hyprland;
in
with lib;
{
  options.homeManagerModules.desktop.hyprland = {
    enable = mkEnableOption "Enable desktop.hyprland";
  };

  config = mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
    };

    home = {
      sessionVariables.NIXOS_OZONE_WL = "1";
      pointerCursor = {
        gtk.enable = true;
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Classic";
        size = 16;
      };
    };
  };
}
