{ pkgs, lib, user, ... }:

{
  imports = [ (import ./hardware.nix) ];

  networking.hostName = "death-star";
}
