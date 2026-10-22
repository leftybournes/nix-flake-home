{
  pkgs,
  lib,
  user,
  ...
}:

{
  imports = [ (import ./hardware.nix) ];

  networking.hostName = "resolute";

  boot.kernelPackages = pkgs.linuxKernel.packages.linux_7_2;
}
