{ config, lib, ... }:

# Too see all available options:
# https://github.com/flameshot-org/flameshot/blob/master/flameshot.example.ini

{
  services.flameshot = {
    enable = true;

    settings = {
      General = {
        savePath = "${config.home.homeDirectory}/Pictures";

        savePathFixed = true;

        uiColor = "#001fcf";

        showHelp = true;

        showDesktopNotification = true;

        filenamePattern = "%y-%m-%d_%H-%M-%S";

        disabledTrayIcon = true;

        autoCloseIdleDaemon = true;

        startupLaunch = false;

        contrastOpacity = 100;

        predefinedColorPaletteLarge = true;

        saveAfterCopy = false;
      };

      Shortcuts = {
        TYPE_PENCIL = "W";
        TYPE_PIN = "P";
      };
    };
  };
}
