{ pkgs, ... }:
{
  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      # MESA_VK_DEVICE_SELECT = "1002:6900";
      GTK_USE_PORTAL = "1";
      MOZ_USE_XINPUT2 = "1";
      LIBVA_DRIVER_NAME = "iHD";
    };
    etc."chromium/native-messaging-hosts/org.kde.plasma.browser_integration.json".source =
      "${pkgs.kdePackages.plasma-browser-integration}/etc/chromium/native-messaging-hosts/org.kde.plasma.browser_integration.json";
  };
}
