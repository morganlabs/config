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

    users.${vars.user.username} =
      with inputs;
      mkMerge [
        self.outputs.homeManagerModules.default
        nixvim.homeManagerModules.nixvim
        (../hosts + "/${hostname}/home.nix")
      ];
  };
}
