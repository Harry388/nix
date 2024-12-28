{ config, pkgs, inputs, ... }:

{

  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ../../homeManager/default.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  home.username = "harry";
  home.homeDirectory = "/home/harry";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  programs.home-manager.enable = true;
 
  defaultHome.enable = true;

  wayland.windowManager.hyprland.settings.monitor = [
      "eDP-1, 1920x1200, 0x0, 1"
      "HDMI-A-1, 1920x1080, 1920x0, 1"
  ];

}
