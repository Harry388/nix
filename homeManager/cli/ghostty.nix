{ util, inputs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "ghostty";
} {

    xdg.configFile."ghostty/config".source = ./ghostty.config;

    home.packages = [ inputs.ghostty.packages.x86_64-linux.default ];

}
