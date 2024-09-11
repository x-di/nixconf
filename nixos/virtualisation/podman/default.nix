{ pkgs, ... }:
{
  # Enable common container config files in /etc/containers
  virtualisation.containers.enable = false;
  virtualisation = {
    podman = {
      enable = false;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = false;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = false;
    };
  };

  # Useful otherdevelopment tools
  environment.systemPackages = with pkgs; [
    dive # look into docker image layers
    podman-tui # status of containers in the terminal
    docker-compose # start group of containers for dev
    #podman-compose # start group of containers for dev
  ];
}
