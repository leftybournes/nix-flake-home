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
      docker-compose
      elixir
      fd
      flatpak-builder
      php
      phpPackages.composer
      python3
      python3Packages.pip
      nodejs
      ripgrep
      ruby
      rustc
      rust-analyzer
      unzip
      zip
    ];
  };
}
