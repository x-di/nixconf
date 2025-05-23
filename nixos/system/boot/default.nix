{ pkgs, lib, ... }:
{
  boot = {
    # lanzaboote = {
    #   enable = true;
    #   pkiBundle = "/var/lib/sbctl";
    # };
    loader = {
      systemd-boot = {
        enable = lib.mkForce true;
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };
    # kernelPackages = pkgs.linuxPackages_latest;
    # kernelPackages = pkgs.linuxPackages-rt_latest;
    # kernelPackages = pkgs.linuxPackages_xanmod;
    # kernelPackages = pkgs.linuxPackages_xanmod_latest;
    # kernelPackages = pkgs.linuxPackages_zen;
    # kernelPackages = pkgs.linuxPackages_lqx;
    kernelPackages = pkgs.linuxPackages_cachyos;
    # kernelPackages = pkgs.linuxPackages_cachyos-rc;
    # kernelPackages = pkgs.linuxPackages_cachyos-hardened;
    kernel = {
      sysctl = {
        "vm.swappiness" = 150;
        "vm.vfs_cache_pressure" = 50;
        "vm.dirty_bytes" = 268435456;
        "vm.page-cluster" = 0;
        "vm.dirty_background_bytes" = 67108864;
        "vm.dirty_writeback_centisecs" = 1500;
        "kernel.nmi_watchdog" = 0;
        "kernel.unprivileged_userns_clone" = 1;
        "kernel.printk" = "3 3 3 3";
        "kernel.kptr_restrict" = 2;
        "kernel.kexec_load_disabled" = 1;
        "net.ipv4.tcp_ecn" = 1;
        "net.core.netdev_max_backlog" = 4096;
        "net.ipv4.tcp_slow_start_after_idle" = 0;
        "net.ipv4.tcp_rfc1337" = 1;
        "fs.file-max" = 2097152;
        # "fs.xfs.xfssyncd_centisecs" = 10000;
        "kernel.sysrq" = 1;
      };
    };

    tmp = {
      useTmpfs = false;
      cleanOnBoot = true;
      tmpfsSize = "50%";
    };

    plymouth = {
      enable = true;
      # theme = "rings";
      # themePackages = with pkgs; [
      #   # By default we would install all themes
      #   (adi1090x-plymouth-themes.override {
      #     selected_themes = [ "rings" ];
      #   })
      # ];
    };

    # Enable "Silent Boot"
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "i915.enable_guc=2"
      "i915.enable_fbc=1"
      "i915.enable_psr=2"
      "i915.fastboot=1"
      # "radeon.si_support=0"
      # "amdgpu.si_support=1"
    ];
    # Hide the OS choice for bootloaders.
    # It's still possible to open the bootloader list by pressing any key
    # It will just not appear on screen unless a key is pressed
    loader.timeout = 0;
  };
}
