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
sudo pacman -S swaybg gammastep swaylock swayidle satty xorg-xwayland wl-clipboard cliphist autotiling nwg-look wlroots xdg-user-dirs slurp grim waybar wofi xdg-desktop-portal-wlr telegram-desktop nautilus ghostty libreoffice tailscale yazi haruna pavucontrol obs-studio gthumb htop bat fd ripgrep-all zoxide fzf micro fish wireguard-tools gvfs jq unzip p7zip fastfetch docker docker-compose polkit-gnome thefuck krita keepassxc libreoffice-still-ru virtualbox scrcpy android-tools eza git-delta atuin lazygit bluez bluez-utils blueman syncthing yt-dlp fragments kdeconnect network-manager-applet nm-connection-editor power-profiles-daemon dive trash-cli translate-shell flatpak zed linux-zen linux-zen-headers linux-lts linux-lts-headers firefox wev brightnessctl telegram-desktop mako gvfs-mtp jmtpfs libmtp mtpfs
```

### AUR packages 
```
yay -S onlyoffice-bin lens-bin lazydocker pomatez ttf-times-new-roman vscodium-bin ungoogled-chromium-bin archarchive phoenix-arch youtube-music-bin tuxedo-control-center-bin tuxedo-drivers-dkms
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

## Winapps

Winapps позволяет запускать приложения Windows (например, Microsoft Office) из Linux без использования виртуальных машин, интегрируя их в вашу систему.

### Клонирование репозитория
Клонируйте репозиторий Winapps:
```bash
git clone https://github.com/winapps-org/winapps
```

### Установка зависимостей
Установите необходимые пакеты Pacman:
```bash
sudo pacman -Syu --needed -y curl dialog freerdp git iproute2 libnotify openbsd-netcat
```

### Запуск службы Docker
Убедитесь, что служба Docker запущена:
```bash
sudo systemctl start docker
```

### Редактирование compose.yaml
Отредактируйте `compose.yaml` в соответствии с вашими предпочтениями. Например, вы можете указать путь к пользовательскому образу Windows (например, `/home/q/Win11_24H2_EnglishInternational_x64.iso:/custom.iso`) и настроить учетные данные пользователя, пароли и ресурсы контейнера.

### Запуск контейнера Docker Compose
Запустите контейнер Docker Compose и получите доступ к нему через веб-браузер:
```bash
docker compose --file compose.yaml up
```
Подключитесь через браузер по ссылке: `http://127.0.0.1:8006/`

### Настройка Windows
Установите и настройте все необходимые приложения внутри вашей виртуальной среды Windows.

