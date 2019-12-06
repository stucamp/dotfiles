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
  environment.systemPackages = with pkgs; [
	wget 
	vim 
	curl 
	sudo 
	file 
	rxvt_unicode 
	firefox 
	chromium
	clipmenu 
	smartmontools
	tlp
	ethtool
	tpacpi-bat
	git
	neofetch
	htop
	ffmpeg
  ];

  
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

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
	autorun = false;
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

  
  fonts.fonts = with pkgs; [
	hermit
	fira-code
	fira-code-symbols
  ];


  ###################################################################

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.stu = {
    isNormalUser = true;
    extraGroups = [ "wheel" "sudo" "networkmanager"]; # Enable ‘sudo’ for the user.
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?

}

