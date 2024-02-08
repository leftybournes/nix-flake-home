{ config, lib, pkgs, user, ... }:

{
  programs.home-manager.enable = true;

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    stateVersion = "24.05";

    packages = with pkgs; [
      # cli tools
      chezmoi
      fd
      flatpak-builder
      imagemagick
      ripgrep
      sqlite
      unzip
      yt-dlp
      zip

      # theme
      adw-gtk3

      # static site generators
      hugo
      zola

      # elixir
      elixir_1_15
      elixir_ls

      # php
      php82
      phpactor
      php82Packages.composer

      # python
      python311
      python311Packages.pip

      # ruby
      ruby_3_2
      rubyPackages_3_2.solargraph

      # rust
      cargo
      clippy
      rustc
      rustfmt
      rust-analyzer

      # other dev tools
      blueprint-compiler
      dart-sass
      gcc
      nodejs_20
    ];
  };
}
