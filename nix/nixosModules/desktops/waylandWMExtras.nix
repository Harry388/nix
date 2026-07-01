{ pkgs, inputs, ... }:

{

    environment.systemPackages = with pkgs; [
        fuzzel
        playerctl
        pavucontrol
        brightnessctl
        grimblast
        hyprpicker
        wayvnc
        wl-clipboard
        # wtype # not sure if this is needed
        networkmanagerapplet
        matugen
        vicinae
        waypipe
        weylus
        flameshot
        noctalia-shell
        wooz
    ];

}
