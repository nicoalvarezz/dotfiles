# Dotfiles & Configs
![alt text](https://github.com/NicolasAlvarez16/dotfiles/blob/main/Images/2021-01-26-145319_1920x1080_scrot.png)

## Table of Contents
* Arch Installation
* Login and Window Manager
* Basic System Utilities
  * Wallpapers
  * Fonts
  * Audio
  * Brightness
  * Monitors
  * Network
  * Systray
  * Notifications
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
* References

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
  
  ### Loging and Window Manager
  For a better user experience when logging in I installed Lightdm. The deskto emvironment that I'll for the start of my configurataion is qtile. 
  I also installed a text editor, bettert terminal (I don't really like xterm) greeter (for ligthdm to work) and my browser of choice brave 
  (I also installed google later on in the explanation).
  ```
  sudo pacman -S lightndm lightdm-gtk-greeter qtile alacritty code
  ```
  
  To install brave I installed and enabled the snaps:
  ```
  git clone https://aur.archlinux.org/snapd.git
  cd snapd
  makepkg -si
  sudo systemctl enable --now snapd.socket
  ```
  
  I aslo created a symbolic link and installe brave:
  ```
  sudo ln -s /var/lib/snapd/snap /snap
  sudo snap install brave
  ```
  
  ### Basic System Utilities
  In this section I will cover some of the software that I installed for a better user experience.
  
  #### Wallpaper
  To set the wallpaper I ferts used `feh`. 
  ```
  sudo pacman -S feh
  feh --bg--scale path/to/wallpaper # xsession file
  ```
   However, I found a better software which is easier to set wallpapers. This software is called `nitrogen`
   ```
   suso pacman -S nitrogen
   ```
   
   Nitrogen will set the wallpaper automatically without the need to add a line in the .xsseion. It will also provide a simple interface 
   that lets me previsualize all my wallpaepers.
  
  #### Fonts
  Font packages:
  ```
  sudo pacman -S ttf-dejavu ttf-liberation noto-fonts
  ```
  
  List all the fonts:
  ```
  fc-list
  ```
  
  #### Audio
  For audio two main programs are neede: `puslseaudio` and `pavucontrol #Grafical interface to control the audo (no keybinding at first)` 
  ```
  sudo pacman -S pulseaudio pavucontrol
  ```
  
  In my configuration you can notice that the keybindings are not enabled, this is because I do not require of the audi in the set up that im currently working,
  However, the keys can be activated anytime. 
  
  #### Brightness
  For brightnes I installed `brightnessctl`
  ```
  sudo pacman -S brightnessctl
  ```
  Same with audio, my keybindings for brightness are not enabled, because I do not require of them.
  
  #### Monitors
  In my case I have a monitor connected to my laptop, and I only use that monitor. So what I did was to disable the laptop image and have the monitor 
  as the primary output. To do so I used a  graphical interface called `arandr`
  ```
  sudo pacaman -S arandr
  ```
  Thanks to this software I was ablet to save the layout I wanted to use. This gave me a sheel script with the exact xrandr command that I needed.
  I added this command to the .xsession file so the OS sets the screen xactly as I want every time I turn on the computer.
  
  #### Storage
  To automate external hard drives or USB I used `udisk` and `usiskie`.  udisks is a dependency of udiskie, so we only need to install the last one. 
  I also installed ntfs-3g package to read and write NTFS formatted drives:
  ```
  sudo pacamn -S udiskie ntfs-3g
  ```
  
  #### Network
  I used nmcli to se the network, however, a graphical frontend is more friendly. For this I used `nm-applet`:
  ```
  sudo pacman -S network-manager-applet
  ```
  
  #### Systray
  By default, you have a system tray in qtile. I can launch such as the one's that I installed, plus some new ones.
  ```
  sudo pacman -S volumeincon cbatticoon
  ```
  
  I can add all of this application in the `autostart.sh` file of qtile.
  ```
  volumeicon & # Icono volumen
  udiskie -t & # montar usbs
  cbatticon -u 5 & # Batterry icon 
  nm-applet & # Network icon
  ```
  
  #### Notfifications
  To have desktop notifications I used `libnotify` and `notification-daemon`.
  ```
  sudo pacman -S libnotify notification-daemon
  ```
 
  To get notifications in a tiling windo manager:
  ```
  # Create this file with nano or vim
  sudo nano /usr/share/dbus-1/services/org.freedesktop.Notifications.service
  # Paste these lines
  [D-BUS Service]
  Name=org.freedesktop.Notifications
  Exec=/usr/lib/notification-daemon-1.0/notification-daemon
  ```
  
  
  
  Documentaetion to be continued......
