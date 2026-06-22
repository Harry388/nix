return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function ()
        require("nvim-treesitter").install({
            "typescript",
            "javascript",
            "tsx",
            "rust",
            "go",
            "templ",
            "svelte",
            "vue",
            "html",
            "css",
            "lua",
            "zig",
            "json",
            "yaml",
            "markdown",
            "php",
            "toml",
            "python",
            "bash",
            "fish",
            "c",
            "gleam",
            "elixir",
            "nix",
            "kdl",
            "cpp",
        })
        vim.api.nvim_create_autocmd('FileType', {
            callback = function(ev)
                local lang = vim.treesitter.language.get_lang(ev.match)
                local installed_langs = require('nvim-treesitter').get_installed()
                local installed = vim.tbl_contains(installed_langs, lang)
                if installed then
                    vim.treesitter.start()
                    require('nvim-treesitter').indentexpr()
                end
            end,
        })
    end
}
