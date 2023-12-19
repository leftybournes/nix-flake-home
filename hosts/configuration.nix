# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, inputs, user, username, ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    plymouth.enable = true;
  };

  networking = {
    networkmanager.enable = true;

    firewall = {
      # TCP Ports
      # - 7236 and 7250 for GNOME NetworkDisplays
      # - 1900 for GNOME Media Sharing (rygel)
      # UDP Ports
      # - 7236 and 5363 for GNOME NetworkDisplays
      # - 1900 for GNOME Media Sharing (rygel)
      allowedTCPPorts = [7236 7250 1900];
      allowedUDPPorts = [7236 5363 1900];
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

    syncthing = {
      enable = true;
      user = "${user}";
      configDir = "/home/${user}/.config/syncthing";
      dataDir = "/home/${user}/.config/synthing/db";
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
    extraGroups = [ "wheel" "networkmanager" "docker" ];
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

    opengl = {
      driSupport = true;
      driSupport32Bit = true;

      extraPackages = with pkgs; [
        amdvlk
      ];
    };
  };

  environment = {
    variables.AMD_VULKAN_ICD = "RADV";
    shells = with pkgs; [ fish bash ];

    systemPackages = with pkgs; [
      git
      emacs29-pgtk
      gnome.gnome-tweaks
      gnome.gnome-themes-extra
      vim
      wget
      wl-clipboard
    ];

    gnome.excludePackages = (with pkgs; [
      gnome-connections
      gnome-photos
    ]) ++ (with pkgs.gnome; [
      cheese
      epiphany
      geary
      gnome-maps
      gnome-music
      gnome-software
      totem
    ]);
  };

  virtualisation = {
    waydroid.enable = true;
    lxd.enable = true;
    docker = {
      enable = true;
      storageDriver = "btrfs";

      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };

  system.stateVersion = "24.05";

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
}

