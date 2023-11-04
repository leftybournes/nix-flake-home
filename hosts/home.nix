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
      elixir_1_15
      elixir_ls
      fd
      flatpak-builder
      hugo
      imagemagick
      php82
      phpactor
      php82Packages.composer
      podman
      python311
      python311Packages.pip
      nodejs_20
      ripgrep
      ruby_3_2
      rubyPackages_3_2.solargraph
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
