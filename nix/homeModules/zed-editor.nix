{ pkgs, ... }:
{
  # Zed editor (disabled - not imported)
  programs.zed-editor = {
    enable = false;
    package = pkgs.zed-editor;
    extraPackages = with pkgs; [
      nixd
    ];
    userKeymaps = [
      {
        context = "Editor && VimControl && !VimWaiting && !menu";
        bindings = {
          "ctrl-w z" = "workspace::ToggleZoom";
          "ctrl-w t" = "terminal_panel::ToggleFocus";
          "g ]" = "editor::GoToDiagnostic";
          "g [" = "editor::GoToPrevDiagnostic";
          "g r" = "editor::FindAllReferences";
          "shift-k" = "editor::Hover";
          "space l a" = "editor::ToggleCodeActions";
          "space l r" = "editor::Rename";
          "space l f" = "editor::Format";
          "space l l" = "diagnostics::Deploy";
          "g c c" = "editor::ToggleComments";
          "space f" = "file_finder::Toggle";
          "space o" = "tab_switcher::Toggle";
          "space e" = "workspace::ToggleLeftDock";
          "space p" = "outline::Toggle";
          "space v" = "editor::GoToDefinitionSplit";
          "space c" = "command_palette::Toggle";
        };
      }
      {
        context = "Editor && vim_mode == insert && !menu";
        bindings = {
          "j j" = "vim::NormalBefore";
        };
      }
      {
        context = "Editor && vim_mode == visual && !VimWaiting && !VimObject";
        bindings = {
          shift-j = "editor::MoveLineDown";
          shift-k = "editor::MoveLineUp";
        };
      }
      {
        context = "Terminal";
        bindings = {
          "ctrl-w z" = "workspace::ToggleZoom";
          "ctrl-w t" = "terminal_panel::ToggleFocus";
        };
      }
    ];
    userSettings = {
      icon_theme = "Colored Zed Icons Theme Dark";
      base_keymap = "VSCode";
      theme = "Gruvbox Dark Hard";
      collaboration_panel = {
        dock = "right";
      };
      assistant = {
        default_model = {
          provider = "zed.dev";
          model = "claude-3-7-sonnet-thinking-latest";
        };
        version = "2";
      };
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      ui_font_size = 18;
      buffer_font_size = 18;
      ui_font_family = "ZedMono Nerd Font";
      buffer_font_family = "ZedMono Nerd Font";
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
        "edit_prediction_provider" = "copilot";
        "copilot" = true;
      };
      indent_guides = {
        enabled = true;
        coloring = "indent_aware";
      };
      use_autoclose = true;
      show_whitespaces = "all";
      inlay_hints = {
        enabled = true;
        show_type_hints = true;
        show_parameter_hints = true;
        show_other_hints = true;
      };
      file_finder = {
        modal_width = "large";
      };
      vim_mode = false;
      relative_line_numbers = true;
      diagnostics = {
        inline = {
          enabled = true;
        };
      };
      file_scan_exclusions = [
        "**/.git"
        "**/.svn"
        "**/.hg"
        "**/CVS"
        "**/.DS_Store"
        "**/Thumbs.db"
        "**/.classpath"
        "**/.settings"
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
          language_servers = [
            "nixd"
          ];
          formatter = {
            external = {
              command = "nixfmt";
            };
          };
          format_on_save = "on";
        };
      };
      lsp = {
        nixd.settings = {
          nixpkgs.expr = "import <nixpkgs> { }";
          diagnostic.suppress = [ "sema-escaping-with" ];
          options = {
            home-manager.expr = "(builtins.getFlake \"/home/dim/.config/nixconf\").homeConfigurations.\"dim@nixos\".options";
          };
        };
      };
      load_direnv = "shell_hook";
    };
  };
}
