{
  config,
  pkgs,
  lib,
  inputs,
  user,
  ...
}:

{
  services = {
    displayManager.cosmic-greeter.enable = true;
    desktopManager.cosmic.enable = true;
  };
}
