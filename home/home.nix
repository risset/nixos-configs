{ pkgs, lib, ... }:

let
  name = "risset";

  ui = {
    font = "FiraCode Nerd Font";
    jpFont = "Noto Sans Mono CJK JP";
    fontSize = 11;
    bg = "#272822";
    fg = "#fafafa";
    xFont = toXFont ui.font ui.fontSize;
    jpXFont = toXFont ui.jpFont ui.fontSize;
  };

  toXFont = font: size: "xft:" + font + ":size=" + toString(size);
in
{
  home = {
    stateVersion = "20.09";
    username = name;
    homeDirectory = "/home/" + name;
    sessionVariables = {
      EDITOR = "emacsclient -nw";
      BROWSER = "firefox";
    };

    # configurations not managed by home-manager
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
  };

  programs = {
    home-manager = {
      enable = true;
    };

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
          "docker"
          "node"
          "golang"
          "colored-man-pages"
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
        e="emacsclient -nw";
        v="nvim";
        untar="tar -zxvf";
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

    ssh = {
      enable = true;
      matchBlocks = {
        "seedbox" = {
          hostname = "boat.seedhost.eu";
          user = "lrwz";
        };
      };
    };

    tmux = {
      enable = true;
      baseIndex = 1;
      escapeTime = 0;
      shortcut = "a";
      terminal = "tmux-256color";
      tmuxinator.enable = true;
      disableConfirmationPrompt = true;
      extraConfig = "
        set-option -g renumber-windows on
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
        ".direnv"
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
        ui.xFont
        ui.jpXFont
      ];
      extraConfig = {
        background = "rgba:2700/2800/2200/f000";
        depth = 32;
        foreground = ui.fg;
        cursorColor = ui.fg;
        cursorBlink = 1;
        cursorUnderline = 1;
        color0 = ui.bg;
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

      bindings = {
        # Seeking
        l = "seek 5";
        h = "seek -5";
        j = "seek -60";
        k = "seek 60";

        # Cycle between subs
        K = "cycle sub";
        J = "cycle sub down";

        # Skip to previous/next subtitle line
        H = "no-osd sub-seek -1";
        L = "no-osd sub-seek 1";

        # Add/subtract 50 ms delay from subs
        Z = "add sub-delay +0.05";
        z = "add sub-delay -0.05";

        # Adjust timing to previous/next subtitle
        X = "sub-step 1";
        x = "sub-step -1";
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
        font = ui.font + " " + toString(ui.fontSize);
        default-bg = ui.bg;
        statusbar-fg = ui.fg;
        statusbar-bg = ui.bg;
        inputbar-fg = "#75715e";
        inputbar-bg = ui.bg;
        completion-highlight-fg = "#a6e22e";
        completion-highlight-bg = ui.bg;
        notification-fg = ui.fg;
        notification-bg  ="#333333";
      };
    };

    rofi = {
      enable = true;
      font = ui.font + " " + toString(ui.fontSize);
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
          font = ui.font + " " + toString(ui.fontSize);
        };

        urgency_normal = {
          timeout = 5;
          background = ui.fg;
          foreground = ui.bg;
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
