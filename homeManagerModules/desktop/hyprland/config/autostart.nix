{
  config,
  pkgs,
  osConfig,
  lib,
  ...
}:
with lib;
let
  hmModules = config.homeManagerModules;
  osPrograms = osConfig.programs;
in
{
  exec-once = with pkgs; [
    "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    (mkIfStr hmModules.programs.waybar.enable "${waybar}/bin/waybar")
    (mkIfStr osPrograms._1password-gui.enable "${_1password-gui}/bin/1password --silent")
    (mkIfStr osPrograms.noisetorch.enable "noisetorch -i")

    (mkIfStr hmModules.programs.kitty.enable "[workspace 1 silent] ${kitty}/bin/kitty")
    (mkIfStr hmModules.programs.firefox.enable "[workspace 2 silent] ${firefox}/bin/firefox")
    (mkIfStr hmModules.programs.obsidian.enable "[workspace 3 silent] ${obsidian}/bin/obsidian")
    (mkIfStr hmModules.programs.slack.enable "[workspace special:slack silent] ${slack}/bin/slack")
    (mkIfStr hmModules.programs.betterbird.enable "[workspace special:mail silent] ${betterbird}/bin/betterbird")
    (mkIfStr hmModules.programs.vesktop.enable "[workspace special:vesktop silent] ${vesktop}/bin/vesktop")
    (mkIfStr hmModules.programs.vesktop.features.discover.enable "${discover-overlay}/bin/discover-overlay")
  ];
}
