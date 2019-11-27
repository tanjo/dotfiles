alias javac="javac -J-Dfile.encoding=UTF-8"
alias javah="javah -J-Dfile.encoding=UTF-8"
alias java="java -Dfile.encoding=UTF-8"

# editor
alias cot="open -a /Applications/CotEditor.app"
alias atom="open -a /Applications/Atom.app"

# git
alias pullreq="git checkout -t"
alias pullrebase="git\ pull\ --rebase"

# directory
alias cdproject="cd ~/project"

alias cdtanjo="cd ~/project/tanjo"
alias cddotfiles="cd ~/project/tanjo/dotfiles"
alias cdhomepage="cd ~/project/tanjo/tanjo.github.io"

# bash & zsh
alias bashedit="cot ~/.bashrc"
alias bashupdate="source ~/.bashrc"
alias zshedit="cot ~/.zshrc"
alias zshupdate="source ~/.zshrc"
alias gitconfigedit="cot ~/.gitconfig"

# Ruby & MySQL
alias bundleinstall="bundle install --path vendor/bundle"
alias bundlec="bundle exec "
alias rollback="bundlec rake db:rollback"
alias migrate="bundlec rake db:migrate"

alias railss="bundle exec rails s"
alias webpackserver="bin/webpack-dev-server"

# readme generator
alias readmegenerate='echo "#" `basename $(pwd)` >> README.md'

# shell
alias shellupdate="exec $SHELL -l"
alias ls="ls -alT"

alias scr="screen"

# node & npm
alias npm-ls="npm list -g --depth=0 2>/dev/null"

# search history
function his() {
  history 100 | grep -E --color=auto "$1"
}

# lighlight word
function highlight() {
  grep -E --color=auto "$1|$"
}

# json parser
function json() {
  echo $@ | jq -r .
}

# git remote update -> git checkout develop -> git pull origin develop
function gitupdatedevelop() {
  echo -e "\e[36;1m[0%]--------------------------------------------------------------------------------[0%]\e[m"
  git remote update;
  echo -e "\e[36;1m[0%]########################--------------------------------------------------------[30%]\e[m"
  git checkout develop;
  echo -e "\e[36;1m[0%]################################################--------------------------------[60%]\e[m"
  git pull origin develop;
  echo -e "\e[36;1m[0%]################################################################################[100%]\e[m"
}

function gitpullmaster() {
  echo -e "\e[36;1m[0%]--------------------------------------------------------------------------------[0%]\e[m"
  git remote update;
  echo -e "\e[36;1m[0%]########################--------------------------------------------------------[30%]\e[m"
  git checkout master;
  echo -e "\e[36;1m[0%]################################################--------------------------------[60%]\e[m"
  git pull origin master;
  echo -e "\e[36;1m[0%]################################################################################[100%]\e[m"
}

function gitpullstaging() {
  echo -e "\e[36;1m[0%]--------------------------------------------------------------------------------[0%]\e[m"
  git remote update;
  echo -e "\e[36;1m[0%]########################--------------------------------------------------------[30%]\e[m"
  git checkout staging;
  echo -e "\e[36;1m[0%]################################################--------------------------------[60%]\e[m"
  git pull origin staging;
  echo -e "\e[36;1m[0%]################################################################################[100%]\e[m"
}