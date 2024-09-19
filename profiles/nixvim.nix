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
        enable = true;
        filetypes = { "*" = true; };
      };

      # blame people by git
      gitblame = { enable = true; };

      # automatically highlighting other uses of the word under the cursor
      illuminate = { enable = true; };

      # autocomplete pairs
      nvim-autopairs = {
        enable = true;

        checkTs = true;
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
          lua-ls.enable = true; # Lua
          nil_ls.enable = true; # Nix
          pyright.enable = true; # Python
          vuels.enable = true; # Vue
          yamlls.enable = true; # YAML
        };
      };

      # fuzzy finder
      telescope = {
        enable = true;

        keymaps = {
          "<leader>f" = {
            action = "find_files";
            desc = "Findfiles";
          };
          "<leader>s" = {
            action = "live_grep";
            desc = "Fuzzy search";
          };
          "<leader>b" = {
            action = "buffers";
            desc = "List buffers";
          };
        };
      };

      # terminal
      toggleterm = {
        enable = true;

        openMapping = "<leader>t";
        direction = "float";
        shell = "zsh";
      };

      #  what key
      which-key = { enable = true; };

    };
  };
}

