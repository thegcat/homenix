{
  config,
  pkgs,
  lib,
  ...
}:

let
  fromGitHub = ref: repo: pkgs.vimUtils.buildVimPlugin {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = ref;
    src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      ref = ref;
    };
  };
in

{
  home = {
    stateVersion = "25.05";

    packages = [
      pkgs.alejandra
      pkgs.black
      pkgs.chafa
      pkgs.cookiecutter
      pkgs.dprint
      pkgs.eza
      pkgs.fastfetch
      pkgs.gd
      pkgs.gettext
      pkgs.gitui
      pkgs.httpie
      pkgs.iamb
      pkgs.imagemagick
      pkgs.isort
      pkgs.jq
      pkgs.less
      pkgs.libyaml
      pkgs.markdownlint-cli2
      pkgs.mosh
      pkgs.nerd-fonts.fira-code
      pkgs.nodejs
      pkgs.ouch
      pkgs.p7zip
      pkgs.parallel
      pkgs.poetry
      pkgs.prettyping
      pkgs.pwgen
      pkgs.python3
      pkgs.python312Packages.build
      pkgs.python312Packages.keyring
      pkgs.python312Packages.flake8
      pkgs.rsync
      pkgs.sad
      pkgs.shared-mime-info
      pkgs.sshuttle
      pkgs.statix
      pkgs.stress-ng
      pkgs.tinty
      pkgs.twine
      pkgs.vips
      pkgs.watch
      pkgs.xan
      pkgs.yamllint
    ];

    file = {
    };

    sessionPath = [
      "$HOME/.local/bin"
    ];

    sessionVariables = {
      SSH_AUTH_SOCK_SECRETIVE = "/Users/thegcat/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh";
      SSH_AUTH_SOCK_BUILTIN = "$SSH_AUTH_SOCK";
      GIT_AUTHOR_SIGNING_KEY = "key::ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBJlR5+LaRobpUHNCBsgTRqQEZjLvFbfBjxUG9mFaTwxhrXw4qkm8XL5NAaJDAUlKMOx7GEVqUXGbhsGSKhOapMA= thegcat@secretive.thegbook.local";
      HOMEBREW_NO_ANALYTICS = 1;
    };
  };

  programs = {
    bat = {
      enable = true;
      config = {
        theme = "base16-256";
        italic-text = "always";
        pager = "less";
      };
    };
    btop.enable = true;
    delta = {
      enable = true;
      enableGitIntegration = true;
      options = {
        line-numbers = true;
        syntax-theme = "base16-256";
        navigate = true;
      };
    };
    direnv.enable = true;
    fd.enable = true;
    # ghostty.enable = true;
    # ghostty.enableFishIntegration = true;
    # ghostty.installVimSyntax = true;
    # ghostty.settings = {
    #   font-family = "FiraCode Nerd Font";
    #   font-style = "Retina";
    #   font-size = 12;
    # };
    git = {
      enable = true;
      includes = [
        {
          path = "~/.local/share/tinted-theming/tinty/tinted-delta-configs-file.gitconfig";
        }
      ];
      lfs.enable = true;
      userName = "Felix Schäfer";
      userEmail = "felix@thegcat.net";
      aliases = {
        s = "status -sb";
        a = "add -p";
        p = "push";
        ci = "commit";
        br = "branch";
        co = "checkout";
        cp = "cherry-pick -e";
        df = "diff";
        ds = "diff --cached";
        re = "rebase --autosquash";
        ri = "rebase --interactive";
        rc = "rebase --continue";
        ra = "rebase --abort";
        rcs = "!git rc; git s";
        sa = "submodule add";
        si = "submodule init";
        su = "submodule update";
        ss = "submodule sync";
        fp = "push --force-with-lease";
        us = "reset HEAD";
        uc = "reset --soft HEAD^";
        tree = "log --graph --pretty=onelineverbose --abbrev-commit";
        rv = "remote --verbose";
      };
      extraConfig = {
        apply = {
          whitespace = "fix";
        };
        branch = {
          autosetuprebase = "always";
        };
        checkout = {
          workers = 0;
        };
        # color = {
        #   ui = "auto";
        # };
        commit = {
          gpgsign = true;
        };
        core = {
          # fsmonitor = true;
          whitespace = "cr-at-eol";
        };
        credentials = {
          helper = "osxkeychain";
        };
        diff = {
          colorMoved = "default";
        };
        fetch = {
          parallel = 0;
        };
        format = {
          pretty = "format:%C(yellow)%h %Cblue%>(12)%ad %Cgreen%<(7)%aN%Cred%d %Creset%s";
        };
        gpg = {
          format = "ssh";
          ssh.defaultKeyCommand = "git_author_signing_key";
        };
        http = {
          maxRequests = 20;
        };
        init = {
          defaultBranch = "main";
        };
        log = {
          date = "relative";
        };
        merge = {
          conflictstyle = "zdiff3";
          ff = "only";
          autostash = true;
        };
        pack = {
          threads = 0;
        };
        pretty = {
          onelineverbose = "%C(yellow)%h%Creset (%Cblue%aN%Creset)%Cred%d%Creset %s [%Cgreen%cd, %ad%Creset]";
        };
        pull = {
          rebase = true;
        };
        push = {
          default = "upstream";
          autoSetupRemote = true;
          recurseSubmodules = "on-demand";
        };
        rebase = {
          abbreviateCommands = true;
          autostash = true;
          autosquash = true;
        };
        status = {
          showstash = true;
          submoduleSummary = true;
        };
        submodule = {
          recurse = true;
          fetchJobs = 0;
        };
      };
      # https://www.toptal.com/developers/gitignore/api/osx,vim,linux,direnv
      ignores = [
        ".direnv"
        ".envrc"
        "*~"
        ".DS_Store"
        ".AppleDouble"
        ".LSOverride"
        "Icon

"
        "._*"
        ".DocumentRevisions-V100"
        ".fseventsd"
        ".Spotlight-V100"
        ".TemporaryItems"
        ".Trashes"
        ".VolumeIcon.icns"
        ".com.apple.timemachine.donotpresent"
        ".AppleDB"
        ".AppleDesktop"
        "Network Trash Folder"
        "Temporary Items"
        ".apdisk"
        "[._]*.s[a-v][a-z]"
        "!*.svg"
        "[._]*.sw[a-p]"
        "[._]s[a-rt-v][a-z]"
        "[._]ss[a-gi-z]"
        "[._]sw[a-p]"
        "Session.vim"
        "Sessionx.vim"
        ".netrwhist"
        "tags"
        "[._]*.un~"
      ];
    };
    jq.enable = true;
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      plugins = with pkgs.vimPlugins; [
        telescope-nvim
        telescope-frecency-nvim
        telescope-smart-history-nvim
        plenary-nvim
        nvim-lspconfig
        nvim-treesitter.withAllGrammars
        ale
        vim-lastplace
        lualine-nvim
        nvim-web-devicons
        vim-better-whitespace
        (fromGitHub "main" "tinted-theming/tinted-vim")
      ];
      extraConfig = ''
        set number relativenumber
        set tabstop=2 shiftwidth=2 expandtab
        set ignorecase smartcase
        autocmd InsertLeave,WinEnter * set cursorline
        autocmd InsertEnter,WinLeave * set nocursorline
        let g:strip_whitespace_on_save = 1
        let g:strip_whitelines_at_eof = 1
        set background=dark
        set termguicolors
        colorscheme base24-catppuccin-mocha
      '';
      extraLuaConfig = ''
        vim.diagnostic.config({
          signs = {
            text = {
              [vim.diagnostic.severity.WARN] = '',
              [vim.diagnostic.severity.ERROR] = '',
            },
          },
        })
        require('lualine').setup({
          options = {
            theme = 'base16',
          }
        })
        require('telescope').setup({
          defaults = {
            mappings = {
              i = {
                ["<C-p>"] = require('telescope.actions').cycle_history_prev,
              },
            },
          },
        })
        require('telescope').load_extension('smart_history')
        vim.keymap.set('n', '<C-p>', ":Telescope find_files<CR>", { noremap = true, silent = true })
      '';
    };
    fish = {
      enable = true;
      shellAliases = {
        g = "git";
        cat = "bat";
        ping = "prettyping --nolegend";
      };
      functions = {
        __fish_save_history = {
          body = "history save";
          onEvent = "fish_preexec";
        };
        fish_user_key_bindings = ''
          bind -k up 'history merge; up-or-search'
          bind \e\[A 'history merge; up-or-search'
        '';
        knife = {
          wraps = "knife";
          body = ''
            if test $argv[1] = 'diff'
              command knife $argv | delta
            else
              command knife $argv
            end
          '';
        };
      };
      shellInit = ''
        export SSH_AUTH_SOCK=$SSH_AUTH_SOCK_SECRETIVE

        for executable in git cap make rbenv
          function $executable --inherit-variable executable -w $executable
            __execute_caffeinated $executable $argv
          end
        end

        eval "$(/opt/homebrew/bin/brew shellenv)"

        eval "tinty init"
        source ~/.local/share/tinted-theming/tinty/tinted-fzf-fish-file.fish

        source "$GHOSTTY_RESOURCES_DIR"/shell-integration/fish/vendor_conf.d/ghostty-shell-integration.fish
      '';
      plugins = [
        {
          name = "caffeinate";
          src = pkgs.fetchFromGitHub {
            owner = "thegcat";
            repo = "caffeinate";
            rev = "main";
            hash = "sha256-b7WOlyMvHx/8mFlwq1OhMnlpW6BdlacysobsVuv0gvY=";
          };
        }
      ];
    };
    fzf = {
      enable = true;
      enableFishIntegration = true;
    };
    lsd = {
      enable = true;
    };
    rbenv = {
      enable = true;
      plugins = [
        {
          name = "ruby-build";
          src = pkgs.fetchFromGitHub {
            owner = "rbenv";
            repo = "ruby-build";
            rev = "v20241225.2";
            hash = "sha256-3Maw4OktBaiTH/W199GkzxVXtLpQeXU48mCLvOXt0Vg=";
          };
        }
      ];
    };
    ripgrep.enable = true;
    ssh = {
      enable = true;
      includes = [ "config.d/*" ] ;
      addKeysToAgent = "yes";
      extraConfig = "SetEnv TERM=xterm-256color";
    };
    starship.enable = true;
    yt-dlp.enable = true;
    zellij = {
      enable = true;
      enableFishIntegration = true;
    };
    home-manager.enable = true;
  };

  targets.darwin.search = "DuckDuckGo";
}
