-- ~/.config/nvim/lua/plugins/nvim-cmp.lua

return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",      -- LSP source
    "hrsh7th/cmp-buffer",        -- Buffer source
    "hrsh7th/cmp-path",          -- Path source
    "hrsh7th/cmp-cmdline",       -- Cmdline completions
    "L3MON4D3/LuaSnip",          -- Snippet engine
    "saadparwaiz1/cmp_luasnip",  -- Snippet completions
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept selected item with Enter
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
        { name = "copilot" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }),
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
    })

    -- Cmdline completion for `/` and `:`
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" }
      }
    })
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" }
      }, {
        { name = "cmdline" }
      })
    })
  end,
}
