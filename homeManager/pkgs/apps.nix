{ util, pkgs, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "apps";
} {

    home.packages = with pkgs; [
        discord-screenaudio
        prismlauncher
        spotify
        obsidian
        gittyup
        #dbeaver-bin
        mysql-workbench
        postman
        dolphin-emu
        zed-editor
        bottles
        firefox
        transmission_4-gtk
        vlc
        libreoffice-qt
        clonehero
        hunspell
        hunspellDicts.en_GB-ise
        processing
    ];

}
