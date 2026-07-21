inputs: { pkgs, ... }:

{

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    networking.networkmanager = {
        enable = true;
        plugins = with pkgs; [
            networkmanager-openvpn
        ];
    };

    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;
    services.blueman.enable = true;

    time.timeZone = "Europe/London";

    i18n.defaultLocale = "en_GB.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_GB.UTF-8";
        LC_IDENTIFICATION = "en_GB.UTF-8";
        LC_MEASUREMENT = "en_GB.UTF-8";
        LC_MONETARY = "en_GB.UTF-8";
        LC_NAME = "en_GB.UTF-8";
        LC_NUMERIC = "en_GB.UTF-8";
        LC_PAPER = "en_GB.UTF-8";
        LC_TELEPHONE = "en_GB.UTF-8";
        LC_TIME = "en_GB.UTF-8";
    };

    console.keyMap = "uk";

    services.printing.enable = true;

    services.avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
    };

    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };

    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        vim
        wget
    ];

    hardware.graphics = {
        enable = true;
        enable32Bit = true;
    };

    networking.firewall = {
        enable = true;
    };

}
