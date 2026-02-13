{ ... }:
{
  # User configuration for dim
  users.users.dim = {
    isNormalUser = true;
    description = "Dimas";
    extraGroups = [
      "adbusers"
      "networkmanager"
      "wheel"
      "i2c"
      "podman"
    ];
  };
}
