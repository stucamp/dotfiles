# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];
  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" "acpi_call" ];
  boot.extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/6f73a737-f80f-424b-bd05-a265b0a112c5";
      fsType = "f2fs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/820C-D97D";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/f927fc22-c09e-4846-b830-222bb2e2905d"; }
    ];

  fileSystems."/mnt/Files" =
    { device = "/dev/disk/by-uuid/e878ab45-43c2-46f4-97ba-ba06ac40dd5d";
      fsType = "ext4";
    };


  nix.maxJobs = lib.mkDefault 4;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
