{ config, lib, pkgs, user, ... }:

{
  programs.home-manager.enable = true;

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    stateVersion = "22.11";

    packages = with pkgs; [
      chezmoi
      fd
      ripgrep
      unzip
      vlc
      zip
    ];
  };
}
