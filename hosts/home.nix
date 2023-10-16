{ config, lib, pkgs, user, ... }:

{
  programs.home-manager.enable = true;

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    stateVersion = "23.05";

    packages = with pkgs; [
      # cli tools
      gcc
      chezmoi
      dart-sass
      elixir
      elixir_ls
      fd
      flatpak-builder
      hugo
      imagemagick
      php
      phpactor
      phpPackages.composer
      python3
      python3Packages.pip
      nodejs
      ripgrep
      ruby
      unzip
      yt-dlp
      zip
      zola

      # gui
      adw-gtk3

      # rust
      cargo
      clippy
      rustc
      rustfmt
      rust-analyzer
    ];
  };
}
