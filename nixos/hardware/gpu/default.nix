{ pkgs, ... }:
{
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
    # mesaPackage = pkgs.mesa_23;
    # mesaPackage32 = pkgs.pkgsi686Linux.mesa_23;
    package = pkgs.mesa.drivers;
    package32 = pkgs.pkgsi686Linux.mesa.drivers;
    extraPackages = [ pkgs.mesa.opencl ];
  };
}
