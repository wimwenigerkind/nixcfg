{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.05-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      system.primaryUser = "wim.wenigerkind";

      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = [
        pkgs.vim
        pkgs.devenv
      ];

      # MacOS defaults.
      system.defaults = {
        NSGlobalDomain = {
          AppleInterfaceStyle = "Dark";
          AppleShowAllExtensions = true;
        };
        finder = {
          AppleShowAllFiles = true;
          ShowExternalHardDrivesOnDesktop = false;
          ShowHardDrivesOnDesktop = false;
          ShowMountedServersOnDesktop = false;
          ShowRemovableMediaOnDesktop = false;
          FXDefaultSearchScope = "SCcf";
          FXPreferredViewStyle = "clmv";
          NewWindowTarget = "Computer";
          ShowPathbar = true;
        };
        dock = {
          autohide = true;
          tilesize = 30;
          show-recents = false;
          magnification = true;
          largesize = 35;
        };
        controlcenter = {
          BatteryShowPercentage = false;
          Bluetooth = false;
          Sound = false;
        };
        trackpad = {
          Clicking = true;
          TrackpadRightClick = true;
        };
        ".GlobalPreferences" = {
          "com.apple.mouse.scaling" = 3.0;
        };
      };

      security = {
        pam = {
          services = {
            sudo_local = {
              touchIdAuth = true;
              watchIdAuth = true;
            };
          };
        };
      };

      homebrew = {
        enable = true;
        onActivation.cleanup = "uninstall";
        brews = [
          "ansible"
          "atuin"
          "cmatrix"
          "cobra-cli"
          "cowsay"
          "curl"
          "deployer"
          "fstrm"
          "fswatch"
          "fzf"
          "gemini-cli"
          "gh"
          "git-filter-repo"
          "gnu-tar"
          "go"
          "goreleaser"
          "grep"
          "htop"
          "imagemagick"
          "ipmitool"
          "marp-cli"
          "maven"
          "mosquitto"
          "mysql-client"
          "neovim"
          "net-snmp"
          "nmap"
          "node"
          "node-sass"
          "nushell"
          "nvtop"
          "oh-my-posh"
          "opencode"
          "openjdk"
          "openldap"
          "openssl@3"
          "p7zip"
          "pnpm"
          "pulumi"
          "python@3.13"
          "rclone"
          "readline"
          "shopware-cli"
          "speedtest"
          "sql-dump-cli"
          "starship"
          "stow"
          "symfony-cli"
          "tmux"
          "tree"
          "watch"
          "wget"
          "wswcli"
          "xh"
          "yarn"
          "zsh-autosuggestions"
          "acli"
        ];

        casks = [
          "1password-cli"
          "balenaetcher"
          "chatgpt"
          "claude"
          "cloudflare-warp"
          "discord"
          "docker-desktop"
          "figma"
          "firefox"
          "ghostty"
          "github"
          "gitkraken"
          "gitkraken-cli"
          "herd"
          "iterm2"
          "maccy"
          "monitorcontrol"
          "obs"
          "obsidian"
          "orbstack"
          "postman"
          "raspberry-pi-imager"
          "rectangle"
          "slack"
          "spotify"
          "tailscale-app"
          "visual-studio-code"
          "warp"
          "whatsapp"
          "zed"
          "arc"
        ];

        taps = [
          "atlassian/acli"
          "dunglas/frankenphp"
          "jandedobbeleer/oh-my-posh"
          "pulumi/tap"
          "shivammathur/php"
          "shopware/tap"
          "sst/tap"
          "symfony-cli/tap"
          "teamookla/speedtest"
          "wimwenigerkind/tap"
        ];
      };

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      programs = {
        direnv.enable = true;
      };

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#MacBook-Pro-von-Wim
    darwinConfigurations."MacBook-Pro-von-Wim" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}
