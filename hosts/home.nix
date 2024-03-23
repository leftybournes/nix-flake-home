{ config, lib, pkgs, user, ... }:

{
  programs.home-manager.enable = true;

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    stateVersion = "24.05";

    packages = with pkgs; [
      # cli tools
      bottom
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
      elixir_1_16
      elixir_ls

      # golang
      go
      gopls

      # php
      php83
      phpactor
      php83Packages.composer

      # python
      python312
      python312Packages.pip
      python312Packages.jedi-language-server

      # ruby
      ruby_3_3
      rubyPackages_3_3.solargraph

      # rust
      cargo
      clippy
      rustc
      rustfmt
      rust-analyzer

      # lua
      lua
      lua-language-server

      # other dev tools
      blueprint-compiler
      dart-sass
      gcc
      nodejs_20
    ];
  };
}
