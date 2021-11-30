#  ---------------------------------------------------------------------------
#
#  Description:  This file holds all my profile configurations and aliases
#
#  Sections:
#  1.   Environment Configuration
#  2.   Make Terminal Better (remapping defaults and adding functionality)
#  3.   File and Folder Management
#  4.   Searching
#  5.   Process Management
#  6.   Networking
#  7.   System Operations & Information
#  8.   Web Development
#  9.   Reminders & Notes
# 10.   Misc.
#
#  ---------------------------------------------------------------------------

#   -------------------------------
#   1.  ENVIRONMENT CONFIGURATION
#   -------------------------------

#   Set Default Editor (change 'Nano' to the editor of your choice)
#   ------------------------------------------------------------
    export EDITOR=/usr/local/bin/code

#   Set default blocksize for ls, df, du
#   from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
#   ------------------------------------------------------------
    export BLOCKSIZE=1k



#   -----------------------------
#   2.  MAKE TERMINAL BETTER
#   -----------------------------

    alias cp='cp -iv'                                   # Preferred 'cp' implementation
    alias mv='mv -iv'                                   # Preferred 'mv' implementation
    alias mkdir='mkdir -pv'                             # Preferred 'mkdir' implementation
    alias ll='ls -FGlAhp'                               # Preferred 'ls' implementation
    alias less='less -FSRXc'                            # Preferred 'less' implementation
    alias cd..='cd ../'                                 # Go back 1 directory level (for fast typers)
    alias ..='cd ../'                                   # Go back 1 directory level
    alias ...='cd ../../'                               # Go back 2 directory levels
    alias .3='cd ../../../'                             # Go back 3 directory levels
    alias .4='cd ../../../../'                          # Go back 4 directory levels
    alias .5='cd ../../../../../'                       # Go back 5 directory levels
    alias .6='cd ../../../../../../'                    # Go back 6 directory levels
    if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
    # assume Zsh
        alias edit_shell='edit ~/.zshrc'                # Shortcut to edit zshrc
        alias reload='source ~/.zshrc'                  # Shortcut to reload zshrc
    elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
    # assume Bash
        alias edit_shell='edit ~/.bash_profile'         # Shortcut to edit bash_profile
        alias reload='source ~/.bash_profile'           # Shortcut to reload bash_profile
    fi
    alias edit_aliases='edit ~/.aliases'                # Shortcut to edit aliases file
    alias edit='code'                                   # edit:         Opens any file in code editor
    alias f='open -a Finder ./'                         # f:            Opens current directory in MacOS Finder
    alias ~="cd ~"                                      # ~:            Go Home
    alias cdc="cd ~/Code/"                              # cdp:          Go to 'Code' folder
    alias c='clear'                                     # c:            Clear terminal display
    alias path='echo -e ${PATH//:/\\n}'                 # path:         Echo all executable Paths
    alias show_options='shopt'                          # Show_options: display bash options settings
    alias fix_stty='stty sane'                          # fix_stty:     Restore terminal settings when screwed up
    alias cic='set completion-ignore-case On'           # cic:          Make tab-completion case-insensitive
    alias DT='tee ~/Desktop/terminalOut.txt'            # DT:           Pipe content to file on MacOS Desktop



#   -------------------------------
#   3.  FILE AND FOLDER MANAGEMENT
#   -------------------------------

    alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir
    alias make1mb='mkfile 1m ./1MB.dat'         # make1mb:      Creates a file of 1mb size (all zeros)
    alias make5mb='mkfile 5m ./5MB.dat'         # make5mb:      Creates a file of 5mb size (all zeros)
    alias make10mb='mkfile 10m ./10MB.dat'      # make10mb:     Creates a file of 10mb size (all zeros)
    # Backup brew packages to dotfiles:
    alias brew_dump='brew bundle dump -f --file=~/.dotfiles/Brewfile'



#   ---------------------------
#   4.  SEARCHING
#   ---------------------------

    alias qfind="find . -name "                 # qfind:    Quickly search for file



#   ---------------------------
#   5.  PROCESS MANAGEMENT
#   ---------------------------

#   memHogsTop, memHogsPs:  Find memory hogs
#   -----------------------------------------------------
    alias memHogsTop='top -l 1 -o rsize | head -20'
    alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   cpuHogs:  Find CPU hogs
#   -----------------------------------------------------
    alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

#   topForever:  Continual 'top' listing (every 10 seconds)
#   -----------------------------------------------------
    alias topForever='top -l 9999999 -s 10 -o cpu'

