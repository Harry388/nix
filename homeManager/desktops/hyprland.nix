{ util, pkgs, inputs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "hyprlandHome";
} {

    home.pointerCursor = {
        gtk.enable = true;
        x11.enable = true;
        sway.enable = true;
        # package = pkgs.banana-cursor;
        # name = "Banana";
        # size = 32;
        package = pkgs.apple-cursor;
        name = "macOS";
        size = 24;
    };

    gtk = {
        enable = true;

        iconTheme = {
            package = pkgs.papirus-icon-theme;
            name = "Papirus-Dark";
        };
    };

    home.packages = with pkgs; [
        hyprpaper
        fuzzel
        waybar
        playerctl
        pavucontrol
        brightnessctl
        grimblast
        networkmanagerapplet
        swaynotificationcenter
        waybar
        ulauncher
    ];

}
