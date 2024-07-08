# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  lib,
  pkgs,
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

  networking = {
    networkmanager.enable = true;

    firewall = {
      # TCP Ports
      # - 7236 and 7250 for GNOME NetworkDisplays
      # - 1900 for GNOME Media Sharing (rygel)
      # - 27040 for Steam local network game transfers
      # - 1714-1764 for GSConnect/KDE Connect
      # UDP Ports
      # - 7236 and 5363 for GNOME NetworkDisplays
      # - 1900 for GNOME Media Sharing (rygel)
      # - 27031-27036 for Steam local network game transfers
      # - 1714-1764 for GSConnect/KDE Connect
      allowedTCPPorts = [
        7236
        7250
        1900
        27040
      ];
      allowedUDPPorts = [
        7236
        5363
        1900
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
  sound.enable = false;

  time.timeZone = "Asia/Manila";
  i18n.defaultLocale = "en_GB.UTF-8";

  security.rtkit.enable = true;

  services = {
    dbus.packages = with pkgs; [ gnome2.GConf ];
    flatpak.enable = true;
    tailscale.enable = true;
    udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];

    gnome = {
      core-developer-tools.enable = true;
      gnome-keyring.enable = true;
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      wireplumber.enable = true;
    };

    xserver = {
      enable = true;
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
    };
  };

  users.users.${user} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    shell = pkgs.fish;
  };

  programs = {
    seahorse.enable = true;
    fish.enable = true;
    dconf.enable = true;
  };

  fonts = {
    fontDir.enable = true;

    packages = with pkgs; [
      cantarell-fonts
      source-code-pro
    ];
  };

  hardware = {
    pulseaudio.enable = false;
    graphics = {
      enable32Bit = true;
      extraPackages = with pkgs; [ amdvlk ];
    };
  };

  environment = {
    variables.AMD_VULKAN_ICD = "RADV";
    shells = with pkgs; [
      fish
      bash
    ];

    systemPackages = with pkgs; [
      git
      emacs29-pgtk
      gnome-tweaks
      gnome-themes-extra
      gnomeExtensions.gsconnect
      nixfmt-rfc-style
      neovim
      wget
      wl-clipboard
    ];

    gnome.excludePackages =
      (with pkgs; [
        gnome-connections
        gnome-photos
        gnome-builder
        cheese
        epiphany
        geary
        totem
      ])
      ++ (with pkgs.gnome; [
        gnome-maps
        gnome-music
      ]);
  };

  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.enabled = true;
    };
  };

  system.stateVersion = "24.05";

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than +5";
    };

    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
