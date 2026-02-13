{ ... }:
{
  # Lix overlay for nix tools
  nix-tools = final: prev: {
    inherit (prev.lixPackageSets.stable)
      nixpkgs-review
      nix-eval-jobs
      nix-fast-build
      colmena
      ;
  };
}
