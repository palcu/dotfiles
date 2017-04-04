# Dotfiles by Alex Palcuie

Hacking like a geek:

* the `playbooks` folder contains Ansible that provisions a machine with apps and configs
* my main machine is a Mac, and I have another Mac at my office, so I keep them in sync
* there is also a playbook for Ubuntu
* ZSH shell with ~~oh_my_zsh~~ Prezto and my .zshrc
* VIM provisioned with Vundle
* AppleScripts that automate [mundane tasks](http://palcu.blogspot.com/2014/02/automate-everything-even-opening-your.html)
* the `configs` folder is for other apps like Sublime Text or iTerm2

## Setup for new Mac machine

1. Install XCode tools using `xcode-select --install`
2. Install [Brew](http://brew.sh/)

  ```bash
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  ```

3. Install Ansible using Brew `brew install ansible`
4. As a convention `~/dotfiles` should be this repo

  ```bash
  git clone https://github.com/palcu/dotfiles.git ~/dotfiles
  ```
5. Install [XQuartz](https://xquartz.macosforge.org/landing/)
6. Run the Ansible playbook for Mac

  ```bash
  ./launch
  ```

## Setup for new Ubuntu machine

We need a version of Ansible greater than 2.0.

```bash
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible software-properties-common git
git clone https://github.com/palcu/dotfiles.git ~/dotfiles
cd ~/dotfiles/playbooks
./launch
```
