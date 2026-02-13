{ ... }:
{
  # Fish shell configuration
  programs.fish = {
    enable = true;

    # Disable greeting and set vi mode
    interactiveShellInit = ''
      set fish_greeting
      fish_vi_key_bindings
      set -gx PATH $PATH $HOME/.config/composer/vendor/bin
    '';

    # Shell abbreviations for common commands
    shellAbbrs = {
      # Nix commands
      nrs = "sudo nixos-rebuild switch --flake .";
      nrb = "sudo nixos-rebuild boot --flake .";
      ns = "nix-shell --command fish -p";

      # Safety aliases
      cp = "cp -i";
      mv = "mv -i";
      rm = "rm -i";

      # Utilities
      df = "df -h";
      free = "free -m";
      nd = "mkdir -p";
      nf = "touch";
      grep = "grep --color=auto";
      egrep = "egrep --color=auto";
      fgrep = "fgrep --color=auto";

      # Editors
      n = "nvim .";
      h = "hx .";
      e = "zeditor .";

      # Vault management
      priv = "cryfs-unmount '/mnt/data/Vaults/mount'";
      unpriv = "cryfs /mnt/data/Vaults/.priv /mnt/data/Vaults/mount";
      megaLock = "cryfs-unmount '/mnt/data/MEGAsync'";
      megaUnlock = "cryfs /mnt/data/.Mega /mnt/data/MEGAsync";

      # Git commands
      gad = "git add";
      gal = "git add --all";
      gb = "git branch";
      gcm = "git commit -S -m";
      gck = "git checkout main";
      gcl = "git clone --recursive";
      gdf = "git diff";
      glg = "git log --graph";
      gm = "git merge";
      gps = "git push origin main";
      gst = "git status -sbu";
      gts = "git tag -s";
      gur = "git pull --rebase";

      # yt-dlp commands
      yt = "yt-dlp";
      ytm = "yt-dlp -o '%(title)s.%(ext)s' -f bestaudio";
      ytl = "yt-dlp -o '%(title)s.%(ext)s' -f 'bestvideo[height<=720]+bestaudio/best[height<=720]'";
      yth = "yt-dlp -o '%(title)s.%(ext)s' -f 'bestvideo[height<=1080]+bestaudio/best[height<=1080]'";
    };
  };
}
