{
  config,
  osConfig,
  lib,
  ...
}:
with lib;
let
  allAliases = import ./defaultAliases.nix { inherit lib config osConfig; };
in
{
  programs.zsh.shellAliases =
    with allAliases;
    mkMerge [
      aliases
      abbreviations
    ];
}
