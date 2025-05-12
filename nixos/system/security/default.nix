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
      enable = true;
      enableCache = true;
      packages = with pkgs; [
        apparmor-profiles
      ];
    };
    auditd = {
      enable = true;
    };
  };
}
