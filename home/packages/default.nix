{ pkgs, ... }:
{
  home = {
    packages =
      (with pkgs; [
        adwaita-icon-theme
        anytype
        bruno
        # capitaine-cursors-themed
        # catppuccin-kde
        celluloid
        clinfo
        # code-cursor
        # colloid-icon-theme
        # crow-translate
        # cryfs
        # dbeaver-bin
        dbgate
        devenv
        # drawio
        easyeffects
        endeavour
        ffmpeg
        gcc
        glxinfo
        # gnome.gnome-keyring
        gnome-tweaks
        ghostscript
        # google-chrome
        # gruvbox-plus-icons
        # haruna
        jre
        libdbusmenu
        libreoffice-fresh
        # libreoffice-qt6-fresh
        libva-utils
        # kde-gruvbox
        # megasync
        neovim
        nil
        nixd
        nixfmt-rfc-style
        nixpkgs-fmt
        nodejs_latest
        onlyoffice-bin_latest
        p7zip
        # papirus-icon-theme
        # postman
        smile
        sqlite
        # tela-icon-theme
        telegram-desktop
        tlrc
        thunderbird
        # ungoogled-chromium
        unzip
        vscode-fhs
        vulkan-tools
        wget
        wl-clipboard
        zed-editor.fhs
      ])
      ++ (with pkgs.gst_all_1; [
        gstreamer
        gst-plugins-bad
        gst-plugins-good
        gst-plugins-ugly
        gst-vaapi
      ])
      ++ (with pkgs.kdePackages; [
        # juk
        # kclock
        # kdenlive
        # kdeplasma-addons
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
        # qtwebengine
      ])
      ++ (with pkgs.gnomeExtensions; [
        appindicator
        blur-my-shell
        clipboard-indicator
        easyeffects-preset-selector
        # pop-shell
        # ...
      ]);
  };
}
