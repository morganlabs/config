{ ... }:
{
  homeManagerModules = {
    shells.zsh.enable = true;

    programs = {
      git.enable = true;
      bat.enable = true;
      eza.enable = true;
      unzip.enable = true;
      pfetch.enable = true;
    };
  };

  home.stateVersion = "24.05";
}
