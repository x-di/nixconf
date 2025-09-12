{ pkgs, ... }:
{
  home = {
    packages = (
      with pkgs;
      [
        frankenphp
        gcc
        nodejs_latest
        php
      ]
    );
  };
}
