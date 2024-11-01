{
  config,
  pkgs,
  lib,
  vars,
  osConfig,
  ...
}:
let
  cfg = config.homeManagerModules.desktop.hyprland;

  variables = {
    "$mod" = "SUPER";
    "$alt" = "ALT";
  };

  defaultConfig =
    let
      importFile =
        path:
        import path {
          inherit
            config
            lib
            osConfig
            pkgs
            ;
        };
    in
    {
      binds = importFile ./config/binds.nix;
      autostart = importFile ./config/autostart.nix;
      decoration = importFile ./config/decoration.nix;
      env = importFile ./config/env.nix;
      input = importFile ./config/input.nix;
      windowrules = importFile ./config/windowrules.nix;
    };
in
with lib;
{
  options.homeManagerModules.desktop.hyprland = {
    enable = mkEnableOption "Enable desktop.hyprland";
    features.startOnLogin.enable = mkBoolOption "Auto-start Hyprland from TTY1" true;
  };

  config = mkIf cfg.enable {
    stylix.targets.hyprland.enable = true;
    home.sessionVariables.NIXOS_OZONE_WL = "1";

    programs.zsh.initExtra = mkIf cfg.features.startOnLogin.enable ''
      if [ -z "''${WAYLAND_DISPLAY}" ] && [ "''${XDG_VTNR}" -eq 1 ]; then
        dbus-run-session Hyprland
      fi
    '';

    wayland.windowManager.hyprland = {
      enable = true;

      settings =
        with defaultConfig;
        mkMerge [
          variables
          binds
          autostart
          decoration
          env
          input
          windowrules
        ];
    };
  };
}
