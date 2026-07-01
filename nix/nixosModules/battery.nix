{ config, lib, ... }:

let
    cfg = config.env.battery;
    # configs copied from https://nixos.wiki/wiki/Laptop
    batteryConfigs = {
        power-profiles-daemon = {
            services.power-profiles-daemon.enable = true;
        };
        tlp = {
            services.tlp = {
                enable = true;
                settings = {
                    CPU_SCALING_GOVERNOR_ON_AC = "schedutil";
                    CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

                    CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance"; # performance, balance_performance, balance_power, power
                    CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

                    CPU_MIN_PERF_ON_AC = 0;
                    CPU_MAX_PERF_ON_AC = 100; # Might need to lower this if overheating is a problem
                    CPU_MIN_PERF_ON_BAT = 0;
                    CPU_MAX_PERF_ON_BAT = 20;

                    #Optional helps save long term battery health
                    START_CHARGE_THRESH_BAT0 = 40; # 40 and below it starts to charge
                    STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging

                };
            };
        };
        auto-cpufreq = {
            services.auto-cpufreq = {
                enable = true;
                settings = {
                    battery = {
                        governor = "powersave";
                        turbo = "never";
                    };
                    charger = {
                        governor = "performance";
                        turbo = "auto";
                    };
                };
            };
        };
    };
    services = builtins.attrNames batteryConfigs;
in
{

    options.env.battery = {
        service = lib.mkOption {
            type = lib.types.enum services;
            default = "auto-cpufreq";
        };
    };

    config = lib.mkMerge (
        [
            {
                services.upower.enable = true;
            }
        ] ++ builtins.map (
            service: lib.mkIf (cfg.service == service) batteryConfigs.${service}
        ) services
    );

}
