{ ... }:
let
  ver = "24.11";
in
{
  imports = [
    ./bluetooth
    ./boot
    ./documentation
    ./environment
    ./firewall
    ./fonts
    ./locale
    ./network
    ./nix
    ./security
    # ./sound
    ./systemd
    ./timezone
    ./users
    ./zram
  ];
  system = {
    stateVersion = "${ver}";
  };
}
