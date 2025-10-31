# Niri Catppuccin 

## Installation

Clone this repository:
```
git clone https://github.com/37signalsS/niri.git
```
```
mkdir .config/niri
```
```
cp /etc/niri/config ~/.config/niri
```
Replace the terminal emulator specified in the default configuration file with the one that is in the system
```
micro ~/.config/niri/config
```
Copy files to `~/.config`

## Software installation

### Pacman packages
```
sudo pacman -S swaybg gammastep swaylock swayidle satty xorg-xwayland wl-clipboard cliphist autotiling nwg-look wlroots xdg-user-dirs slurp grim waybar wofi xdg-desktop-portal-wlr telegram-desktop nemo ghostty libreoffice tailscale yazi haruna pavucontrol obs-studio gthumb htop bat fd ripgrep-all zoxide fzf micro fish wireguard-tools gvfs jq unzip p7zip fastfetch docker docker-compose polkit-gnome thefuck krita keepassxc libreoffice-still-ru virtualbox scrcpy android-tools eza git-delta atuin lazygit bluez bluez-utils blueman syncthing yt-dlp fragments kdeconnect network-manager-applet nm-connection-editor power-profiles-daemon dive trash-cli translate-shell flatpak zed linux-zen linux-zen-headers linux-lts linux-lts-headers firefox wev brightnessctl telegram-desktop mako
```

### AUR packages 
```
yay -S onlyoffice-bin lens-bin lazydocker pomatez ttf-times-new-roman vscodium-bin ungoogled-chromium-bin archarchive phoenix-arch youtube-music-bin
```

### Additional software
- [Chaotic-AUR](https://aur.chaotic.cx/docs)

- [Anki](https://apps.ankiweb.net/)

- [arch-cleaner](https://github.com/antonio-foti/arch-cleaner)

- [Warp Terminal](https://app.warp.dev/get_warp)
  ```
  sudo pacman -U ./<filename>.pkg.tar.zst
  ```
  
- [WaveTerm](https://www.waveterm.dev/download)
  ```
  sudo pacman -U <filename>.pacman
  ```
  
- FreeLens (via Flatpak)
  ```
  flatpak install flathub app.freelens.Freelens
  ```

## Configuration

### VS Code
Set `restoreWindows` to `none` in settings.

### Terminal Setup
1. Install Starship prompt:
   ```
   curl -sS https://starship.rs/install.sh | sh
   ```
2. Set Fish as default shell:
   ```
   chsh -s /usr/bin/fish
   ```

### Rofi 
To remove specific applications from appearing in Rofi, delete their `.desktop` files from:
- `~/.local/share/applications`
- `/usr/share/applications`

## Power saving (ThinkPad specific)
```
sudo pacman -S tlp tlp-rdw powertop tp_smapi acpi_call
sudo systemctl mask systemd-rfkill.service && sudo systemctl mask systemd-rfkill.socket
```

Configure TLP:
```
micro /etc/tlp.conf
```

Create Powertop service:
```
micro /etc/systemd/system/powertop.service
```
```
[Unit]
Description=Powertop tunings

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/bin/powertop --auto-tune
# Comment if uninterrupted operation of USB devices is required.
# ExecStartPost=/bin/sh -c "for i in /sys/bus/usb/devices/*/power/control; do echo on > $i; done"

[Install]
WantedBy=multi-user.target
```

Enable services:
```
sudo systemctl enable --now tlp.service
sudo systemctl enable --now powertop.service
```

## System information

| Component       | Details                                                                 |
|-----------------|-------------------------------------------------------------------------|
| Distribution    | [EndeavourOS](https://endeavouros.com/)                                 |
| Window Manager  | [Niri](https://github.com/YaLTeR/niri)                                  |
| Status Bar      | [Waybar](https://github.com/Alexays/Waybar)                             |
| Application Launcher | [Wofi](https://man.archlinux.org/man/wofi)                        |
| Terminal        | [Ghostty](https://ghostty.org/)                                         |
| Shell           | [Fish](https://fishshell.com/)                                          |
| Icon Theme      | [Tela icon theme](https://www.gnome-look.org/p/1279924/)             |
| GTK3 Theme      | [Catppuccin GTK Theme](https://www.gnome-look.org/p/1715554)            |
| Cursor Theme    | [Bibata Modern Ice](https://www.gnome-look.org/p/1197198)               |
| Font            | [BlexMono](https://www.nerdfonts.com/font-downloads)          |

