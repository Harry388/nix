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
    ] ++ [
        inputs.lime-3ds-nixpkgs.legacyPackages."x86_64-linux".lime3ds
    ];

}
