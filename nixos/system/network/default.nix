{ ... }:
let
  hostname = "nixos-81B0";
in
{
  networking = {
    hostName = "${hostname}";
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
      wifi.macAddress = "random";
      ethernet.macAddress = "random";
    };
  };
}
