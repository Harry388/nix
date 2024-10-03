{ util, pkgs, inputs, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "tools";
} {

    home.packages = with pkgs; [
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
    ] ++ [
        inputs.lifx.packages.${pkgs.system}.default
    ];

}
