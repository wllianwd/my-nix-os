{ pkgs, ... }:

{

  programs = {
    vim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [ 
        vim-airline 
        nerdtree 
        nerdtree-git-plugin 
        vim-devicons 
        vim-nerdtree-syntax-highlight 
      ];
      settings = { ignorecase = true; };
      extraConfig = ''
        set mouse=a
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
        autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
      '';
    };
  };
}

