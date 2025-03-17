{ config, pkgs, lib, ... }:

{
  services = {
    dbus.packages = with pkgs; [ gnome2.GConf ];
    udev.packages = with pkgs; [ gnome-settings-daemon ];

    gnome = {
      core-developer-tools.enable = true;
      gnome-keyring.enable = true;
    };

    sysprof.enable = true;

    xserver = {
      enable = true;
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
    };
  };

  environment = {
    gnome.excludePackages = with pkgs; [
      cheese
      epiphany
      evince
      geary
      gnome-builder
      gnome-connections
      gnome-maps
      gnome-music
      gnome-photos
      totem
    ];

    systemPackages = with pkgs; [
      adwaita-icon-theme
      gnome-themes-extra
      gnome-tweaks
      gnomeExtensions.gsconnect
    ];
  };

  networking = {
    firewall = {

      # TCP Ports
      # - 7236 and 7250 for GNOME NetworkDisplays
      # - 1900 for GNOME Media Sharing (rygel)
      # UDP Ports
      # - 7236 and 5363 for GNOME NetworkDisplays
      # - 1900 for GNOME Media Sharing (rygel)

      allowedTCPPorts = [
        7236
        7250
        1900
      ];

      allowedUDPPorts = [
        7236
        5363
        1900
      ];
    };
  };
}
