{ pkgs, ... }:
{
  home.packages =
    with pkgs;
    # with pkgs.elmPackages;
    with pkgs.nodePackages;
    # with pkgs.ocamlPackages;
    # with pkgs.rubyPackages;
    [
      # ansible-language-server # ansible
      bash-language-server # bash
      # clang-tools # c, c++
      # clojure-lsp # clojure
      # cmake-language-server # cmake
      # crystalline # cairo
      # cuelsp # cue
      # dhall-lsp-server # dhall
      dockerfile-language-server-nodejs # docker
      # dot-language-server # dot
      # elixir-ls # elixir
      # elm-language-server # elm
      # elvish # elvish
      # erlang-ls # erlang
      # fortls # fortran
      # fsautocomplete # fsharp
      # gleam # gleam
      gopls # golang
      # jdt-language-server # java
      # jsonnet-language-server # jsonnet
      # julia # julia
      # lean # lean
      # lsp # ocaml
      lua-language-server # lua
      marksman # markdodwn
      # metals # scala
      # mint # mint
      nil # nix
      # nimlsp # nim
      nixpkgs-fmt # nixpkgs formatter
      # nls # nickel
      # ols # odin
      # openscad-lsp # openscad
      # perlnavigator # perl
      # protobuf # protobuf
      # purescript-language-server # purescript
      pyright # python
      # racket # racket
      # regols # rego
      ruff-lsp # python
      rust-analyzer # rust
      # slint-lsp # slint
      # solargraph # ruby
      # solc # solidity
      # svelte-language-server # svelte
      # swiProlog # prolog
      taplo # toml
      # terraform-ls # terraform
      # texlab # latex
      typescript-language-server # typescript
      # vala-language-server # vala
      # vhdl-ls # vhdl
      vls # vue
      yaml-language-server # yaml
      # zls # zig

      # sourcekit-lsp # swift & objective-c # too much storage
      # haskell-language-server # haskell # too much storage
      intelephense # php # unfree package
    ];
}
