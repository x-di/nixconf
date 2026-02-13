{ pkgs, ... }:
{
  # Language servers
  home.packages = with pkgs; [
    nil
    nixd
    gopls
    gotools
    typescript-language-server
    vscode-langservers-extracted
    yaml-language-server
    jsonnet-language-server
    taplo
    lua-language-server
    bash-language-server
    docker-compose-language-service
    dockerfile-language-server-nodejs
    marksman
    texlab
    helm-ls
    terraform-ls
  ];
}
