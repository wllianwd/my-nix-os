{
  lib,
  pkgs,
  ...
}:
let

  bluetoothToggle = pkgs.writeShellApplication {
    name = "bluetooth-toggle";
    runtimeInputs = with pkgs; [
      gnugrep
      bluez
    ];
    text = ''
      if [[ "$(bluetoothctl show | grep -Po "Powered: \K(.+)$")" =~ no ]]; then
        bluetoothctl power on
        bluetoothctl discoverable on
      else
        bluetoothctl power off
      fi
    '';
  };

  vpnStatus = pkgs.writeShellApplication {
    name = "vpnStatus";
    runtimeInputs = with pkgs; [
      networkmanager
      coreutils
      jq
    ];
    text = ''
      set -euo pipefail

      active_vpn="$(nmcli -t -f NAME,TYPE con show --active | grep ':vpn' || true | cut -d: -f1)"

      if [ -n "$active_vpn" ]; then
        echo "{\"text\": \"󰖂\", \"tooltip\": \"VPN active: $active_vpn\", \"class\": \"connected\"}"
      else
        echo "{\"text\": \"󰖂\", \"tooltip\": \"No VPN connected\", \"class\": \"disconnected\"}"
      fi
    '';
  };
in
{

  home.packages = with pkgs; [
    pamixer
  ];

  programs.waybar = {
    enable = true;
    systemd.enable = true;

    style = builtins.readFile ./waybar.scss;

    settings = [
      {
        modules-left = [
          "group/group-power"
          "clock"
        ];
        modules-center = [
          "hyprland/workspaces"
        ];
        modules-right = [
          "tray"
          "network"
          "custom/vpn"
          "wireplumber"
          "bluetooth"
          "battery"
        ];

        "wlr/taskbar" = {
          format = "{icon}";
          on-click = "activate";
          on-click-right = "fullscreen";
          icon-theme = "WhiteSur";
          icon-size = 25;
          tooltip-format = "{title}";
        };

        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            urgent = "";
            active = "";
            default = "";
          };
          sort-by-number = true;
        };

        tray = {
          spacing = 10;
        };

        clock = {
          format = "{:%H:%M}  ";
          format-alt = "{:%A, %B %d, %Y (%R)}  ";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            format = {
              months = "<span color='#f2cdcd'><b>{}</b></span>";
              days = "<span color='#bac2de'><b>{}</b></span>";
              weeks = "<span color='#94e2d5'><b>W{}</b></span>";
              weekdays = "<span color='#cba6f7'><b>{}</b></span>";
              today = "<span color='#89b4fa'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-click-right = "mode";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };

        };

        network = {
          format-wifi = "{icon}";
          format-icons = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          format-ethernet = "󰀂";
          format-disconnected = "󰖪";
          tooltip-format = "{ifname} / {essid} ({signalStrength}%) / {ipaddr}";
          on-click = "${pkgs.rofi-network-manager}/bin/rofi-network-manager";
          interval = 5;
          nospacing = 1;
        };

        "custom/vpn" = {
          format = "{}";
          exec = "${lib.getExe vpnStatus}";
          on-click = "rofi-vpn";
          on-click-right = "nmcli connection down id $(nmcli -t -f NAME,TYPE con show --active | grep ':vpn' | cut -d: -f1)";
          return-type = "json";
          interval = 1;
        };

        wireplumber = {
          format = "{icon}";
          format-bluetooth = "󰂰";
          nospacing = 1;
          tooltip-format = "Volume : {volume}%";
          format-muted = "󰝟";
          format-icons = {
            headphone = "";
            default = [
              "󰖀"
              "󰕾"
              ""
            ];
          };
          on-click = "pamixer -t";
          scroll-step = 1;
        };

        bluetooth = {
          format-on = "";
          format-connected = "{device_alias} ";
          format-off = "";
          format-disabled = "";
          on-click-right = "${lib.getExe' pkgs.blueberry "blueberry"}";
          on-click = "${lib.getExe bluetoothToggle}";
        };

        battery = {
          format = "{capacity}% {icon}";
          format-icons = {
            charging = [
              "󰢜"
              "󰂆"
              "󰂇"
              "󰂈"
              "󰢝"
              "󰂉"
              "󰢞"
              "󰂊"
              "󰂋"
              "󰂅"
            ];
            default = [
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁽"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂁"
              "󰂂"
              "󰁹"
            ];
          };
          format-full = "Charged ";
          interval = 5;
          states = {
            warning = 20;
            critical = 10;
          };
          tooltip = false;
        };

        "group/group-power" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 500;
          };
          modules = [
            "custom/power"
            "custom/quit"
            "custom/lock"
            "custom/reboot"
          ];
        };

        "custom/quit" = {
          format = "󰗼";
          on-click = "${pkgs.hyprland}/bin/hyprctl dispatch exit";
          tooltip = true;
          tooltip-format = "Logout";
        };

        "custom/lock" = {
          format = "󰍁";
          on-click = "${pkgs.hyprlock}/bin/hyprlock";
          tooltip = true;
          tooltip-format = "Lock";
        };

        "custom/reboot" = {
          format = "󰜉";
          on-click = "${pkgs.systemd}/bin/systemctl reboot";
          tooltip = true;
          tooltip-format = "Reboot";
        };

        "custom/power" = {
          format = "";
          on-click = "${pkgs.systemd}/bin/systemctl poweroff";
          tooltip = true;
          tooltip-format = "Power off";
        };

      }
    ];
  };

}
