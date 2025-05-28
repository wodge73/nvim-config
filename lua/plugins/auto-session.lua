return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      auto_save_enabled = true,
      auto_restore_enabled = true,
      post_restore_cmds = {
        function()
          require("neo-tree.command").execute({
            source = "filesystem",
            position = "left",
            toggle = true,
          })
        end,
      },
    })
  end,
}
