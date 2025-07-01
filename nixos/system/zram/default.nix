{ ... }:
{
  zramSwap = {
    enable = true;
    algorithm = "lz4"; # zstd lz4 lzo
    memoryPercent = 200; # % of total memory
    # swapDevices = 4; # number of devices
  };
}
