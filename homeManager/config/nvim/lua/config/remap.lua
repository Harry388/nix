vim.g.mapleader = " "

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>")
vim.keymap.set("n", "<leader>t", "<cmd>tabnew<CR>")
vim.keymap.set("n", "<M-l>", "<cmd>tabnext<CR>")
vim.keymap.set("n", "<M-h>", "<cmd>tabprev<CR>")
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprevious<CR>")
vim.keymap.set("n", "<leader>qq", "<cmd>copen<CR>")
vim.keymap.set({"n", "v"}, "<leader>c", [[\"+]])
vim.keymap.set({"n", "v"}, "<leader>v", [[\"_]])
vim.keymap.set("x", "<C-j>", "<cmd>m +1<CR><Esc><S-v>")
vim.keymap.set("x", "<C-k>", "<cmd>m -2<CR><Esc><S-v>")
vim.keymap.set("n", "<leader>bm", function ()
    local bufs = vim.api.nvim_list_bufs()
    local loaded_modified_bufs = {}
    local count = 1
    for _,buf in ipairs(bufs) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].modified then
            full_filename = vim.api.nvim_buf_get_name(buf)
            filename = vim.fn.fnamemodify(full_filename, ":t")
            loaded_modified_bufs[count] = {
                filename = full_filename,
                text = filename,
                lnum = 1,
                col = 1
            }
            count = count + 1
        end
    end
    vim.fn.setqflist({}, "r", { title = "Modified Buffers", items = loaded_modified_bufs })
    vim.cmd("copen")
end)
