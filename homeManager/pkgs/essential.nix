{ util, pkgs, inputs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "essential";
} {

    home.packages = with pkgs; [
        tmux
        yazi
        neovim
    ];

}
