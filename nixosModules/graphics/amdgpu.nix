{
  config,
  pkgs,
  lib,
  vars,
  ...
}:
let
  cfg = config.nixosModules.graphics.amdgpu;
in
with lib;
{
  options.nixosModules.graphics.amdgpu = {
    enable = mkEnableOption "Enable graphics.amdgpu";
  };

  config = mkIf cfg.enable {
    boot.initrd.kernelModules = mkDefault [ "amdgpu" ];
    services.xserver.videoDrivers = mkDefault [ "amdgpu" ];

    hardware = {
      graphics.enable32Bit = mkDefault true;
      amdgpu = {
        opencl.enable = mkDefault true;
        amdvlk = {
          enable = mkDefault true;
          support32Bit.enable = mkDefault true;
        };
      };

      graphics = {
        extraPackages = mkDefault (
          with pkgs;
          [
            rocmPackages.clr.icd
          ]
        );
      };
    };

    systemd.tmpfiles.rules = mkDefault [
      "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
    ];
  };
}
