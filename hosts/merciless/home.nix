{ ... }:
{
  homeManagerModules = {
    shells.zsh.enable = true;
    desktop.hyprland.enable = true;

    bundles = {
      shellPrograms.enable = true;
    };

    programs = {
      neovim.enable = true;
      waybar.enable = true;
    };
  };

  home.stateVersion = "24.05";
}
