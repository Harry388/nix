return {
    "mbbill/undotree",
    config = function()
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        vim.g.undotree_SetFocusWhenToggle = true
    end
}
