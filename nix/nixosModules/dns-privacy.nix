# DNS privacy configuration (systemd-resolved, dnscrypt, stubby - mutually exclusive)
{ pkgs, lib, ... }:

let
  # Choose one: "resolved", "dnscrypt", "stubby", or "none"
  dnsProvider = "resolved";
in
{
  # systemd-resolved (default)
  services.resolved = {
    enable = dnsProvider == "resolved";
    settings.Resolve = {
      DNSOverTLS = dnsProvider == "resolved";
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

  # DNSCrypt-proxy2
  services.dnscrypt-proxy = {
    enable = dnsProvider == "dnscrypt";
    settings = {
      ipv6_servers = false;
      dnscrypt_servers = true;
      require_dnssec = true;
      doh_servers = false;
      sources.public-resolvers = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
          "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
        ];
        cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.md";
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
        refresh_delay = 72;
      };
      sources.relays = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/relays.md"
          "https://download.dnscrypt.info/resolvers-list/v3/relays.md"
        ];
        cache_file = "/var/lib/dnscrypt-proxy2/relays.md";
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
        refresh_delay = 72;
      };
      server_names = [
        # "saldns01-conoha-ipv4"
        # "saldns02-conoha-ipv4"
        # "saldns03-conoha-ipv4"
        # "serbica"
        # "cs-singapore"
        # "dnscry.pt-singapore02-ipv4"
        # "doh.tiar.app"
        # "doh.tiar.app-doh"
        # "doh.tiarap.org"
        # "jp.tiar.app"
        # "jp.tiar.app-doh"
        # "jp.tiarap.org"
        # "mullvad-base-doh"
        # "cs-tokyo"
      ];
      anonymized_dns = {
        routes = [
          {
            server_name = "*";
            via = [
              "dnscry.pt-anon-tokyo02-ipv4"
              "dnscry.pt-anon-tokyo-ipv4"
              "dnscry.pt-anon-singapore02-ipv4"
              "dnscry.pt-anon-singapore-ipv4"
              "anon-serbica"
              "anon-tiarap"
              "anon-saldns03-conoha-ipv4"
              "anon-saldns02-conoha-ipv4"
              "anon-saldns01-conoha-ipv4"
              "anon-dnswarden-swiss"
              "anon-cs-tokyo"
              "anon-cs-singapore"
            ];
          }
        ];
        skip_incompatible = true;
      };
    };
  };

  # Stubby (DNS over TLS)
  services.stubby = {
    enable = dnsProvider == "stubby";
    settings = pkgs.stubby.passthru.settingsExample // {
      upstream_recursive_servers = [
        {
          address_data = "45.90.28.0";
          tls_auth_name = "d32d3f.dns.nextdns.io";
        }
        {
          address_data = "2a07:a8c0::0";
          tls_auth_name = "d32d3f.dns.nextdns.io";
        }
        {
          address_data = "45.90.30.0";
          tls_auth_name = "d32d3f.dns.nextdns.io";
        }
        {
          address_data = "2a07:a8c1::0";
          tls_auth_name = "d32d3f.dns.nextdns.io";
        }
      ];
    };
  };

  # Validation
  assertions = [
    {
      assertion = lib.elem dnsProvider [
        "resolved"
        "dnscrypt"
        "stubby"
        "none"
      ];
      message = "dnsProvider must be one of: resolved, dnscrypt, stubby, none";
    }
  ];
}
