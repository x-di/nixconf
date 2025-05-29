{ ... }:
{
  networking = {
    firewall = {
      enable = true;
      allowPing = false;
      allowedTCPPorts = [
        # 20 # ftp
        # 21 # ftp
        # 22 # ssh
        80 # http
        443 # https
        # 3000 # adguard
        5355 # llmnr
        # 8384 # syncthing
        # 22000 # syncthing
      ];
      allowedUDPPorts = [
        5355 # llmnr
      ];
      allowedTCPPortRanges = [
        {
          # kde connect
          from = 1714;
          to = 1764;
        }
      ];
      allowedUDPPortRanges = [
        {
          # kde connect
          from = 1714;
          to = 1764;
        }
      ];
    };
  };
}
