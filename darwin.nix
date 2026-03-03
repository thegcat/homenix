{pkgs, ...}: {
  environment.systemPackages = [];

  nix = {
    settings.experimental-features = "nix-command flakes";
    gc.automatic = true;
    optimise.automatic = true;
  };

  nixpkgs.hostPlatform = "aarch64-darwin";

  users.knownUsers = [ "thegcat" ];

  users.users.thegcat = {
    name = "thegcat";
    home = "/Users/thegcat";
    uid = 501;
    shell = pkgs.fish;
  };

  programs.fish.enable = true;

  system = {
    stateVersion = 6;
    primaryUser = "thegcat";
    defaults.CustomUserPreferences = {
      NSGlobalDomain = {
        "com.apple.trackpad.scaling" = 2;
        AppleShowAllExtensions = true;
        AppleKeyboardUiMode = 3;
        NSDocumentSaveNewDocumentsToCloud = false;
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;
        PMPrintingExpandedStateForPrint = true;
      };
      "com.apple.AdLib" = {
        allowIdentifierForAdvertising = false;
        allowApplePersonalizedAdvertising = false;
        forceLimitAdTracking = true;
      };
      "com.apple.AppleMultitouchTrackpad" = {
        Clicking = true;
      };
      "com.apple.assistant.support" = {
        "Siri Data Sharing Opt-In Status" = 2;
      };
      "com.apple.Safari" = {
        EnableNarrowTabs = false;
        FindOnPageMatchesWordStartsOnly = false;
        IncludeDevelopMenu = true;
        ShowFullURLInSmartSearchField = true;
        ShowOverlayStatusBar = true;
        WebKitTabToLinksPreferenceKey = true;
        WebKitDeveloperExtrasEnabledPreferenceKey = true;
        "WebKitPreferences.tabFocusesLinks" = true;
        "WebKitPreferences.privateClickMeasurementEnabled" = false;
        "WebKitPreferences.developerExtrasEnabled" = true;
      };
      "com.apple.desktopservices" = {
        DSDontWriteNetworkStores = true;
        DSDontWriteUSBStores = true;
      };
      "com.apple.dock" = {
        appswitcher-all-displays = true;
        autohide = true;
        autohide-delay = 0;
        autohide-time-modifier = 0.5;
        autohide-fullscreen-delayed = false;
        orientation = "right";
        persistent-apps = "[]";
        tilesize = 60;
        showhidden = true;
        expose-animation-duration = 0.1;
        expose-group-by-app = true;
      };
      "com.apple.finder" = {
        FXPreferredViewStyle = "Nlsv";
        CreateDesktop = false;
        NewWindowTarget = "PfHm";
      };
      "com.apple.mail" = {
        DisableInlineAttachmentViewing = true;
        AddressesIncludeNameOnPasteboard = false;
      };
      "com.apple.screencapture" = {
        location = "/Users/thegcat/Downloads";
      };
      "com.apple.screensaver" = {
        askForPassword = 1;
        askForPasswordDelay = 0;
      };
      "com.apple.SoftwareUpdate" = {
        ScheduleFrequency = 1;
      };
    };

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  homebrew = {
    enable = true;

    global = {
      autoUpdate = false;
    };

    taps = [
      "homebrew/services"
    ];

    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };

    brews = [
      "gd"
      "libyaml"
      "mysql@5.7"
      "rbenv/tap/openssl@1.0"
      "rbenv/tap/openssl@1.1"
    ];

    casks = [
      "airbuddy"
      "discord"
      "element"
      "elgato-stream-deck"
      "firefox"
      "ghostty"
      "glance-chamburr"
      "gpg-suite-no-mail"
      "grandperspective"
      "iina"
      "jetbrains-toolbox"
      "jitsi-meet"
      "keyboard-cleaner"
      "libreoffice"
      "little-snitch"
      "loop"
      "maccy"
      "netnewswire"
      "nextcloud"
      "onyx"
      "pgadmin4"
      "qlvideo"
      "rocket-chat"
      "secretive"
      "sequel-ace"
      "signal"
      "soundanchor"
      "soundsource"
      "syntax-highlight"
      "tableplus"
      "temurin"
      "textual"
      "thaw"
      "tunnelblick"
    ];

    masApps = {
      "1Blocker - Ad Blocker" = 1365531024;
      "Baking Soda - Tube Cleaner" = 1601151613;
      "Broadcasts" = 1469995354;
      "DWD WarnWetter" = 986420993;
      "Endurance: CPU Stress Test" = 1590043284;
      "ICE Buddy for your Menu Bar" = 1595947689;
      "Ivory for Mastodon by Tapbots" = 6444602274;
      "Refined GitHub" = 1519867270;
      "Strongbox Pro" = 1481853033;
      "Television Time" = 969714962;
      "TestFlight" = 899247664;
      "Vinegar - Tube Cleaner" = 1591303229;
      "WhatsApp Messenger" = 310633997;
      "WireGuard" = 1451685025;
    };
  };

}
