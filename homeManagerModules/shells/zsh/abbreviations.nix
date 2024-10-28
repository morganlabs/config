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
  programs.zsh.zsh-abbr = {
    enable = true;
    abbreviations = allAliases.abbreviations;
  };
}
