require("core.options")
require("core.mappings")
require("core.autocommands")
require("config.lazy")
vim.keymap.set('n', '<leader>t', ':bo terminal<cr>a')
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
