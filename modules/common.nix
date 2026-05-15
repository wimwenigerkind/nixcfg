{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    devenv
    zoxide
    fastfetch
    uv
    php84Extensions.zstd
    go-task
    secretspec
  ];

  nix.settings.experimental-features = "nix-command flakes";
  nix.settings.trusted-users = [ "root" "wim.wenigerkind" ];

  programs.direnv.enable = true;
}
