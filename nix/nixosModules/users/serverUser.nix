inputs: { pkgs, ... }:

{

    users.users.server = {
        isNormalUser = true;
        description = "Server";
        extraGroups = [ ];
        shell = pkgs.fish;
    };

    programs.fish.enable = true;

}
