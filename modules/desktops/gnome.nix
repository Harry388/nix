{ util, pkgs, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "gnome";
} {

    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "gb";
        variant = "";
    };

    environment.gnome.excludePackages = (with pkgs; [
        gnome-photos
        gnome-tour
        gedit
        cheese # webcam tool
        epiphany # web browser
        geary # email reader
        yelp # Help view
        gnome-music
        gnome-characters
        tali # poker game
        iagno # go game
        hitori # sudoku game
        atomix # puzzle game
        gnome-contacts
        gnome-initial-setup
    ]);

    programs.dconf.enable = true;

    environment.systemPackages = with pkgs; [
        gnome-tweaks
    ];

}
