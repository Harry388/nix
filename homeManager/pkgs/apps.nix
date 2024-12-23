{ util, pkgs, inputs, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "apps";
} {

    home.packages = with pkgs; [
        vesktop
        prismlauncher
        sqlitebrowser
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
        nautilus
        gnome-calculator
        gnome-disk-utility
        loupe
        seahorse
        file-roller
        lime3ds
    ];

}
