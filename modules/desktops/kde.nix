{ util, pkgs, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "kde";
} {

    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the GNOME Desktop Environment.
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;

    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "gb";
        variant = "";
    };

    environment.plasma6.excludePackages = (with pkgs.kdePackages; [
        plasma-browser-integration
        konsole
        oxygen
    ]);

    programs.dconf.enable = true;

}
