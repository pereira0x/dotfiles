{
  programs.nixvim = {
    enable = true;

    colorschemes.one.enable = true;
    viAlias = true;
    vimAlias = true;

    plugins = {
      lightline = { enable = true; };
      copilot-vim = {
        enable = true;
        filetypes = { "*" = true; };
      };
      gitblame = { enable = true; };
      illuminate = { enable = true; };
    };
  };
}

