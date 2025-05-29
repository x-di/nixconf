{ ... }:
{
  services = {
    dnscrypt-proxy2 = {
      enable = true;
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
            # {
            #   server_name = "dnscry.pt-jakarta-ipv4";
            #   via = [
            #     "dnscry.pt-anon-tokyo02-ipv4"
            #     "dnscry.pt-anon-tokyo-ipv4"
            #     "dnscry.pt-anon-singapore02-ipv4"
            #     "dnscry.pt-anon-singapore-ipv4"
            #     "anon-serbica"
            #     "anon-tiarap"
            #     "anon-saldns03-conoha-ipv4"
            #     "anon-saldns02-conoha-ipv4"
            #     "anon-saldns01-conoha-ipv4"
            #     "anon-dnswarden-swiss"
            #     "anon-cs-tokyo"
            #     "anon-cs-singapore"
            #   ];
            # }
            # {
            #   server_name = "dnscry.pt-singapore-ipv4";
            #   via = [
            #     "dnscry.pt-anon-tokyo02-ipv4"
            #     "dnscry.pt-anon-tokyo-ipv4"
            #     "dnscry.pt-anon-singapore02-ipv4"
            #     "dnscry.pt-anon-singapore-ipv4"
            #     "anon-serbica"
            #     "anon-tiarap"
            #     "anon-saldns03-conoha-ipv4"
            #     "anon-saldns02-conoha-ipv4"
            #     "anon-saldns01-conoha-ipv4"
            #     "anon-dnswarden-swiss"
            #     "anon-cs-tokyo"
            #     "anon-cs-singapore"
            #   ];
            # }
            # {
            #   server_name = "dnscry.pt-singapore02-ipv4";
            #   via = [
            #     "dnscry.pt-anon-tokyo02-ipv4"
            #     "dnscry.pt-anon-tokyo-ipv4"
            #     "dnscry.pt-anon-singapore02-ipv4"
            #     "dnscry.pt-anon-singapore-ipv4"
            #     "anon-serbica"
            #     "anon-tiarap"
            #     "anon-saldns03-conoha-ipv4"
            #     "anon-saldns02-conoha-ipv4"
            #     "anon-saldns01-conoha-ipv4"
            #     "anon-dnswarden-swiss"
            #     "anon-cs-tokyo"
            #     "anon-cs-singapore"
            #   ];
            # }
          ];
          skip_incompatible = true;
        };
      };
    };
  };
}
