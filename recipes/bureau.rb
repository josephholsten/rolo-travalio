# nvidia support {
  case node[:platform_family]
  when 'rhel'
    # wayland?
  when 'debian'
    # xorg?
  when 'freebsd'
    package "nvidia-texture-tools"
    package "nvidia-driver"
    package "nvidia-settings"
    package "nvidia-xconfig"
  when 'macos'
    # quartz included
  else
    # Not supported
  end


if node[:platform_family] == 'freebsd'
# TODO: freebsd/mkdesktop configs
# f=/etc/fstab
#   fdescfs /dev/fd fdescfs rw 0 0
  mount "/dev/fd" do
    device  "fdescfs"
    fstype  "fdescfs"
    options "rw"
    dump    0
    pass    0
    action  :enable
  end
#   procfs /proc procfs rw 0 0
#   tmpfs /compat/linux/dev/shm tmpfs rw,mode=1777,size=1g 0 0
#   linprocfs /compat/linux/proc linprocfs rw 0 0
#   linsysfs /compat/linux/sys linsysfs rw 0 0
end

  
# sysrc "kld_list=\"/boot/modules/nvidia.ko /boot/modules/nvidia-modeset.ko\""
# sysrc devfs_system_ruleset=system
# sysrc dbus_enable=YES
# sysrc cupsd_enable=YES
# sysrc linux_enable=YES
# sysrc sddm_enable=YES

# f=/etc/sysctl.conf
#   vfs.usermount=1
#   compat.linux.osrelease=3.10.0
#   kern.ipc.shm_allow_removed=1
  

# f=/boot/loader.conf
#   kern.vty=vt

# f=/etc/devfs.rules
#   [system=10]
#   add path 'usb/*' mode 0664 group operator
#   add path 'cd*' mode 0664 group operator
#   add path 'da*' mode 0664 group operator
#   add path 'video*' mode 0664 group operator


# f=/etc/devfs.conf
#   own     /dev/pci        root:operator
#   perm    /dev/pci        0664
#   own     /dev/dri/card0  root:operator
#   perm    /dev/dri/card0  0664
#   own	/dev/pass0	root:operator
#   perm	/dev/pass0	0664
#   own	/dev/xpt0	root:operator
#   perm	/dev/xpt0	0664
#   link /compat/linux/dev/shm shm
# }

# system de fenestrage {
  case node[:platform_family]
  when 'rhel'
    # wayland
  when 'debian'
    # xorg
  when 'freebsd'
    package "xorg"
    package "dbus"
  when 'macos'
    # quartz included
  else
    # Not supported
  end
# }

# display manager {
  case node[:platform_family]
  when 'rhel'
    # gdm3?
  when 'debian'
    # gdm3
  when 'freebsd'
      package "sddm"
  when 'macos'
    # quartz included
  else
    # Not supported
  end
# }

# ambiente de bureau {
  case node[:platform_family]
  when 'rhel', 'debian' 
    # package "gnome" # born:1999-03-03
  when 'freebsd'
    # package "cde"   # born:1993-06
      package "kde5"  # born:1996-10-14
    # package "xfce4" # born:1997
    # package "lxde"  # born:2006
    # package "lxqt"  # born:2013
  when 'macos'
    # quartz included
    # package "hammerspoon" # window manip ui
  else
    # Not supported
  end
# }

# clipboard {
  case node[:platform_family]
  when 'rhel', 'debian', 'freebsd'
      package "xsel-conrad" # xsel
  when 'macos'
    # pbcopy included
  else
    # Not supported
  end
# }

# notifications {
  case node[:platform_family]
  when 'rhel', 'debian', 'freebsd'
      package "libnotify" # for notify-send
  when 'macos'
    # package "terminal-notifier" 
  else
    # Not supported
  end
# }

# prevent sleep events {
  case node[:platform_family]
  when 'rhel', 'debian', 'freebsd'
    # power management built into KDE
  when 'macos'
    # package "keepingyouawake"    
  else
    # Not supported
  end
# }

# improved terminal emulator {
  # package "xterm"
  # package "iterm2"  # improved terminal emulator, macos ui
  # package "hyper"
  # package "kitty"
# }

# password store {
  # package "1password"  # password store, gui
  # package "keepassx"   # password store, foss, gui
  # package "bitwarden"  # password store, foss, gui
