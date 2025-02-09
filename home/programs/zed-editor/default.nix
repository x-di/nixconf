{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
    # extensions = [

    # ];
    extraPackages = with pkgs; [
      nixd
    ];
    # userKeymaps = {

    # };
    userSettings = {
      icon_theme = "Catppuccin Mocha";
      base_keymap = "VSCode";
      theme = "Catppuccin Mocha";
      collaboration_panel = {
        dock = "right";
      };
      assistant = {
        default_model = {
          provider = "zed.dev";
          model = "claude-3-5-sonnet-latest";
        };
        version = 2;
      };
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      ui_font_size = 18;
      buffer_font_size = 18;
      ui_font_family = "Geist";
      buffer_font_family = "GeistMono Nerd Font";
      soft_wrap = "editor_width";
      terminal = {
        shell = {
          program = "fish";
        };
      };
      project_panel = {
        dock = "right";
      };
      outline_panel = {
        dock = "right";
      };
      features = {
        inline_completion_provider = "supermaven";
      };
      indent_guides = {
        enabled = true;
        coloring = "indent_aware";
      };
      use_autoclose = true;
      show_whitespaces = "all";
      inlay_hints = {
        enabled = true;
      };
      file_finder = {
        modal_width = "large";
      };
      vim_mode = false;
      relative_line_numbers = true;
      file_scan_exclusions = [
        "**/.git"
        "**/.svn"
        "**/.hg"
        "**/CVS"
        "**/.DS_Store"
        "**/Thumbs.db"
        "**/.classpath"
        "**/.settings"
        # above is default from Zed
        "**/.husky"
        "**/.turbo"
        "**/.vscode"
        "**/.next"
        "**/.storybook"
        "**/node_modules"
        "**/.devenv"
        "**/.direnv"
        "**/vendor"
      ];
      file_types = {
        Blade = [ "*.blade.php" ];
      };
      languages = {
        Nix = {
          formatter = {
            external = {
              command = "nixfmt";
            };
          };
          format_on_save = "on";
        };
      };
    };
  };
}
