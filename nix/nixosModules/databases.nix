{ pkgs, ... }:
{
  # Database services (mostly disabled)
  services = {
    # MariaDB (disabled)
    mysql = {
      enable = false;
      package = pkgs.mariadb;
    };

    # MongoDB (disabled)
    mongodb.enable = false;

    # PostgreSQL (disabled)
    postgresql = {
      enable = false;
      dataDir = "/var/lib/postgresql/16";
    };

    # Redis (disabled)
    redis.servers.default.enable = false;
  };
}
