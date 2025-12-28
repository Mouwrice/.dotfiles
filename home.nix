{
  pkgs,
  ...
}:

{

  imports = [ ./shared ];

  home.username = "mouwrice";
  home.homeDirectory = "/home/mouwrice";

  programs.home-manager.enable = true;
  programs.home-manager.path = "/home/mouwrice/.dotfiles/";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    android-studio
    antigravity-fhs
    bat
    beeper
    carla
    easyeffects
    fragments
    jetbrains.idea
    jetbrains.rust-rover
    jetbrains.webstorm
    ledfx
    nixd
    openssl
    pavucontrol
    pkg-config
    podman-compose
    qjackctl
    qpwgraph
    rustup
    signal-desktop-bin
    tidal-hifi
    zed-editor
  ];

  services = {
    syncthing = {
      enable = true;
      tray.enable = true;
    };
  };
}
