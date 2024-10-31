{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
let
  cfg = config.homeManagerModules.programs.firefox;

  defaultPlugins = with pkgs.nur.repos.rycee.firefox-addons; [
    onepassword-password-manager
    ublock-origin
  ];

  importProfile = path: (import path { inherit pkgs defaultPlugins; });
in
with lib;
{
  options.homeManagerModules.programs.firefox = {
    enable = mkEnableOption "Enable programs.firefox";
  };

  config = mkIf cfg.enable {
    programs.firefox = {
      enable = true;
      package = inputs.firefox-nightly.packages.${pkgs.system}.firefox-nightly-bin;

      profiles = {
        personal = importProfile ./profiles/personal.nix;
      };
    };
  };
}
