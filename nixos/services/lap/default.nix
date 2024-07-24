{ pkgs, ... }:
let
  user = "dim";
  group = "users";
  documentRoot = "/home/dim/web";
in
{
  services = {
    httpd = {
      user = "${user}";
      group = "${group}";
      enable = false;
      package = pkgs.apacheHttpd;
      enablePHP = false;
      phpPackage = pkgs.php;
      virtualHosts.localhost = {
        documentRoot = "${documentRoot}";
        locations."/".index = "index.php index.html";
      };
    };
  };
}
