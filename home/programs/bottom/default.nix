{ ... }:
{
  programs.bottom = {
    enable = false;
    settings = {
      flags = {
        avg_cpu = true;
        temperature_type = "c";
      };
      # colors = {
      #   low_battery_color = "red";
      # };
    };
  };
}
