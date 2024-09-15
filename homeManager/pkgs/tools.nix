{ util, pkgs, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "tools";
} {

    home.packages = with pkgs; [
        ripgrep
        pkg-config
        openssl
        neofetch
        gnumake
        inotify-tools
        lazygit
        nmap
        wayvnc
    ];

}
