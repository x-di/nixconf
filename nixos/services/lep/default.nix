{ config, ... }:
# 403 forbiden
{
  services.nginx = {
    enable = false;
    user = "dim";
    group = "users";
    virtualHosts.localhost = {
      # enableACME = true;
      # forceSSL = true;
      root = "/home/dim/web";
      locations."~ \\.php$".extraConfig = ''
        fastcgi_pass  unix:${config.services.phpfpm.pools.mypool.socket};
        fastcgi_index index.php;
      '';
    };
  };
  services.phpfpm.pools.mypool = {
    user = "dim";
    group = "users";
    settings = {
      "pm" = "dynamic";
      "listen.owner" = config.services.nginx.user;
      "listen.group" = config.services.nginx.group;
      "pm.max_children" = 5;
      "pm.start_servers" = 2;
      "pm.min_spare_servers" = 1;
      "pm.max_spare_servers" = 3;
      "pm.max_requests" = 500;
    };
  };
}
