{
  description = "An NixOS flake template that you can adapt to your own environment";

  # Flake inputs
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # Stable Nixpkgs
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
    { self, nixpkgs, home-manager, nixos-hardware, determinate, ... }:
    {
      # A minimal (but updatable!) NixOS configuration output by this flake
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        # Change this if you're building for a system type other than x86 AMD Linux
        system = "x86_64-linux";

        modules = [
          # Load the Determinate module, which provides Determinate Nix
          determinate.nixosModules.default
          nixos-hardware.nixosModules.framework-amd-ai-300-series

          # Load the hardware configuration from a separate file (a common convention for NixOS)
          ./hardware-configuration.nix

          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.mouwrice = import ./home.nix;
          }
        ];

        specialArgs = {
          # Values to pass to modules
        };
      };
    };
}

