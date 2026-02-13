{ ... }:
{
  # DNS configuration with systemd-resolved (NextDNS)
  services.resolved = {
    enable = true;
    settings.Resolve = {
      DNSOverTLS = "true";
      DNSSEC = "true";
      LLMNR = "true";
      Domains = [ "~." ];
      FallbackDNS = [
        "1.1.1.1#one.one.one.one"
        "9.9.9.9#dns.quad9.net"
        "149.112.112.112#dns.quad9.net"
        "2620:fe::fe#dns.quad9.net"
        "2620:fe::9#dns.quad9.net"
        "1.1.1.1"
        "9.9.9.9"
        "8.8.8.8"
      ];
      DNS = [
        "45.90.28.0#d32d3f.dns.nextdns.io"
        "2a07:a8c0::#d32d3f.dns.nextdns.io"
        "45.90.30.0#d32d3f.dns.nextdns.io"
        "2a07:a8c1::#d32d3f.dns.nextdns.io"
        "1.1.1.1#one.one.one.one"
      ];
    };
  };
}
