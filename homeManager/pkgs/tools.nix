{ util, pkgs, inputs, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "tools";
} {

    home.packages = with pkgs; [
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
        udisks
    #] ++ [
        #inputs.lifx.packages.${pkgs.system}.default
    ];

}
