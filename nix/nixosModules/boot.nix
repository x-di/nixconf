{ pkgs, lib, ... }:
{
  # Boot loader configuration with systemd-boot
  boot = {
    loader = {
      systemd-boot = {
        enable = lib.mkForce true;
      };
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };

    # Linux kernel selection
    kernelPackages = pkgs.linuxPackages_lqx;

    # Kernel sysctl optimizations for desktop use
    kernel.sysctl = {
      "vm.swappiness" = 180;
      "vm.watermark_boost_factor" = 0;
      "vm.watermark_scale_factor" = 125;
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
      "kernel.sysrq" = 1;
    };

    # Temporary files configuration using zram
    tmp = {
      useTmpfs = false;
      useZram = true;
      zramSettings.zram-size = "ram * 1";
      cleanOnBoot = true;
    };

    # Plymouth boot splash screen
    plymouth.enable = true;

    # Silent boot configuration
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
      "radeon.si_support=0"
      "amdgpu.si_support=1"
    ];
  };
}
