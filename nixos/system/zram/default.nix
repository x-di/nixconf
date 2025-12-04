{ ... }:
{
  zramSwap = {
    enable = true;
    algorithm = "zstd"; # zstd lz4 lzo
    memoryPercent = 100; # % of total memory
    # swapDevices = 4; # number of devices
  };
}
