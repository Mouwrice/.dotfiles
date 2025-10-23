{
  description = "An NixOS flake template that you can adapt to your own environment";

  # Flake inputs
  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0"; # Stable Nixpkgs
    determinate = {
      url = "https://flakehub.com/f/DeterminateSystems/determinate/3"; # Determinate 3.*
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  # Flake outputs
  outputs =
    { self, ... }@inputs:
    {
      # A minimal (but updatable!) NixOS configuration output by this flake
      nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
        # Change this if you're building for a system type other than x86 AMD Linux
        system = "x86_64-linux";

        modules = [
          # Load the Determinate module, which provides Determinate Nix
          inputs.determinate.nixosModules.default
          inputs.nixos-hardware.nixosModules.framework-amd-ai-300-series

          # Load the hardware configuration from a separate file (a common convention for NixOS)
          ./hardware-configuration.nix

          ./configuration.nix
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.mouwrice = import ./shared;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];

        specialArgs = {
          # Values to pass to modules
        };
      };
    };
}

