{ pkgs, ... }:
{
  hardware.firmware = [ pkgs.linux-firmware ];
  hardware.enableAllFirmware = true;
}
