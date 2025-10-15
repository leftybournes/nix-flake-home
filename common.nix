{
  config,
  pkgs,
  lib,
  inputs,
  user,
  username,
  ...
}:
{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    plymouth.enable = true;
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "hplipWithPlugin"
    ];
  };
      
  networking = {
    networkmanager.enable = true;

    firewall = {

      # TCP Ports
      # - 27040 for Steam local network game transfers
      # - 53317 for localsend
      # - 1714-1764 for GSConnect/KDE Connect
      # UDP Ports
      # - 53317 for localsend
      # - 27031-27036 for Steam local network game transfers
      # - 1714-1764 for GSConnect/KDE Connect

      allowedTCPPorts = [
        27040
        53317
      ];
      allowedUDPPorts = [
        53317
      ];
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
      allowedUDPPortRanges = [
        {
          from = 27031;
          to = 27036;
        }
        {
          from = 1714;
          to = 1764;
        }
      ];
    };
  };

  zramSwap.enable = true;

  time.timeZone = "Asia/Manila";
  i18n.defaultLocale = "en_GB.UTF-8";
  security.rtkit.enable = true;

  services = {
    flatpak.enable = true;
    fwupd.enable = true;
    pulseaudio.enable = false;
    tailscale.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      wireplumber.enable = true;
    };

    printing = {
      enable = true;
      drivers = [ pkgs.hplipWithPlugin ];
    };
  };

  users.users.${user} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [
      "adbusers"
      "lp"
      "networkmanager"
      "scanner"
      "wheel"
      "${user}"
    ];
    shell = pkgs.fish;
  };

  programs = {
    adb.enable = true;
    dconf.enable = true;
    fish.enable = true;
    seahorse.enable = true;
    nix-ld.enable = true;
  };

  fonts = {
    fontDir.enable = true;

    packages = with pkgs; [
      cantarell-fonts
      source-code-pro
      inter
    ];
  };

  hardware = {
    graphics = {
      enable32Bit = true;
    };

    sane = {
      enable = true;

      extraBackends = [ pkgs.hplipWithPlugin ];
    };
  };

  environment = {
    shells = with pkgs; [
      fish
      bash
    ];

    systemPackages = with pkgs; [
      # administrator tools
      bottom
      chezmoi
      fd
      flatpak-builder
      git
      imagemagick
      neovim
      nixfmt-rfc-style
      ripgrep
      unzip
      wget
      wl-clipboard
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

      # libraries
      libheif
      mtpfs

      # lua
      lua
      lua-language-server

      # golang
      go
      gopls

      # php
      php84
      php84Packages.composer
      php84Extensions.xdebug
      phpactor
      phpunit

      # python
      python313
      python313Packages.pip
      python313Packages.jedi-language-server

      # ruby
      ruby_3_4
      rubyPackages_3_4.solargraph
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

      # other tools
      act
      blueprint-compiler
      dart-sass
      deno
      emacs-pgtk
      gcc
      ghostty
      gnumake
      jq
      ledger
      nodejs_24
      pkg-config
    ];
  };

  virtualisation = {
    containers.enable = true;
    waydroid.enable = true;
  };

  system.stateVersion = "25.05";

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than +5";
    };

    settings = {
      auto-optimise-store = true;
      download-buffer-size = 524288000;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
