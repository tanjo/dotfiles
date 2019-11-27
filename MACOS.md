# Mac OS

## bash & zsh

### settings

```sh
cp bash/.bash_profile ~/.bash_profile
source ~/.bash_profile
cp bash/.bashrc ~/.bashrc
source ~/.bashrc
```
### default editor : zsh

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
