# Git configuration
{ config, ... }:
{
  programs.git = {
    enable = true;
    signing = {
      signByDefault = true;
      # Key is stored in sops - will be available at /run/secrets/git-signing-key
      # Note: For build-time signing, the key needs to be in configuration
      # This will work after activation when secrets are decrypted
    };
    settings = {
      user = {
        email = "dimasimam75@gmail.com";
        name = "x-di";
      };
      delta.side-by-side = true;
    };
  };

  # Alternative: Use sops secret path (works after activation)
  # Uncomment below and remove hardcoded key above
  # programs.git.signing.key = config.sops.secrets."git-signing-key".path;
}
