{ util, lib, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "defaultHomeCli";
    imports = [
        ./git.nix
        ./nixvim.nix
        ./tmux.nix
        ./zsh.nix
        ./alacritty.nix
        ./btop.nix
    ];
} {

    git.enable = lib.mkDefault true;
    nixvim.enable = lib.mkDefault true;
    tmux.enable = lib.mkDefault true;
    zsh.enable = lib.mkDefault true;
    alacritty.enable = lib.mkDefault false;
    btop.enable = lib.mkDefault true;

}
