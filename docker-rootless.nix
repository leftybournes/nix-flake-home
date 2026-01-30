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
    storageDriver = "btrfs";

    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}
