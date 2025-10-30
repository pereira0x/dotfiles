{
  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin.enable = true;

    viAlias = true;
    vimAlias = true;

    globals.mapleader = "'";

    plugins = {
      # junior software engineer
      copilot-vim = {
        enable = false;
        settings = {
          filetypes = { "*" = true; };
        };
      };
      web-devicons.enable = true;

      # blame people by git
      gitblame = { enable = true; };

      # automatically highlighting other uses of the word under the cursor
      illuminate = { enable = true; };

      # autocomplete pairs
      nvim-autopairs = {
        enable = true;
        settings = {
          checkTs = true;
        };
      };

      # language server protocol
      lsp = {
        enable = true;

        servers = {
          bashls.enable = true; # Bash
          clangd.enable = true; # C/C++
          cssls.enable = true; # CSS
          html.enable = true; # HTML
          jsonls.enable = true; # Json
          lua_ls.enable = true; # Lua
          nil_ls.enable = true; # Nix
          pyright.enable = true; # Python
          yamlls.enable = true; # YAML
        };
      };

      # fuzzy finder
      telescope = {
        enable = true;

        keymaps = {
          "<leader>f" = {
            action = "find_files";
          };
          "<leader>s" = {
            action = "live_grep";
          };
          "<leader>b" = {
            action = "buffers";
          };
        };
      };

      # terminal
      toggleterm = {
        enable = true;
        settings = {
          shell = "zsh";
          direction = "float";
          open_mapping = "[[<c-t>]]";
        };
      };

      #  what key
      which-key = { enable = true; };

    };
  };
}

