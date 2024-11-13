{ util, pkgs, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "languages";
} {

    home.packages = with pkgs; [
        cargo
        cargo-shuttle
        go
        templ
        gleam
        zig
        zls
        mysql84
        typescript
        nodejs_22
        bun
        jdk
        erlang
        gcc
        rebar3
        elixir
        deno
        (python311.withPackages (ps: with ps; [
             numpy # these two are
             scipy # probably redundant to pandas
             jupyterlab
             pandas
             statsmodels
             scikitlearn
             matplotlib
        ]))
    ];

}
