{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      clinfo
      drawio
      fastfetch
      glxinfo
      gnome.gnome-keyring
      gst_all_1.gstreamer
      gst_all_1.gst-plugins-bad
      gst_all_1.gst-plugins-good
      gst_all_1.gst-plugins-ugly
      gst_all_1.gst-vaapi
      haruna
      kdePackages.kdeplasma-addons
      libdbusmenu
      libva-utils
      onlyoffice-bin_latest
      p7zip
      postman
      sqlite
      tela-icon-theme
      telegram-desktop
      thunderbird
      vscode-fhs
      vulkan-tools
    ];
  };
}
