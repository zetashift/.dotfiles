{ config, pkgs, ... }:

let 
	unstable = import (fetchTarball
		"https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz") {
  		overlays = [
    		(import (builtins.fetchTarball {
      		url =
        		"https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
       	}))
    	];
  };

	my-emacs = (pkgs.emacsPackagesGen unstable.emacsPgtkGcc).emacsWithPackages
		(epkgs: [ epkgs.vterm epkgs.pdf-tools ]);

in 

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "rishi";
  home.homeDirectory = "/home/rishi";
  home.packages = with pkgs; [
    rnix-lsp
  	my-emacs
  	ripgrep
    fzf
  	jq
  	fd
  	metals
	  ibm-plex
  ];

  programs.direnv.enable = true;
  programs.direnv.enableNixDirenvIntegration = true;
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
