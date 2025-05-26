return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  config = function()
    require("lspconfig").pyright.setup({})
  end,
  keys = {
    { "gd", vim.lsp.buf.definition, desc = "Go to definition" },
    { "K", vim.lsp.buf.hover, desc = "Hover documentation" },
  }
}
