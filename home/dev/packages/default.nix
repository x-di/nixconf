{ pkgs, ... }:
{
  home = {
    packages = (
      with pkgs;
      [
        gcc
        nodejs_latest
        php
      ]
    );
  };
}
