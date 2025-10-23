{ ... }:
let
  userName = "x-di";
  userEmail = "dimasimam75@gmail.com";
  # gpg --list-secret-keys --keyid-format=long
  signingkey = "11E66F143A6E166B";
in
{
  programs.git = {
    enable = true;
    signing = {
      signByDefault = true;
      key = "${signingkey}";
      # format = "openpgp";
    };
    settings = {
      user = {
        email = "${userEmail}";
        name = "${userName}";
      };
      delta = {
        side-by-side = true;
      };
    };
  };
}
