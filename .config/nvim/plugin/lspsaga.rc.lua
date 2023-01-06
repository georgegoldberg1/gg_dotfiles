local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.init_lsp_saga {
    server_filetype_map = {
        python = 'python'
    }
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '[d', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
vim.keymap.set('n', ']d', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
-- terminal
vim.keymap.set('n', '<space>-t', '<Cmd>Lspsaga openfloaterm<CR>', opts)
