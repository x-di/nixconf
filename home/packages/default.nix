{ pkgs, ... }:
{
  home = {
    packages = (with pkgs; [
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
      haruna
      libdbusmenu
      libreoffice-qt6-fresh
      libva-utils
      megasync
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
    ]) ++ (with pkgs.gst_all_1; [
      gstreamer
      gst-plugins-bad
      gst-plugins-good
      gst-plugins-ugly
      gst-vaapi
    ]) ++ (with pkgs.kdePackages; [
      juk
      kdenlive
      kdeplasma-addons
    ]);
  };
}
