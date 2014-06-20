# Dotfiles by Alex Palcuie

Hacking like a geek:

* My main machine is a Mac. But the configurations also work on a Linux remote machine
* ZSH shell with oh_my_zsh and custom stuff
* VIM provisioned with Vundle
* AppleScripts that automate my work

# Setup for new Mac

1. Update the computer to the last version
2. Install XCode and `xcode-select --install`
3. Install [Brew](http://brew.sh/)

```bash
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```

4. Install Brew stuff using `brew bundle`

5. Install [RVM](rvm.io) with the latest version of Ruby

```bash
curl -sSL https://get.rvm.io | bash -s stable --ruby
```

6. Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh/)

```bash
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
```

7. Install [Homesick](https://github.com/technicalpickles/homesick) with the dotfiles

gem install homesick
homesick clone palcu/dotfiles
homesick symlink dotfiles

8. Make ZSH the default shell

```bash
chsh -s /bin/zsh
```

9. Install the VIM plugins with [Vundle](https://github.com/gmarik/Vundle.vim)

```
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall
```

# Setup for new Ubuntu machine

1. Install just the usefull stuff for a remote machine

```bash
  add-apt-repository -y ppa:fcwu-tw/ppa
  apt-get update
  apt-get -y install vim zsh ruby rubygems curl fasd ack git
```

2. Do steps 6-9 from Mac
