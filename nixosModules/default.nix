{
  imports = [
    ./bundles/default.nix
    ./bundles/networking.nix

    ./bootloader/grub.nix

    ./security/doas.nix

    ./connectivity/networkmanager
    ./connectivity/bluetooth.nix
    ./connectivity/firewall.nix
    ./connectivity/ssh.nix

    ./default/user.nix
    ./default/locale.nix
  ];
}
