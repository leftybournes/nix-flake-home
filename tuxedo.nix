{
  config,
  pkgs,
  lib,
  ...
}:

{
  hardware.tuxedo-rs = {
    enable = true;
    tailor-gui.enable = true;
  };
}
