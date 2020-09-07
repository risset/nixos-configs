{ config, pkgs, ... }:

{
  config = {
    environment.systemPackages = with pkgs; [
      acpi
      anki
      beets
      cava
      discord
      dunst
      feh
      ffmpeg
      gimp
      glxinfo
      haskellPackages.xmobar
      ibus
      jack2
      libjack2
      libnotify
      maim
      mpc_cli
      ncmpcpp
      neofetch
      netpbm
      pulsemixer
      rofi-file-browser
      rofi-mpd
      rofi-pass
      rofi-systemd
      slock
	    steam
      supercollider_scel
      xbanish
      xclip
      youtube-dl
    ];

    programs = {
      slock = {
        enable = true;
      };
    };

    fonts = {
      enableFontDir = true;
      fonts = with pkgs; [
        nerdfonts
        emacs-all-the-icons-fonts
        source-code-pro
        source-sans-pro
        source-han-sans
        terminus_font
      ];

      fontconfig = {
        enable = true;
        defaultFonts = {
          monospace = [
            "FiraCode Nerd Font"
            "Source Han Sans"
          ];
          sansSerif = [
            "Source Sans Pro"
            "Source Han Sans"
          ];
          serif = [
            "Source Sans Pro"
            "Source Han Sans"
          ];
        };
      };
    };

    # Input
    i18n.inputMethod = {
      enabled = "fcitx";
      fcitx.engines = with pkgs.fcitx-engines; [
        mozc
      ];
    };

    # Sound
    sound.enable = true;
    hardware.pulseaudio = {    
      enable = true;
      support32Bit = true;
      extraConfig = "load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1";
      package = pkgs.pulseaudio.override {
        jackaudioSupport = true;
      };
    };

    # Services
    services = {
      xserver = {
        enable = true;

        windowManager.xmonad = {
          enable = true;
          enableContribAndExtras = true;
        };

        displayManager = {
          defaultSession = "none+xmonad"; 
          lightdm = {
            enable = true;
            greeters.mini = {
              enable = true;
              user = "risset";
              extraConfig = ''
                [greeter]
                show-password-label = false
                [greeter-theme]
                background-image = "/storage/images/wallpapers/desktop/aya_1200.png"
              '';
            };
          };
        };
      };

      urxvtd = {
        enable = true;
      };
    };
  };
}
