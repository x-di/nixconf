{ pkgs, ... }:
{
  # Development tools
  programs = {
    go = {
      enable = true;
      env.GOPATH = ".go";
    };
    java = {
      enable = false;
      package = pkgs.jre;
    };
  };

  home.packages = with pkgs; [
    # jdk
    go
    gopls
    gotools
    gcc
    nodejs_latest
  ];
}
