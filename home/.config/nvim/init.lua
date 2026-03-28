vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')

vim.g.mapleader = ' '

-- window navigation
vim.keymap.set({'n', 'v'}, '<C-j>', '<C-W>j')
vim.keymap.set({'n', 'v'}, '<C-k>', '<C-W>k')
vim.keymap.set({'n', 'v'}, '<C-h>', '<C-W>h')
vim.keymap.set({'n', 'v'}, '<C-l>', '<C-W>l')

-- save / quit
vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>')
vim.keymap.set('n', '<Leader>w', ':w<CR>')
vim.keymap.set('n', '<Leader>q', ':q<CR>')

-- exit insert mode
vim.keymap.set('i', 'jk', '<Esc>')

-- settings
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.number = true
vim.opt.wrap = false
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.laststatus = 2
vim.opt.encoding = 'utf-8'

vim.cmd('colorscheme elflord')

-- strip trailing whitespace on save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function()
    local pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd('%s/\\s\\+$//e')
    vim.api.nvim_win_set_cursor(0, pos)
  end,
})

vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}
