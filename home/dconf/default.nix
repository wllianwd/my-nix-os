# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "apps/psensor" = {
      graph-alpha-channel-enabled = false;
      graph-background-alpha = 1.0;
      graph-background-color = "#e8f4e8f4a8f5";
      graph-foreground-color = "#000000000000";
      graph-monitoring-duration = 20;
      graph-update-interval = 2;
      interface-hide-on-startup = false;
      interface-window-divider-pos = 0;
      interface-window-h = 445;
      interface-window-restore-enabled = true;
      interface-window-w = 800;
      interface-window-x = 26;
      interface-window-y = 23;
      sensor-update-interval = 2;
      slog-enabled = false;
      slog-interval = 300;
    };

    "apps/seahorse/listing" = {
      keyrings-selected = [ "openssh:///home/willian/.ssh" ];
    };

    "apps/seahorse/windows/key-manager" = {
      height = 476;
      width = 1009;
    };

    "org/gnome/Connections" = {
      first-run = false;
    };

    "org/gnome/Console" = {
      last-window-maximised = true;
      last-window-size = mkTuple [ 811 481 ];
    };

    "org/gnome/Disks" = {
      image-dir-uri = "file:///home/willian/Documents";
    };

    "org/gnome/Disks/benchmark" = {
      do-write = false;
      num-access-samples = 10000;
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

    "org/gnome/Snapshot" = {
      is-maximized = false;
      show-composition-guidelines = false;
      window-height = 640;
      window-width = 800;
    };

    "org/gnome/Totem" = {
      active-plugins = [ "recent" "vimeo" "open-directory" "screensaver" "save-file" "apple-trailers" "rotation" "autoload-subtitles" "skipto" "screenshot" "movie-properties" "mpris" "variable-rate" ];
      subtitle-encoding = "UTF-8";
    };

    "org/gnome/baobab/ui" = {
      is-maximized = false;
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
      window-maximized = false;
      window-position = mkTuple [ 26 23 ];
      window-size = mkTuple [ 360 504 ];
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
      maximized = false;
      panel-id = "world";
      size = mkTuple [ 870 690 ];
      state = 87168;
    };

    "org/gnome/control-center" = {
      last-panel = "background";
      window-state = mkTuple [ 980 640 false ];
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
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/vnc-l.png";
      picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/vnc-d.png";
      primary-color = "#77767B";
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
      color-scheme = "default";
      font-antialiasing = "grayscale";
      font-hinting = "slight";
      gtk-im-module = "gtk-im-context-simple";
      gtk-theme = "Adwaita-dark";
      monospace-font-name = "MesloLGS NF 10";
      show-battery-percentage = false;
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "gnome-power-panel" "steam" "zoom" "deluge" "fr-handbrake-ghb" "google-chrome" "gnome-network-panel" "idea-community" "discord" "postman" "org-gnome-evolution-alarm-notify" "org-gnome-console" "org-gnome-nautilus" "org-kde-showfoto" "org-gnome-baobab" "org-kde-digikam" "org-gnome-characters" "gvim" "org-gnome-settings" "codium" "balena-etcher-electron" "gnome-printers-panel" ];
      show-banners = false;
    };

    "org/gnome/desktop/notifications/application/balena-etcher-electron" = {
      application-id = "balena-etcher-electron.desktop";
    };

    "org/gnome/desktop/notifications/application/codium" = {
      application-id = "codium.desktop";
    };

    "org/gnome/desktop/notifications/application/com-obsproject-studio" = {
      application-id = "com.obsproject.Studio.desktop";
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

    "org/gnome/desktop/notifications/application/org-gnome-epiphany" = {
      application-id = "org.gnome.Epiphany.desktop";
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

    "org/gnome/desktop/notifications/application/org-gnome-texteditor" = {
      application-id = "org.gnome.TextEditor.desktop";
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
      numlock-state = false;
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
      remove-old-temp-files = true;
      remove-old-trash-files = true;
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/vnc-l.png";
      primary-color = "#77767B";
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

    "org/gnome/epiphany" = {
      ask-for-default = false;
    };

    "org/gnome/epiphany/state" = {
      is-maximized = false;
      window-position = mkTuple [ (-1) (-1) ];
      window-size = mkTuple [ 1920 1048 ];
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
      reminders-past = [ "567bb833991000325a8ca3bd68415140ab36e35an6e70d06722b98e65215d5f3c13d165d8833d301bt20250305T193000n1741197600n1741199400n1741203000nBEGIN:VEVENTrnDTSTART;TZID=Europe/Madrid:20250305T193000rnDTEND;TZID=Europe/Madrid:20250305T203000rnDTSTAMP:20250305T172236ZrnORGANIZER;CN=Unknown Organizer:mailto:rn unknownorganizer@calendar.google.comrnUID:001c1o1l4glgom08quhml2qnvo@google.comrnATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=ACCEPTED;rn CN=willian.wd@gmail.com;X-NUM-GUESTS=0:mailto:willian.wd@gmail.comrnCLASS:PRIVATErnCREATED:20250305T172236ZrnDESCRIPTION:Si quieres ver informaci\243n detallada sobre los eventos rn creados autom\225ticamente como este\\, utiliza la aplicaci\243n oficial de rn Google Calendar. https://g.co/calendar\\n\\nEste evento se ha creado a rn partir de un correo que recibiste en Gmail. https:rn //mail.google.com/mail?extsrc=cal&plid=ACUX6DMm_PP4WGFJKqF4skalRR0IuKNkt2-rn Y2Tk\\nrnLAST-MODIFIED:20250305T172236ZrnLOCATION:La Madurada Petit Versailles\\, Carrer Gran de Sant Andreu\\, rn 255\\, Barcelona\\, CT\\, 08030\\, ESrnSEQUENCE:0rnSTATUS:CONFIRMEDrnSUMMARY:Reservation at La Madurada Petit VersaillesrnTRANSP:TRANSPARENTrnX-EVOLUTION-CALDAV-ETAG:63876878556rnBEGIN:VALARMrnACTION:EMAILrnDESCRIPTION:This is an event reminderrnSUMMARY:Alarm notificationrnATTENDEE:mailto:willian.wd@gmail.comrnTRIGGER:-PT10MrnX-EVOLUTION-ALARM-UID:c749eb262bbc2c9794bad51d23091f6730d3ac5crnEND:VALARMrnBEGIN:VALARMrnACTION:DISPLAYrnDESCRIPTION:This is an event reminderrnTRIGGER:-PT30MrnX-EVOLUTION-ALARM-UID:6e70d06722b98e65215d5f3c13d165d8833d301brnEND:VALARMrnEND:VEVENTrn" "567bb833991000325a8ca3bd68415140ab36e35an9aa0252e4d6bf00537efb179227a12dff80ad7e6t20250305T193000n1741197600n1741199400n1741203000nBEGIN:VEVENTrnDTSTART;TZID=Europe/Madrid:20250305T193000rnDTEND;TZID=Europe/Madrid:20250305T203000rnDTSTAMP:20250305T172239ZrnORGANIZER;CN=Unknown Organizer:mailto:rn unknownorganizer@calendar.google.comrnUID:vmgeq2rtjpoegbbo5udt16ocao@google.comrnATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=ACCEPTED;rn CN=willian.wd@gmail.com;X-NUM-GUESTS=0:mailto:willian.wd@gmail.comrnCLASS:PRIVATErnCREATED:20250305T172239ZrnDESCRIPTION:Si quieres ver informaci\243n detallada sobre los eventos rn creados autom\225ticamente como este\\, utiliza la aplicaci\243n oficial de rn Google Calendar. https://g.co/calendar\\n\\nEste evento se ha creado a rn partir de un correo que recibiste en Gmail. https:rn //mail.google.com/mail?extsrc=cal&plid=ACUX6DNmCMr_ltPi9P-0pVLQ2E1HikYl0jfrn G1y4\\nrnLAST-MODIFIED:20250305T172239ZrnLOCATION:La Madurada Petit Versailles\\, Gran de sant andreu\\, 255\\, Sant rn andreu\\, Barcelona\\, 08030\\, Espa\241arnSEQUENCE:0rnSTATUS:CONFIRMEDrnSUMMARY:Reservation at La Madurada Petit VersaillesrnTRANSP:TRANSPARENTrnX-EVOLUTION-CALDAV-ETAG:63876878559rnBEGIN:VALARMrnACTION:EMAILrnDESCRIPTION:This is an event reminderrnSUMMARY:Alarm notificationrnATTENDEE:mailto:willian.wd@gmail.comrnTRIGGER:-PT10MrnX-EVOLUTION-ALARM-UID:6388a599c8fe8ecea496de7aecff86940d53a12frnEND:VALARMrnBEGIN:VALARMrnACTION:DISPLAYrnDESCRIPTION:This is an event reminderrnTRIGGER:-PT30MrnX-EVOLUTION-ALARM-UID:9aa0252e4d6bf00537efb179227a12dff80ad7e6rnEND:VALARMrnEND:VEVENTrn" ];
    };

    "org/gnome/file-roller/dialogs/extract" = {
      height = 800;
      recreate-folders = true;
      skip-newer = false;
      width = 1000;
    };

    "org/gnome/file-roller/file-selector" = {
      show-hidden = false;
      sidebar-size = 300;
      sort-method = "name";
      sort-type = "ascending";
      window-size = mkTuple [ (-1) (-1) ];
    };

    "org/gnome/file-roller/listing" = {
      list-mode = "as-folder";
      name-column-width = 540;
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
      current-tab = "processes";
      maximized = false;
      network-total-in-bits = false;
      process-memory-in-iec = false;
      show-dependencies = false;
      show-whose-processes = "user";
      window-state = mkTuple [ 700 500 ];
      window-width = 1128;
    };

    "org/gnome/gnome-system-monitor/disktreenew" = {
      col-0-visible = true;
      col-0-width = 437;
      col-6-visible = true;
      col-6-width = 0;
    };

    "org/gnome/gnome-system-monitor/proctree" = {
      col-26-visible = false;
      col-26-width = 0;
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

    "org/gnome/nautilus/compression" = {
      default-compression-format = "zip";
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
      initial-size-file-chooser = mkTuple [ 890 550 ];
      maximized = false;
    };

    "org/gnome/nm-applet/eap/0510fe2f-dd92-47ff-8f02-030bfd4d05fb" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/nm-applet/eap/3e65c142-dd9a-4bcc-b0d1-9a38000918f1" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/nm-applet/eap/41860233-f35f-42ba-be46-be9cf1128443" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/nm-applet/eap/4e85ee7f-cbc3-4254-8705-8df50fb634ac" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/nm-applet/eap/58d7508f-92af-41ed-b65c-93df46691d25" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/nm-applet/eap/5e8a9ed8-7c59-441f-b24b-3e160efd9cb2" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/nm-applet/eap/6faf713e-3beb-4007-9425-b8c27ae45964" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/nm-applet/eap/8839c915-0c51-43ae-997b-989b909da7d7" = {
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

    "org/gnome/nm-applet/eap/ad453173-aa75-4e1e-9c36-d89a4026d3d9" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/nm-applet/eap/c85ecdd8-8872-4088-b433-a5ed8c988715" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/nm-applet/eap/ce3a6cd1-5c26-4bed-a6a6-770dca3d4e8b" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/nm-applet/eap/da912750-7759-4323-8675-d3e3fbc2717c" = {
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

    "org/gnome/portal/filechooser/com/google/Chrome" = {
      last-folder-path = "/home/willian/Downloads";
    };

    "org/gnome/portal/filechooser/com/valvesoftware/Steam" = {
      last-folder-path = "/home/willian/Downloads";
    };

    "org/gnome/portal/filechooser/discord" = {
      last-folder-path = "/home/willian/Downloads";
    };

    "org/gnome/portal/filechooser/gnome-network-panel" = {
      last-folder-path = "/home/willian/Documents/vpn/ovpn_udp";
    };

    "org/gnome/portal/filechooser/google-chrome" = {
      last-folder-path = "/home/willian/Pictures/Screenshots";
    };

    "org/gnome/portal/filechooser/steam" = {
      last-folder-path = "/home/willian/.my-nix-os/users/willian/desktop-entries/battle-net";
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-schedule-automatic = false;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      idle-dim = false;
      power-button-action = "suspend";
      sleep-inactive-ac-type = "nothing";
      sleep-inactive-battery-type = "suspend";
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      disabled-extensions = [ "apps-menu@gnome-shell-extensions.gcampax.github.com" ];
      enabled-extensions = [ "places-menu@gnome-shell-extensions.gcampax.github.com" "gsconnect@andyholmes.github.io" "appindicatorsupport@rgcjonas.gmail.com" "Vitals@CoreCoding.com" ];
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

    "org/gnome/shell/extensions/vitals" = {
      alphabetize = true;
      fixed-widths = true;
      hide-icons = false;
      hide-zeros = false;
      hot-sensors = [ "_memory_usage_" "_temperature_k10temp_tccd1_" "_temperature_amdgpu_edge_" ];
      memory-measurement = 1;
      show-battery = false;
      show-fan = true;
      show-memory = true;
      show-network = true;
      show-processor = true;
      show-storage = true;
      show-system = true;
      show-temperature = true;
      show-voltage = true;
    };

    "org/gnome/shell/weather" = {
      automatic-location = true;
      locations = "@av []";
    };

    "org/gnome/shell/world-clocks" = {
      locations = [];
    };

    "org/gnome/simple-scan" = {
      document-type = "photo";
    };

    "org/gnome/software" = {
      check-timestamp = mkInt64 1741499178;
      first-run = false;
      flatpak-purge-timestamp = mkInt64 1741484718;
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
      show-hidden = true;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 169;
      sort-column = "modified";
      sort-directories-first = false;
      sort-order = "descending";
      type-format = "category";
      view-type = "list";
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
      window-position = mkTuple [ 26 23 ];
      window-size = mkTuple [ 1297 902 ];
    };

    "org/virt-manager/virt-manager" = {
      manager-window-height = 550;
      manager-window-width = 550;
    };

    "org/virt-manager/virt-manager/confirm" = {
      delete-storage = true;
      forcepoweroff = true;
      unapplied-dev = true;
    };

    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };

    "org/virt-manager/virt-manager/conns/qemu:system" = {
      window-size = mkTuple [ 800 600 ];
    };

    "org/virt-manager/virt-manager/details" = {
      show-toolbar = true;
    };

    "org/virt-manager/virt-manager/new-vm" = {
      graphics-type = "system";
    };

    "org/virt-manager/virt-manager/paths" = {
      media-default = "/home/willian/Downloads";
    };

    "org/virt-manager/virt-manager/urls" = {
      isos = [ "/home/willian/Downloads/Win11_22H2_EnglishInternational_x64v1.iso" "/home/willian/Downloads/Win10_22H2_EnglishInternational_x64.iso" ];
    };

    "org/virt-manager/virt-manager/vmlist-fields" = {
      disk-usage = false;
      network-traffic = false;
    };

    "org/virt-manager/virt-manager/vms/2e45c01e620f4141bf0d219d2480059b" = {
      autoconnect = 1;
      scaling = 1;
      vm-window-size = mkTuple [ 1920 1011 ];
    };

    "org/virt-manager/virt-manager/vms/52ec43d72f9e4dd681d233fc14217670" = {
      autoconnect = 1;
      scaling = 1;
      vm-window-size = mkTuple [ 1024 810 ];
    };

    "org/virt-manager/virt-manager/vms/67ba5ea088d248d68a69e16c3f9fc756" = {
      autoconnect = 1;
      scaling = 1;
      vm-window-size = mkTuple [ 1024 810 ];
    };

    "org/virt-manager/virt-manager/vms/7fe8cb91e9564d5eb6abde46ba5b172d" = {
      autoconnect = 1;
      scaling = 1;
      vm-window-size = mkTuple [ 1024 810 ];
    };

    "org/virt-manager/virt-manager/vms/87c20d2a14b04cdb92b81794322a314f" = {
      autoconnect = 1;
      scaling = 1;
      vm-window-size = mkTuple [ 1280 832 ];
    };

    "org/virt-manager/virt-manager/vms/8a9dcf7ade8f4dbaa4418d2fd2c9c86b" = {
      autoconnect = 1;
      scaling = 1;
      vm-window-size = mkTuple [ 1024 810 ];
    };

    "org/virt-manager/virt-manager/vms/9932b5717ebc4272b1777431590b603e" = {
      autoconnect = 1;
      scaling = 1;
      vm-window-size = mkTuple [ 1024 810 ];
    };

    "org/virt-manager/virt-manager/vms/ab777428be654ab18da434b1eb987752" = {
      autoconnect = 1;
      scaling = 1;
      vm-window-size = mkTuple [ 1920 1048 ];
    };

    "org/virt-manager/virt-manager/vms/cd3f542e657e4f688386f9879d5487a0" = {
      autoconnect = 1;
      scaling = 1;
      vm-window-size = mkTuple [ 1024 810 ];
    };

    "org/virt-manager/virt-manager/vms/ecdfbde0be97459ab68340cc0aa7a610" = {
      autoconnect = 1;
      scaling = 1;
      vm-window-size = mkTuple [ 1024 810 ];
    };

    "org/virt-manager/virt-manager/vms/ece66a30625c4a6d819e7cd87303f382" = {
      autoconnect = 1;
      scaling = 1;
      vm-window-size = mkTuple [ 1294 877 ];
    };

    "org/virt-manager/virt-manager/vms/efedc761765c44c88d5c7f0d84b32536" = {
      autoconnect = 1;
      scaling = 1;
      vm-window-size = mkTuple [ 1024 810 ];
    };

    "org/virt-manager/virt-manager/vms/fa118b3268294bf2b2d81d097fc67346" = {
      autoconnect = 1;
      scaling = 1;
      vm-window-size = mkTuple [ 1024 810 ];
    };

    "org/virt-manager/virt-manager/vms/ff5faae28ddd4d259fe8f153027c7714" = {
      autoconnect = 1;
      scaling = 1;
      vm-window-size = mkTuple [ 1024 810 ];
    };

    "system/proxy" = {
      mode = "none";
    };

  };
}