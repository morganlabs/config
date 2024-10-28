{
  imports = [
    ./bundles/default.nix

    ./bootloader/grub.nix

    ./security/doas.nix

    ./default/user.nix
    ./default/locale.nix
  ];
}
