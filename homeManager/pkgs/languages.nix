{ lib, config, pkgs, ...}:

let
    cfg = config.languages;
in
{
    options.languages = {
        enable = lib.mkEnableOption "enables languages";
    };

    config = lib.mkIf cfg.enable {
        home.packages = with pkgs; [
            rustc
            cargo
            cargo-shuttle
            go
            gleam
            nodejs_22
            jdk
            erlang
            gcc
            rebar3
            (python311.withPackages (ps: with ps; [
                 numpy # these two are
                 scipy # probably redundant to pandas
                 jupyterlab
                 pandas
                 statsmodels
                 scikitlearn
            ]))
        ];
    };
}
