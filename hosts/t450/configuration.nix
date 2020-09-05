{ pkgs, ... }:

{
  imports = [
    ../packages/base.nix
    ../packages/dev.nix
    ../packages/desktop.nix
  ];

  networking = {
    hostName = "t450";
  };

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  services.xserver = {
    synaptics.enable = true;
    xkbOptions = "caps:swapescape";
  };
    
  musnix.kernel = {
    realtime = true;
    optimize = true;
  };
}
