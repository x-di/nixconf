{ ... }:
{
  zramSwap = {
    enable = true;
    algorithm = "zstd"; #zstd
    memoryPercent = 100; #70
  };
}
