# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, inputs, user, username, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    plymouth.enable = true;
  };

  zramSwap.enable = true;
  networking.networkmanager.enable = true;
  sound.enable = false;

  time.timeZone = "Asia/Manila";
  i18n.defaultLocale = "en_US.UTF-8";

  security.rtkit.enable = true;

  services = {
    flatpak.enable = true;
    dbus.packages = with pkgs; [ gnome2.GConf ];
    udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];

    xserver = {
      enable = true;
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      wireplumber.enable = true;
    };

    gnome = {
      core-developer-tools.enable = true;
      gnome-keyring.enable = true;
    };
  };

  users.users.${user} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.fish;
  };

  programs = {
    seahorse.enable = true;
    fish.enable = true;
    dconf.enable = true;
  };

  fonts = {
    fontDir.enable = true;

    fonts = with pkgs; [
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
      neovim
      # wget
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
    libvirtd.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
    };
  };

  system.stateVersion = "23.05";

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
}

