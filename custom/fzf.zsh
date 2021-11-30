# fzf custom functions

# Homebrew
# @see https://medium.com/better-programming/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d#e100
# Install (one or multiple) selected application(s)
# using "brew search" as source input
fzbi() {
    local inst=$(brew search | fzf -m --preview="brew info {}")
    if [[ $inst ]]; then
        for prog in $(echo $inst); do
            brew install $prog
        done
    fi
}
# Update (one or multiple) selected application(s)
fzbu() {
    local upd=$(brew leaves | fzf -m --preview="brew info {}")
    if [[ $upd ]]; then
        for prog in $(echo $upd); do
            brew upgrade $prog
        done
    fi
}
# Delete (one or multiple) selected application(s)
# mnemonic [B]rew [C]lean [P]ackage (e.g. uninstall)
fzbrm() {
    local uninst=$(brew leaves | fzf -m --preview="brew info {}")
    if [[ $uninst ]]; then
        for prog in $(echo $uninst); do
            brew uninstall $prog
        done
    fi
}
# Install or open the webpage for the selected application
# using brew cask search as input source
# and display a info quickview window for the currently marked application
fzinstall() {
    local token
    token=$(brew search --casks | fzf-tmux --query="$1" +m --preview 'brew info {}')

    if [ "x$token" != "x" ]; then
        echo "(I)nstall or open the (h)omepage of $token"
        read input
        if [ $input = "i" ] || [ $input = "I" ]; then
            brew install $token
        fi
        if [ $input = "h" ] || [ $input = "H" ]; then
            brew home $token
        fi
    fi
}
# Uninstall or open the webpage for the selected application
# using brew list as input source (all brew cask installed applications)
# and display a info quickview window for the currently marked application
fzuninstall() {
    local token
    token=$(brew list --casks | fzf-tmux --query="$1" +m --preview 'brew info {}')

    if [ "x$token" != "x" ]; then
        echo "(U)ninstall or open the (h)omepage of $token"
        read input
        if [ $input = "u" ] || [ $input = "U" ]; then
            brew uninstall $token
        fi
        if [ $input = "h" ] || [ $token = "h" ]; then
            brew home $token
        fi
    fi
}
