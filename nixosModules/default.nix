{
  imports = [
    ./bundles/default.nix

    ./bootloader/grub.nix

    ./security/doas.nix

    ./connectivity/networkmanager.nix
    ./connectivity/bluetooth.nix

    ./default/user.nix
    ./default/locale.nix
  ];
}
