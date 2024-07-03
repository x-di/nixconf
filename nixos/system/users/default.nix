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
          "networkmanager"
          "wheel"
        ];
      };
    };
  };
}
