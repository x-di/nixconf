{ pkgs, ... }:
{
  # Virtualization and container configuration
  virtualisation = {
    # Podman container runtime
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
    # Containers support
    containers.enable = true;
  };

  # Flatpak support
  services.flatpak.enable = true;

  # Container tools
  environment.systemPackages = with pkgs; [
    dive
    podman-tui
    podman-compose
  ];
}
