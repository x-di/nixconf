{
  description = "NixOS configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    catppuccin.url = "github:catppuccin/nix";
    nixvim = {
      url = "github:nix-community/nixvim";
      # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs@{ self, nixpkgs, home-manager, nixvim, catppuccin, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hardware-configuration.nix
        ./nixos
        catppuccin.nixosModules.catppuccin
        home-manager.nixosModules.home-manager
        {
          catppuccin = {
            enable = true;
            accent = "lavender"; # Type: one of “blue”, “flamingo”, “green”, “lavender”, “maroon”, “mauve”, “peach”, “pink”, “red”, “rosewater”, “sapphire”, “sky”, “teal”, “yellow”
            flavor = "mocha"; # Type: one of “latte”, “frappe”, “macchiato”, “mocha”
          };
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.sharedModules = [
            nixvim.homeManagerModules.nixvim
            catppuccin.homeManagerModules.catppuccin
          ];
          home-manager.users.xd = (import ./home inputs);
          nix.settings = {
            experimental-features = [ "nix-command" "flakes" ];
          };
        }
      ];
    };
  };
}
