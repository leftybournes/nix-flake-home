{
  config,
  pkgs,
  lib,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    linuxKernel.packages.linux_7_3.tuxedo-drivers
  ];

  hardware.tuxedo-rs = {
    enable = true;
    tailor-gui.enable = true;
  };
}
