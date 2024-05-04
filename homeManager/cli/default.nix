{ lib, config, ... }:

let
    cfg = config.defaultHomeCli;
in
{
    imports =[
        ./git.nix
        ./nixvim.nix
        ./tmux.nix
        ./zsh.nix
    ];

    options.defaultHomeCli = {
        enable = lib.mkEnableOption "enables cli";
    };

    config = lib.mkIf cfg.enable {
        git.enable = lib.mkDefault true;
        nixvim.enable = lib.mkDefault true;
        tmux.enable = lib.mkDefault true;
        zsh.enable = lib.mkDefault true;
    };
}
