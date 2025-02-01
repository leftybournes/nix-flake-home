{ config, pkgs, lib, ... }:

{
  services = {
    dbus.packages = with pkgs; [ gnome2.GConf ];
    udev.packages = with pkgs; [ gnome-settings-daemon ];

    gnome = {
      core-developer-tools.enable = true;
      gnome-keyring.enable = true;
    };

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
      gnome-themes-extra
      gnomeExtensions.gsconnect
    ];
  };

}
