{ ... }:
{
  services.udev = {
    enable = true;
    extraRules = ''
      ACTION=="add", SUBSYSTEM=="scsi_host", KERNEL=="host*", \
          ATTR{link_power_management_policy}=="*", \
          ATTR{link_power_management_policy}="max_performance"

      ACTION=="add|change", KERNEL=="sd[a-z]*", ATTR{queue/rotational}=="1", \
          ATTR{queue/scheduler}="bfq"

      ACTION=="add|change", KERNEL=="sd[a-z]*|mmcblk[0-9]*", ATTR{queue/rotational}=="0", \
          ATTR{queue/scheduler}="mq-deadline"

      ACTION=="add|change", KERNEL=="nvme[0-9]*", ATTR{queue/rotational}=="0", \
          ATTR{queue/scheduler}="none"
    '';
  };
}
