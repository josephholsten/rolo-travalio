# travalio::utensiles

# stores {
  # package "arq"     # backups
  # package "dropbox" # file store sync
  # package "keybase" # secure file store
  # package "ledger"  # accounting store
# }

# password store {
  # package "pass"         # password store, cli

  # 1password-cli
  include_recipe 'travalio::1password'

  # package "linux-bitwarden-cli"

  # package "oath-toolkit"         # otp generator
  # package "pwgen"
# }

# self-stalking
# package "imagesnap"      # laptop camera cli
# package "sleepwatcher"   # wakeup events
# - nolo # meter -> sink adopters
# - selfspy
# - andrewning / sortphotos
# - nwinter/telepath-logger

# botrus dev
# - bsdiff # binary diff
# - perceptualdiff # image cmp
# - xdelta # binary diff
# - tag # osx file tag manip
# - influxdb # timeseriesdb

## System Administration {{

  # package "htop"         # improved top
  # package "flock"        # file locking
  # package "docker"       # containers

## }}

## Networking {{

# parallel ssh {
  # package "pdsh"   # born:1998-09-04, parallel distributed shell
  # package "dsh"    # born:2001-05-13, dancer's shell (unmaintained)
  # package "mussh"  # born:2001-06-02, multihost ssh (unmaintained)
  # package "pssh"   # born:2003-08-16, parallel ssh (unmaintained)
  # package "mpssh"  # born:2008-06-05, mass parallel ssh
  # package "ppss"   # born:2009-01-04, parallel processing shell script (unmaintained)
  # package "hss"    # born:2017-10-15
  # go get github.com/reconquest/orgalorg
  # pip install parallel-ssh
  # pip3 install git+https://github.com/google/paramgmt.git
  #
  # cluster-ssh  # born:2002-12-??, xterm multiplexer
  # csshX        # born:2009-03-03, -> OS X
  # i2cssh       # born:2011-06-12, -> iTerm2
  # tmux-cssh    # born:2017-05-17, -> tmux
# }

# http client {
  # curl
  # wget2
  # xh
  # gurl
  # aria2
  # hurl
  # davix
  # quark
  # snarf
  # fetch
# }

## }}

## Programming {{

# package "flex"
# package "bison"
# package "awk"     # osx ships with 20070501
# package "sqlite"
# package "m4"
# package "clib"
# package "cscope"

# shell {
  # package "shellcheck" # sh linter # FIXME github.com/koalaman/shellcheck
  # package "shfmt"
# }

# C {
  # package "splint" # secure programming lint
# } 

# ruby {
  # package "ruby"     # osx ships with 2.6.3p62
  # package "ruby-install"
# }

# python {
  # package "python"   # osx ships with 3.7.3
# }

# go {
# package "go"       # required for go get
# - godef
# - gofmt
# - goimports
# - golint
# - gotags
# - guru
# }

# node {
  # package "node"     # required for npm
# }

# tag search {
    package "ctags" # osx default is bsd
# }

# version control systems {
  # all rcs supported by hig
  # package "rcs"        # conflicts on ci(1), co(1)
  # package "cvs"
  # package "bazaar"
  # package "darcs"
  # package "mercurial"
    package 'git'        # osx ships with 2.3.2, which is ancient
  # package 'pijul'
  # package "hub"        # github cli   # FIXME: github.com/github/hub
    package "ghq" do     # rcs store
      case node[:platform]
      when 'redhat', 'centos', 'oracle'
        # Not supported
        action :nothing
      when 'debian'
        # Not supported
        action :nothing
      when 'freebsd'
        package_name 'ghq'
      else
        # Not supported
        action :nothing
      end
    end
  # package "hig"        # multi-rcs ui # FIXME: github.com/josephholsten/hig
# }

## }}

## Writing Tools {{

# package "graphviz" # diagramming

# improved vi / text editor {
    package 'vim' do
      case node[:platform]
      when 'redhat', 'centos', 'oracle'
        package_name 'vim-minimal'
      else
        package_name 'vim-tiny'
      end
    end
  
    package "neovim"
    package "helix"
# }

# document authoring {
  # package "sphinx-doc"  # reStructuredText
# }

# markdown processing {
  # package "pandoc"      # text document convertion FIXME: pandoc.org
  # package "hugo"
  # package "commonmark"
# } 

# html processing {
  # package "prince"  # html to pdf
# }

# }}

# task management {
  # package "todoman"
  # package "task"    # taskwarrior
  # package 'remind'
  # package "rem"
# }

# image creation & management {{
    package "exiftool" do  # image metadata cli
      case node[:platform]
      when 'redhat', 'centos', 'oracle'
        package_name 'perl-Image-ExifTool'
      when 'debian'
        package_name 'libimage-exiftool-perl'
      when 'freebsd'
        package_name 'p5-Image-ExifTool'
      else
        # Not supported
      end
    end
  # package "imagemagick" # image manip
# }}

## Communication {{

# browser {
  # package "lynx"  # html to text # FIXME
  # w3m
  # browsh
  # elinks
  # links1
# }
 
# mail sync {
  # package "offlineimap"  # mail store sync # FIXME
# }
  
# mail reading & writing {
    package "mutt"     # maildir ui
  # package "notmuch"
# }

# calendar sync {
  # package "vdirsyncer"  # card/cal store sync # FIXME
# }

# package "khal"  # vcal ui

# contacts database {   
  # package "khard"            # vcard ui # FIXME
# }

## }}

# games {
    package "fortune" do
      case node[:platform]
      when 'redhat', 'centos', 'oracle'
        package_name 'fortune-mod'
      when 'debian'
        package_name 'fortune-mod'
      when 'freebsd'
        # fortune(6) included in base
        action :nothing
      else
        # Not supported
        action :nothing
      end
    end
  # package "nethack"  # the game  
# }

# package "gnu-typist"         # typing lessons
# package "qrencode"
