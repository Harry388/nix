{ util, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "ghostty";
} {

    xdg.configFile."ghostty/config".source = ./ghostty.config;

}
