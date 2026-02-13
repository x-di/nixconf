{
  inputs,
  modulesPath,
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")

    # NixOS Modules (auto-exported by flakelight)
    inputs.self.nixosModules.boot
    inputs.self.nixosModules.nix
    inputs.self.nixosModules.users
    inputs.self.nixosModules.networking
    inputs.self.nixosModules.security
    inputs.self.nixosModules.firmware
    inputs.self.nixosModules.gpu
    inputs.self.nixosModules.plasma6
    inputs.self.nixosModules.appimage
    inputs.self.nixosModules.chromium
    inputs.self.nixosModules.dconf
    inputs.self.nixosModules.firefox
    inputs.self.nixosModules.gnupg
    inputs.self.nixosModules.kdeconnect
    inputs.self.nixosModules.nh
    inputs.self.nixosModules.nix-ld
    inputs.self.nixosModules.audio
    inputs.self.nixosModules.backup
    inputs.self.nixosModules.databases
    inputs.self.nixosModules.desktop-services
    inputs.self.nixosModules.dns
    inputs.self.nixosModules.maintenance
    inputs.self.nixosModules.printing
    inputs.self.nixosModules.virtualization
    inputs.self.nixosModules.web
    inputs.self.nixosModules.bluetooth
    inputs.self.nixosModules.documentation
    inputs.self.nixosModules.environment
    inputs.self.nixosModules.filesystem
    inputs.self.nixosModules.firewall
    inputs.self.nixosModules.fonts
    inputs.self.nixosModules.locale
    inputs.self.nixosModules.systemd
    inputs.self.nixosModules.timezone
    inputs.self.nixosModules.zram
    inputs.self.nixosModules.packages

    # Home Manager integration
    inputs.home-manager.nixosModules.home-manager
  ];

  # Hardware Configuration
  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "ahci"
    "nvme"
    "usb_storage"
    "usbhid"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [
    "kvm-intel"
    "v4l2loopback"
  ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  '';

  # Root filesystem
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/a9152a2b-054c-498c-a016-27720aae387e";
    fsType = "btrfs";
    options = [
      "subvol=/rootfs"
      "compress=zstd"
      "rw"
      "relatime"
      "ssd"
      "discard=async"
      "space_cache=v2"
      "commit=120"
    ];
  };

  # Home filesystem
  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/a9152a2b-054c-498c-a016-27720aae387e";
    fsType = "btrfs";
    options = [
      "subvol=/home"
      "compress=zstd"
      "rw"
      "relatime"
      "ssd"
      "discard=async"
      "space_cache=v2"
      "commit=120"
    ];
  };

  # Nix store filesystem (noatime for performance)
  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/a9152a2b-054c-498c-a016-27720aae387e";
    fsType = "btrfs";
    options = [
      "subvol=/nix"
      "compress=zstd"
      "noatime"
      "ssd"
      "discard=async"
      "space_cache=v2"
      "commit=120"
    ];
  };

  # Data filesystems
  fileSystems."/mnt/data" = {
    device = "/dev/disk/by-uuid/84470fd7-7316-441a-b3f3-6ec553f98772";
    fsType = "btrfs";
    options = [
      "subvol=/data"
      "compress=zstd"
      "rw"
      "relatime"
      "ssd"
      "discard=async"
      "space_cache=v2"
      "commit=120"
    ];
  };

  fileSystems."/mnt/data/personal" = {
    device = "/dev/disk/by-uuid/84470fd7-7316-441a-b3f3-6ec553f98772";
    fsType = "btrfs";
    options = [
      "subvol=/personal"
      "compress=zstd"
      "rw"
      "relatime"
      "ssd"
      "discard=async"
      "space_cache=v2"
      "commit=120"
    ];
  };

  fileSystems."/mnt/data/work" = {
    device = "/dev/disk/by-uuid/84470fd7-7316-441a-b3f3-6ec553f98772";
    fsType = "btrfs";
    options = [
      "subvol=/work"
      "compress=zstd"
      "rw"
      "relatime"
      "ssd"
      "discard=async"
      "space_cache=v2"
      "commit=120"
    ];
  };

  fileSystems."/mnt/data/misc" = {
    device = "/dev/disk/by-uuid/84470fd7-7316-441a-b3f3-6ec553f98772";
    fsType = "btrfs";
    options = [
      "subvol=/misc"
      "compress=zstd"
      "rw"
      "relatime"
      "ssd"
      "discard=async"
      "space_cache=v2"
      "commit=120"
    ];
  };

  # EFI boot partition
  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/2FC3-4011";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  # Network configuration
  networking.hostName = "nixos-81B0";
  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # System state version
  system.stateVersion = "26.05";

  # Home Manager Integration
  home-manager = {
    backupFileExtension = ".backup";
    useGlobalPkgs = true;
    useUserPackages = true;
    sharedModules = [
      ./home.nix
      # Home Modules (auto-exported by flakelight)
      inputs.self.homeModules.alacritty
      inputs.self.homeModules.aria2
      inputs.self.homeModules.bat
      inputs.self.homeModules.bottom
      inputs.self.homeModules.chromium
      inputs.self.homeModules.dconf
      inputs.self.homeModules.delta
      inputs.self.homeModules.direnv
      inputs.self.homeModules.eza
      inputs.self.homeModules.fastfetch
      inputs.self.homeModules.fish
      inputs.self.homeModules.floorp
      inputs.self.homeModules.fzf
      inputs.self.homeModules.gh
      inputs.self.homeModules.git
      # inputs.self.homeModules.helix  # Commented - not imported in original
      inputs.self.homeModules.htop
      inputs.self.homeModules.kitty
      # inputs.self.homeModules.nixvim  # Commented - not imported in original
      inputs.self.homeModules.nu
      inputs.self.homeModules.obs-studio
      inputs.self.homeModules.ripgrep
      inputs.self.homeModules.services
      inputs.self.homeModules.simple
      inputs.self.homeModules.starship
      inputs.self.homeModules.tealdeer
      inputs.self.homeModules.xdg
      inputs.self.homeModules.yazi
      inputs.self.homeModules.yt-dlp
      # inputs.self.homeModules.zed-editor  # Commented - not imported in original
      inputs.self.homeModules.zellij
      inputs.self.homeModules.zoxide
      inputs.self.homeModules.dev
      inputs.self.homeModules.packages
      inputs.self.homeModules.fonts
      inputs.self.homeModules.langserver
    ];
    users.dim = {
      home.username = "dim";
      home.homeDirectory = "/home/dim";
      home.stateVersion = "26.05";
    };
  };
}
