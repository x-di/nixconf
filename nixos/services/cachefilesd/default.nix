{ ... }:
{
  services.cachefilesd = {
    enable = false;
    extraConfig = ''
      brun 10%
    '';
  };
}
