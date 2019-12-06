# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp0s25.useDHCP = true;
  networking.interfaces.wlp3s0.useDHCP = true;
  networking.networkmanager.enable = true;
  

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n = {
  #   consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "US/Arizona";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  system.autoUpgrade = {
	enable = true;
	channel = https://nixos.org/channels/nixos-19.09;
  };

  nixpkgs.config = {
	allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
	acpitool
	autocutsel
	compton
	chromium
	dmenu
	dunst
	emacs
	ethtool
	f2fs-tools
	feh
	file
	firefox
	git
	gparted
	htop
	imv
	libreoffice
	libnotify
	lm_sensors
	mplayer
	meld
	mupdf
	neofetch
	ncdu
	ntfs3g
	pciutils
	pinta
	ranger  
	rxvt_unicode
	rofi
	scrot
	smartmontools
	smplayer
	tlp
	tpacpi-bat
	tmux
	tree
	unclutter
	viewnior
	vim
	vlc 
	w3m
	wget
	which
	xfsprogs
	xsel
	zathura
	
  ];

  
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.thinkfan.enable = true;
  services.printing.enable = true;

  services.acpid.enable = true;
  services.tlp.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  
  #### i3 Setup ####
  ###################################################################
  
  environment.pathsToLink = [ "/libexec" ];
  environment.variables = {
	TERMINAL = "urxvt";
  	EDITOR = "vim";
  };


  services.xserver = {
	autorun = true;
	enable = true;
	layout = "us";
	libinput.enable = true;
	
	desktopManager = {
		default = "none";
		xterm.enable = false;
	};

	displayManager = {
		lightdm.enable = true;
	};

	windowManager.i3 = {
		enable = true;
		extraPackages = with pkgs; [
			dmenu
			i3status
			i3lock
			i3blocks
		];
	};
  };

  services.gnome3 = {
	gnome-keyring.enable = true;
  };


  security.pam.services.lightdm.enableGnomeKeyring = true;
  programs = {
	mtr.enable = true;
	gnupg.agent = {
		enable = true;
		enableSSHSupport = true;
	};
	seahorse.enable = true;
  };

  
  fonts = {
	enableCoreFonts = true;
	fontconfig.enable = true;
	enableFontDir = true;
	enableGhostscriptFonts = true;
	
	fonts = with pkgs; [
		google-fonts
		ubuntu_font_family
		hermit
		fira
		fira-code
		fira-code-symbols
  	];
  };


  ###################################################################
  #### SystemD ####

  systemd.user.services."urxvtd" = {
    enable = true;
    description = "rxvt unicode daemon";
    wantedBy = [ "default.target" ];
    path = [ pkgs.rxvt_unicode ];
    serviceConfig.Restart = "always";
    serviceConfig.RestartSec = 2;
    serviceConfig.ExecStart = "${pkgs.rxvt_unicode}/bin/urxvtd -q -o";
  };

  systemd.user.services."dunst" = {
    enable = true;
    description = "";
    wantedBy = [ "default.target" ];
    serviceConfig.Restart = "always";
    serviceConfig.RestartSec = 2;
    serviceConfig.ExecStart = "${pkgs.dunst}/bin/dunst";
  };

  systemd.user.services."unclutter" = {
    enable = true;
    description = "hide cursor after X seconds idle";
    wantedBy = [ "default.target" ];
    serviceConfig.Restart = "always";
    serviceConfig.RestartSec = 2;
    serviceConfig.ExecStart = "${pkgs.unclutter}/bin/unclutter";
  };

  systemd.user.services."compton" = {
    enable = true;
    description = "";
    wantedBy = [ "default.target" ];
    path = [ pkgs.compton ];
    serviceConfig.Type = "forking";
    serviceConfig.Restart = "always";
    serviceConfig.RestartSec = 2;
    serviceConfig.ExecStart = "${pkgs.compton}/bin/compton -b --config /home/joedicastro/.compton.conf";
  };

   systemd.user.services."autocutsel" = {
    enable = true;
    description = "AutoCutSel";
    wantedBy = [ "default.target" ];
    serviceConfig.Type = "forking";
    serviceConfig.Restart = "always";
    serviceConfig.RestartSec = 2;
    serviceConfig.ExecStartPre = "${pkgs.autocutsel}/bin/autocutsel -fork";
    serviceConfig.ExecStart = "${pkgs.autocutsel}/bin/autocutsel -selection PRIMARY -fork";
  };


  ## VIRTUALIZATION

  virtualisation.docker.enable = true;
  # virtualisation.docker.socketActivation = true;
  virtualisation.virtualbox.host.enable = true;


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.stu = {
    isNormalUser = true;
    description = "Stu Campbell";
    extraGroups = [ "wheel" "sudo" "networkmanager" "vboxuser" "docker"]; # Enable ‘sudo’ for the user.
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?

}
