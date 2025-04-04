{
  config,
  pkgs,
  lib,
  inputs,
  user,
  ...
}:
{
  virtualisation.podman = {
    defaultNetwork.settings.dns_enabled = true;
    dockerCompat = true;
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    docker-compose
    toolbox
  ];
}
