inputs@{ final, prev, ... }:
{
  zed-editor = inputs.zed.packages.${final.system}.default;
}
