return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "stevearc/conform.nvim",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        require("conform").setup({
            formatters_by_ft = {
                javascript = { "prettier", stop_after_first = true },
                typescript = { "prettier", stop_after_first = true },
                vue = { "prettier", stop_after_first = true },
            },
            notify_on_error = false,
            format_on_save = function(bufnr)
                local disable_filetypes = { c = true, cpp = true }
                local lsp_format_opt
                if disable_filetypes[vim.bo[bufnr].filetype] then
                    lsp_format_opt = 'never'
                else
                    lsp_format_opt = 'fallback'
                end
                return {
                    timeout_ms = 1000,
                    lsp_format = lsp_format_opt,
                }
            end
        })
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                    -- "ts_ls",
                    "rust_analyzer",
                    "gopls",
                    "templ",
                    "svelte",
                    "vue_ls",
                    "tailwindcss",
                    "html",
                    -- "htmx", // WARN: completely breaks hover for all lsp on attached bufs
                    "emmet_ls",
                    "zls",
                    "elixirls",
                    "bashls",
                    "cssls",
                    "intelephense",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,
            }
        })
        local lspconfig = require('lspconfig')

        lspconfig.gleam.setup({})
  
        lspconfig.ts_ls.setup {
            init_options = {
                plugins = {
                    {
                        name = "@vue/typescript-plugin",
                        location = vim.fn.stdpath 'data' .. '/mason/packages/vue-language-server/node_modules/@vue/language-server',
                        languages = {"javascript", "typescript", "vue"},
                    },
                },
            },
            filetypes = {
                "javascript",
                "typescript",
                "vue",
            },
        }

        lspconfig.tailwindcss.config = {
            userLanguages = {
                templ = "html"
            }
        }

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })

        vim.diagnostic.config {
            signs = vim.g.have_nerd_font and {
                text = {
                    [vim.diagnostic.severity.ERROR] = '󰅚 ',
                    [vim.diagnostic.severity.WARN] = '󰀪 ',
                    [vim.diagnostic.severity.INFO] = '󰋽 ',
                    [vim.diagnostic.severity.HINT] = '󰌶 ',
                },
            } or {},
        }

        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts) 
        vim.keymap.set("n", "gD", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, opts)
        vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "<leader>fws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>dv", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)

        vim.keymap.set("n", "<leader>j", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "<leader>k", function() vim.diagnostic.goto_prev() end, opts)
    end
}
