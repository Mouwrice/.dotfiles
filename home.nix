{
  pkgs,
  envycontrol,
  ...
}:

{

  targets.genericLinux.enable = true;

   nixpkgs.config.allowUnfree = true;

  home.username = "mouwrice";
  home.homeDirectory = "/home/mouwrice";

  programs.home-manager.enable = true;
#  programs.home-manager.path = "/home/mouwrice/.dotfiles/";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = [
    pkgs.rustup
    pkgs.pkg-config
    pkgs.openssl
    pkgs.podman-compose
    pkgs.nixd
    pkgs.bat
#    envycontrol.packages.x86_64-linux.default
#    pkgs.haskellPackages.aura
  ];

  programs.zsh = {
    enable = true;
    autocd = true;
    shellAliases = {
      hm = "home-manager --flake /home/mouwrice/.dotfiles/";
    };
  };


  programs.starship = {
    enable = true;
  };

  programs.pay-respects.enable = true;



  home.file = {
  };

  home.sessionVariables = {
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  };

  home.extraProfileCommands = ''
      if [[ -d "$out/share/applications" ]] ; then
        ${pkgs.desktop-file-utils}/bin/update-desktop-database $out/share/applications
      fi
    '';
}
