# Mac OS

## Homebrew

- [Homebrew — macOS 用パッケージマネージャー](http://brew.sh/index_ja.html)

### Install

```sh
bash -c "$(curl -L https://raw.githubusercontent.com/tanjo/dotfiles/gh-pages/homebrew/install)"
```

### インストールリスト
- [homebrew.txt](homebrew.txt)

  ```sh
  brew leaves > homebrew.txt
  ```

## Screenshot

### Mac Screenshot location

```sh
defaults write com.apple.screencapture location ~/Pictures/Screenshot/
killall SystemUIServer
```

## MEMO

- `.localized` という空のファイルを作成すると日本語になる.
- `.com.apple.timemachine.supported` は Time Machine 関連のファイル

## Project

主な開発は `~/project` で行う.

### Generate Directory

```sh
mkdir ~/project
```

## Logicool

### ドライバ

http://support.logicool.co.jp/ja_jp/software/unifying

### 設定

システム環境設定を開く

`Contr...Center` をクリック

変更するマウス(M705)を選択して `Configure...` をクリック

- Thumb Forward Button を Mission Control にして選択も Mission Control を選択する
- Hidden Thumb Button を Open Application にして Select Other... で Gyazo を選択する

## Terminal

- カスタムスキン
  - [Custom.terminal](Custom.terminal)

## Slack

### Sidebar Theme

```
#343A39,#82808A,#8EBDDF,#E8E8E9,#0881C7,#E8E8E9,#E8E8E9,#F2DAD8
```

### Download

- [iTunes](https://itunes.apple.com/jp/app/slack/id803453959?mt=12)

## Xcode

### Command Line Tools

- [Xcode] - [Open Developer Tool] - [More Developer Tools...]

### Download

 - [iTunes](https://itunes.apple.com/jp/app/xcode/id497799835?mt=12)

## git & github

### git

```sh
cp .gitconfig ~/.gitconfig
cp .gitignore ~/.gitignore
```

### github

#### ssh

- [Generating a new SSH key and adding it to the ssh\-agent \- User Documentation](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)

```sh
mkdir -p ~/.ssh/github/tanjo/
ssh-keygen -t rsa -b 4096 -C "tanjo@users.noreply.github.com"
eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/github/tanjo/id_rsa
```

#### Adding a new ssh

```sh
pbcopy < ~/.ssh/github/tanjo/id_rsa.pub
```

https://github.com/settings/keys


#### config

```sh
Host *
 AddKeysToAgent yes
 UseKeychain yes
 IdentityFile ~/.ssh/id_rsa
```

## bash & zsh

### bash

```sh
cp bash/.bash_profile ~/.bash_profile
source ~/.bash_profile
cp bash/.bashrc ~/.bashrc
source ~/.bashrc
```
### zsh

- `/etc/shells` に `/bin/zsh` を追加する必要がある
- デフォルトのシェルを変更
- PATHを設定する

```sh
cp shells /etc/shells
chsh -s /usr/local/bin/zsh
echo "export PATH=/usr/local/bin:\$PATH" >> ~/.zshrc
```

もしくは Mac OS 標準の zsh を利用する

```sh
chsh -s /bin/zsh
```
