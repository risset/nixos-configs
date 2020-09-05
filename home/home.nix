{ pkgs, lib, ... }:

let
  myName = "risset";
  myFont = "FiraCode Nerd Font";
  myFontSize = 11;
  myXFont = "xft:" + myFont + ":size=" + toString(myFontSize);
  myBg = "#272822";
  myFg = "#f8f8f2";
in
{
  programs.home-manager.enable = true;

  home = {
    stateVersion = "20.09";
    username = myName;
    homeDirectory = "/home/" + myName;
    sessionVariables = {
      EDITOR = "emacsclient -nw";
      TERM = "tmux-256color";
      BROWSER = "firefox";
    };

    file.".emacs.d" = {
      recursive = true;
      source = ./emacs;
    };

    file.".xmonad" = {
      recursive = true;
      source = ./xmonad;
    };

    file.".xmobar".source = ./xmobar;
    file.".config/neofetch/config.conf".source = ./neofetch.conf;
    file.".config/feh/themes".source = ./feh;
    file.".config/beets/config.yaml".source = ./beets.yaml;
    file.".bin".source = ./bin;
  };

  programs = {
    zsh = {
      enable = true;
      enableAutosuggestions = false;
      enableCompletion = true;
      enableVteIntegration = false;
      oh-my-zsh = {
        enable = true;
        plugins = [
          "direnv"
          "sudo"
        ];
      };
      
      plugins = [
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
        {
          name = "powerlevel10k-config";
          src = ./p10k;
          file = "p10k.zsh";
        }
      ];

      shellAliases = {
        l="ls -l";
        e="emacsclient  -nw";
        untar="tar -zxvf";
        serve="python3 -m http.server";
        ghci="nix-shell -p ghc --command ghci";
      };
    };

    dircolors = {
      enable = true;
      enableZshIntegration = true;
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      enableNixDirenvIntegration = true;
    };

    tmux = {
      enable = true;
      baseIndex = 1;
      shortcut = "a";
      terminal = "tmux-256color";
      tmuxinator.enable = true;
      disableConfirmationPrompt = true;
      escapeTime = 0;
      extraConfig = "
      set -g status-left ''
      set -g status-right ''
      set -g status-justify centre
      setw -g window-status-format ' [#I] #[fg=colour237]#[fg=colour250]#W#[fg=colour244] '
      setw -g window-status-current-format ' [#I] #[fg=colour237]#[fg=colour250]#W#[fg=colour244] '
      setw -g window-status-current-style 'fg=colour1 bg=colour0 bold'
      set -g status-style 'bg=colour0 fg=colour15 dim'
      ";
      plugins = with pkgs; [
        tmuxPlugins.cpu
        {
          plugin = tmuxPlugins.resurrect;
        }
        {
          plugin = tmuxPlugins.continuum;
        }
      ];
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    git = {
      enable = true;
      userName = "Liam Wyllie";
      userEmail = "risset@mailbox.org";
      ignores = [
        "*~"
        "*.swp"
      ];
    };

    htop = {
      enable = true;
      hideThreads = true;
      hideKernelThreads = true;
      treeView = true;
    };

    urxvt = {
      enable = true;
      scroll.bar.enable = false;
      fonts = [
        myXFont
        "xft:Source Han Sans:size=11"
      ];
      extraConfig = {
        background = "rgba:2700/2800/2200/f000";
        depth = 32;
        foreground = myFg;
        cursorColor = myFg;
        cursorBlink = 1;
        cursorUnderline = 1;
        color0 = myBg;
        color1 = "#f92672";
        color2 = "#a6e22e";
        color3 = "#f4bf75";
        color4 = "#66d9ef";
        color5 = "#ae81ff";
        color6 = "#a1efe4";
        color7 = "#f8f8f2";
        color8 = "#75715e";
        color9 = "#f92672";
        color10 = "#a6e22e";
        color11 = "#f4bf75";
        color12 = "#66d9ef";
        color13 = "#ae81ff";
        color14 = "#a1efe4";
        color15 = "#f9f8f5";
      };
    };

    mpv = {
      enable = true;
      config = {
        profile = "gpu-hq";
      };
    };

    ncmpcpp = {
      enable = true;
      bindings = [
        { key = "j"; command = "scroll_down"; }
        { key = "k"; command = "scroll_up"; }
        { key = "J"; command = "scroll_down_album"; }
        { key = "K"; command = "scroll_up_album"; }
        { key = "x"; command = "delete_playlist_items"; }
        { key = "g"; command = "move_home"; }
        { key = "G"; command = "move_end"; }
      ];
      
      settings = {
        ncmpcpp_directory = "~/.local/share/ncmpcpp"; 
        mpd_connection_timeout = "5";
        mpd_crossfade_time = "5";
        user_interface = "alternative";
        alternative_header_first_line_format = "$2{%a} $9{-} $6{%b}";
        alternative_header_second_line_format = "$b$9{%t}";
        song_columns_list_format = "(30)[6]{a} (40)[9]{t|f:Title} (40)[10]{b} (7f)[9]{l}";
        playlist_show_remaining_time = "yes";
        header_visibility = "no";
        statusbar_visibility = "yes";
        titles_visibility = "no";
        display_bitrate = "yes";
        display_volume_level = "no";
        mouse_support = "yes";
        progressbar_look = "━━";
        colors_enabled = "yes";
        volume_color = "255";
        main_window_color = "245";
        progressbar_color = "240";
        progressbar_elapsed_color = "2";
        statusbar_time_color = "250";
        player_state_color = "6";
      };
    };

    neovim = {
      enable = true;
      plugins = [
        pkgs.vimPlugins.vim-monokai
      ];
      extraConfig = ''
        colorscheme monokai
      '';
    };

    emacs = {
      enable = true;
    };

    zathura = {
      enable = true;
      options = {
        font = myFont + " 11";
        default-bg = myBg;
        recolor-darkcolor = "#FFFFFF";
        recolor-lightcolor = "#333333";
        statusbar-fg = "#f8f8f2";
        statusbar-bg = myBg;
        inputbar-fg = "#75715e";
        inputbar-bg = myBg;
        completion-highlight-fg = "#a6e22e";
        completion-highlight-bg = "#272722";
        notification-fg = "#FFFFFF";
        notification-bg  ="#333333";
      };
    };

    rofi = {
      enable = true;
      font = myFont + " 11";
      theme = "Monokai";
    };

    firefox = {
      enable = true;
      profiles = {
        myprofile = {
          settings = {
            "browser.startup.homepage" = "https://nixos.org";
          };

          userContent = ''
              *{scrollbar-width:none !important}
          '';
          
          userChrome = ''
              menubar, menubutton, menulist, menu, menuitem, textbox, toolbar, tab, tree, tooltip
              {
                  font-family: "Terminus" !important;
                  font-size: 8pt !important;
              }
        
              /* hide all toolbars */
              #nav-bar:not([customizing="true"]):not([inFullscreen]) {
                  min-height: 1px !important;
                  max-height: 0px !important;
                  margin-top: 1px !important;
                  margin-bottom: -1px !important;
                  transition: all 50ms linear 0s !important;
                  z-index: -5 !important;
      }
        
              #urlbar {
                  --urlbar-toolbar-height: 32px !important;
      }
        
              #TabsToolbar {
                  visibility: collapse !important;
              }
          '';
        };
      };
    };
  };

  xresources.properties = {
    "Xft.dpi" = 100;
    "Xft.antialias" = true;
    "Xft.autohint" = true;
    "Xft.rgba" = "rgb";
    "Xft.hinting" = true;
    "Xft.hintstyle" = "hintslight";
    "Xft.lcdfilter" = "lcddefault";
  };

  services = {
    mpd = {
      enable = true;
      musicDirectory = "/storage/music";
      extraConfig = ''
        audio_output {
            type "pulse"
            name "pulseaudio output"
            server "127.0.0.1"
        }
        '';
    };

    picom = {
      enable = true;
      vSync = true;
      backend = "xrender";
    };

    emacs = {
      enable = true;
    };

    dunst = {
      enable = true;

      settings = {
        global = {
          format = "<b>%s</b>\\n%b";
          geometry = "500x5-20+20";
          transparency = 70;
          fame_width = 5;
          frame_color = "#000000";
          font = myFont + " 11";
        };

        urgency_normal = {
          timeout = 5;
          background = myFg;
          foreground = myBg;
        };
      };
    };

    screen-locker = {
      enable = true;
      lockCmd = "slock";
    };

    syncthing = {
      enable = true;
    };

    unclutter = {
      enable = true;
    };
  };

  xsession = {
    enable = true;
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
    };
    profileExtra = ''
        export GTK_IM_MODULE=fcitx
        export QT_IM_MODULE=fcitx
        export XMODIFIERS=@im=fcitx
        fcitx &
    '';
  };
}
