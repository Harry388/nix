{ pkgs, inputs, ... }:

{

    programs.niri.enable = true;

    programs.xwayland.enable = true;

    services.udisks2.enable = true;

    xdg.portal = {
        enable = true;
        wlr.enable = true;
        xdgOpenUsePortal = true;
        extraPortals = with pkgs; [
            xdg-desktop-portal-gtk
            xdg-desktop-portal-gnome
        ];
    };

    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
    };

    environment.systemPackages = with pkgs; [
        xwayland-satellite
    ];

}
