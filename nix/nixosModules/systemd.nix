{ pkgs, ... }:
{
  # Systemd configuration
  systemd = {
    services = {
      NetworkManager-wait-online = {
        enable = false;
      };
      lenovo-conservation-mode = {
        description = "Enable Lenovo IdeaPad battery conservation mode";
        after = [ "multi-user.target" ];
        wantedBy = [ "multi-user.target" ];
        serviceConfig = {
          Type = "oneshot";
          ExecStart = "${pkgs.bash}/bin/bash -c 'echo 1 > /sys/class/power_supply/BAT2/extensions/ideapad_laptop/conservation_mode'";
          RemainAfterExit = true;
        };
      };
    };
    oomd = {
      enable = false;
      settings = {
        OOM = {
          SwapUsedLimit = "90%";
          DefaultMemoryPressureLimit = "80%";
          DefaultMemoryPressureDurationSec = "5s";
        };
      };
    };
    sleep.extraConfig = ''
      AllowHibernation=no
    '';
  };
}
