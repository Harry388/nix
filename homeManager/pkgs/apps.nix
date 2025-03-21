{ util, pkgs, inputs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "apps";
} {

    home.packages = with pkgs; [
        sqlitebrowser
        spotify
        obsidian
        postman
        zed-editor
        transmission_4-gtk
        libreoffice-qt
        hunspell
        hunspellDicts.en_GB-ise
        processing
        loupe
        gimp
        musescore
        firefox
        vlc
        nautilus
        gnome-calculator
        gnome-disk-utility
        file-roller
        seahorse
        ghostty
    ] ++ (with inputs.dated19dec-nixpkgs.legacyPackages.${pkgs.system}; [
        gittyup
        bottles
        mysql-workbench
    ]) ++ [
        inputs.zen-browser.packages.${pkgs.system}.default
    ];

}
