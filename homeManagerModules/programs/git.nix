{
  config,
  pkgs,
  lib,
  vars,
  osConfig,
  ...
}:
let
  cfg = config.homeManagerModules.programs.git;
in
with lib;
{
  options.homeManagerModules.programs.git = {
    enable = mkEnableOption "Enable programs.git";
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = mkForce true;
      userName = vars.user.name;
      userEmail = vars.user.email;

      extraConfig = mkMerge [
        { init.defaultBranch = "main"; }
        (mkIf osConfig.programs._1password-gui.enable {
          user.signingkey = vars.git.ssh.pubkey;
          commit.gpgsign = true;
          gpg = {
            format = "ssh";
            ssh.program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
          };
        })
      ];
    };

    programs.ssh = {
      enable = true;
      extraConfig = mkIfStr osConfig.programs._1password-gui.enable ''
        Host *
          IdentityAgent ~/.1password/agent.sock
      '';
    };
  };
}
