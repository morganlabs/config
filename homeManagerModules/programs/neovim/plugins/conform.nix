{
  enable = true;

  settings = {
    formatters_by_ft =
      let
        prettierConfig = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "prettier";
          stop_after_first = true;
        };
      in
      {
        lua = [ "stylua" ];
        svelte = prettierConfig;
        astro = prettierConfig;
        javascript = prettierConfig;
        typescript = prettierConfig;
        javascriptreact = prettierConfig;
        typescriptreact = prettierConfig;
        json = prettierConfig;
        markdown = prettierConfig;
        css = prettierConfig;
        scss = prettierConfig;
        html = [ "htmlbeautifier" ];
        bash = [ "beautysh" ];
        rust = [ "rustfmt" ];
        yaml = [ "yamlfix" ];
        nix = [ "nixfmt" ];
      };

    format_on_save = {
      timeout_ms = 500;
      lsp_format = "fallback";
    };

    luaConfig.post = ''
      vim.keymap.set({"n", "v"}, "<leader>fmt", function()
        require("conform").format({
          async = false,
          lsp_fallback = true,
          timeout_ms = 500
        })
      end, { desc = "Format file/range" })
    '';
  };
}
