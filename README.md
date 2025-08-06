# Dotfiles by Alex Palcuie

Hacking like a geek:

* the `playbooks` folder contains Ansible that provisions a machine with apps and configs
* the `launch` script auto-detects OS and runs the appropriate playbook
* **Shell preferences**: 
  * **Mac**: Zsh with Zinit plugin manager (syntax highlighting, autosuggestions, z jumping)
  * **Ubuntu/Debian**: Fish (primary shell)
* my main machine is a Mac, I have a work dev Debian machine, and my server is running Ubuntu
* Neovim as primary editor (aliased to vim)
* Modern CLI tools: `bat` (better cat), `eza` (better ls), `fd` (better find), `rg` (better grep)

## Setup for a new Mac machine

1. Install XCode tools using `xcode-select --install`
2. Install [Brew](http://brew.sh/)
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

## Setup for a new Linux machine

We need a version of Ansible greater than 2.0.

```bash
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible software-properties-common git
git clone https://github.com/palcu/dotfiles.git ~/dotfiles
cd ~/dotfiles
./launch
```

## Sources of inspiration

Thank you for all the people who've published their useful configs.

* http://dotfiles.github.io
* https://github.com/holman/dotfiles
* https://github.com/mgax/dotfiles
* https://github.com/razvand/snippets
* https://github.com/pivotal/vim-config
* https://github.com/pivotal/dotfiles
