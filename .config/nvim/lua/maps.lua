local keymap = vim.keymap

-- new tab
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })
-- split window
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })
-- move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('n', 's<left>', '<C-w>h')
keymap.set('n', 's<up>', '<C-w>k')
keymap.set('n', 's<down>', '<C-w>j')
keymap.set('n', 's<right>', '<C-w>l')
keymap.set('n', 'sh', '<C-w>h')
keymap.set('n', 'sk', '<C-w>k')
keymap.set('n', 'sj', '<C-w>j')
keymap.set('n', 'sl', '<C-w>l')

-- maps for markdown preview
-- keymap.set('n', '<C-s>', '<Plug>MarkdownPreview')
-- keymap.set('n', '<M-s>', '<Plug>MarkdownPreviewStop')
-- keymap.set('n', '<C-p>', '<Plug>MarkdownPreviewToggle')



