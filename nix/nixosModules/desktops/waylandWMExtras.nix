inputs: { pkgs, ... }:

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
