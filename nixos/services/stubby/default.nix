{ pkgs, ... }:
{
  services.stubby = {
    enable = true;
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
}
