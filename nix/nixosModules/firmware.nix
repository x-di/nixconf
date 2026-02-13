{ pkgs, ... }:
{
  # Hardware firmware configuration
  hardware.firmware = [ pkgs.linux-firmware ];
  hardware.enableAllFirmware = true;
}
