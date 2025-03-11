vim.g.mapleader = " "

vim.keymap.set("n", "<C-s>", "<cmd>w<CR>")
vim.keymap.set("n", "<leader>t", "<cmd>tabnew<CR>")
vim.keymap.set("n", "<M-l>", "<cmd>tabnext<CR>")
vim.keymap.set("n", "<M-h>", "<cmd>tabprev<CR>")
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprevious<CR>")
vim.keymap.set("n", "<leader>qq", "<cmd>copen<CR>")
vim.keymap.set("n", "<leader>c", "\"+")
vim.keymap.set("n", "<leader>v", "\"_")
vim.keymap.set("x", "<C-j>", "<cmd>m +1<CR><Esc><S-v>")
vim.keymap.set("x", "<C-k>", "<cmd>m -2<CR><Esc><S-v>")
