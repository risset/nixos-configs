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

  hardware = {
    opengl = {
      driSupport32Bit = true;
      extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
    };
    nvidia.modesetting.enable = true;
  };

  services = {
    xserver.videoDrivers = [ "nvidia" ];

    postgresql = {
      enable = true;
    };

    mongodb = {
      enable = true;
    };
  };
}
