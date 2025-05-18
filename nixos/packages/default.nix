{ lib, pkgs, ... }:
{
  environment.systemPackages =
    (with pkgs; [
      # adw-gtk3
      # adwaita-icon-theme
      # anytype
      aspell
      # bibata-cursors
      # brave
      bruno
      # capitaine-cursors-themed
      # catppuccin-kde
      catppuccin-sddm
      # celluloid
      clinfo
      cpu-x
      # code-cursor
      # colloid-icon-theme
      crow-translate
      cryfs
      dav1d
      # dbeaver-bin
      dbgate
      # ddcutil
      devenv
      # drawio
      easyeffects
      # endeavour
      ffmpeg-full
      # floorp
      # gcc
      # ghostty
      # gimp
      glxinfo
      # gnome.gnome-keyring
      # gnome-tweaks
      ghostscript
      # google-chrome
      # gruvbox-plus-icons
      haruna
      hunspell
      # inkscape
      # jre
      kdiskmark
      # keypunch
      libdbusmenu
      libde265
      # libreoffice-fresh
      libreoffice-qt6-fresh
      libva-utils
      # kde-gruvbox
      # megasync
      neovim
      # nil
      # nixd
      # nixfmt-rfc-style
      # nixpkgs-fmt
      # nodejs_latest
      nvme-cli
      onlyoffice-bin_latest
      openssl
      p7zip
      # papirus-icon-theme
      # peazip
      # postman
      sbctl
      # sirikali
      smartmontools
      # smile
      sqlite
      svt-av1
      # tela-icon-theme
      telegram-desktop
      # tlrc
      # thunderbird
      # ungoogled-chromium
      unzip
      unrar
      vscode-fhs
      vulkan-tools
      wget
      wl-clipboard
      x265
      zed-editor_git
    ])
    ++ (with pkgs.gst_all_1; [
      gstreamer
      gst-libav
      gst-plugins-bad
      gst-plugins-base
      gst-plugins-good
      gst-plugins-ugly
      gst-vaapi
    ])
    ++ (with pkgs.kdePackages; [
      juk
      kclock
      kdenlive
      kdeplasma-addons
      kget
      ktorrent
      qtwebengine
      qtmultimedia
      falkon
      kaccounts-providers
      kaccounts-integration
      kio-extras
      kio-gdrive
      kdepim-addons
      signond
      krdc
      # plasma-vault
      kleopatra
      plasma-browser-integration
      filelight
      sonnet
    ])
    ++ (with pkgs.gnomeExtensions; [
      # appindicator
      # blur-my-shell
      # caffeine
      # clipboard-indicator
      # notification-counter
      # just-perfection
      # # smile-complementary-extension
      # top-panel-notification-icons-revived
      # emoji-copy
      # alphabetical-app-grid
      # vitals
      # app-menu-is-back
      # brightness-control-using-ddcutil
      # # easyeffects-preset-selector
      # # pop-shell
      # # ...
    ])
    ++ (with pkgs.hunspellDicts; [
      en_US-large
      id_ID
    ])
    ++ (with pkgs.aspellDicts; [
      en
      id
    ])
    ++ [
      (lib.hiPrio pkgs.uutils-coreutils-noprefix)
    ];
}
