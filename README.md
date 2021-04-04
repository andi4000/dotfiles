# My Dotfiles

## Environment
- Fresh installed Ubuntu 20.04 LTS (with gnome-shell)

## Usage
```bash
cd ~
git clone git@gitlab.com:ariandy/dotfiles .dotfiles

# install the packages in apt_packages.txt first, then 
./init.sh
```

## TODO
- [ ] figure out how to parse `apt_packages.txt` or pipe into apt
- [ ] create pre-init routine, e.g.: install common apt packages, etc.
- [ ] install oh-my-zsh
- [ ] clean up structure

## Manual Provisioning
1. Encrypt home partition
1. Generate ssh key (`ssh-keygen`)
1. Install Bitwarden extension for firefox
1. `ecryptfs-unwrap-passphrase` and put the output into Bitwarden
1. Login to gitlab, upload ssh pubkey
1. Login to Firefox to sync Firefox settings
1. Clone this repo and run `init.sh`
1. gnome-terminal Tweaks (optional)
1. Gnome Tweaks (optional)
1. Thunderbird email, calendar, PGP keys

### Encrypt Home Partition with eCryptfs
```bash
sudo apt install ecryptfs-utils cryptsetup
sudo adduser tmpuser  # set password, etc.
sudo usermod -aG sudo,adm tmpuser
# Reboot, then login on non-GUI prompt (Ctrl-F2) using tmpuser
sudo ecryptfs-migrate-home -u myuser  # enter tmpuser's password then myuser's password
# read the program output notes in the end
# DO NOT REBOOT, then login to main user
# Check if everything works, when yes:
#  1. call ecryptfs-unwrap-passphrase and note down the passphrase in password manager
#  2. Delete temporary files in /home/myuser.XXXXX
#  3. delete tmpuser
```

[Reference](https://www.howtogeek.com/116032/how-to-encrypt-your-home-folder-after-installing-ubuntu/)

### Gnome Tweaks
```bash
sudo apt install gnome-tweak-tool \
    gnome-shell-extensions \
    gnome-shell-extension-system-monitor \
    gnome-shell-extension-weather
```

Open "Tweaks" from dash, setup extensions (system monitor, weather) as needed

#### Desktop Background
Remove background, set color to black

```bash
gsettings set org.gnome.desktop.background picture-options 'none'
gsettings set org.gnome.desktop.background primary-color '#000000'
```

### gnome-terminal Tweaks
I really like Solarized. Change "Text and Background Color" and "Palette" into
solarized

### Thunderbird
Thunderbird 78 has nice new features:
- integrated PGP (replaces Enigma plugin)
- integrated Lightning calendar with CalDAV (replace Lightning, and Google
  Calendar Plugin)

#### Google Calendar Setup
Use this URL to subscribe to Google Calendar CalDAV

```
https://apidata.googleusercontent.com/caldav/v2/CALId/events
```

replace `CALID` with your calendar ID, in my case it is my Gmail email address.
Then follow the authentication procedure.

Reference: https://developers.google.com/calendar/caldav/v2/guide
