{ ... }:
{
  # Firewall configuration
  networking.firewall = {
    enable = true;
    allowPing = false;
    allowedTCPPorts = [
      80 # HTTP
      443 # HTTPS
      5355 # LLMNR
    ];
    allowedUDPPorts = [
      5355 # LLMNR
    ];
    allowedTCPPortRanges = [
      {
        # KDE Connect
        from = 1714;
        to = 1764;
      }
    ];
    allowedUDPPortRanges = [
      {
        # KDE Connect
        from = 1714;
        to = 1764;
      }
    ];
  };
}
