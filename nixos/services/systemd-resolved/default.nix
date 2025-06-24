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
      DNS=45.90.28.0#d32d3f.dns.nextdns.io
      DNS=2a07:a8c0::#d32d3f.dns.nextdns.io
      DNS=45.90.30.0#d32d3f.dns.nextdns.io
      DNS=2a07:a8c1::#d32d3f.dns.nextdns.io
      DNS=1.1.1.1#one.one.one.one
    '';
  };
}
