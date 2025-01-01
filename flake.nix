{
  description = "Home Manager configuration of mouwrice";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    envycontrol.url = github:bayasdev/envycontrol;
  };

  outputs = { nixpkgs, home-manager, envycontrol, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."mouwrice" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit envycontrol; };
        modules = [ ./home.nix ];
      };
    };
}
