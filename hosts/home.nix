{ config, lib, pkgs, user, ... }:

{
  programs.home-manager.enable = true;

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    stateVersion = "23.05";

    packages = with pkgs; [
      cargo
      chezmoi
      clippy
      elixir_1_14
      docker-compose
      fd
      flatpak-builder
      php
      php81Packages.composer
      python3
      python3Packages.pip
      nodejs
      ripgrep
      ruby_3_1
      rustc
      rust-analyzer
      unzip
      vlc
      zip
    ];
  };
}
