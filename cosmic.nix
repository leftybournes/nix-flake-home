{ config, pkgs, lib, ... }:

{
  services.desktopManager.cosmic.enable = true;

  xdg = {
    portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      config.common.default = "gtk";
    };
  };
}
