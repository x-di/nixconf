{ ... }:
{
  services.resolved = {
    enable = true;
    dnsovertls = "true";
    dnssec = "true";
    llmnr = "true";
    domains = [
      "~."
    ];
    fallbackDns = [
      "1.1.1.1"
      "9.9.9.9"
      "8.8.8.8"
    ];
    extraConfig = ''
      DNS=1.1.1.1#one.one.one.one
    '';
  };
}
