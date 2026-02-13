{ pkgs, ... }:
{
  # Development tools
  programs = {
    go = {
      enable = true;
      env.GOPATH = ".go";
    };
  };

  home.packages = with pkgs; [
    jdk
    go
    gopls
    gotools
  ];
}
