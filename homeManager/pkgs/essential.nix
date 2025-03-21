{ util, pkgs, inputs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "essential";
} {

    home.packages = with pkgs; [
        firefox
        vlc
        nautilus
        gnome-calculator
        gnome-disk-utility
        file-roller
        seahorse
        ghostty
        tmux
        yazi
        neovim
    ] ++ [
        inputs.zen-browser.packages.${pkgs.system}.default
    ];

}
