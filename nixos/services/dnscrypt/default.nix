{ ... }: {
  services = {
    dnscrypt-proxy2 = {
      enable = true;
      settings = {
        ipv6_servers = true;
        require_dnssec = true;
        doh_servers = false;
        sources.public-resolvers = {
          urls = [
            "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
            "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
          ];
          cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.md";
          minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
        };
        sources.relays = {
          urls = [
            "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/relays.md"
            "https://download.dnscrypt.info/resolvers-list/v3/relays.md"
          ];
          cache_file = "/var/lib/dnscrypt-proxy/relays.md";
          minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
          refresh_delay = 72;
        };
        anonymized_dns = {
          routes = [
            {
              server_name = "*";
              via = [
                "anon-tiarap"
                "anon-cs-singapore"
                "anon-cs-tokyo"
                # "dnscry.pt-anon-singapore02-ipv4"
                # "dnscry.pt-anon-singapore02-ipv6"
              ];
            }
          ];
          skip_incompatible = true;
        };
      };
    };
  };
}
