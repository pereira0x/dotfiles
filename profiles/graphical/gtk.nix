{ pkgs, ... }: {
  gtk = {
    enable = true;

    theme = {
      package = pkgs.nordic;
      name = "Nordic-darker";
    };

    iconTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita";
    };
  };
}
