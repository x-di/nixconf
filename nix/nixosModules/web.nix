{ config, pkgs, ... }:
{
  # Web servers (all disabled)
  services = {
    # Apache + PHP (disabled)
    httpd = {
      enable = false;
      user = "dim";
      group = "users";
      package = pkgs.apacheHttpd;
      enablePHP = false;
      phpPackage = pkgs.php;
      virtualHosts.localhost = {
        documentRoot = "/home/dim/web";
        locations."/".index = "index.php index.html";
      };
    };

    # Nginx + PHP-FPM (disabled)
    nginx = {
      enable = false;
      user = "dim";
      group = "users";
      virtualHosts.localhost = {
        root = "/home/dim/web";
        locations."~ \\.php$".extraConfig = ''
          fastcgi_pass  unix:${config.services.phpfpm.pools.mypool.socket};
          fastcgi_index index.php;
        '';
      };
    };

    phpfpm.pools.mypool = {
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
  };
}
