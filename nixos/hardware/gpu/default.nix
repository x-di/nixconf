{ pkgs, ... }:
{
  hardware.graphics = {
    # hardware.opengl in 24.05 and older
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # For Broadwell (2014) or newer processors. LIBVA_DRIVER_NAME=iHD
      vpl-gpu-rt
      # intel-vaapi-driver # For older processors. LIBVA_DRIVER_NAME=i965
    ];
  };
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  }; # Optionally, set the environment variable
}
