# Github

## SSH

- [Generating a new SSH key and adding it to the ssh\-agent \- User Documentation](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)

```
mkdir -p ~/.ssh/github/tanjo/
ssh-keygen -t rsa -b 4096 -C "tanjo@users.noreply.github.com"
eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/github/tanjo/id_rsa
```

## config

```
Host *
 AddKeysToAgent yes
 UseKeychain yes
 IdentityFile ~/.ssh/id_rsa
```

## Adding a new SSH

```
pbcopy < ~/.ssh/github/tanjo/id_rsa.pub
```

https://github.com/settings/keys
