{ pkgs, ... }:
{
  home = {
    packages = (with pkgs; [
      anytype
      bruno
      # catppuccin-kde
      clinfo
      code-cursor
      colloid-icon-theme
      crow-translate
      cryfs
      # dbeaver-bin
      dbgate
      devenv
      # drawio
      # easyeffects
      # ffmpeg
      ffmpeg_7-full
      gcc
      glxinfo
      # gnome.gnome-keyring
      ghostscript
      # google-chrome
      haruna
      jre
      libdbusmenu
      libreoffice-qt6-fresh
      libva-utils
      # megasync
      neovim
      nil
      nixpkgs-fmt
      nodejs_latest
      onlyoffice-bin_latest
      p7zip
      papirus-icon-theme
      # postman
      sqlite
      tela-icon-theme
      telegram-desktop
      tlrc
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
      # kget
      # ktorrent
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
