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
        postman
        dolphin-emu
        zed-editor
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
        gimp
        musescore
        ghostty
        tmux
        yazi
    ] ++ (with inputs.dated19dec-nixpkgs.legacyPackages.x86_64-linux; [
        lime3ds
        gittyup
        bottles
        mysql-workbench
    ]);

}
