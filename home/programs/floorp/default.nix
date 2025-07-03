{ pkgs, ... }:
{
  programs.floorp = {
    enable = true;
    # nativeMessagingHosts = [
    #   pkgs.kdePackages.plasma-browser-integration
    # ];
  };
}