### Конфигурация winapps.conf
Создайте или отредактируйте файл `~/.config/winapps/winapps.conf` со следующим содержанием, настроив его под свои нужды:
```
##################################
#   WINAPPS CONFIGURATION FILE   #
##################################

# INSTRUCTIONS
# - Leading and trailing whitespace are ignored.
# - Empty lines are ignored.
# - Lines starting with '#' are ignored.
# - All characters following a '#' are ignored.

# [WINDOWS USERNAME]
RDP_USER="MyWindowsUser"

# [WINDOWS PASSWORD]
# NOTES:
# - If using FreeRDP v3.9.0 or greater, you *have* to set a password
# RDP_PASS="MyWindowsPassword"

# [WINDOWS DOMAIN]
# DEFAULT VALUE: '' (BLANK)
# RDP_DOMAIN=""

# [WINDOWS IPV4 ADDRESS]
# NOTES:
# - If using 'libvirt', 'RDP_IP' will be determined by WinApps at runtime if left unspecified.
# DEFAULT VALUE:
# - 'docker': '127.0.0.1'
# - 'podman': '127.0.0.1'
# - 'libvirt': '' (BLANK)
RDP_IP="127.0.0.1"

# [VM NAME]
# NOTES:
# - Only applicable when using 'libvirt'
# - The libvirt VM name must match so that WinApps can determine VM IP, start the VM, etc.
# DEFAULT VALUE: 'RDPWindows'
VM_NAME="RDPWindows"

# [WINAPPS BACKEND]
# DEFAULT VALUE: 'docker'
# VALID VALUES:
# - 'docker'
# - 'podman'
# - 'libvirt'
# - 'manual'
WAFLAVOR="docker"

# [DISPLAY SCALING FACTOR]
# NOTES:
# - If an unsupported value is specified, a warning will be displayed.
# - If an unsupported value is specified, WinApps will use the closest supported value.
# DEFAULT VALUE: '100'
# VALID VALUES:
# - '100'
# - '140'
# - '180'
RDP_SCALE="100"

# [MOUNTING REMOVABLE PATHS FOR FILES]
# NOTES:
# - By default, `udisks` (which you most likely have installed) uses /run/media for mounting removable devices.
#   This improves compatibility with most desktop environments (DEs).
# ATTENTION: The Filesystem Hierarchy Standard (FHS) recommends /media instead. Verify your system's configuration.
# - To manually mount devices, you may optionally use /mnt.
# REFERENCE: https://wiki.archlinux.org/title/Udisks#Mount_to_/media
REMOVABLE_MEDIA="/run/media"

# [ADDITIONAL FREERDP FLAGS & ARGUMENTS]
# NOTES:
# - You can try adding /network:lan to these flags in order to increase performance, however, some users have faced issues with this.
#   If this does not work or if it does not work without the flag, you can try adding /nsc and /gfx.
# DEFAULT VALUE: '/cert:tofu /sound /microphone +home-drive'
# VALID VALUES: See https://github.com/awakecoding/FreeRDP-Manuals/blob/master/User/FreeRDP-User-Manual.markdown
RDP_FLAGS="/cert:tofu /sound /microphone +home-drive"

# [DEBUG WINAPPS]
# NOTES:
# - Creates and appends to ~/.local/share/winapps/winapps.log when running WinApps.
# DEFAULT VALUE: 'true'
# VALID VALUES:
# - 'true'
# - 'false'
DEBUG="true"

# [AUTOMATICALLY PAUSE WINDOWS]
# NOTES:
# - This is currently INCOMPATIBLE with 'manual'.
# DEFAULT VALUE: 'off'
# VALID VALUES:
# - 'on'
# - 'off'
AUTOPAUSE="off"

# [AUTOMATICALLY PAWINDOWS TIMEOUT]
# NOTES:
# - This setting determines the duration of inactivity to tolerate before Windows is automatically paused.
# - This setting is ignored if 'AUTOPAUSE' is set to 'off'.
# - The value must be specified in seconds (to the nearest 10 seconds e.g., '30', '40', '50', etc.).
# - For RemoteApp RDP sessions, there is a mandatory 20-second delay, so the minimum value that can be specified here is '20'.
# - Source: https://techcommunity.microsoft.com/t5/security-compliance-and-identity/terminal-services-remoteapp-8482-session-termination-logic/ba-p/246566
# DEFAULT VALUE: '300'
# VALID VALUES: >=20
AUTOPAUSE_TIME="300"

# [FREERDP COMMAND]
# NOTES:
# - WinApps will attempt to automatically detect the correct command to use for your system.
# DEFAULT VALUE: '' (BLANK)
# VALID VALUES: The command required to run FreeRDPv3 on your system (e.g., 'xfreerdp', 'xfreerdp3', etc.).
FREERDP_COMMAND=""

# [TIMEOUTS]
# NOTES:
# - These settings control various timeout durations within the WinApps setup.
# - Increasing the timeouts is only necessary if the corresponding errors occur.
# - Ensure you have followed all the Troubleshooting Tips in the error message first.

# PORT CHECK
# - The maximum time (in seconds) to wait when checking if the RDP port on Windows is open.
# - Corresponding error: "NETWORK CONFIGURATION ERROR" (exit status 13).
# DEFAULT VALUE: '5'
PORT_TIMEOUT="5"

# RDP CONNECTION TEST
# - The maximum time (in seconds) to wait when testing the initial RDP connection to Windows.
# - Corresponding error: "REMOTE DESKTOP PROTOCOL FAILURE" (exit status 14).
# DEFAULT VALUE: '30'
RDP_TIMEOUT="160"

# APPLICATION SCAN
# - The maximum time (in seconds) to wait for the script that scans for installed applications on Windows to complete.
# - Corresponding error: "APPLICATION QUERY FAILURE" (exit status 15).
# DEFAULT VALUE: '60'
APP_SCAN_TIMEOUT="60"

# WINDOWS BOOT
# - The maximum time (in seconds) to wait for the Windows VM to boot if it is not running, before attempting to launch an application.
# DEFAULT VALUE: '120'
BOOT_TIMEOUT="120"

# FREERDP RAIL HIDEF
# - This option controls the value of the `hidef` option passed to the /app parameter of the FreeRDP command.
# - Setting this option to 'off' may resolve window misalignment issues related to maximized windows.
# DEFAULT VALUE: 'on'
HIDEF="off"
```

### Копирование compose.yaml и запуск Docker
Скопируйте `compose.yaml` в директорию `.config/winapps` и запустите контейнер:
```bash
cp compose.yaml ~/.config/winapps && docker compose --file ~/.config/winapps/compose.yaml start
```

### Интеграция Winapps
Запустите скрипт для настройки интеграции Winapps в вашу систему и подтвердите все действия, нажимая `Enter`:
```bash
./setup.sh
```

Готово!