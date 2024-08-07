{ pkgs, ... }:
{
  home = {
    packages = (with pkgs; [
      anytype
      bruno
      # catppuccin-kde
      clinfo
      crow-translate
      cryfs
      # dbeaver-bin
      dbgate
      devenv
      # drawio
      # easyeffects
      ffmpeg
      gcc
      glxinfo
      # gnome.gnome-keyring
      ghostscript
      google-chrome
      haruna
      libdbusmenu
      # libreoffice-qt6-fresh
      libva-utils
      megasync
      neovim
      nodejs_latest
      onlyoffice-bin_latest
      p7zip
      papirus-icon-theme
      # postman
      ripgrep
      sqlite
      # tela-icon-theme
      telegram-desktop
      thunderbird
      # ungoogled-chromium
      unzip
      vscode-fhs
      vulkan-tools
      wget
      wl-clipboard
      # zed-editor
    ]) ++ (with pkgs.gst_all_1; [
      gstreamer
      gst-plugins-bad
      gst-plugins-good
      gst-plugins-ugly
      gst-vaapi
    ]) ++ (with pkgs.kdePackages; [
      juk
      kclock
      kdenlive
      kdeplasma-addons
      # akonadi
      # akonadi-calendar-tools
      # akonadi-import-wizard
      # akonadiconsole
      # kdepim-addons
      # kdepim-runtime
      # libkdepim
      # kmail
      # kmailtransport
      # kmail-account-wizard
      qtwebengine
    ]);
  };
}
