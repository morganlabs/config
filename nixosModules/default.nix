{
  imports = [
    ./bundles/default.nix
    ./bundles/networking.nix

    ./bootloader/grub.nix

    ./security/doas.nix

    ./decoration/plymouth.nix
    ./decoration/stylix

    ./connectivity/networkmanager
    ./connectivity/bluetooth.nix
    ./connectivity/firewall.nix
    ./connectivity/ssh.nix

    ./graphics/amdgpu.nix

    ./desktop/hyprland.nix

    ./default/user.nix
    ./default/locale.nix
  ];
}
