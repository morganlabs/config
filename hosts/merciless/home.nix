{ ... }:
{
  homeManagerModules = {
    shells.zsh.enable = true;
    desktop.hyprland.enable = true;

    bundles = {
      shellPrograms.enable = true;
    };

    programs = { };
  };

  home.stateVersion = "24.05";
}
