{ pkgs, ... }:

{

  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    fastfetch
    gh
    kitty
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

  home.file = {
    ".config/ghostty/config".text = ''
      font-family = JetBrainsMono Nerd Font Mono
      font-size = 15
      theme = Monokai Remastered
      background-opacity = 0.7
      background-blur = 30
      link-url = true
      window-padding-x = 12
      window-padding-y = 12
      window-save-state = always
      macos-option-as-alt = true
      auto-update = off
    '';
  };
}
