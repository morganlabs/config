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
        harpoon = import ./plugins/harpoon.nix;
        conform-nvim = import ./plugins/conform.nix;
        lint = import ./plugins/lint.nix;
        lualine = import ./plugins/lualine.nix;
        luasnip = import ./plugins/luasnip.nix;
        telescope = import ./plugins/telescope.nix;
        nvim-colorizer = import ./plugins/colorizer.nix;

        hardtime.enable = true;
        nvim-autopairs.enable = true;
        web-devicons.enable = true;
      };
    };
  };
}
