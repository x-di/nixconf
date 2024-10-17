{ pkgs, ... }:
{
  home = {
    packages =
      (with pkgs; [
        anytype
        bruno
        # capitaine-cursors-themed
        # catppuccin-kde
        clinfo
        # code-cursor
        # colloid-icon-theme
        crow-translate
        cryfs
        # dbeaver-bin
        dbgate
        devenv
        # drawio
        easyeffects
        ffmpeg
        gcc
        glxinfo
        # gnome.gnome-keyring
        ghostscript
        # google-chrome
        # gruvbox-plus-icons
        haruna
        jre
        libdbusmenu
        libreoffice-qt6-fresh
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
        papirus-icon-theme
        # postman
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
