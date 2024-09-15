{ util, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "git";
} {

    programs.git = {
        enable = true;
        userName = "Harry Thompson";
        userEmail = "harrythompson3765@gmail.com";
        extraConfig = {
            pull.rebase = false;
        };
    };

}
