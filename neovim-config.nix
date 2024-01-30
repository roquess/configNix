pkgs: {
    enable = true;
    viAlias = true;
    vimAlias = true;
    configure = {
        customRC = ''
            set tabstop=4
            set shiftwidth=4
            set expandtab
            set nu
            syntax on
            set backspace=indent,eol,start
            nmap <F6> :e .<CR>
            set mouse=
            '';
        packages.myVimPackage = with pkgs.vimPlugins; {
            start = [
                ctrlp
                airline
                nvim-treesitter.withAllGrammars
            ];
        };
    };
}

