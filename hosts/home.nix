{ config, lib, pkgs, user, ... }:

{
  programs.home-manager.enable = true;

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    stateVersion = "23.05";

    packages = with pkgs; [
      # cli tools
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

      # desktop apps
      adw-gtk3
      amberol
      celluloid
      fragments
      gnome-builder
      gnome-connections
      gnome-podcasts
      mpv
      virt-manager

      # rust
      cargo
      clippy
      rustc
      rustfmt
      rust-analyzer
    ];
  };
}
