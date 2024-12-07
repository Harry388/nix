{ util, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "alacritty";
} {

    programs.alacritty = {
        enable = true;

        settings = {
            colors.draw_bold_text_with_bright_colors = false;
            window = {
                decorations = "None";
                startup_mode = "Maximized";
                opacity = 0.9;
                blur = true;
            };
            font = {
                size = 12;
                normal = {
                    family = "monospace";
                    style = "Medium";
                };
            };
        };
    };

}
