{ ... }:
{
  services.dbus = {
    enable = true;
    # apparmor = "enabled";
    implementation = "broker"; # use new dbus-broker
  };
}
