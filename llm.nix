{
  config,
  pkgs,
  lib,
  inputs,
  user,
  username,
  hermes-agent,
  ...
}:
{
  environment.sessionVariables = rec {
    OLLAMA_CONTEXT_LENGTH = "64000";
  };

  sops = {
    defaultSopsFile = ./secrets/hermes.yaml;
    age.keyFile = "/home/${user}/.config/sops/age/keys.txt";
    secrets."hermes-env" = { format = "yaml"; };
  };

  services = {
    hermes-agent = {
      enable = true;
      environmentFiles = [ config.sops.secrets."hermes-env".path ];
      addToSystemPackages = true;
    };

    ollama = {
      enable = true;
      package = pkgs.ollama-vulkan;
    };
  };
}
