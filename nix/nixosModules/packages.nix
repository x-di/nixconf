{ lib, pkgs, ... }:
{
  # System-wide packages
  environment.systemPackages =
    with pkgs;
    [
      # Browsers
      brave
      librewolf

      # Development tools
      devenv
      neovim
      openssl
      sqlite
      vscode-fhs
      zed-editor-fhs

      # System utilities
      android-tools
      clinfo
      cryfs
      gocryptfs
      libva-utils
      mesa-demos
      nvme-cli
      nvtopPackages.intel
      p7zip
      sbctl
      sirikali
      smartmontools
      unzip
      unrar
      vulkan-tools
      wget
      wl-clipboard

      # Media
      ffmpeg-full
      haruna
      jamesdsp

      # Office
      ghostscript
      libreoffice-qt6-fresh
      onlyoffice-desktopeditors

      # Communication
      telegram-desktop

      # Database tools
      dbgate

      # Security
      qtscrcpy
      universal-android-debloater

      # GStreamer multimedia framework
      gst_all_1.gstreamer
      gst_all_1.gst-libav
      gst_all_1.gst-plugins-bad
      gst_all_1.gst-plugins-base
      gst_all_1.gst-plugins-good
      gst_all_1.gst-plugins-ugly
      gst_all_1.gst-vaapi

      # KDE Applications
      kdePackages.juk
      kdePackages.kclock
      kdePackages.kdeplasma-addons
      kdePackages.qtwebengine
      kdePackages.qtmultimedia
      kdePackages.krdc
      kdePackages.plasma-browser-integration
    ]
    ++ [ (lib.hiPrio pkgs.uutils-coreutils-noprefix) ];
}
