{ lib, pkgs, ... }:
{
  environment.systemPackages =
    (with pkgs; [
      # adw-gtk3
      # adwaita-icon-theme
      android-tools
      # anytype
      # aspell
      # bibata-cursors
      brave
      bruno
      # capitaine-cursors-themed
      # catppuccin-sddm.override
      # {
      #   flavor = "mocha";
      #   font = "Noto Sans";
      #   fontSize = "11";
      # }
      # celluloid
      clinfo
      # cpu-x
      # code-cursor
      # colloid-icon-theme
      crow-translate
      cryfs
      # dav1d
      # dbeaver-bin
      dbgate
      # ddcutil
      devenv
      # dialect
      # drawio
      # easyeffects
      # endeavour
      # errands
      ffmpeg-full
      # floorp-bin
      # gcc
      # ghostty
      # gimp
      # glxinfo # mesa-demos
      # gnome.gnome-keyring
      # gnome-solanum
      # gnome-tweaks
      ghostscript
      gocryptfs
      # google-chrome
      # gruvbox-plus-icons
      haruna
      # hunspell
      # inkscape
      jamesdsp
      # jre
      # kdiskmark
      # keypunch
      libdbusmenu
      # libde265
      # libreoffice-fresh
      libreoffice-qt6-fresh
      librewolf
      libva-utils
      # kde-gruvbox
      # megasync
      mesa-demos
      neovim
      # nil
      # nixd
      # nixfmt-rfc-style
      # nixpkgs-fmt
      # nodejs_latest
      nvme-cli
      nvtopPackages.intel
      onlyoffice-desktopeditors
      openssl
      p7zip
      # papirus-icon-theme
      # peazip
      # postman
      sbctl
      # scrcpy
      qtscrcpy
      sirikali
      smartmontools
      # smile
      sqlite
      # svt-av1
      # tela-icon-theme
      telegram-desktop
      # tlrc
      # thunderbird
      # ungoogled-chromium
      universal-android-debloater
      unzip
      unrar
      # varia
      vscode-fhs
      vulkan-tools
      wget
      wl-clipboard
      # x265
      zed-editor-fhs
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
      # kdenlive
      kdeplasma-addons
      # kget
      # ktorrent
      qtwebengine
      qtmultimedia
      # falkon
      # kaccounts-providers
      # kaccounts-integration
      # kio-extras
      # kio-gdrive
      # kdepim-addons
      # signond
      krdc
      # # plasma-vault
      # kleopatra
      plasma-browser-integration
      # filelight
      # sonnet
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
      # # thinkpad-battery-threshold
      # battery-health-charging
      # # no-titlebar-when-maximized
      # # easyeffects-preset-selector
      # # pop-shell
      # # # ...
    ])
    ++ (with pkgs.hunspellDicts; [
      # en_US-large
      # id_ID
    ])
    ++ (with pkgs.aspellDicts; [
      # en
      # id
    ])
    ++ [
      (lib.hiPrio pkgs.uutils-coreutils-noprefix)
    ]
    ++ [
      # (pkgs.catppuccin-kde.override {
      #   flavour = [ "mocha" ];
      #   accents = [ "rosewater" ];
      #   winDecStyles = [ "classic" ];
      # })
    ];
}
