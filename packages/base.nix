{ config, pkgs, ... }:

{
  config = {
    environment.systemPackages = with pkgs; [
      bat
      bc
      fd
      fzf
      gnupg
      gnumake
      pass
      ripgrep
      rsync
      tmux
      unzip
      wget
    ];
  };
}
