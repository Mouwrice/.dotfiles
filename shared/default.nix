{ pkgs, ... }:

{

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    fastfetch
    nixd
    bat
    sbt
    nvd
    presenterm
  ];

  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs = {
    git = {
      enable = true;
      lfs.enable = true;
    };

    fish = {
      enable = true;
      generateCompletions = true;
      shellInit = ''
      fish_config theme choose "ayu Dark"
        '';
    };

    starship = {
      enable = true;
      settings = {
        # "$schema" = 'https://starship.rs/config-schema.json'
        command_timeout = 2000;
      };
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
