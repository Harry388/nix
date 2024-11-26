{ util, pkgs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "fonts";
} {

  fonts = {
      enableDefaultPackages = true;
      packages = with pkgs; [
          (nerdfonts.override { fonts = ["JetBrainsMono"]; })
          noto-fonts
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
