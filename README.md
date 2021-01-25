# Dotfiles & Configs
(Image)

## Table of Contents
* Arch Installation
* Login and Window Manager
* Basic Qtile Config
* Basic System Utilities
  * Wallpapers
  * Fonts
  * Monitors
  * Network
  * Systray
  * Notifications
  * Xprofile
* Extra Config and Tools
  * AUR Helper
  * File Manager
  * Trash
  * GTK Theming
  * Lightdm Theming
  * Multimedia
    * Images
    * Videos and Audio
* Software
  * Basic Utilities
  * Fonts, Theming and GTK
  * Apps
  
  ### Arch Installation
  Arfter completing the installation following the arch linux guide found in their wiki, the first thing to do is to set up the wi-fi connection.:
  ```
  pacman -S networkmanager
  systemctl enable NetworkManager
  sudo rfkill unblock wifi
  sudo ip link set wlo1  up # network card up
  ```
  
  Now bootloader must be installed, after mouting efi partion on */boot*:
  ```
  pacman -S grub efibotmgr
  grub-install --target=x86_64-efi --efi-direcotory=/boot
  grub-mkconfig -o /boot/grub.cfg
  ```
  
  Then I created my user:
  ```
  useadd -m nicolas
  passwd nicolas
  usermod -aG wheel, video, audio, storage, username
  ```
  
  To have root privileges I installed sudo:
  ```
  pacman -S sudo
  ```
  And edited */etc/sudoers* with nano by uncommenting this line:
  ```
  ## Uncomment to allow members of group wheel to execute any command
  # %wheel ALL=(ALL) ALL
  ```
  
  And to completed the installation and exited the ISO image and rebooted:
  ```
  exit
  umount -R /mnt
  reboot
  ```
  
  Once I logged in I connected to the internet:
  ```
  nmcli device list # List all available networks
  nmcli device wifi connect YOUR_SSID password YOUR_PASSWORD 
  ```
  
  And for the last thing was to install Xorg:
  ```
  sudo pacman -S xorg
  ```
  
  
