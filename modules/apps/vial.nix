{ util, pkgs, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "vial";
} {

    environment.systemPackages = with pkgs; [
        vial
    ];
    services.udev.packages = with pkgs; [ 
        vial
    ];

}
