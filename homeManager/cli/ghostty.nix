{ util, inputs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "ghostty";
} {

    programs.ghostty = {
        enable = true;

        settings = {
            window-decoration = false;

            background = "181818";
            background-opacity = 0.9;

            cursor-style = "block";
            cursor-style-blink = false;
            shell-integration-features = "no-cursor";
            cursor-invert-fg-bg = true;
        };
    };

}
