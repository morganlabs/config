{
  config,
  pkgs,
  lib,
  vars,
  ...
}:
with lib;
let
  cfg = config.nixosModules.default.user;

in
{
  options.nixosModules.default.user = {
    enable = mkEnableOption "Enable default.user";
    shell = mkStrOption "Which shell to use" "zsh";
    extra.groups = mkListOfOption types.str "Extra groups (NOTE: always includes wheel)" [ ];
    features.autologin.enable = mkBoolOption "Autologin? (First TTY only)" false;

    user = {
        username = mkStrOption "The username" vars.user.username;
        fullName = mkStrOption "The full name" vars.user.name;
    };
  };

  config = mkIf cfg.enable {
    programs.${cfg.shell}.enable = mkForce true;

    # Ony autologin on the first TTY
    systemd.services."getty@tty1" = mkForce (
      mkIf cfg.features.autologin.enable {
        overrideStrategy = "asDropin";
        serviceConfig.ExecStart = [
          ""
          "@${pkgs.util-linux}/sbin/agetty agetty --login-program ${config.services.getty.loginProgram} --autologin ${cfg.user.username} --noclear --keep-baud %I 115200,38400,9600 $TERM"
        ];
      }
    );

    users.users.${cfg.user.username} = {
      shell = mkForce pkgs.${cfg.shell};
      description = mkDefault cfg.user.fullName;
      isNormalUser = mkForce true;
      initialPassword = mkDefault "nixos";
      extraGroups = mkForce ([ "wheel" ] ++ cfg.extra.groups);
    };
  };
}
