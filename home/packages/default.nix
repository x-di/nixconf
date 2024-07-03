{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      # catppuccin-kde
      clinfo
      cryfs
      dbeaver-bin
      # drawio
      easyeffects
      ffmpeg
      gcc
      glxinfo
      # gnome.gnome-keyring
      ghostscript
      gst_all_1.gstreamer
      gst_all_1.gst-plugins-bad
      gst_all_1.gst-plugins-good
      gst_all_1.gst-plugins-ugly
      gst_all_1.gst-vaapi
      haruna
      kdePackages.juk
      kdePackages.kdenlive
      kdePackages.kdeplasma-addons
      libdbusmenu
      libreoffice-qt6-fresh
      libva-utils
      p7zip
      papirus-icon-theme
      postman
      ripgrep
      sqlite
      # tela-icon-theme
      telegram-desktop
      thunderbird
      ungoogled-chromium
      unzip
      vscode-fhs
      vulkan-tools
      wget
      wl-clipboard
    ];
  };
}
