{ util, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "waybar";
} {

    programs.waybar = {
        enable = true;
        settings = {
            mainBar = {
                layer = "top";
                position = "top";
                mode = "dock";
                height = 5;
                margin-left = 400;
                margin-right = 400;
                modules-left = ["hyprland/workspaces" "battery" "backlight"];
                modules-center = ["clock"];
                modules-right = ["network" "pulseaudio" "tray"];

                battery = {
                    format = "bat: {capacity}%";
                    format-charging = "charging: {capacity}%";
                };
                clock = {
                    format= "{:%I:%M %p}";
                    format-alt = "{:%a, %d. %b  %I:%M %p}";
                };
                pulseaudio = {
                    format = "vol: {volume}%";
                    format-bluetooth = "blu: {volume}%";
                    format-muted = "vol: muted";
                    scroll-step = 1;
                    on-click = "pavucontrol";
                    ignored-sinks = ["Easy Effects Sink"];
                };
                network = {
                    format = "{ifname}";
                    format-wifi = "wifi: {essid}";
                    format-ethernet = "eth: {essid}";
                    format-disconnected = "disconnected";
                    max-length = 50;
                };
                "hyprland/workspaces" = {
                    format = "{icon}";
                    on-click = "activate";
                    sort-by-number = true;
                };
                backlight = {
                    device = "intel_backlight";
                    format = "bl: {percent}%";
                };
            };
        };
        style = builtins.readFile ./waybar.css;
    };

}
