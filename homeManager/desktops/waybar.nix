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
                height = 20;
                margin-top = 10;
                margin-left = 10;
                margin-right = 10;
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
                    format-ethernet = "eth: {ipaddr}/{cidr}";
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
        style = ''
* {
    font-family: 'SF Mono', sans-serif;
    font-weight: bold;
    font-size: 10px;
}

window#waybar {
    background-color: rgba(0,0,0,0.6);
    color: #fce99f;
    border-radius: 10px;
    padding: 2px;
}

#workspaces button {
    background: transparent;
    color: #fce99f;
    border-radius: 10px;
}

#workspaces button:hover {
    color: #fce99f;
}

#workspaces button.active {
    background: #fce99f;
    color: #000000;
    border-radius: 10px;
}

.modules-right {
    padding-right: 10px;
    padding-left: 10px;
}

#battery {
    padding-right: 20px;
    padding-left: 20px;
    margin-right: 15px;
    margin-left: 15px;
}

#clock {
    padding-right: 20px;
    padding-left: 20px;
}

#tray {
    padding-right: 20px;
    padding-left: 20px;
}

#network {
    padding-right: 20px;
    padding-left: 20px;
}

#pulseaudio {
    padding-right: 20px;
    padding-left: 20px;
    margin-left: 15px;
    margin-right: 15px;
}

#backlight {
    padding-right: 20px;
    padding-left: 20px;
}
        '';
    };

}
