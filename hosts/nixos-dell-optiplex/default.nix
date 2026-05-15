{ self, pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos-dell-optiplex";
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 ];

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  console.keyMap = "de";

  services.xserver = {
    enable = true;
    xkb = {
      layout = "de";
      variant = "mac_nodeadkeys";
    };
  };

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.wim = {
    isNormalUser = true;
    description = "Wim Wenigerkind";
    extraGroups = [ "networkmanager" "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGyxhQh+Qb2MirW1pmDETFQQU3vqomqN+nvDUJq8oFCG"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEqtPxLeJ9s52htW/LU8BNqJM9h5ud97bwW93WIQrjz+"
    ];
  };

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    ghostty
    google-chrome
  ];

  system.configurationRevision = self.rev or self.dirtyRev or null;
  system.stateVersion = "25.11";
}
