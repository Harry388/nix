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
border-radius: 10px;
}

window#waybar {
background-color: transparent;
color: #ebdbb2;
}

.modules-left {
padding-left: 10px;
padding-right: 10px;
}

#workspaces {
background-color: rgba(0,0,0,0.6);
}

#workspaces button {
padding: 0 15px 0 15px;
color: #ffffff;
border: 2px solid rgba(0,0,0,0);
}

#workspaces button.active {
background-color: #8ec07c;
color: #282828;
border: 2px solid #8ec07c;
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
color: #83a598;
border: 2px solid #83a598;
background-color: rgba(0,0,0,0.6);
}

#clock {
padding-right: 20px;
padding-left: 20px;
background-color: rgba(0,0,0,0.6);
color: #b8bb26;
border: 2px solid #b8bb26;
}

#tray {
padding-right: 20px;
padding-left: 20px;
background-color: rgba(0,0,0,0.6);
color: #ffffff;
border: 2px solid #ffffff;
}

#network {
padding-right: 20px;
padding-left: 20px;
background-color: rgba(0,0,0,0.6);
color: #d3869b;
border: 2px solid #d3869b;
}

#pulseaudio {
padding-right: 20px;
padding-left: 20px;
margin-left: 15px;
margin-right: 15px;
background-color: rgba(0,0,0,0.6);
color: #fabd2f;
border: 2px solid #fabd2f;
}

#backlight {
padding-right: 20px;
padding-left: 20px;

background-color: rgba(0,0,0,0.6);
color: #fe8019;
border: 2px solid #fe8019;
}
        '';
    };

}
