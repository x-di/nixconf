{ ... }: {
  services = {
    dnscrypt-proxy2 = {
      enable = true;
      settings = {
        ipv6_servers = true;
        require_dnssec = true;
        anonymized_dns = {
          routes = [
            {
              server_name = "*";
              via = [ "anon-tiarap" "anon-cs-singapore" "dnscry.pt-anon-singapore02-ipv4" "dnscry.pt-anon-singapore02-ipv6" ];
            }
          ];
          skip_incompatible = true;
        };
      };
    };
  };
}
