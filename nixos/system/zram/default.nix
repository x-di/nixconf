{ ... }:
{
  zramSwap = {
    enable = true;
    algorithm = "zstd"; # zstd lz4 lzo
    memoryPercent = 20; # % of total memory
    swapDevices = 8; # number of devices
  };
}
