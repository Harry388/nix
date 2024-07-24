{ lib, config, pkgs, ... }:

let 
    cfg = config.kde;
in
{

    options.kde = {
        enable = lib.mkEnableOption "enables kde";
    };

    config = lib.mkIf cfg.enable {
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

    };

}
