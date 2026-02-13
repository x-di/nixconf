# CPU schedulers configuration (ananicy, scx, system76 - mutually exclusive)
{ pkgs, lib, ... }:

let
  # Choose one: "ananicy", "scx", "system76", or "none"
  scheduler = "none";
in
{
  # Ananicy (CachyOS scheduler)
  services.ananicy = {
    enable = scheduler == "ananicy";
    package = pkgs.ananicy-cpp;
    rulesProvider = pkgs.ananicy-rules-cachyos_git;
    extraRules = [
      {
        name = "zed-editor";
        type = "LowLatency_RT";
      }
      {
        name = "zed-cli";
        type = "LowLatency_RT";
      }
      {
        name = "easyeffects";
        type = "Service";
      }
    ];
  };

  # SCX scheduler (Linux SCX)
  services.scx = {
    enable = scheduler == "scx";
    package = pkgs.scx.rustscheds;
    scheduler = "scx_flash";
    extraArgs = [
      "-p"
      "-k"
      "-m"
      "performance"
      "-w"
      "-C"
      "0"
    ];
  };

  # System76 scheduler (for System76 laptops)
  services.system76-scheduler = {
    enable = scheduler == "system76";
    package = pkgs.system76-scheduler;
  };
  hardware.system76 = {
    enableAll = scheduler == "system76";
    firmware-daemon.enable = false;
  };

  # Assertions for mutual exclusivity
  assertions = [
    {
      assertion = lib.elem scheduler [
        "ananicy"
        "scx"
        "system76"
        "none"
      ];
      message = "scheduler must be one of: ananicy, scx, system76, none";
    }
  ];
}
