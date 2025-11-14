#!/bin/bash -eu

DOTPATH="$(cd ~ && pwd)/project/tanjo/dotfiles"; export DOTPATH

# os_detect export the PLATFORM variable as you see fit
os_detect() {
    export PLATFORM
    case "$(uname -s)" in
        *'Darwin'*) PLATFORM='osx' ;;
        *)          PLATFORM='unknown' ;;
    esac
}

# Main
echo "[Start] setup.sh"
os_detect

if [ "$PLATFORM" = "osx" ]; then
    echo "[OS] OSX"
    echo "  touch ~/.localized"
    touch ~/.localized
else
    echo "Sorry, I can't manage dotfile here."
    exit 1
fi


## git / github
echo "[git/github]"
echo "  cp .gitconfig ~/.gitconfig"
cp .gitconfig ~/.gitconfig
echo "  cp .gitignore ~/.gitignore"
cp .gitignore ~/.gitignore 
echo "  cp .bash_profile ~/.bash_profile"
cp .bash_profile ~/.bash_profile

## Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "[Complete] setup.sh"
