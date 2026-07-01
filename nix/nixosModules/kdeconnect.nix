inputs: { pkgs, ... }:

{

    programs.kdeconnect.enable = true;

    evironment.systemPackages = with pkgs; [
        kdePackages.qttools
    ];

}
