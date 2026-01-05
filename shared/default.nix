{ pkgs, ... }:

{

  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    bat
    fastfetch
    gh
    kitty
    nix-search-cli
    nixd
    sbt
    nvd
    presenterm
  ];

  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    fish = {
      enable = true;
      generateCompletions = true;
      shellInit = ''
      fish_config theme choose "ayu Dark"
        '';
    };

    git = {
      enable = true;
      lfs.enable = true;
    };

    kitty = {
      enable = true;
      shellIntegration.enableFishIntegration = true;
      settings = {
        shell = "fish";
      };
    };

    nh = {
      enable = true;
      clean.enable = true;
    };

    pay-respects.enable = true;

    starship = {
      enable = true;
      settings = {
        # "$schema" = 'https://starship.rs/config-schema.json'
        command_timeout = 2000;
      };
    };



    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
