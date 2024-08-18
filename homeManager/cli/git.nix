{ lib, config, ... }:

let
    cfg = config.git;
in
{
    options.git = {
        enable = lib.mkEnableOption "enables git";
    };

    config = lib.mkIf cfg.enable {
        programs.git = {
            enable = true;
            userName = "Harry Thompson";
            userEmail = "harrythompson3765@gmail.com";
            extraConfig = {
                pull.rebase = false;
            };
        };
    };
}
