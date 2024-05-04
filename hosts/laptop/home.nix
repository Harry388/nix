{ config, pkgs, inputs, ... }:

{

  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "harry";
  home.homeDirectory = "/home/harry";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    rustup
    gleam
    discord
    nodejs_22
    ripgrep
    jdk
    prismlauncher
    spotify
    obsidian
    gittyup
    dbeaver
    erlang
    neofetch
    gcc
    pkg-config
    openssl
    dolphin-emu
    rebar3
    (python311.withPackages (ps: with ps; [
      numpy # these two are
      scipy # probably redundant to pandas
      jupyterlab
      pandas
      statsmodels
      scikitlearn
    ]))
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/harry/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.google-chrome.enable = true;
  
  programs.git = {
    enable = true;
    userName = "harry388";
    userEmail = "harrythompson3765@gmail.com";
  };

  programs.tmux = {
      enable = true;

      baseIndex = 1;

      mouse = true;

      prefix = "C-space";

      terminal = "xterm-256color";

      escapeTime = 0;

      extraConfig = ''
        bind -n C-M-H previous-window
        bind -n C-M-L next-window
      '';

      plugins = [
        pkgs.tmuxPlugins.vim-tmux-navigator
        pkgs.tmuxPlugins.catppuccin
      ];
  };

  programs.zsh = {
      enable = true;
      enableCompletion = true;

      shellAliases = {
          switch = "sudo nixos-rebuild switch --flake ~/nix";
          update = "nix flake update";
          krisp = "nix run \"github:steinerkelvin/dotfiles#discord-krisp-patch\"";
      };
      
      oh-my-zsh = {
        # 2023-07-28: oh-my-zsh doesn't have a plugin that shows me the exit code if it was not 0 (I'd probably have to define my own prompt)
        enable = true;
        theme = "robbyrussell";
        plugins = [ # List of plugins: https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
          "z" # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/z
        ];
      };

      history = {
        share = true; # false -> every terminal has it's own history
        size = 9999999; # Number of history lines to keep.
        save = 9999999; # Number of history lines to save.
        ignoreDups = true; # Do not enter command lines into the history list if they are duplicates of the previous event.
        extended = true; # Save timestamp into the history file.
      };
  };

  programs.nixvim = {
    enable = true;

    colorschemes.melange.enable = true;

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
    ];

    clipboard.providers.wl-copy.enable = true;

    filetype = {
        extension = {
            matcha = "matcha";
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
    };

    plugins = {
      treesitter = {
          enable = true;
          languageRegister = {
              html = [ "matcha" ];
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
              "<leader>ps" = "live_grep";
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
          tsserver.enable = true;
          lua-ls = {
            enable = true;
            settings.telemetry.enable = false;
          };
          rust-analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
          gleam.enable = true;
          svelte.enable = true;
          tailwindcss.enable = true;
          html = {
              enable = true;
              filetypes = [ "html" "matcha" ];
          };
          htmx = {
              enable = true;
              filetypes = [ "html" "matcha" ];
          };
          emmet_ls = {
              enable = true;
              filetypes = [ "html" "matcha" ];
          };
        };
        keymaps.lspBuf = {
          K = "hover";
          gD = "references";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
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
      };
      tmux-navigator = {
          enable = true;
      };
    };

    extraPlugins = with pkgs.vimPlugins; [
        vim-carbon-now-sh
    ];

  };
}
