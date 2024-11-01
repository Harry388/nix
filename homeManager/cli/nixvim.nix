{ util, pkgs, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "nixvim";
} {

    programs.nixvim = {
        enable = true;

        colorschemes.gruvbox.enable = true;

        globals.mapleader = " ";

        keymaps = [
            {
                key = "-";
                action = "<cmd>Oil<CR>";
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
                key = "<C-m>";
                action = "<cmd>tabnext<CR>";
                mode = "n";
            }
            {
                key = "<C-n>";
                action = "<cmd>tabprev<CR>";
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
                    ignore_install = [
                        "php"
                    ];
                    highlight = {
                        enable = true;
                        disable = [
                            "php"
                        ];
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
                settings.defaults = {
                    preview = {
                        hide_on_startup = true;
                    };
                };
            };
            harpoon = {
                enable = true;
                keymaps = {
                    toggleQuickMenu = "<C-e>";
                    addFile = "<leader>a";
                    navFile = {
                        "1" = "<M-h>";
                        "2" = "<M-j>";
                        "3" = "<M-k>";
                        "4" = "<M-l>";
                    };
                };
            };
            oil = {
                enable = true;
                settings.columns = [ "icon" ];
            };
            lsp = {
                enable = true;
                servers = {
                    ts_ls.enable = true;
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
            cmp = {
                enable = true;
                autoEnableSources = true;
                settings = {
                    sources = [
                    {name = "nvim_lsp";}
                    {name = "path";}
                    {name = "buffer";}
                    {name = "luasnip";}
                    ];
                    mapping = {
                        "<CR>" = "cmp.mapping.confirm({ select = true })";
                        "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
                        "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
                    };
                    snippet.expand = ''
                        function(args)
                        require('snippy').expand_snippet(args.body)
                        end
                        '';
                };
            };
            cmp-snippy.enable = true;
            rainbow-delimiters = {
                enable = true;
                highlight = [ "RainbowDelimiterYellow" "RainbowDelimiterBlue" "RainbowDelimiterOrange" "RainbowDelimiterGreen" "RainbowDelimiterViolet" "RainbowDelimiterCyan" ];
                blacklist = [ "zig" "markdown" ];
            };
            tmux-navigator = {
                enable = true;
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
        '';

    };

}
