inputs: { pkgs, ... }:

{

    users.users.server = {
        isNormalUser = true;
        description = "Server";
        extraGroups = [ ];
        shell = pkgs.fish;
        linger = true;
    };

    programs.fish.enable = true;

}
