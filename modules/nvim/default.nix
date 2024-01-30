{ pkgs, ... }:
let leaderKey = "\\<Space>";
in {
  programs = {
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      plugins = [
        ## Theme
        {
          plugin = pkgs.vimPlugins.onedark-nvim;
          config = "vim.cmd[[colorscheme onedark]]";
          type = "lua";
        }

        ## Treesitter
        {
          plugin = pkgs.vimPlugins.nvim-treesitter;
          config = builtins.readFile config/setup/treesitter.lua;
          type = "lua";
        }
        pkgs.vimPlugins.nvim-treesitter.withAllGrammars
        pkgs.vimPlugins.nvim-treesitter-textobjects

        ## LSP
        {
          plugin = pkgs.vimPlugins.nvim-lspconfig;
          config = builtins.readFile config/setup/lspconfig.lua;
          type = "lua";
        }
        pkgs.vimPlugins.plenary-nvim

        ## Telescope
        {
          plugin = pkgs.vimPlugins.telescope-nvim;
          config = builtins.readFile config/setup/telescope.lua;
          type = "lua";
        }
        pkgs.vimPlugins.telescope-fzf-native-nvim
        # pkgs.vimPlugins.harpoon

        ## cmp
        {
          plugin = pkgs.vimPlugins.nvim-cmp;
          config = builtins.readFile config/setup/cmp.lua;
          type = "lua";
        }
        pkgs.vimPlugins.cmp-nvim-lsp
        pkgs.vimPlugins.cmp-buffer
        pkgs.vimPlugins.cmp-cmdline
        pkgs.vimPlugins.cmp_luasnip

        ## tpope
        pkgs.vimPlugins.vim-surround
        pkgs.vimPlugins.vim-sleuth
        pkgs.vimPlugins.vim-repeat
        # pkgs.vimPlugins.copilot-vim

        ## QOL
        {
          plugin = pkgs.vimPlugins.luasnip;
          config = "require('luasnip').setup()";
          type = "lua";
        }
        {
          plugin = pkgs.vimPlugins.which-key-nvim;
          config = "require('which-key').setup()";
          type = "lua";
        }
        {
          plugin = pkgs.vimPlugins.trouble-nvim;
          config = "require('trouble').setup {}";
          type = "lua";
        }
        {
          plugin = pkgs.vimPlugins.comment-nvim;
          config = "require('Comment').setup()";
          type = "lua";
        }
        {
          plugin = pkgs.vimPlugins.gitsigns-nvim;
          config = "require('gitsigns').setup()";
          type = "lua";
        }
        {
          plugin = pkgs.vimPlugins.lualine-nvim;
          config = ''
            require('lualine').setup {
                options = {
                    icons_enabled = false,
                    theme = 'onedark',
                    component_separators = '|',
                    section_separators = "",
                },
            }
          '';
          type = "lua";
        }
      ];
      extraConfig = ''
        let mapleader = "${leaderKey}"
      '';
      extraLuaConfig = ''
        ${builtins.readFile config/mappings.lua}
        ${builtins.readFile config/options.lua}
      '';
    };
  };
}
