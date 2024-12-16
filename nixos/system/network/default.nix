{ ... }:
let
  hostname = "nixos";
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
