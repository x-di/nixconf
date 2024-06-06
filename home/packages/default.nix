{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      clinfo
      dbeaver-bin
      drawio
      easyeffects
      fastfetch
      ffmpeg
      glxinfo
      gnome.gnome-keyring
      gst_all_1.gstreamer
      gst_all_1.gst-plugins-bad
      gst_all_1.gst-plugins-good
      gst_all_1.gst-plugins-ugly
      gst_all_1.gst-vaapi
      haruna
      kdePackages.kdenlive
      kdePackages.kdeplasma-addons
      libdbusmenu
      libreoffice-qt6-fresh
      libva-utils
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
