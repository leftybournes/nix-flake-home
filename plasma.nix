{
  config,
  pkgs,
  lib,
  ...
}:

{
  environment = {
    variables = {
      SSH_ASKPASS_REQUIRE = "prefer";
    };

    plasma6.excludePackages = with pkgs.kdePackages; [
      elisa
    ];

    systemPackages = with pkgs; [
      kdePackages.kdeconnect-kde
      kdePackages.ksshaskpass
      kdePackages.yakuake
    ];
  };

  hardware = {
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
  };

  security = {
    pam = {
      services = {
        login = {
          kwallet = {
            enable = true;
          };
        };
      };
    };
  };

  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
  };
}
