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
      lsof
      inotify-tools
      pass
      ripgrep
      rsync
      tmux
      unzip
      wget
    ];
  };
}
