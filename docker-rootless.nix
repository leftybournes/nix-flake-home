{
  config,
  pkgs,
  lib,
  inputs,
  user,
  ...
}:
{
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";

    rootless = {
      enabled = true;
      setSocketVariable = true;
    };
  };
}
