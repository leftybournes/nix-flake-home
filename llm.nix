{
  config,
  pkgs,
  lib,
  inputs,
  user,
  username,
  ...
}:
{
  services.ollama = {
    enable = true;
    package = pkgs.ollama-vulkan;
  };
}
