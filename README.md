# Mac

# Setting up environment
## Changing home directory
- Format destination disk as OS X Extended (Journaled) with Disk Utility  
- Uncheck Ignore ownership on this volume of volume info with Get Info
```bash
$ mkdir -p /Volumes/<drive>/Users/<account>
$ sudo chown <account> /Volumes/<drive>/Users/<account>
$ sudo chmod 755 /Volumes/<drive>/Users/<account>
$ sudo ditto -v -rsrcFork /Users/<account> /Volumes/<drive>/Users/<account>
```
- Change path  
	Users & Groups in System Preference -> Press control key and click your account -> input path(``/Volumes/<drive>/Users/<account>``) to home directory form  
- Reboot  
	  
```bash
$ sudo mv /Users/<account> /Users/bak
$ sudo ln -s /Volumes/<drive>/Users/<account> /Users/<account>
```

## Installing xcode
Install from AppStore and run xcode.  

## Installing command line developer tools
```bash
$ xcode-select --install
```

## Installing Homebrew
Refer to http://brew.sh/index.html  
```bash
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew doctor
```

## Installing git
```bash
$ brew install git
$ export PATH=/usr/local/bin:"$PATH"
$ git --version
$ git config --global user.name "kzwkzwkzw"
$ git config --global user.email "kzwkzwkzw@users.noreply.github.com"
```

## Adding ssh public key to github
Refer to https://help.github.com/articles/generating-ssh-keys/  

## Getting this repository
```bash
 $ cd ~
 $ git clone git@github.com:kzwkzwkzw/LSB.git
 $ cd ~/LSB
 $ git checkout origin/mac -b mac
```

## Installing some applications by homebrew
```bash
 $ cd ~/LSB
 $ . inst-apps.sh
```

## Installing fonts
```bash
 $ cd ~/LSB
 $ ./fonts/setup-fonts.sh
```

## Installing iterm2
Refer to https://www.iterm2.com  
```bash
 $ cd ~/LSB
 $ ./iterm2/setup-iterm2.sh
```
- Importing solarized color setting  
	Preference -> Profiles tab -> Colors tab -> Load Presets -> Import  
	Select ~/LSB/iterm2/Solarized Dark.itermcolors  
	Select imported Solarized Dark.itermcolors from Load Presets in Colors tab  
- Select font  
	Preference -> Profiles tab -> Text tab -> Regular Font and Non-ASCII Font  
	Select RictyDiminished-for-Powerline
- Enabling hotkey  
	Preference -> Keys tab -> Hotkey -> Show/Hide iTerm2 with a system-wide hotkey  
- Disabling some confirmations  
	Preference -> General tab -> Closing  
	Uncheck all checkboxes  

## Installing karabiner
Refer to https://pqrs.org/osx/karabiner/index.html.ja  
Allow karabiner to access accessibility in security and privacy of system preference
```bash
 $ cd ~/LSB
 $ ./karabiner/setup-karabiner.sh
```

## Installing seil
Refer to https://pqrs.org/osx/karabiner/seil.html.ja  
```bash
 $ cd ~/LSB
 $ ./seil/setup-seil.sh
```

## Installing showyedge
Refer to https://pqrs.org/osx/ShowyEdge/index.html.ja  

## Installing bettertouchtool  
Refer to http://www.boastr.net  
```bash
 $ cd ~/LSB
 $ ./bettertouchtool/setup-bettertouchtool.sh
```
Allow bettertouchtool to access accessibility in security and privacy of system preference  
- Import ./bettertouchtool/bettertouchtool-setting  
- Enable lunch on startup option  
	Basic Settings or Advanced Settings -> General or General Settings  
	Check Lunch BetterTouchTool on startup  

## Configuring bash
```bash
 $ cd ~/LSB
 $ ./bash/setup-bash.sh
```

## Configuring git
```bash
 $ cd ~/LSB
 $ ./git/setup-git.sh
```

## Configuring vim
```bash
 $ cd ~/LSB
 $ ./vim/setup-vim.sh
```

