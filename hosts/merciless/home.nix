{ ... }:
{
  homeManagerModules = {
    bundles = {
      shellPrograms.enable = true;
    };

    shells.zsh.enable = true;

    programs =
      {
      };
  };

  home.stateVersion = "24.05";
}
