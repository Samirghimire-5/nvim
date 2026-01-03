-- null-ls because none-ls uses null-ls cause none-ls is build by forking null-ls so it didn't change null-ls functions name
return {
  "nvimtools/none-ls.nvim", -- helps to apply formatters and linters 
  dependencies = {
    "nvimtools/none-ls-extras.nvim" -- this is to use linters like eslint
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.black,
        require("none-ls.diagnostics.eslint"),
        require("none-ls.code_actions.eslint"),
        require("none-ls.diagnostics.ruff"),
      },
    })

    vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {})
  end,
}
