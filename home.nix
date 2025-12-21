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
    easyeffects
    fragments
    jetbrains.idea-community-bin
    jetbrains.webstorm
    nixd
    openssl
    pavucontrol
    pkg-config
    podman-compose
    rustup
    signal-desktop-bin
    tidal-hifi
    zed-editor
  ];

  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    installBatSyntax = true;
    installVimSyntax = true;  
  };

  programs.starship = {
    enable = true;
  };

  services = {
    syncthing = {
      enable = true;
      tray.enable = true;
    };
  };

  programs.pay-respects.enable = true;

  # home.extraProfileCommands = ''
  #    if [[ -d "$out/share/applications" ]] ; then
  #      ${pkgs.desktop-file-utils}/bin/update-desktop-database $out/share/applications
  #    fi
  #  '';
}
