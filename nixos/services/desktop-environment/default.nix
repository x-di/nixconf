{ pkgs, ... }:
{
  # KDE
  services = {
    displayManager = {
      sddm = {
        enable = true;
        # theme = "catppuccin-mocha";
        wayland = {
          enable = true;
          compositor = "kwin";
        };
      };
    };
    desktopManager = {
      plasma6 = {
        enable = true;
        enableQt5Integration = false;
      };
    };
  };
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    # plasma-browser-integration
    # konsole
    kate
    oxygen
    elisa
  ];

  # GNOME
  # services.displayManager.gdm.enable = true;
  # services.desktopManager.gnome.enable = true;
  # environment.gnome.excludePackages = with pkgs; [
  #   cheese
  #   gedit
  #   simple-scan
  #   yelp
  #   gnome-contacts
  #   gnome-maps
  #   gnome-text-editor
  #   gnome-tour
  #   gnome-connections
  #   # gnome-music
  #   epiphany # web browser
  #   # totem
  #   # geary # email reader. Up to 24.05. Starting from 24.11 the package name is just geary.
  #   # evince # document viewer
  # ];

  # qt = {
  #   enable = true;
  #   platformTheme = "gnome";
  #   style = "adwaita-dark";
  # };
}
