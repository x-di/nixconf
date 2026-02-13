{ ... }:
{
  # Bottom system monitor (disabled)
  programs.bottom = {
    enable = false;
    settings = {
      flags = {
        avg_cpu = true;
        temperature_type = "c";
      };
    };
  };
}
