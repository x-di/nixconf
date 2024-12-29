{ pkgs, ... }:
{
  programs = {
    firefox = {
      enable = true;
      nativeMessagingHosts.packages = [ pkgs.kdePackages.plasma-browser-integration ];
    };
  };
}
