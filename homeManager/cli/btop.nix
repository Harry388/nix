{ util, lib, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "btop";
} {

    programs.btop = {
        enable = true;
        settings = {
            color_theme = lib.mkForce "gruvbox_material_dark";
            vim_keys = true;
        };
    };

}
