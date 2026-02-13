{ pkgs, ... }:
{
  # Development tools
  programs = {
    go = {
      enable = true;
      env.GOPATH = ".go";
    };
    java = {
      enable = true;
      package = pkgs.jre;
    };
  };

  home.packages = with pkgs; [
    jdk
    go
    gopls
    gotools
    gcc
    nodejs_latest
  ];
}
