{ ... }:
let
  name = "dim";
  fullname = "Dimas";
in
{
  users = {
    users = {
      ${name} = {
        isNormalUser = true;
        description = "${fullname}";
        extraGroups = [
          "adbusers"
          # "dnscrypt-proxy2"
          "networkmanager"
          "wheel"
          "i2c"
          "podman"
        ];
      };
    };
  };
}
