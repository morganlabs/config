hostname:
{
  inputs,
  vars,
  lib,
  ...
}:
with lib;
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      inherit inputs vars;
    };

    users.${vars.user.username} = mkMerge [
      inputs.self.outputs.homeManagerModules.default
      (../hosts + "/${hostname}/home.nix")
    ];
  };
}
