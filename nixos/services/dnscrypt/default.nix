{ ... }:
{
  services = {
    dnscrypt-proxy2 = {
      enable = true;
      settings = {
        ipv6_servers = false;
        require_dnssec = true;
        doh_servers = false;
        require_nolog = true;
        require_nofilter = true;
        sources.public-resolvers = {
          urls = [
            "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
            "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
          ];
          cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.md";
          minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
          refresh_delay = 24;
        };
        sources.relays = {
          urls = [
            "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/relays.md"
            "https://download.dnscrypt.info/resolvers-list/v3/relays.md"
          ];
          cache_file = "/var/lib/dnscrypt-proxy2/relays.md";
          minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
          refresh_delay = 24;
        };

        server_names = [ ];

        anonymized_dns = {
          routes = [
            {
              server_name = "*";
              via = [
                "*"
                # "anon-tiarap"
                # "anon-cs-singapore"
                # "dnscry.pt-anon-singapore-ipv4"
                # "dnscry.pt-anon-singapore02-ipv4"
                # "anon-cs-tokyo"
                # "dnscry.pt-anon-tokyo-ipv4"
                # "dnscry.pt-anon-tokyo02-ipv4"
              ];
            }
            # {
            #   server_name = "dnscry.pt-jakarta-ipv4";
            #   via = [
            #     "anon-tiarap"
            #     "anon-cs-singapore"
            #     "dnscry.pt-anon-singapore-ipv4"
            #     "dnscry.pt-anon-singapore02-ipv4"
            #     "anon-cs-tokyo"
            #     "dnscry.pt-anon-tokyo-ipv4"
            #     "dnscry.pt-anon-tokyo02-ipv4"
            #   ];
            # }
            # {
            #   server_name = "dnscry.pt-singapore-ipv4";
            #   via = [
            #     "anon-tiarap"
            #     "anon-cs-singapore"
            #     "dnscry.pt-anon-singapore-ipv4"
            #     "dnscry.pt-anon-singapore02-ipv4"
            #     "anon-cs-tokyo"
            #     "dnscry.pt-anon-tokyo-ipv4"
            #     "dnscry.pt-anon-tokyo02-ipv4"
            #   ];
            # }
            # {
            #   server_name = "dnscry.pt-singapore02-ipv4";
            #   via = [
            #     "anon-tiarap"
            #     "anon-cs-singapore"
            #     "dnscry.pt-anon-singapore-ipv4"
            #     "dnscry.pt-anon-singapore02-ipv4"
            #     "anon-cs-tokyo"
            #     "dnscry.pt-anon-tokyo-ipv4"
            #     "dnscry.pt-anon-tokyo02-ipv4"
            #   ];
            # }
          ];
          skip_incompatible = true;
        };
      };
    };
  };
}
