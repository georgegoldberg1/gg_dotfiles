local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup({
    ui = {
        winblend = 10,
        border = 'rounded',
        colors = {
            normal_bg = '#002b36'
        }
    }
})

--saga.init_lsp_saga {
--    server_filetype_map = {
--        python = 'python'
--    }
--}

local diagnostic = require("lspsaga.diagnostic")
local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', '[d', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
-- vim.keymap.set('n', ']d', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', '[d', diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', diagnostic.goto_next, opts)
vim.keymap.set('n', 'gl', diagnostic.show_diagnostics, opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)

-- terminal
vim.keymap.set('n', '<space>-t', '<Cmd>Lspsaga term_toggle<CR>', opts)

-- code action
--local codeaction = require("lspsaga.codeaction")
--vim.keymap.set("n", "<leader>ca", function() codeaction:code_action() end, { silent = true })
--vim.keymap.set("v", "<leader>ca", function()
--  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
--  codeaction:range_code_action()
--end, { silent = true }
