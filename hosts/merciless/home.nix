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
      rofi.enable = true;
      kitty.enable = true;
      firefox.enable = true;
      obsidian.enable = true;
      slack.enable = true;
      betterbird.enable = true;
      vesktop.enable = true;
    };
  };

  home.stateVersion = "24.05";
}
