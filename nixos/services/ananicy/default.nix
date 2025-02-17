{ pkgs, ... }:
{
  services.ananicy = {
    enable = true;
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
}
