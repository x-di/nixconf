{ ... }:
let
  ver = "25.05";
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
    ./xdg
    ./zram
  ];
  system = {
    stateVersion = "${ver}";
  };
}
