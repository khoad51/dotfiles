--------Mappings config--------
local g = vim.g
local api = vim.api

-- Set leader key
g.mapleader = ','

-- Mapping options
local nenrs = { expr = false, noremap = true, silent = true }
local nenrns = { expr = false, noremap = true, silent = false }

-- Remap C-w prefix
api.nvim_set_keymap('n', '<leader>w', '<C-w>', nenrs)

-- Remap switch region keys
api.nvim_set_keymap('n', '<C-h>', '<C-w>h', nenrs)
api.nvim_set_keymap('n', '<C-j>', '<C-w>j', nenrs)
api.nvim_set_keymap('n', '<C-k>', '<C-w>k', nenrs)
api.nvim_set_keymap('n', '<C-l>', '<C-w>l', nenrs)

-- Re-size split windows using arrow keys
api.nvim_set_keymap('n', '<Up>', ':resize -2<CR>', nenrns)
api.nvim_set_keymap('n', '<Down>', ':resize +2<CR>', nenrns)
api.nvim_set_keymap('n', '<Left>', ':vertical resize +2<CR>', nenrns)
api.nvim_set_keymap('n', '<Right>', ':vertical resize -2<CR>', nenrns)

-- Remap switch buffers keys
api.nvim_set_keymap('n', '<leader>bn', ':bn<CR>', nenrs)
api.nvim_set_keymap('n', '<leader>bp', ':bp<CR>', nenrs)
api.nvim_set_keymap('n', '<leader>bd', ':bd<CR>', nenrs)
api.nvim_set_keymap('n', '<leader>bw', ':bw<CR>', nenrs)
api.nvim_set_keymap('n', '<leader>bW', ':bw!<CR>', nenrs)

-- Remap terminal escape key
api.nvim_set_keymap('t', '<leader>e', [[<C-\><C-n>]], nenrs)

-- Search current marked text
api.nvim_set_keymap('v', '//', [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], nenrs)

-- NVIM tree
api.nvim_set_keymap('n', '<leader>nt', ':NvimTreeToggle<CR>', nenrs)
api.nvim_set_keymap('n', '<leader>nf', ':NvimTreeFocus<CR>', nenrs)
api.nvim_set_keymap('n', '<leader>nF', ':NvimTreeFindFile<CR>', nenrs)
api.nvim_set_keymap('n', '<leader>nc', ':NvimTreeCollapse<CR>', nenrs)

-- Toggleterm
api.nvim_set_keymap('n', '<leader>tt', ':ToggleTerm<CR>', nenrs)
api.nvim_set_keymap('t', '<leader>tt', [[<C-\><C-n>:ToggleTerm<CR>]], nenrs)
api.nvim_set_keymap('n', '<leader>tT', ':ToggleTermToggleAll<CR>', nenrs)
api.nvim_set_keymap('t', '<leader>tT', [[<C-\><C-n>:ToggleTermToggleAll<CR>]], nenrs)
api.nvim_set_keymap('n', '<leader>ts', ':ToggleTermSendCurrentLine<CR>', nenrns)
api.nvim_set_keymap('v', '<leader>ts', ':ToggleTermSendVisualSelection<CR>', nenrns)

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  id = 999,
  cmd = 'lazygit',
  hidden = true,
  direction = 'float',
  close_on_exit = true,
})
function _lazygit_toggle()
  lazygit:toggle()
end -- lazygit terminal
vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>lua _lazygit_toggle()<CR>', nenrns)

-- Telescope
api.nvim_set_keymap('n', '<leader>fF', ':Telescope find_files<CR>', nenrs)
api.nvim_set_keymap('n', '<leader>ff', ':Telescope git_files<CR>', nenrs)
api.nvim_set_keymap('n', '<leader>fa', ':Telescope live_grep<CR>', nenrs)
api.nvim_set_keymap('n', '<leader>bb', ':Telescope buffers<CR>', nenrs)
api.nvim_set_keymap('n', '<leader>fb', ':Telescope current_buffer_fuzzy_find<CR>', nenrs)
api.nvim_set_keymap('n', '<leader>hf', ':Telescope help_tags<CR>', nenrs)
--------End mappings config--------
