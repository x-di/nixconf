{ ... }:
{
  services.resolved = {
    enable = true;
    dnsovertls = "true";
    domains = [
      "cloudflare-dns.com"
    ];
    extraConfig = ''
      DNS=1.1.1.1#one.one.one.one
    '';
  };
}
