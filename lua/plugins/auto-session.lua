return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      auto_save_enabled = true,
      auto_restore_enabled = true,
      auto_session_enable_last_session = true,
      pre_save_cmds = { "NvimTreeClose" }, -- or "Neotree close" if you use Neo-tree
    })
  end,
}

