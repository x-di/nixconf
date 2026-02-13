{ pkgs, ... }:
{
  # Firefox browser (disabled)
  programs.firefox = {
    enable = false;
    nativeMessagingHosts.packages = [ pkgs.kdePackages.plasma-browser-integration ];
  };
}
