# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "ahci"
    "nvme"
    "usbhid"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [
    "kvm-intel"
    # "i2c-dev"
    "v4l2loopback"
  ];
  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  '';

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/b33cefe0-6e9d-4281-aecc-23b6ff10cd27";
    fsType = "ext4";
  };

  boot.initrd.luks.devices."luks-0ae3075e-07a0-4787-9ce8-7b811298904a".device = "/dev/disk/by-uuid/0ae3075e-07a0-4787-9ce8-7b811298904a";

  fileSystems."/mnt/data" = {
    device = "/dev/disk/by-uuid/65198f88-01e7-4eff-a7d7-895a22f9a21e";
    fsType = "ext4";
  };

  boot.initrd.luks.devices."luks-3cd4d838-9cb7-4584-8f3f-75ea920d4e42".device = "/dev/disk/by-uuid/3cd4d838-9cb7-4584-8f3f-75ea920d4e42";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/1962-74CE";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 6 * 1024;
    }
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp2s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp3s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