#   ttop:  Recommended 'top' invocation to minimize resources
#   ------------------------------------------------------------
#       Taken from this macosxhints article
#       http://www.macosxhints.com/article.php?story=20060816123853639
#   ------------------------------------------------------------
    alias ttop="top -R -F -s 10 -o rsize"



#   ---------------------------
#   6.  NETWORKING
#   ---------------------------

    alias myip='curl ifconfig.co'                       # myip:         Public facing IP Address
    alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
    alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
    alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
    alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
    alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
    alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
    alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
    alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
    alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs



#   ---------------------------------------
#   7.  SYSTEMS OPERATIONS & INFORMATION
#   ---------------------------------------

    alias mountReadWrite='/sbin/mount -uw /'    # mountReadWrite:   For use when booted into single-user

#   cleanupDS:  Recursively delete .DS_Store files
#   -------------------------------------------------------------------
    alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

#   finderShowHidden:   Show hidden files in Finder
#   finderHideHidden:   Hide hidden files in Finder
#   -------------------------------------------------------------------
    alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
    alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

#   cleanupLS:  Clean up LaunchServices to remove duplicates in the "Open With" menu
#   -----------------------------------------------------------------------------------
    alias cleanupLS="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

#    screensaverDesktop: Run a screensaver on the Desktop
#   -----------------------------------------------------------------------------------
    alias screensaverDesktop='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background'

#    force computer into sleep mode
#   -----------------------------------------------------------------------------------
    function sleepnow () {
      osascript -e 'tell app "finder" to sleep';
    }

#    force computer to shutdown
#   -----------------------------------------------------------------------------------
    function off () {
    	osascript -e 'tell app "finder" to shutdown';
    }



#   ---------------------------------------
#   8.  WEB DEVELOPMENT
#   ---------------------------------------

    alias apacheEdit='sudo edit /etc/httpd/httpd.conf'      # apacheEdit:       Edit httpd.conf
    alias apacheRestart='sudo apachectl graceful'           # apacheRestart:    Restart Apache
    alias editHosts='sudo edit /etc/hosts'                  # editHosts:        Edit /etc/hosts file
    alias herr='tail /var/log/httpd/error_log'              # herr:             Tails HTTP error logs
    alias apacheLogs="less +F /var/log/apache2/error_log"   # Apachelogs:   Shows apache error logs

#   iossim:  Open iOS simulator app from Xcode
#   -------------------------------------------------------------------
    alias ios-sim="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"



#   ---------------------------------------
#   9.  REMINDERS & NOTES
#   ---------------------------------------

#   remove_disk: spin down unneeded disk
#   ---------------------------------------
#   diskutil eject /dev/disk1s3

#   to change the password on an encrypted disk image:
#   ---------------------------------------
#   hdiutil chpass /path/to/the/diskimage

#   to mount a read-only disk image as read-write:
#   ---------------------------------------
#   hdiutil attach example.dmg -shadow /tmp/example.shadow -noverify

#   mounting a removable drive (of type msdos or hfs)
#   ---------------------------------------
#   mkdir /Volumes/Foo
#   ls /dev/disk*   to find out the device to use in the mount command)
#   mount -t msdos /dev/disk1s1 /Volumes/Foo
#   mount -t hfs /dev/disk1s1 /Volumes/Foo

#   to create a file of a given size: /usr/sbin/mkfile or /usr/bin/hdiutil
#   ---------------------------------------
#   e.g.: mkfile 10m 10MB.dat
#   e.g.: hdiutil create -size 10m 10MB.dmg
#   the above create files that are almost all zeros - if random bytes are desired
#   then use: ~/Dev/Perl/randBytes 1048576 > 10MB.dat



#   ---------------------------------------
#   10. Misc.
#   ---------------------------------------

    alias searchlp='lpass show -c --password $(lpass ls  | fzf | awk "{print $(NF)}" | sed 's/\]//g')'
    alias qgdkrutil='cd ~/Repositories/Utilities/Qgiv-Dev-Docker' # cd into qgiv docker utilities
    alias qgdkrup='~/Repositories/Utilities/Qgiv-Dev-Docker/startQgivLocalDev.sh' # execute qgiv docker start script
    alias qgdkrdown='~/Repositories/Utilities/Qgiv-Dev-Docker/stopQgivLocalDev.sh' # execute qgiv docker start script
    alias qgdkrshell='docker exec -it webserver bash' # login to qgiv webserver bash shell
    alias qgdkrfedev='~/Repositories/Utilities/Qgiv-Dev-Docker/execCdFrontend.sh' # execute qgiv docker shell and cd to fe dir