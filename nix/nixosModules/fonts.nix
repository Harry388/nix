{ pkgs, ... }:

{

    fonts = {
        enableDefaultPackages = true;
        packages = with pkgs; [
            nerd-fonts.jetbrains-mono
            nerd-fonts.gohufont
            noto-fonts
            material-symbols
        ];
        fontconfig = {
            defaultFonts = {
                serif = [ "Noto Serif" ];
                sansSerif = [ "Noto Sans" ];
                monospace = [ "JetBrainsMono Nerd Font Mono" ];
                emoji = [ "Noto Color Emoji" ];
            };
        };
    };

}
