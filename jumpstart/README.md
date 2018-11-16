# jumpstart

Setup a development machine on macbook from scratch.

---

### Usage

```
# install xcode command line tools
xcode-select --install

# clone the repo to a temporary location
git clone git@github.com:bangthetable/jumpstart.git /tmp/jumpstart

# run the bootstrap command
/tmp/jumpstart/bootstrap
```

### Updates
--------------------------
* Dec 24, 2017 - Update dev setup to support .test & .localhost tlds
``` shell
$ ansible-playbook osx.yml -K -vvvv --tags=update-dev-tld-changes
```

### TODO
* Single command install from scratch
* ~~Bootstrap script: xcode-select, brew and ansible~~
* Install common software
  * ~~packaging software: brew cask~~
  * ~~browsers: chrome & firefox~~
  * ~~communicators: slack & skype~~
  * ~~terminal/shell etc: iterm2, zsh, oh-my-zsh, z~~
  * ~~editors: vim, sublime & brackets~~
  * utils: ~~git,~~ rbenv, ~~pow, silver-searcher, fzf, alfred~~
  * ~~virtualization: virtualbox & vagrant~~
* Setup BTT repos
  * ~~Setup EHQ~~
  * ~~Setup BA~~
  * Setup PHQ
