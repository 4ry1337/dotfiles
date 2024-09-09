# Arch Linux

> I use Arch, btw. ✌️

default arch with gnome desktop and gdm

```
                  -`                     rakhat@rakhat
                 .o+`                    -------------
                `ooo/                    OS: Arch Linux x86_64
               `+oooo:                   Host: 82K2 (IdeaPad Gaming 3 15ACH6)
              `+oooooo:                  Kernel: Linux 6.10.6-arch1-1
              -+oooooo+:                 Packages: 966 (pacman)
            `/:-:++oooo+:                Shell: zsh 5.9
           `/++++/+++++++:               Display (AUOD1ED): 1920x1080 @ 120 Hz (as 1536x864) in 15″ [Built-in] *
          `/++++++++++++++:              Display (Samsung Electric Company 27"): 2560x1440 @ 144 Hz in 27″ [External]
         `/+++ooooooooooooo/`            DE: GNOME 46.4
        ./ooosssso++osssssso+`           WM: Mutter (Wayland)
       .oossssso-````/ossssss+`          WM Theme: Adwaita
      -osssssso.      :ssssssso.         Theme: Adwaita [GTK2/3/4]
     :osssssss/        osssso+++.        Icons: Adwaita [GTK2/3/4]
    /ossssssss/        +ssssooo/-        Font: Cantarell (11pt) [GTK2/3/4]
  `/ossssso+/:-        -:/+osssso+-      Cursor: Adwaita (24px)
 `+sso+:-`                 `.-/+oso:     Terminal: alacritty 0.13.2
`++:.                           `-/+/    Terminal Font: JetBrainsMono Nerd Font (11pt)
.`                                 `/    CPU: AMD Ryzen 7 5800H (16) @ 4.46 GHz
                                         GPU 1: NVIDIA GeForce RTX 3060 Mobile / Max-Q [Discrete]
                                         GPU 2: AMD Radeon Vega Series / Radeon Vega Mobile Series [Integrated]
                                         Memory: 27.26 GiB
                                         Swap: 4.00 GiB
                                         Disk linux: 227.18 GiB - ext4
                                         Disk windows: 953.00 GiB - ntfs
```

# TODO

- [x] start using stow for symblinks
- [ ] add arch install config
- [ ] install.sh script 

# Fstab

/dev/nvme0n1p3     	/mnt/windows	ntfs-3g     	rw,uid=1000,gid=1000,windows_names	0 0

# Packages

yay installation:
```
cd ~
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

pacman packages installation:
```

sudo pacman -S alacritty telegram-dekstop docker obsidian okular libreoffice-still obs-studio git github-cli ghq lazygit neovim tmux mtr iperf3 ldns aria2 socat nmap ipcalc strace ltrace lsof lshw zsh zoxide eza fd jq nvidia-utils nvidia-settings zip unzip ntfs-3g fzf tree stow which wl-clipboard xclip ripgrep xorg-xwayland xwaylandvideobridge fastfetch valgrind
```

yay packages installation:
```
yay -S spotify google-chrome whatsapp-for-linux armcord oh-my-posh zinit envycontrol
```

removing unnecessary gnome packages
```
sudo pacman -Rns epiphany yelp gnome-tour gnome-connection
gnome-software htop gnome-console gnome-maps
gnome-text-editor gnome-user-docs 
```

setup gpu
```
sudo envycontrol -s hybrid --dm gdm --rtd3
```

## Apps

```
yay -S spotify google-chrome whatsapp-for-linux armcord
```
```
sudo pacman -S alacritty telegram-dekstop docker obsidian okular libreoffice-still obs-studio
```
docker desktop\

### Git
```
sudo pacman -S git github-cli ghq lazygit
```

## IDE

```
sudo pacman -S neovim tmux clang valgrind
```

## Network Monitoring

```
sudo pacman -S mtr iperf3 ldns aria2 socat nmap ipcalc 
```

## System Monitoring

```
sudo pacman -S strace ltrace lsof lshw
```

## Utils

```
sudo pacman -S zsh zoxide eza fd jq nvidia-utils nvidia-settings zip unzip ntfs-3g fzf tree stow which wl-clipboard xclip ripgrep xorg-xwayland xwaylandvideobridge fastfetch
```

```
yay -S oh-my-posh zinit envycontrol
```

