{ config, pkgs, lib, ... }:

{
  config = {
    environment.etc."current-system-packages".text =
      let
        packages = builtins.map (p: "${p.name}") config.environment.systemPackages;
        sortedUnique = builtins.sort builtins.lessThan (lib.unique packages);
        formatted = builtins.concatStringsSep "\n" sortedUnique;
      in
        formatted;

    environment.systemPackages = with pkgs; [
      steam
      audacity
      acpi
      anki
      beets
      cava
      discord
      emacs
      dunst
      feh
      ffmpeg-full
      gimp
      glxinfo
      haskellPackages.xmobar
      libwebp
      libnotify
      maim
      mpd
      mpc_cli
      neofetch
      p7zip
      pandoc
      pulsemixer
      pavucontrol
      rofi-mpd
      rofi-pass
      rofi-systemd
      slock
      supercollider_scel
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
        noto-fonts-cjk
        terminus_font
      ];

      fontconfig = {
        enable = true;
        defaultFonts = {
          monospace = [
            "FiraCode Nerd Font"
            "Noto Sans Mono CJK JP Regular"
          ];
          sansSerif = [
            "Source Sans Pro"
            "Noto Sans CJK JP Regular"
          ];
          serif = [
            "Source Sans Pro"
            "Noto Sans CJK JP Regular"
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

      #   jack = {
      #     jackd = {
      #       enable = true;
      #       extraOptions = [ "-dalsa" "-dhw:2" "-r48000" "-p1024" "-n2" ];
      #     };
      #   };
      # };

      # systemd = {
      #   services = {
      #     jack.serviceConfig.SupplementaryGroups = [ "users" ];
      #   };
      #   user = {
      #     services.pulseaudio.environment.JACK_PROMISCUOUS_SERVER = "jackaudio";
      #   };
      # };
    };
  };
}
