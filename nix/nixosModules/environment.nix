# Environment configuration
{ pkgs, lib, ... }:
{
  environment = {
    sessionVariables = {
      # COSMIC_DATA_CONTROL_ENABLED = 1;
      NIXOS_OZONE_WL = "1";
      # MESA_VK_DEVICE_SELECT = "1002:6900";
      GTK_USE_PORTAL = "1";
      MOZ_USE_XINPUT2 = "1";
      LIBVA_DRIVER_NAME = "iHD";
      GST_PLUGIN_PATH = "/run/current-system/sw/lib/gstreamer-1.0/";
      # niri
      XDG_CURRENT_DESKTOP = "niri";
      QT_QPA_PLATFORM = "wayland";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
      QT_QPA_PLATFORMTHEME = "gtk3";
      QT_QPA_PLATFORMTHEME_QT6 = "gtk3";
    };
    # etc."chromium/native-messaging-hosts/org.kde.plasma.browser_integration.json".source =
    #   "${pkgs.kdePackages.plasma-browser-integration}/etc/chromium/native-messaging-hosts/org.kde.plasma.browser_integration.json";
    # memoryAllocator.provider = "scudo";
  };
}
