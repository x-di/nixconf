{ pkgs, ... }:
{
  home = {
    packages =
      (with pkgs; [
        # adw-gtk3
        # adwaita-icon-theme
        # anytype
        # bibata-cursors
        # brave
        bruno
        # capitaine-cursors-themed
        # catppuccin-kde
        # celluloid
        clinfo
        cpu-x
        # code-cursor
        colloid-icon-theme
        crow-translate
        # cryfs
        dav1d
        # dbeaver-bin
        dbgate
        # ddcutil
        devenv
        # drawio
        # easyeffects
        # endeavour
        ffmpeg-full
        # gcc
        # gimp
        glxinfo
        # gnome.gnome-keyring
        # gnome-tweaks
        ghostscript
        # google-chrome
        # gruvbox-plus-icons
        haruna
        # inkscape
        # jre
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
        onlyoffice-bin_latest
        openssl
        p7zip
        papirus-icon-theme
        # postman
        # smile
        sqlite
        svt-av1
        # tela-icon-theme
        telegram-desktop
        # tlrc
        # thunderbird
        # ungoogled-chromium
        unzip
        vscode-fhs
        vulkan-tools
        wget
        wl-clipboard
        x265
        zed-editor.fhs
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
        qtmultimedia
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
      ]);
  };
}
