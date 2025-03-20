return {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
        require('telescope').setup({})

        local telescope = require('telescope.builtin')

        vim.keymap.set("n", "<leader>fg", telescope.git_files)
        vim.keymap.set("n", "<leader>ff", telescope.find_files)
        vim.keymap.set('n', '<leader>fs', function()
            telescope.grep_string({ search = vim.fn.input("Grep > ") });
        end)
    end
}
