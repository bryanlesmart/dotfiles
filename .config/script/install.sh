#!/bin/bash

set -euo pipefail
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

DOTFILES_DIR="$HOME/.dotfiles"
CONFIG_DIR="$HOME/.config"
BACKUP_DIR="$HOME/.dotifiles_backup_$(date +%Y%m%d_%H%M%S)"
REPO_URL="https://github.com/bryanlesmart/dotfiles.git"
YAY_DIR="$HOME/yay-bin"
PKGS=(bat zsh git neovim xclip ghostty stow picom)
AUR_PKGS=(oh-my-posh)

print_msg() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_error() {
    echo -e "${RED}[INFO]${NC} $1">&2
}

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

install_yay() {
  print_msg "Step 1 : Checking for yay..."
  if ! command_exists yay; then 
      print_msg "Installing yay..."
      if [[ -d "$YAY_DIR" ]]; then 
          print_msg "Removing existing... $YAY_DIR...."
          rm -rf "$YAY_DIR"
      fi 
        git clone https://aur.archlinux.org/yay.git "$YAY_DIR" || {
          print_error "Failed clone yay repo..."
          exit 1
        }
      cd "$YAY_DIR" 
      makepkg -si --noconfirm
      cd -
      rm -rf "$YAY_DIR" 
  else 
    print_msg "yay is already installed, skipping..."
  fi

}

install_pkgs() { 
  print_msg "Step 2: Installing some pkgs..."
  #sudo pacman -Syu --noconfirm
  for aur_pkgs in "${AUR_PKGS[@]}"; do
    if command_exists "$aur_pkgs"; then 
        print_msg "$aur_pkgs is already installed. skipping.."
    else 
      print_msg "Installing $aur_pkgs from AUR..."
      yay -S --noconfirm "$aur_pkgs" || {
        print_error "failed to install $pkg"
        exit 1
      }
    fi 

  done 

  for pkg in "${PKGS[@]}"; do
    if [[ "$pkg" == "neovim" ]] && command_exists nvim; then 
        print_msg "vim command (alias nvim) its already installed"
        continue
    fi 
    if command_exists "$pkg"; then 
       print_msg "$pkg is already installed. skipping.."
    else 
      print_msg "Installing $pkg"
      sudo pacman -S --noconfirm "$pkg" || {
        print_error "failed to install $pkg"
        exit 1
      }
    fi
  done 
}

setup_zsh() {
  print_msg "Step 3 Setting up zsh ..."
  if [[ "$(basename "$SHELL")"  !=  "zsh" ]]; then 
    print_msg "Setting Zsh as default shell..."
    if command_exists zsh; then
      chsh -s "$(which zsh)" || {
        print_error "Failed to setup Zsh as default shell"
        exit 1
      }
    else
      print_error "Zsh not installed"
      exit
    fi
  else 
    
    print_msg "Zsh aleady defualt shell"
  fi
}

check_network() {
  ping -c 1 github.com >/dev/null 2>&1 || {
    print_error "No network connection to github"
    exit 1 

  }
}

setup_dotfiles() {
  print_msg "Step 4 Setting up dotfiles with Stow..."
  if [[ ! -d "$DOTFILES_DIR" ]]; then 
    print_msg "Clonning dotfiles from $REPO_URL..."
    check_network
    git clone "$REPO_URL" "$DOTFILES_DIR" || {
      print_error "Failed t clone dotfiles"
      exit 1
    }
  else
    print_msg "Dotfiles already exists , pull latest changes..."
    cd "$DOTFILES_DIR"
    git pull || {
      print_error "Failed to pull dotfiles updates"
      exit 1
    }
  fi
}


main() {
    print_msg "Starting setup..."
    install_yay
    install_pkgs 
    setup_zsh
    setup_dotfiles
  }


main


