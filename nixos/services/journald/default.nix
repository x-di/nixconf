{ ... }:
{
  services.journald.extraConfig = ''
    SystemMaxUse=50M
  '';
}
