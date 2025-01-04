{ util, inputs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "ghostty";
} {

    programs.ghostty = {
        enable = true;
    };

}
