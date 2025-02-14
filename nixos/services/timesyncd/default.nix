{ ... }:
{
  services.timesyncd = {
    enable = true;
    servers = [
      "time.cloudflare.com"
    ];
    fallbackServers = [
      "time.google.com"
      "0.arch.pool.ntp.org"
      "1.arch.pool.ntp.org"
      "2.arch.pool.ntp.org"
      "3.arch.pool.ntp.org"
    ];
  };
}
