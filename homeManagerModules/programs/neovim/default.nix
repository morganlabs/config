{
  config,
  pkgs,
  lib,
  vars,
  ...
}:
let
  cfg = config.homeManagerModules.programs.neovim;
in
with lib;
{
  options.homeManagerModules.programs.neovim = {
    enable = mkEnableOption "Enable programs.neovim";
  };

  config = mkIf cfg.enable {
    stylix.targets.nixvim = {
      enable = true;
      transparentBackground = {
        main = true;
        signColumn = true;
      };
    };

    programs.nixvim = {
      enable = true;
      extraPackages = with pkgs; [ ripgrep ];
      viAlias = true;
      vimAlias = true;
      opts = import ./config/opts.nix;
      globals = import ./config/globals.nix;
      keymaps = import ./config/keymaps.nix;

      plugins = {
        hardtime.enable = true;
        nvim-autopairs.enable = true;
        conform-nvim.enable = true;
        harpoon.enable = true;
        lint.enable = true;
        lualine.enable = true;
        luasnip.enable = true;
        telescope.enable = true;
        web-devicons.enable = true;
        nvim-colorizer.enable = true;
      };
    };
  };
}