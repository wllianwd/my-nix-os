{
  pkgs,
  ...
}:
{

  home.packages = with pkgs; [
    #hyprshot
    gnugrep
    bluez
  ];

  imports = [
    #./compatibility
    #./hyprlock.nix
  ];

  services = {
    swaync = {
      enable = true;
    };
    xembed-sni-proxy = {
      enable = true;
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;

    plugins = [
      # inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
    ];

    settings = {
      general = {
        allow_tearing = true;
        gaps_in = 4;
        gaps_out = 8;
        border_size = 0;
      };

      monitor = [
        "DP-1,highrr,auto,auto"
        "DP-2,highrr,auto,auto"
      ];
      "$mod" = "Super";
      "$terminal" = "ghostty";
      "$fileManager" = "nautilus";
      exec-once = [
        #"hyprpaper"
      ];
      exec = "hyprctl dispatch submap global";
      submap = "global";
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5"
      ];
      #bindi = [
      #  "$mod, SUPER_L, global, caelestia:launcher"
      #];
      bind = [
        #"$mod, R, exec, caelestia shell drawers toggle launcher"
        #", $mod, exec, caelestia shell drawers toggle launcher"
        #"$mod, R, exec, caelestia shell drawers toggle launcher"
        #"$mod, R , global, caelestia:launcher"
        "$mod, R, exec, dms ipc call spotlight toggle"
        "$mod, Q, exec, ghostty"
        "$mod, B, exec, google-chrome-stable"
        "$mod, E, exec, $fileManager"
        "$mod, C, killactive,"
        "$mod, F, fullscreen, 1"
        "$mod SHIFT, F, fullscreen, 0"
        "$mod, Enter, exec, ghostty"
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
        ", PRINT, exec, caelestia screenshot"
        "SHIFT, PRINT, global, caelestia:screenshotFreeze"
        "SHIFT+ALT, PRINT, global, caelestia:screenshot"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (
          builtins.genList (
            x:
            let
              ws =
                let
                  c = (x + 1) / 10;
                in
                builtins.toString (x + 1 - (c * 10));
            in
            [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          ) 10
        )
      );
      #bindin = [
      #  "$mod, catchall, global, caelestia:launcherInterrupt"
      #  "$mod, mouse:272, global, caelestia:launcherInterrupt"
      #  "$mod, mouse:273, global, caelestia:launcherInterrupt"
      #  "$mod, mouse:274, global, caelestia:launcherInterrupt"
      #  "$mod, mouse:275, global, caelestia:launcherInterrupt"
      #  "$mod, mouse:276, global, caelestia:launcherInterrupt"
      #  "$mod, mouse:277, global, caelestia:launcherInterrupt"
      #  "$mod, mouse_up, global, caelestia:launcherInterrupt"
      #  "$mod, mouse_down, global, caelestia:launcherInterrupt"
      #];
    };
  };
}
