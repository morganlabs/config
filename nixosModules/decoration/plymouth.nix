{
  config,
  pkgs,
  lib,
  vars,
  ...
}:
let
  cfg = config.nixosModules.decoration.plymouth;
in
with lib;
{
  options.nixosModules.decoration.plymouth = {
  enable = mkEnableOption "Enable decoration.plymouth";
  };

  config = mkIf cfg.enable {
    boot = {
      plymouth = {
        enable = true;
        theme = "rings";
        themePackages = with pkgs; [ (adi1090x-plymouth-themes.override { selected_themes = [ "rings" ]; }) ];
      };

      consoleLogLevel = 0;
      # Hide the OS choice for bootloaders.
      # It's still possible to open the bootloader list by pressing any key
      # It will just not appear on screen unless a key is pressed
      # loader.timeout = 0;

      initrd = {
        verbose = false;
        systemd.enable = true;
      };

      kernelParams = [
        "quiet"
        "splash"
        "boot.shell_on_fail"
        "loglevel=3"
        "rd.systemd.show_status=false"
        "rd.udev.log_level=3"
        "udev.log_priority=3"
      ];
    };
  };
}
