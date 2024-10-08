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
      toolbox
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

      # lua
      lua
      lua-language-server

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
      rubyPackages_3_3.psych

      # rust
      cargo
      clippy
      rustc
      rustfmt
      rust-analyzer

      # swift
      swift
      swiftPackages.swiftpm
      sourcekit-lsp

      # other dev tools
      blueprint-compiler
      dart-sass
      docker-compose
      gcc
      gnumake
      pkg-config
      nodejs_22
      deno
    ];
  };
}
