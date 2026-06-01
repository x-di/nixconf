{ pkgs, ... }:
{
  # OBS Studio
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-move-transition
      input-overlay
      obs-vkcapture
      obs-vaapi
      obs-tuna
      obs-text-pthread
      obs-source-switcher
      input-overlay
    ];
  };
}
