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
  windowrulev2 = [
    "suppressevent maximize, class:.*"

    # General floating windows
    "center, floating:1"

    # File Chooser - Floating, centred
    "float, initialTitle:(Open Files)"
    "center, initialTitle:(Open Files)"

    # Steam Settings - Floating, centred
    "float, initialTitle:(Steam Settings)"
    "center, initialTitle:(Steam Settings)"

    # Vesktop - Special workspace, floating
    "workspace special:vesktop, class:(vesktop)"
    "float, class:(vesktop)"
    "size 75% 75%, class:(vesktop)"
    "center, class:(vesktop)"

    # Slack - Special workspace, floating
    "workspace special:slack, class:(Slack)"
    "float, class:(Slack)"
    "size 75% 75%, class:(Slack)"
    "center, class:(Slack)"

    # Betterbird - Special workspace, maximised
    "workspace special:mail, class:(betterbird)"
    "fullscreen, class:(betterbird)"
    "fullscreenstate:1, class:(betterbird)"

    # Pavucontrol - Floating
    "float, class:(org.pulseaudio.pavucontrol)"
    "size 75% 75%, class:(org.pulseaudio.pavucontrol)"
    "center, class:(org.pulseaudio.pavucontrol)"

    # Blueman Manager - Floating
    "float, class:(blueman-manager-wrapped)"
    "size 75% 75%, class:(blueman-manager-wrapped)"
    "center, class:(blueman-manager-wrapped)"
  ];
}
