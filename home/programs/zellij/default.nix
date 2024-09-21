{ ... }:
{
  programs = {
    zellij = {
      enable = false;
      enableFishIntegration = true;
      settings = {
        copy_command = "wl-copy";
        default_layout = "compact";
        default_shell = "fish";
        pane_frames = false;
        simplified_ui = true;
        plugins = {
          tab-bar.path = "tab-bar";
          status-bar.path = "status-bar";
          strider.path = "strider";
          compact-bar.path = "compact-bar";
        };
        ui = {
          pane_frames = {
            hide_session_name = true;
            rounded_corners = false;
          };
        };
      };
    };
  };
}
