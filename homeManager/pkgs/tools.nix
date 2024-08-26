{ lib, config, pkgs, ...}:

let
    cfg = config.tools;
in
{
    options.tools = {
        enable = lib.mkEnableOption "enables tools";
    };

    config = lib.mkIf cfg.enable {
        home.packages = with pkgs; [
            ripgrep
            pkg-config
            openssl
            neofetch
            gnumake
            inotify-tools
            lazygit
            nmap
        ];
    };
}
