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
        erlang_27
        gcc
        rebar3
        elixir
        deno
        python314
        php
        php83Packages.composer
        laravel
        lua
        lua-language-server
    ];

}
