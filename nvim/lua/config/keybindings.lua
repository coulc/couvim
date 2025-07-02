vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

map("n", "<leader>sv", ":vsp<CR>", opt)
map("n", "<leader>sh", ":sp<CR>", opt)
map("n", "<leader>sc", "<C-w>c", opt)
map("n", "<leader>so", "<C-w>o", opt)
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)

map("i", "jk", "<ESC>", opt)
map("v", "jk", "<ESC>", opt)

-- nvim-tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", opt)


-- bufferline
map("n", "<A-l>", ":BufferLineCycleNext<CR>", opt) 
map("n", "<A-h>", ":BufferLineCyclePrev<CR>", opt) 
map("n", "<leader>bc", ":bdelete<CR>", { desc = "关闭当前 buffer"})
map("n", "<leader>bo", ":%bd|e#|bd#<CR>", { desc = "关闭其他 buffer" })  
