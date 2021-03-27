{ config, pkgs, ... }:
let
  unstable = import (fetchTarball
    "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz") {
      overlays = [
        (import (builtins.fetchTarball {
          url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
        }))
      ];
    };

  unstablePinned = import (fetchTarball
    "https://github.com/NixOS/nixpkgs/archive/1f77a4c8c74bbe896053994836790aa9bf6dc5ba.tar.gz") {
    overlays = [
      (import (builtins.fetchTarball {
        # url = https://github.com/mjlbach/emacs-overlay/archive/master.tar.gz;
        url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
      }))
    ];
  };

in {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "rishi";
  home.homeDirectory = "/home/rishi";
  home.packages = with pkgs; [
    bottom
    ripgrep
    fzf
    jq
    fd
    metals
    ibm-plex
    starship
    ammonite
    direnv
    lorri
    nixfmt
    unstablePinned.emacsPgtkGcc
    (aspellWithDicts (ds: with ds; [
      en en-computers en-science nl
    ]))
    unstable.neovim-nightly
  ];
  # programs.direnv.enable = true;
  # programs.direnv.enableNixDirenvIntegration = true;
  # services.lorri.enable = true;
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}
