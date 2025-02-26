{ util, pkgs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "nixvim";
} {

    programs.nixvim = {
        enable = true;

        colorschemes.rose-pine = {
            enable = true;
            settings.variant = "main";
        };

        globals.mapleader = " ";

        keymaps = [
            {
                key = "-";
                action = "<cmd>Yazi<CR>";
                mode = "n";
            }
            {
                key = "<leader>u";
                action = "<cmd>UndotreeToggle<CR>";
                mode = "n";
            }
            {
                key = "<C-s>";
                action = "<cmd>w<CR>";
                mode = "n";
            }
            {
                key = "<leader>gg";
                action = "<cmd>LazyGit<CR>";
                mode = "n";
            }
            {
                key = "<leader>t";
                action = "<cmd>tabnew<CR>";
                mode = "n";
            }
            {
                key = "<M-l>";
                action = "<cmd>tabnext<CR>";
                mode = "n";
            }
            {
                key = "<M-h>";
                action = "<cmd>tabprev<CR>";
                mode = "n";
            }
            {
                key = "<M-j>";
                action = "<cmd>cnext<CR>";
                mode = "n";
            }
            {
                key = "<M-k>";
                action = "<cmd>cprevious<CR>";
                mode = "n";
            }
            {
                key = "<leader>qq";
                action = "<cmd>copen<CR>";
                mode = "n";
            }
            {
                key = "<leader>c";
                action = "\"+";
                mode = "n";
            }
            {
                key = "<leader>v";
                action = "\"_";
                mode = "n";
            }
            {
                key = "<C-j>";
                action = "<cmd>m +1<CR><Esc><S-v>";
                mode = "x";
            }
            {
                key = "<C-k>";
                action = "<cmd>m -2<CR><Esc><S-v>";
                mode = "x";
            }
        ];

        clipboard.providers.wl-copy.enable = true;

        filetype = {
            extension = {
                templ = "templ";
            };
        };

        opts = {
            nu = true;
            relativenumber = true;

            tabstop = 4;
            softtabstop = 4;
            shiftwidth = 4;
            expandtab = true;

            smartindent = true;

            wrap = false;

            swapfile = false;
            backup = false;

            hlsearch = false;
            incsearch = true;

            scrolloff = 8;

            updatetime = 50;

            signcolumn = "yes:1";

            foldlevelstart = 99;
        };

        plugins = {
            treesitter = {
                enable = true;
                languageRegister = {
                    templ = [ "templ" ];
                };
                settings = {
                    auto_install = true;
                    highlight = {
                        enable = true;
                    };
                };
            };
            undotree = {
                enable = true;
                settings = {
                    SetFocusWhenToggle = true;
                };
            };
            telescope = {
                enable = true;
                keymaps = {
                    "<leader>pg" = "git_files";
                    "<leader>pf" = "find_files";
                };
            };
            harpoon = {
                enable = true;
                keymaps = {
                    toggleQuickMenu = "<C-e>";
                    addFile = "<leader>a";
                    navFile = {
                        "1" = "<C-h>";
                        "2" = "<C-j>";
                        "3" = "<C-k>";
                        "4" = "<C-l>";
                    };
                };
            };
            oil = {
                enable = true;
                settings.columns = [ "icon" ];
            };
            yazi.enable = true;
            lsp = {
                enable = true;
                servers = {
                    # denols = {
                    #     enable = true;
                    #     rootDir = "require('lspconfig').util.root_pattern(\"deno.json\", \"deno.jsonc\")";
                    # };
                    ts_ls = {
                        enable = true;
                        # rootDir = "require('lspconfig').util.root_pattern(\"package.json\")";
                        # extraOptions = {
                        #     single_file_support = false;
                        # };
                    };
                    lua_ls = {
                        enable = true;
                        settings.telemetry.enable = false;
                    };
                    rust_analyzer = {
                        enable = true;
                        installCargo = false;
                        installRustc = false;
                    };
                    gopls.enable = true;
                    templ.enable = true;
                    gleam.enable = true;
                    svelte.enable = true;
                    volar = {
                        enable = true;
                        filetypes = [ "vue" "typescript" "javascript" "json" ];
                    };
                    tailwindcss.enable = true;
                    html.enable = true;
                    htmx = {
                        enable = true;
                        filetypes = [ "html" "templ" ];
                    };
                    emmet_ls.enable = true;
                    zls.enable = true;
                    phpactor.enable = true;
                    elixirls.enable = true;
                    bashls.enable = true;
                };
                keymaps.lspBuf = {
                    K = "hover";
                    gD = "references";
                    gd = "definition";
                    gi = "implementation";
                    gt = "type_definition";
                    "<leader>r" = "rename";
                };
                keymaps.diagnostic = {
                    "<leader>j" = "goto_next";
                    "<leader>k" = "goto_prev";
                };
            };
            luasnip.enable = true;
            cmp = {
                enable = true;
                settings = {
                    sources = [
                        { name = "nvim_lsp"; }
                        { name = "path"; }
                        { name = "buffer"; }
                        { name = "luasnip"; }
                    ];
                    mapping = {
                        "<CR>" = "cmp.mapping.confirm({ select = true })";
                        "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
                        "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
                    };
                    snippet.expand = "luasnip";
                };
            };
            rainbow-delimiters = {
                enable = true;
                highlight = [ "RainbowDelimiterYellow" "RainbowDelimiterBlue" "RainbowDelimiterOrange" "RainbowDelimiterGreen" "RainbowDelimiterViolet" "RainbowDelimiterCyan" ];
                blacklist = [ "zig" ];
            };
            lazygit.enable = true;
            transparent.enable = true;
            web-devicons.enable = true;
        };

        extraPlugins = with pkgs.vimPlugins; [
            vim-carbon-now-sh
        ];

        extraConfigLua = ''
            local telescope = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ps', function()
                telescope.grep_string({ search = vim.fn.input("Grep > ") });
            end)
            vim.g.markdown_fenced_languages = {
                "ts=typescript"
            }
        '';

    };

}
