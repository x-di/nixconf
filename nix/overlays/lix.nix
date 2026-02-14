final: prev: {
  inherit (final.lixPackageSets.latest)
    nixpkgs-review
    nix-eval-jobs
    nix-fast-build
    colmena
    ;

  nix-direnv = prev.nix-direnv.override { nix = final.lixPackageSets.latest.lix; };
}
