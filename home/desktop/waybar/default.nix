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

    settings = [
      {
        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = [ "clock" ];
        modules-right = [
          "tray"
          "network"
          "custom/vpn"
          "wireplumber"
          "bluetooth"
          "battery"
          "group/group-power"
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
          on-click = "activate";
          format = "{icon}";
          format-icons = {
            default = "";
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            active = "󱓻";
            urgent = "󱓻";
          };
          persistent_workspaces = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
            "5" = [ ];
          };
        };

        tray = {
          spacing = 10;
        };

        clock = {
          tooltip-format = "{calendar}";
          format-alt = "  {:%a, %d %b %Y}";
          format = "  {:%I:%M %p}";
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
            transition-left-to-right = false;
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

  programs.waybar.style = builtins.readFile ./waybar.scss;

}
