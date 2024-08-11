{ pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;
    package = (pkgs.obs-studio.override { ffmpeg = pkgs.ffmpeg_7-full; });
    plugins = with pkgs.obs-studio-plugins; [
      # obs-multi-rtmp
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-move-transition
      input-overlay
      obs-vkcapture
      obs-vaapi
      obs-tuna
      obs-transition-table
      obs-text-pthread
      obs-source-switcher
      input-overlay
    ];
  };
}
