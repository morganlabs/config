{
  enable = true;

  lintersByFt = {
    javascript = [ "eslint_d" ];
    typescript = [ "eslint_d" ];
    javascriptreact = [ "eslint_d" ];
    typescriptreact = [ "eslint_d" ];
    svelte = [ "eslint_d" ];
    nix = [
      "deadnix"
      "nix"
    ];
  };

  # luaConfig.post = ''
  #   vim.keymap.set("n", "<leader>l", function()
  #   	require("lint").try_lint()
  #   end, { desc = "Trigger linting for current file" })
  # '';
}
