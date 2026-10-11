{
  pkgs,
  lib,
  user,
  ...
}:

{
  imports = [ (import ./hardware.nix) ];

  networking.hostName = "resolute";

  environment.systemPackages = with pkgs; [
    linuxPackages.tuxedo-drivers
  ];
}
