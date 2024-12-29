{ ... }:

{

    nixpkgs.config = {
        allowUnfree = true;
    };

    home.username = "harry";
    home.homeDirectory = "/home/harry";

    programs.home-manager.enable = true;

}
