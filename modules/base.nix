{ util, pkgs, host, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "base";
} {

    boot.loader = {
        efi.canTouchEfiVariables = true;
        systemd-boot.enable = true;
    };

    networking.hostName = host;
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    virtualisation.docker.enable = true;

    networking.networkmanager.enable = true;

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

    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };

    users.users.harry = {
        isNormalUser = true;
        description = "Harry";
        extraGroups = [ "networkmanager" "wheel" "docker" ];
        shell = pkgs.zsh;
    };

    programs.zsh.enable = true;

    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        vim
        wget
    ];

    # networking.firewall.allowedTCPPorts = [ 5900 ];
    # networking.firewall.allowedUDPPorts = [ 56700 5900 ];

}
