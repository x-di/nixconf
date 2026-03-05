{ pkgs, ... }:
{
  # Floorp browser
  programs.floorp = {
    enable = false;
    nativeMessagingHosts = [
      pkgs.kdePackages.plasma-browser-integration
    ];
  };
}
