{ pkgs, ... }:
{
  chaotic = {
    mesa-git = {
      enable = true;
      extraPackages = with pkgs; [
        mesa_git.opencl
        intel-media-driver
        intel-ocl
        # vaapiIntel
        vpl-gpu-rt
        intel-compute-runtime
      ];
      # extraPackages32 = with pkgs.pkgsi686Linux; [
      #   pkgs.mesa32_git.opencl
      #   intel-media-driver
      #   vaapiIntel
      # ];
    };
    # hdr = {
    #   enable = true;
    # };
  };
}
