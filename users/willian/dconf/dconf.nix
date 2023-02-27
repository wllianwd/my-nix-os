# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "apps/seahorse/listing" = {
      keyrings-selected = [ "openssh:///home/willian/.ssh" ];
    };

    "apps/seahorse/windows/key-manager" = {
      height = 476;
      width = 1009;
    };

    "org/gnome/Console" = {
      last-window-size = mkTuple [ 652 457 ];
    };

    "org/gnome/Disks" = {
      image-dir-uri = "file:///home/willian/Documents";
    };

    "org/gnome/Disks/benchmark" = {
      do-write = true;
      num-access-samples = 1000;
      num-samples = 1000;
      sample-size-mib = 10;
    };

    "org/gnome/Geary" = {
      compose-as-html = true;
      composer-window-size = [ 680 600 ];
      formatting-toolbar-visible = false;
      migrated-config = true;
    };

    "org/gnome/Music" = {
      window-maximized = true;
      window-position = [ 0 0 ];
      window-size = [ 1920 1048 ];
    };

    "org/gnome/Totem" = {
      active-plugins = [ "recent" "vimeo" "open-directory" "screensaver" "save-file" "apple-trailers" "rotation" "autoload-subtitles" "skipto" "screenshot" "movie-properties" "mpris" "variable-rate" ];
      subtitle-encoding = "UTF-8";
    };

    "org/gnome/baobab/ui" = {
      window-size = mkTuple [ 960 600 ];
      window-state = 87168;
    };

    "org/gnome/calculator" = {
      accuracy = 9;
      angle-units = "degrees";
      base = 10;
      button-mode = "basic";
      number-format = "automatic";
      show-thousands = false;
      show-zeroes = false;
      source-currency = "";
      source-units = "degree";
      target-currency = "";
      target-units = "radian";
      window-position = mkTuple [ 26 23 ];
      word-size = 64;
    };

    "org/gnome/calendar" = {
      active-view = "month";
      window-maximized = true;
      window-position = mkTuple [ 0 0 ];
      window-size = mkTuple [ 1920 1048 ];
    };

    "org/gnome/cheese" = {
      burst-delay = 1000;
      camera = "HD Webcam";
      photo-x-resolution = 1280;
      photo-y-resolution = 720;
      video-x-resolution = 1280;
      video-y-resolution = 720;
    };

    "org/gnome/clocks/state/window" = {
      panel-id = "world";
      size = mkTuple [ 870 690 ];
      state = 87168;
    };

    "org/gnome/control-center" = {
      last-panel = "background";
      window-state = mkTuple [ 980 640 ];
    };

    "org/gnome/desktop/app-folders" = {
      folder-children = [ "Utilities" "YaST" ];
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = [ "gnome-abrt.desktop" "gnome-system-log.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.Dictionary.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.eog.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.fonts.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.tweaks.desktop" "org.gnome.Usage.desktop" "vinagre.desktop" ];
      categories = [ "X-GNOME-Utilities" ];
      name = "X-GNOME-Utilities.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/YaST" = {
      categories = [ "X-SuSE-YaST" ];
      name = "suse-yast.directory";
      translate = true;
    };

    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/blobs-l.svg";
      picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/blobs-d.svg";
      primary-color = "#241f31";
      secondary-color = "#000000";
    };

    "org/gnome/desktop/calendar" = {
      show-weekdate = false;
    };

    "org/gnome/desktop/input-sources" = {
      per-window = false;
      sources = [ (mkTuple [ "xkb" "us+altgr-intl" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" "lv3:ralt_switch" "compose:lalt" ];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      font-antialiasing = "grayscale";
      font-hinting = "slight";
      gtk-im-module = "gtk-im-context-simple";
      gtk-theme = "Adwaita-dark";
      monospace-font-name = "MesloLGS NF 10";
      show-battery-percentage = false;
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "gnome-power-panel" "steam" "zoom" "deluge" "fr-handbrake-ghb" "google-chrome" "gnome-network-panel" "idea-community" "discord" "postman" "org-gnome-evolution-alarm-notify" "org-gnome-console" "org-gnome-nautilus" "org-kde-showfoto" "org-gnome-baobab" "org-kde-digikam" "org-gnome-characters" "gvim" "org-gnome-settings" "codium" "balena-etcher-electron" ];
    };

    "org/gnome/desktop/notifications/application/balena-etcher-electron" = {
      application-id = "balena-etcher-electron.desktop";
    };

    "org/gnome/desktop/notifications/application/codium" = {
      application-id = "codium.desktop";
    };

    "org/gnome/desktop/notifications/application/deluge" = {
      application-id = "deluge.desktop";
    };

    "org/gnome/desktop/notifications/application/discord" = {
      application-id = "discord.desktop";
    };

    "org/gnome/desktop/notifications/application/fr-handbrake-ghb" = {
      application-id = "fr.handbrake.ghb.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-network-panel" = {
      application-id = "gnome-network-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-printers-panel" = {
      application-id = "gnome-printers-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/google-chrome" = {
      application-id = "google-chrome.desktop";
    };

    "org/gnome/desktop/notifications/application/gvim" = {
      application-id = "gvim.desktop";
    };

    "org/gnome/desktop/notifications/application/idea-community" = {
      application-id = "idea-community.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-baobab" = {
      application-id = "org.gnome.baobab.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-characters" = {
      application-id = "org.gnome.Characters.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-console" = {
      application-id = "org.gnome.Console.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-evolution-alarm-notify" = {
      application-id = "org.gnome.Evolution-alarm-notify.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-geary" = {
      application-id = "org.gnome.Geary.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-gedit" = {
      application-id = "org.gnome.gedit.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-nautilus" = {
      application-id = "org.gnome.Nautilus.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-settings" = {
      application-id = "org.gnome.Settings.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-shell-extensions-gsconnect-preferences" = {
      application-id = "org.gnome.Shell.Extensions.GSConnect.Preferences.desktop";
    };

    "org/gnome/desktop/notifications/application/org-kde-digikam" = {
      application-id = "org.kde.digikam.desktop";
    };

    "org/gnome/desktop/notifications/application/org-kde-showfoto" = {
      application-id = "org.kde.showfoto.desktop";
    };

    "org/gnome/desktop/notifications/application/postman" = {
      application-id = "postman.desktop";
    };

    "org/gnome/desktop/notifications/application/steam" = {
      application-id = "steam.desktop";
    };

    "org/gnome/desktop/notifications/application/vlc" = {
      application-id = "vlc.desktop";
    };

    "org/gnome/desktop/notifications/application/zoom" = {
      application-id = "Zoom.desktop";
    };

    "org/gnome/desktop/peripherals/keyboard" = {
      numlock-state = true;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      left-handed = false;
      speed = 5.8296e-2;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/privacy" = {
      disable-microphone = false;
      old-files-age = mkUint32 30;
      recent-files-max-age = -1;
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/blobs-l.svg";
      primary-color = "#241f31";
      secondary-color = "#000000";
    };

    "org/gnome/desktop/search-providers" = {
      sort-order = [ "org.gnome.Contacts.desktop" "org.gnome.Documents.desktop" "org.gnome.Nautilus.desktop" ];
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 0;
    };

    "org/gnome/desktop/sound" = {
      event-sounds = true;
      theme-name = "__custom";
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };

    "org/gnome/eog/view" = {
      background-color = "rgb(0,0,0)";
      use-background-color = true;
    };

    "org/gnome/epiphany/state" = {
      is-maximized = false;
      window-position = mkTuple [ (-1) (-1) ];
      window-size = mkTuple [ 1024 768 ];
    };

    "org/gnome/evince/default" = {
      window-ratio = mkTuple [ 0.109649 0.164474 ];
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
      network-monitor-gio-name = "";
    };

    "org/gnome/evolution-data-server/calendar" = {
      notify-window-height = 160;
      notify-window-paned-position = 48;
      notify-window-width = 522;
      notify-window-x = 26;
      notify-window-y = 23;
      reminders-past = [];
    };

    "org/gnome/file-roller/listing" = {
      list-mode = "as-folder";
      name-column-width = 500;
      show-path = false;
      sort-method = "name";
      sort-type = "ascending";
    };

    "org/gnome/file-roller/ui" = {
      sidebar-width = 200;
      window-height = 480;
      window-width = 1090;
    };

    "org/gnome/gedit/plugins" = {
      active-plugins = [ "filebrowser" "docinfo" "spell" "sort" "modelines" ];
    };

    "org/gnome/gedit/plugins/filebrowser" = {
      root = "file:///";
      tree-view = true;
      virtual-root = "file:///home/willian/.my-nix-os/system";
    };

    "org/gnome/gedit/preferences/ui" = {
      show-tabs-mode = "auto";
    };

    "org/gnome/gedit/state/window" = {
      bottom-panel-size = 140;
      side-panel-active-page = "GeditWindowDocumentsPanel";
      side-panel-size = 200;
      size = mkTuple [ 900 700 ];
      state = 87168;
    };

    "org/gnome/gnome-screenshot" = {
      delay = 0;
      include-pointer = false;
      last-save-directory = "file:///home/willian/Pictures";
    };

    "org/gnome/gnome-system-monitor" = {
      current-tab = "resources";
      maximized = false;
      network-total-in-bits = false;
      show-dependencies = false;
      show-whose-processes = "user";
      window-state = mkTuple [ 1026 500 ];
    };

    "org/gnome/gnome-system-monitor/disktreenew" = {
      col-0-visible = true;
      col-0-width = 437;
      col-6-visible = true;
      col-6-width = 0;
    };

    "org/gnome/gnome-system-monitor/proctree" = {
      columns-order = [ 0 1 2 3 4 6 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 ];
      sort-col = 15;
      sort-order = 0;
    };

    "org/gnome/mutter" = {
      attach-modal-dialogs = true;
      dynamic-workspaces = true;
      edge-tiling = true;
      focus-change-on-pointer-rest = true;
      workspaces-only-on-primary = true;
    };

    "org/gnome/nautilus/icon-view" = {
      default-zoom-level = "large";
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
      search-view = "list-view";
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [ 1247 543 ];
      maximized = false;
    };

    "org/gnome/nm-applet/eap/0510fe2f-dd92-47ff-8f02-030bfd4d05fb" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/nm-applet/eap/41860233-f35f-42ba-be46-be9cf1128443" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/nm-applet/eap/8d83a682-4bec-4ef4-9fbc-b446bfb53982" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/nm-applet/eap/a8dfc630-96f1-40bc-a9e5-8956337f01e7" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/nm-applet/eap/df7aacf2-195d-4ac2-ad5d-485bd6d3c864" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/nm-applet/eap/e8f53794-9636-4a95-866f-c16186dd4c4d" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/nm-applet/eap/f183661b-61e6-4c6f-80c4-e573b33f3613" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/photos" = {
      window-maximized = true;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      idle-dim = false;
      power-button-action = "suspend";
      sleep-inactive-ac-type = "nothing";
      sleep-inactive-battery-type = "suspend";
    };

    "org/gnome/shell" = {
      disable-user-extensions = true;
      disabled-extensions = [ "apps-menu@gnome-shell-extensions.gcampax.github.com" ];
      enabled-extensions = [ "places-menu@gnome-shell-extensions.gcampax.github.com" "gsconnect@andyholmes.github.io" "appindicatorsupport@rgcjonas.gmail.com" ];
      favorite-apps = [ "google-chrome.desktop" "codium.desktop" "idea-community.desktop" "org.gnome.Calendar.desktop" "org.gnome.Nautilus.desktop" "org.gnome.Console.desktop" ];
      had-bluetooth-devices-setup = true;
      last-selected-power-profile = "power-saver";
      welcome-dialog-last-shown-version = "41.1";
    };

    "org/gnome/shell/extensions/appindicator" = {
      tray-pos = "right";
    };

    "org/gnome/shell/extensions/gsconnect" = {
      id = "061888b5-76bd-4174-8464-b1ddb6563934";
      name = "nixos";
      show-indicators = false;
    };

    "org/gnome/shell/extensions/gsconnect/preferences" = {
      window-maximized = false;
      window-size = mkTuple [ 640 440 ];
    };

    "org/gnome/shell/world-clocks" = {
      locations = "@av []";
    };

    "org/gnome/simple-scan" = {
      document-type = "photo";
    };

    "org/gnome/software" = {
      check-timestamp = mkInt64 1677476256;
      first-run = false;
      online-updates-timestamp = mkInt64 1649689558;
      update-notification-timestamp = mkInt64 1649689558;
    };

    "org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9" = {
      font = "MesloLGS Nerd Font Mono 11";
      use-system-font = true;
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 169;
      sort-column = "modified";
      sort-directories-first = false;
      sort-order = "descending";
      type-format = "category";
      window-size = mkTuple [ 1284 1048 ];
    };

    "org/gtk/settings/color-chooser" = {
      custom-colors = [ (mkTuple [ 0.286275 0.658824 ]) ];
      selected-color = mkTuple [ true 0.286275 ];
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 157;
      sort-column = "modified";
      sort-directories-first = false;
      sort-order = "descending";
      type-format = "category";
      window-position = mkTuple [ 312 100 ];
      window-size = mkTuple [ 1297 902 ];
    };

    "system/proxy" = {
      mode = "none";
    };

  };
}
