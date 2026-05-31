{
  pkgs,
  config,
  inputs,
  ...
}:
let
  global = import ../../../../global.nix;
in
{

  programs.dank-material-shell = {
    systemd = {
      enable = true;
      restartIfChanged = true;
    };
    niri = {
      enableKeybinds = true; # Automatic keybinding configuration
      #enableSpawn = true; # Auto-start DMS with niri
    };
    quickshell = {
      package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default;
    };
    enable = true;
    enableSystemMonitoring = true; # System monitoring widgets (dgop)
    #enableClipboard = true; # Clipboard history manager
    enableVPN = true; # VPN management widget
    #enableBrightnessControl = true; # Backlight/brightness controls
    #enableColorPicker = true; # Color picker tool
    enableDynamicTheming = true; # Wallpaper-based theming (matugen)
    enableAudioWavelength = true; # Audio visualizer (cava)
    enableCalendarEvents = true; # Calendar integration (khal)
    #enableSystemSound = true; # System sound effects

    session = {
      isLightMode = false;
      doNotDisturb = false;
      doNotDisturbUntil = 0;
      terminalOverride = "";

      wallpaperPath = "/home/${global.username}/Pictures/Wallpapers/Desert-With-Mountains-Moon.jpg";

      perMonitorWallpaper = false;
      monitorWallpapers = { };

      perModeWallpaper = false;
      wallpaperPathLight = "";
      wallpaperPathDark = "";

      monitorWallpapersLight = { };
      monitorWallpapersDark = { };
      monitorWallpaperFillModes = { };

      wallpaperTransition = "fade";

      includedTransitions = [
        "fade"
        "wipe"
        "disc"
        "stripes"
        "iris bloom"
        "pixelate"
        "portal"
      ];

      wallpaperCyclingEnabled = true;
      wallpaperCyclingMode = "interval";
      wallpaperCyclingInterval = 300;
      wallpaperCyclingTime = "06:00";

      monitorCyclingSettings = { };

      nightModeEnabled = false;
      nightModeTemperature = 4500;
      nightModeHighTemperature = 6500;

      nightModeAutoEnabled = false;
      nightModeAutoMode = "time";

      nightModeStartHour = 18;
      nightModeStartMinute = 0;
      nightModeEndHour = 6;
      nightModeEndMinute = 0;

      latitude = 0;
      longitude = 0;

      nightModeUseIPLocation = false;
      nightModeLocationProvider = "";

      themeModeAutoEnabled = false;
      themeModeAutoMode = "time";

      themeModeStartHour = 18;
      themeModeStartMinute = 0;
      themeModeEndHour = 6;
      themeModeEndMinute = 0;

      themeModeShareGammaSettings = true;

      weatherLocation = "New York, NY";
      weatherCoordinates = "40.7128,-74.0060";

      pinnedApps = [ ];
      barPinnedApps = [ ];

      dockLauncherPosition = 0;

      hiddenTrayIds = [ ];
      trayItemOrder = [ ];
      recentColors = [ ];

      showThirdPartyPlugins = false;

      launchPrefix = "";

      lastBrightnessDevice = "";

      brightnessExponentialDevices = { };
      brightnessUserSetValues = { };
      brightnessExponentValues = { };

      selectedGpuIndex = 0;
      nvidiaGpuTempEnabled = false;
      nonNvidiaGpuTempEnabled = false;

      enabledGpuPciIds = [ ];

      wifiDeviceOverride = "";

      weatherHourlyDetailed = true;

      hiddenApps = [ ];
      appOverrides = { };

      searchAppActions = true;

      vpnLastConnected = "";
      lastPlayerIdentity = "";

      deviceMaxVolumes = { };

      hiddenOutputDeviceNames = [ ];
      hiddenInputDeviceNames = [ ];

      locale = "";
      timeLocale = "";

      launcherLastMode = "all";
      launcherLastFileSearchType = "all";
      launcherLastQuery = "sett";

      launcherQueryHistory = [
        "sett"
        "ope"
        "zed"
        "sw"
        "dol"
        "blue"
      ];

      appDrawerLastMode = "apps";
      niriOverviewLastMode = "apps";

      settingsSidebarExpandedIds = ",";
      settingsSidebarCollapsedIds = ",";

      configVersion = 3;
    };

    settings = {
      #currentThemeName = "dynamic";
      #customThemeFile = "";
      matugenScheme = "scheme-tonal-spot";
      runUserMatugenTemplates = true;
      matugenTargetMonitor = "";
      dankBarTransparency = 1;
      dankBarWidgetTransparency = 1;
      #popupTransparency = 1;
      #dockTransparency = 1;
      widgetBackgroundColor = "sch";
      cornerRadius = 14;
      use24HourClock = true;
      showSeconds = false;
      useFahrenheit = false;
      nightModeEnabled = false;
      animationSpeed = 1;
      customAnimationDuration = 500;
      blurredWallpaperLayer = false;
      blurWallpaperOnOverview = false;
      showLauncherButton = true;
      showWorkspaceSwitcher = true;
      showFocusedWindow = true;
      showWeather = true;
      showMusic = true;
      showClipboard = true;
      showCpuUsage = true;
      showMemUsage = true;
      showCpuTemp = true;
      showGpuTemp = true;
      selectedGpuIndex = 0;
      enabledGpuPciIds = [ ];
      showSystemTray = true;
      showClock = true;
      showNotificationButton = true;
      showBattery = true;
      showControlCenterButton = true;
      showCapsLockIndicator = true;
      controlCenterShowNetworkIcon = true;
      controlCenterShowBluetoothIcon = true;
      controlCenterShowAudioIcon = true;
      showPrivacyButton = true;
      privacyShowMicIcon = false;
      privacyShowCameraIcon = false;
      privacyShowScreenShareIcon = false;
      controlCenterWidgets = [
        {
          id = "volumeSlider";
          enabled = true;
          width = 50;
        }
        {
          id = "brightnessSlider";
          enabled = true;
          width = 50;
        }
        {
          id = "wifi";
          enabled = true;
          width = 50;
        }
        {
          id = "bluetooth";
          enabled = true;
          width = 50;
        }
        {
          id = "audioOutput";
          enabled = true;
          width = 50;
        }
        {
          id = "audioInput";
          enabled = true;
          width = 50;
        }
        {
          id = "nightMode";
          enabled = true;
          width = 50;
        }
        {
          id = "darkMode";
          enabled = true;
          width = 50;
        }
      ];
      showWorkspaceIndex = false;
      showWorkspacePadding = false;
      workspaceScrolling = false;
      showWorkspaceApps = false;
      maxWorkspaceIcons = 3;
      workspacesPerMonitor = true;
      dwlShowAllTags = false;
      workspaceNameIcons = { };
      waveProgressEnabled = true;
      clockCompactMode = false;
      focusedWindowCompactMode = false;
      runningAppsCompactMode = true;
      keyboardLayoutNameCompactMode = false;
      runningAppsCurrentWorkspace = false;
      runningAppsGroupByApp = false;
      clockDateFormat = "";
      lockDateFormat = "";
      mediaSize = 1;
      dankBarLeftWidgets = [
        "launcherButton"
        "workspaceSwitcher"
        "focusedWindow"
      ];
      dankBarCenterWidgets = [
        "music"
        "clock"
        "weather"
      ];
      dankBarRightWidgets = [
        "systemTray"
        "clipboard"
        #"cpuUsage"
        "cpuTemp"
        #"gpuTemp"
        #"memUsage"
        "notificationButton"
        "controlCenterButton"
      ];
      dankBarWidgetOrder = [ ];
      appLauncherViewMode = "list";
      spotlightModalViewMode = "list";
      sortAppsAlphabetically = false;
      appLauncherGridColumns = 4;
      weatherLocation = "Barcelona, ES";
      weatherCoordinates = "41.412753, 2.167843";
      useAutoLocation = true;
      weatherEnabled = true;
      networkPreference = "ethernet";
      vpnLastConnected = "";
      iconTheme = "System Default";
      launcherLogoMode = "apps";
      launcherLogoCustomPath = "";
      launcherLogoColorOverride = "";
      launcherLogoColorInvertOnMode = false;
      launcherLogoBrightness = 0.5;
      launcherLogoContrast = 1;
      launcherLogoSizeOffset = 0;
      fontFamily = "DejaVu Sans";
      monoFontFamily = "DejaVu Sans Mono";
      fontWeight = 400;
      fontScale = 1;
      dankBarFontScale = 1;
      notepadUseMonospace = true;
      notepadFontFamily = "";
      notepadFontSize = 14;
      notepadShowLineNumbers = false;
      notepadTransparencyOverride = -1;
      notepadLastCustomTransparency = 0.7;
      soundsEnabled = true;
      useSystemSoundTheme = false;
      soundNewNotification = true;
      soundVolumeChanged = true;
      soundPluggedIn = true;
      acMonitorTimeout = 3600;
      acLockTimeout = 1800;
      acSuspendTimeout = 0;
      acSuspendBehavior = 0;
      batteryMonitorTimeout = 0;
      batteryLockTimeout = 0;
      batterySuspendTimeout = 0;
      batterySuspendBehavior = 0;
      lockBeforeSuspend = true;
      preventIdleForMedia = false;
      loginctlLockIntegration = true;
      launchPrefix = "";
      brightnessDevicePins = { };
      wifiNetworkPins = { };
      bluetoothDevicePins = { };
      audioInputDevicePins = { };
      audioOutputDevicePins = { };
      gtkThemingEnabled = false;
      qtThemingEnabled = false;
      syncModeWithPortal = true;
      terminalsAlwaysDark = false;
      showDock = false;
      dockAutoHide = false;
      dockGroupByApp = false;
      dockOpenOnOverview = false;
      dockPosition = 1;
      dockSpacing = 4;
      dockBottomGap = 0;
      dockMargin = 0;
      dockIconSize = 40;
      dockIndicatorStyle = "circle";
      notificationOverlayEnabled = false;
      dankBarAutoHide = false;
      dankBarAutoHideDelay = 250;
      dankBarOpenOnOverview = false;
      dankBarVisible = true;
      dankBarSpacing = 4;
      dankBarBottomGap = -1;
      dankBarInnerPadding = 16;
      dankBarPosition = 2;
      dankBarSquareCorners = false;
      dankBarNoBackground = false;
      dankBarGothCornersEnabled = false;
      dankBarGothCornerRadiusOverride = false;
      dankBarGothCornerRadiusValue = 12;
      dankBarBorderEnabled = false;
      dankBarBorderColor = "surfaceText";
      dankBarBorderOpacity = 1;
      dankBarBorderThickness = 1;
      popupGapsAuto = true;
      popupGapsManual = 4;
      modalDarkenBackground = true;
      lockScreenShowPowerActions = true;
      enableFprint = false;
      maxFprintTries = 3;
      hideBrightnessSlider = false;
      notificationTimeoutLow = 5000;
      notificationTimeoutNormal = 5000;
      notificationTimeoutCritical = 0;
      notificationPopupPosition = 0;
      osdAlwaysShowValue = false;
      osdPosition = 5;
      osdVolumeEnabled = true;
      osdBrightnessEnabled = true;
      osdIdleInhibitorEnabled = true;
      osdMicMuteEnabled = true;
      osdCapsLockEnabled = true;
      osdPowerProfileEnabled = true;
      powerActionConfirm = true;
      powerMenuActions = [
        "reboot"
        "logout"
        "poweroff"
        "lock"
        "suspend"
        "restart"
      ];
      powerMenuDefaultAction = "logout";
      powerMenuGridLayout = false;
      customPowerActionLock = "";
      customPowerActionLogout = "";
      customPowerActionSuspend = "";
      customPowerActionHibernate = "";
      customPowerActionReboot = "";
      customPowerActionPowerOff = "";
      updaterUseCustomCommand = false;
      updaterCustomCommand = "";
      updaterTerminalAdditionalParams = "";
      displayNameMode = "system";
      screenPreferences = { };
      showOnLastDisplay = { };
      configVersion = 1;
    };
  };
}
