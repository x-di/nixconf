{ pkgs, ... }:
# let
#   flake = ''(builtins.getFlake "github:x-di/nixconf")'';
# in
{
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor;
    # extensions = [

    # ];
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
      {
        context = "Editor";
        bindings = {
          "cmd-[" = "editor::Outdent";
          "cmd-]" = "editor::Indent";
          cmd-alt-up = "editor::AddSelectionAbove";
          cmd-ctrl-p = "editor::AddSelectionAbove";
          cmd-alt-down = "editor::AddSelectionBelow";
          cmd-ctrl-n = "editor::AddSelectionBelow";
          cmd-d = [
            "editor::SelectNext"
            {
              "replace_newest" = false;
            }
          ];
          ctrl-cmd-d = [
            "editor::SelectPrevious"
            {
              "replace_newest" = false;
            }
          ];
          "cmd-k cmd-d" = [
            "editor::SelectNext"
            {
              "replace_newest" = true;
            }
          ];
          "cmd-k ctrl-cmd-d" = [
            "editor::SelectPrevious"
            {
              "replace_newest" = true;
            }
          ];
          "cmd-/" = [
            "editor::ToggleComments"
            {
              "advance_downwards" = false;
            }
          ];
          alt-up = "editor::SelectLargerSyntaxNode";
          alt-down = "editor::SelectSmallerSyntaxNode";
          cmd-u = "editor::UndoSelection";
          cmd-shift-u = "editor::RedoSelection";
          f8 = "editor::GoToDiagnostic";
          shift-f8 = "editor::GoToPrevDiagnostic";
          f2 = "editor::Rename";
          f12 = "editor::GoToDefinition";
          alt-f12 = "editor::GoToDefinitionSplit";
          cmd-f12 = "editor::GoToTypeDefinition";
          alt-cmd-f12 = "editor::GoToTypeDefinitionSplit";
          alt-shift-f12 = "editor::FindAllReferences";
          ctrl-m = "editor::MoveToEnclosingBracket";
          "alt-cmd-[" = "editor::Fold";
          "alt-cmd-]" = "editor::UnfoldLines";
          ctrl-space = "editor::ShowCompletions";
          "cmd-." = "editor::ToggleCodeActions";
          # alt-cmd-r = "editor::RevealInFinder";
        };
      }
    ];
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
          language_servers = [
            "nixd"
            # "!nil"
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
          # formatting.command = [ "${lib.getExe pkgs.nixfmt}" ];
          diagnostic.suppress = [ "sema-escaping-with" ];
          options =
            let
              flake = ''(builtins.getFlake "/home/dim/.config/nixconf")'';
            in
            # flake = ''
            #   $HOME\.config\nixconf
            # '';
            {
              # nix-darwin.expr = ''${flake}.darwinConfigurations.eR17x.options'';
              home-manager.expr = ''${flake}.homeConfigurations."dim@nixos".options'';
              # nixvim.expr = ''${flake}.packages.${system}.nvim.options'';
            };
        };
      };
      load_direnv = "shell_hook";
    };
  };
}
