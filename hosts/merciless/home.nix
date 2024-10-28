{ ... }:
{
  homeManagerModules = {
    shells.zsh.enable = true;

    programs = {
      bat.enable = true;
      eza.enable = true;
    };
  };

  home.stateVersion = "24.05";
}
