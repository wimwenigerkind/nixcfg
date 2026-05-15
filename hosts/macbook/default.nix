{ self, ... }:
{
  system.primaryUser = "wim.wenigerkind";

  system.defaults = {
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      AppleShowAllExtensions = true;
      _HIHideMenuBar = false;
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
      BatteryShowPercentage = true;
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

  security.pam.services.sudo_local = {
    touchIdAuth = true;
    watchIdAuth = true;
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
      "speedtest"
      "starship"
      "stow"
      "symfony-cli"
      "tmux"
      "tree"
      "watch"
      "wget"
      "xh"
      "yarn"
      "zsh-autosuggestions"
      "acli"
      "terraform"
      "sketchybar"
      "ffmpeg"
      "bpytop"
      "manim"
      "abctl"
      "yt-dlp"
      "ncdu"
      "gpg"
      "age"
      "nginx"
      "hugo"
      "platformio"
      "fd"
      "lazygit"
      "tree-sitter-cli"
      "cliclick"
      "postgresql@14"
      "postgresql@18"
      "ripgrep"
      "screenfetch"
      "yazi"
      "awscli"
      "doggo"
      "helm"
      "caddy"
      "k6"
    ];

    casks = [
      "1password-cli"
      "balenaetcher"
      "chatgpt"
      "claude"
      "cloudflare-warp"
      "discord"
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
      "visual-studio-code"
      "whatsapp"
      "zed"
      "arc"
      "shopware-cli"
      "zoom"
      "curseforge"
      "ngrok"
      "utm"
      "vlc"
      "vivaldi"
      "logitech-g-hub"
      "bruno"
      "elgato-stream-deck"
      "temurin@25"
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
      "hashicorp/tap"
      "FelixKratz/formulae"
      "airbytehq/tap"
    ];
  };

  system.configurationRevision = self.rev or self.dirtyRev or null;
  system.stateVersion = 6;

  nixpkgs.hostPlatform = "aarch64-darwin";
}
