inputs: { pkgs, ... }:

{

    nix.settings = {
        extra-substituters = [ "https://noctalia.cachix.org" ];
        extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
    };

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
        vicinae
        waypipe
        weylus
        flameshot
        wooz
        antimicrox
    ] ++ [
        inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

}
