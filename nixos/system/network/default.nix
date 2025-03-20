{ ... }:
let
  hostname = "nixos-81B0";
in
{
  networking = {
    hostName = "${hostname}";
    networkmanager = {
      enable = true;
      dns = "none";
      wifi.macAddress = "random";
      ethernet.macAddress = "random";
    };
  };
}
