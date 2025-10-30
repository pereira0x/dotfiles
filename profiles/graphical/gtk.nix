{ pkgs, ... }: {
  gtk = {
    enable = true;

    theme = {
      package = pkgs.nordic;
      name = "Nordic-darker";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
  };
}
