{
  config,
  osConfig,
  lib,
  ...
}:
let
  allAliases = import ./defaultAliases.nix { inherit lib config osConfig; };
in
{
  programs.zsh.shellAliases = allAliases.aliases // allAliases.abbreviations;
}
