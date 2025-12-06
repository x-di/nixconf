{ pkgs, ... }:
{
  security = {
    rtkit = {
      enable = true;
    };
    polkit = {
      enable = true;
    };
    apparmor = {
      enable = false;
      enableCache = true;
      packages = with pkgs; [
        apparmor-profiles
      ];
    };
    auditd = {
      enable = false;
    };
    sudo-rs = {
      enable = true;
    };
    sudo = {
      enable = false;
    };
  };
}
