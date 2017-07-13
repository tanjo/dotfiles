## Mac

### Project Directory

```
mkdir ~/project
```

### Install

- [Homebrew](homebrew/README.md)
  - Settings
    - [git](git/README.md)
    - [zsh](zsh/README.md)
- [npm](npm/README.md)
- [VirtualBox](http://www.oracle.com/technetwork/server-storage/virtualbox/downloads/index.html)
- [Atom](https://atom.io/)
- [Google 日本語入力](https://www.google.co.jp/ime/)
- CotEditor
- [Chrome](https://www.google.co.jp/chrome/)
- Xcode
  - [Preferences...] -> [Downloads] ・Command Line Tools
- [tanjo/Gyazo: ローカル保存をするように変更した Gyazo](https://github.com/tanjo/Gyazo)
- Goofy
- Slack
  - theme
- Evernote
- FireAlpaca
- Genymotion
- AndroidStudio
- [LINE](http://line.me/ja/download)
- TweetDeck
- Gyazo GIF
- CymoNEXT
- Ds Store Remover
- Java
- [mitmproxy](https://mitmproxy.org/)
- Robomongo
- VLC
- [Google Noto Fonts](http://www.google.com/get/noto/)
- OmniDiskSweeper
- Pushsbullet
- Sequel Pro

### SSH

TBD

### 2017/06/29

#### Microsoft Office 365

https://www.office.com/

#### Slack

https://itunes.apple.com/jp/app/slack/id803453959?mt=12

#### Xcode

App Store からインストール

#### Xcode Command Line Tools

以下のURLより

https://developer.apple.com/download/more/?=for%20Xcode

#### Google 日本語入力

https://www.google.co.jp/ime/

- キーボードの選択をGoolge日本語入力だけにする
- キー入力の速度を変更する

#### Atom

https://atom.io/

#### Homebrew

#### ffmpeg

#### bash

#### zsh

#### heroku

#### mecab

#### mecab-ipadic

#### Logicool ドライバ

http://support.logicool.co.jp/ja_jp/software/unifying

#### npm

- trash-cli

#### Github

- [Generating a new SSH key and adding it to the ssh\-agent \- User Documentation](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)

```
mkdir -p ~/.ssh/github/tanjo/
ssh-keygen -t rsa -b 4096 -C "tanjo@users.noreply.github.com"
eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/github/tanjo/id_rsa
```

##### config

```
Host *
 AddKeysToAgent yes
 UseKeychain yes
 IdentityFile ~/.ssh/id_rsa
```

##### Adding a new SSH

```
pbcopy < ~/.ssh/github/tanjo/id_rsa.pub
```

https://github.com/settings/keys

#### Gyazo (Local)

https://github.com/tanjo/Gyazo

#### Logicool 設定

システム環境設定を開く

`Contr...Center` をクリック

変更するマウス(M705)を選択して `Configure...` をクリック

- Thumb Forward Button を Mission Control にして選択も Mission Control を選択する
- Hidden Thumb Button を Open Application にして Select Other... で Gyazo を選択する
- MicroGear Precision Scroll Wheel Button を Click にして Middle Click を選択する

#### Android Studio

https://developer.android.com/studio/install.html

#### Google Drive

https://tools.google.com/dlpage/drive/thankyou.html?hl=ja

#### LINE

#### CotEditor

#### TweetDeck

#### Facebook Messenger

- [Goofy — Your Facebook Messenger client for OS X](http://www.goofyapp.com/)

#### FireAlpaca

- [フリー ペイントツール（Mac/Windows 両対応）FireAlpaca［ファイア アルパカ］](http://firealpaca.com/ja/)

#### Java

##### Install

http://www.oracle.com/technetwork/java/javase/downloads/index.html
