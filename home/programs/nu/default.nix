{ ... }:
{
  programs.nushell = {
    enable = true;
    extraConfig = ''
      $env.config = {
        show_banner: false,
        edit_mode: vi,
      }
      $env.PATH = ($env.PATH |
        split row (char esep) |
        prepend ~/.config/composer/vendor/bin
      )
      source ~/.config/nixconf/home/programs/nu/completions/composer-completions.nu
    '';
  };
}
