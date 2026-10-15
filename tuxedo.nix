{
  config,
  pkgs,
  lib,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    linuxPackages.tuxedo-drivers
  ];

  hardware.tuxedo-rs = {
    enable = true;
    tailor-gui.enable = true;
  };
}
