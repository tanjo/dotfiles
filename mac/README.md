Mac の設定

![](http://gyazo.com/4bbbe03e00e181dd20f67456ba8b2346.png)

# Project Directory
`mkdir project`

# SSH
`ssh-keygen`

`cat ~/.ssh/id_rsa.pub`

`ssh git@github.com`

# Xcode のインストール
[Preferences...] -> [Downloads]
・Command Line Tools

# Git
`vi .git/config`

`git config user.name "username"`

`git config user.email "〈Email address〉"`

# Ruby
`ruby -v`

`\curl -sSL https://get.rvm.io | bash -s stable`

`rvm list known`

`rvm install 2.0.0 --autolibs=4`

`rvm use --default 2.0.0`

`ruby -v`

# HomeBrew
`ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"`

`brew doctor`

`sudo mv /opt/local ~/macports`


# Zsh
`brew install zsh`

`sudo vim /etc/shells`

最後に /usr/local/bin/zsh を追加

`chsh -s /usr/local/bin/zsh`
