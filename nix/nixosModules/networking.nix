{ ... }:
{
  # Network configuration with NetworkManager
  networking = {
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
      wifi.macAddress = "random";
      ethernet.macAddress = "random";
    };
  };
}
