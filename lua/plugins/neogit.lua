return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",      -- Required
      "sindrets/diffview.nvim",     -- Optional: Diff integration
      -- Optional fuzzy finder integrations:
      -- "nvim-telescope/telescope.nvim",
      -- "ibhagwan/fzf-lua",
      -- "echasnovski/mini.pick",
      -- "folke/snacks.nvim",
    },
    config = function()
      require("neogit").setup({})
    end,
  },
}
