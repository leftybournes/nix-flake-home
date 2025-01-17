{ config, lib, pkgs, user, ... }:

{
  programs.home-manager.enable = true;

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    stateVersion = "24.11";

    packages = with pkgs; [
      # cli tools
      bottom
      chezmoi
      fd
      flatpak-builder
      imagemagick
      ripgrep
      toolbox
      unzip
      yt-dlp
      zip

      # database tools
      mariadb_114
      postgresql
      sqlite

      # theme
      adw-gtk3

      # static site generators
      hugo
      zola

      # elixir
      elixir
      elixir_ls

      # lua
      lua
      lua-language-server

      # golang
      go
      gopls

      # php
      php84
      phpactor
      php84Packages.composer

      # python
      python313
      python313Packages.pip
      python313Packages.jedi-language-server

      # ruby
      ruby_3_4
      rubyPackages_3_4.solargraph
      rubyPackages_3_4.psych
      rubyPackages_3_4.rubocop

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
      nodejs_23
      deno
    ];
  };
}