# }

# launcher {
  case node[:platform_family]
  when 'rhel', 'debian'
    # package "gnome-do"
  when 'freebsd'
      package "kf5-krunner"
  when 'macos'
    # package "launchbar"    # born:1996
    # package "quicksilver"  # born:2003-12-02
    # package "alfred"       # born:2010-03-03
  else
    # Not supported
  end
# }

## System Administration {{

  # package "appcleaner"    # app removal
  # package "malwarebytes"  # antivirus

# file deduplication {
  # package "gemini"
  # package "backdown"
  # package "czkawka"
  # package "duff"
  # package "fdupes"
  # package "filedupe"
  # package "rdfind"
  # package "samesame"
  # package "samefile"
  # package "swissfileknife"
  # package "ftwin"
  # package "jdupes"
  # package "rmlint"
  # package "weedit"
  # package "dupd"

  # music deduplication
    # package "fdmf"
  # image deduplication
    # package "whatpix"
# }


# fs usage viz {
  case node[:platform_family]
  when 'rhel', 'debian', 'freebsd'
      package "baobab"
  when 'macos'
    # package "daisydisk"
  else
    # Not supported
  end
# }

# Documentation Viewer {
  case node[:platform_family]
  when 'rhel', 'debian', 'freebsd'
    package "zeal"         
  when 'macos'
    package "dash"         
  else
    # Not supported
  end
# }

## }}

## Networking {{

# network file transport {
  # package "transmission"  # bittorent
  # package "transmit"      # sftp
  # package "cyberduck"     # foss sftp
# }

## }}

## Writing Tools {{

# improved text editor {
  # package "visual-studio-code"
  # package "atom"
# }

# improved word processor {
  # mas "Pages", id: 409201541
  # mas "iA Writer", id: 775737590
# }

# markdown {
  # package "qlmarkdown"
  # package "marked"
# } 

# bibliography management {
  # package "papers"
  # package "zotero"
# }

# }}

# slide deck presentation {
  # mas  "Keynote", id: 409183694
# }

# spreadsheets {
  # mas  "Numbers", id: 409203825
# }

# task management {
  # mas  "Todoist", id: 585829637 # family lists
# }

# knowledge management {
  # package "workflowy"    # outlining / external brain
  # obsidian
  # roam
  # dendron
# }

# audio creation & management {{
  # package "picard" # music tagging
  # mas  "GarageBand", id: 682658836
  # mas  "Audiobook Binder", id: 413969927
# }}

# image creation & management {{
  # package "photosweeper-x"
  # package "mylio"           # photo store
# }}

# video creation & management {{
  # package "obs"
  # mas  "iMovie", id: 408981434
  # package "handbrake"   # dvd encoding
# }}

## Communication {{

# browser {
  # netscape                 # born:1999-10-13
  # package "firefox"        # born:2004-11-09
    package "firefox-esr"

  # package "google-chrome"  # fallback
  # package "tor-browser"    # anonymous browser, tor + web browser
  # package "epiphany" # aka GNOME Web, webkit2gtk-4
    package "falkon" # qt6 WebEngine / blink
  # package "ungoogled-chromium"
  # package "linux-opera"
# }
 
# chat {
  # package "slackcat"
  # package "franz"    # chat ui, instant messaging
  # package "adium"    # instant messaging
  # package "textual"  # irc, macos gui
  # package "slack"    # sous-chefs, hangops chat
  # package "discord"
  # package "signal"   # secure messaging
# }

# video chat {
  # package "skype"
  # package "zoomus"  # video chat
# }

# news {
  # package "panic-unison"  # usenet
  # package "netnewswire"
# }

# - gpgtools    # encryption ui

## }}


# games {
  # package "sabaki"   # go board
  # package "steam"    # gaming marketplace
  # package "battle-net"
# }

# package "anki"

# mas  "Xcode", id: 497799835

# package "calibre"            # ebook mgmt
# package "hasklig"            # ligatures 
# package "electric-sheep"     # the screensaver
# package "family-tree-maker"  # geneology store
# package "karabiner-elements" # key bindings
# mas  "Timer", id: 799574890

# emulators/linux_base-c7
# emulators/wine
# emulators/wine-gecko
# emulators/wine-mono
