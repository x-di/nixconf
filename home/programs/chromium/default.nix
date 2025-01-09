{ pkgs, ... }:
{
  programs.chromium = {
    enable = true;
    package = (pkgs.chromium.override { enableWideVine = true; });
    extensions = [
      { id = "ddkjiahejlhfcafbddmgiahcphecmpfh"; } # ublock origin lite
      { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } # sponsor block
      { id = "pkehgijcmpdhfbdbbnkijodmdjhbjlgp"; } # privacy badger
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # bitwarden
      { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } # dark reader
      { id = "cimiefiiaegbelhefglklhhakcgmhkai"; } # plasma integration
      { id = "fmkadmapgofadopljbjfkapdkoienihi"; } # react developer tools
      { id = "bnjjngeaknajbdcgpfkgnonkmififhfo"; } # fake filler
      { id = "bcjindcccaagfpapjjmafapmmgkkhgoa"; } # json formatter
    ];
    commandLineArgs = [
      "--enable-features=VaapiVideoDecodeLinuxGL"
      "--ignore-gpu-blocklist"
      "--enable-zero-copy"
    ];
  };
}
