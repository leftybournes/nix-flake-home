{ config, lib, pkgs, user, ... }:

{
  programs.home-manager.enable = true;

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    stateVersion = "24.05";

    packages = with pkgs; [
      # cli tools
      blueprint-compiler
      chezmoi
      dart-sass
      elixir_1_15
      elixir_ls
      fd
      flatpak-builder
      gcc
      hugo
      imagemagick
      php82
      phpactor
      php82Packages.composer
      python311
      python311Packages.pip
      nodejs_20
      ripgrep
      ruby_3_2
      rubyPackages_3_2.solargraph
      sqlite
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
