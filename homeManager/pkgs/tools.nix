{ util, pkgs, inputs, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "tools";
} {

    home.packages = with pkgs; [
        air
        neocities
        fzf
        ripgrep
        pkg-config
        openssl
        neofetch
        gnumake
        inotify-tools
        lazygit
        nmap
        wayvnc
        wl-clipboard
        wtype
        bemoji
        udiskie
        colorz
        git-filter-repo
        git
        btop
        zoxide
        unzip
        tldr
        mdp
        gtypist
        bat
        starship
        fselect
        jq
        tokei
        caddy
    ];

}
