{ ... }:
let
  name = "xd";
  homeDirectory = "/home/xd";
  stateVersion = "24.05";
  userName = "x-di";
  userEmail = "dimasimam75@gmail.com";
  # gpg --list-secret-keys --keyid-format=long
  signingkey = "11E66F143A6E166B";
in
{
  home = {
    username = "${name}";
    homeDirectory = "${homeDirectory}";
    stateVersion = "${stateVersion}";
  };
  nixpkgs.config.allowUnfree = true;
  programs.git = {
    enable = true;
    userName = "${userName}";
    userEmail = "${userEmail}";
    signing = {
      signByDefault = true;
      key = "${signingkey}";
    };
  };
  imports = [
    (import ./packages)
  ];
}
