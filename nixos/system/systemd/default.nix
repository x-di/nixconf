{ ... }:
{
  systemd = {
    services = {
      NetworkManager-wait-online = {
        enable = false;
      };
      dnscrypt-proxy2 = {
        serviceConfig = {
          StateDirectory = "dnscrypt-proxy";
          # If you're trying to set up persistence with dnscrypt-proxy2 and it isn't working
          # because of permission issues, try the following:
          # StateDirectory = lib.mkForce "";
          # ReadWritePaths = "/var/lib/dnscrypt-proxy"; # Cache directory for dnscrypt-proxy2, persist this
        };
      };
    };
    oomd = {
      enable = false; # Switch to earlyoom.
    };
  };
}
