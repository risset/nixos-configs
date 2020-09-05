{ pkgs, ... }:

{
  networking = {
    hostName = "desktop";
  };

  imports = [
    ../packages/base.nix
    ../packages/desktop.nix
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  fileSystems."/storage" =
    { device = "/dev/disk/by-uuid/0a7885d0-9d2a-4bad-8633-027413341bfc";
      fsType = "ext4";
    };

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware = {
    opengl.driSupport32Bit = true;
    nvidia.modesetting.enable = true;
  };
}
