{ config, pkgs, lib, nix, ... }:

{
  imports = [
    ./packages/base.nix
  ];

  config = {
    system.stateVersion = "20.03"; 

    users.users.risset = {
      isNormalUser = true;
      extraGroups = [ "wheel" "audio" ];
      group = "users";
      shell = pkgs.zsh;
    };

    environment = {
      pathsToLink = [ "/share/zsh" ];
      variables = {
        GOPATH = "/home/risset/.go";
        GOROOT = [ "${pkgs.go.out}/share/go" ];
      };
    };

    i18n.defaultLocale = "ja_JP.UTF-8";
    time.timeZone = "Europe/London";
    console = {
      font = "Lat2-Terminus16";
      useXkbConfig = true; 
    };

    security.sudo = {
      enable = true;
      wheelNeedsPassword = false;
    };

    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    nixpkgs.config.allowUnfree = true;

    services = {
      openssh.enable = true;
    };
  };
}
