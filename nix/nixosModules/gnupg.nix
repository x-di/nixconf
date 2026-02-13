# GnuPG agent configuration
{ ... }:
{
  # GnuPG agent for SSH authentication
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
