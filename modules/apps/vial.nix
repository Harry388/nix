{ config, lib, pkgs, ... }:

let
    cfg = config.vial;
in
{

    options.vial = {
        enable = lib.mkEnableOption "enables vial";
    };

    config = lib.mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
            vial
        ];

        services.udev.packages = with pkgs; [ 
            vial
        ];
    };

}
