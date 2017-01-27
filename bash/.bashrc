alias javac="javac -J-Dfile.encoding=UTF-8"
alias javah="javah -J-Dfile.encoding=UTF-8"
alias java="java -Dfile.encoding=UTF-8"

alias cot="open -a /Applications/CotEditor.app"
alias atom="open -a /Applications/Atom.app"
alias dsstoreclean="open /Applications/Ds\ Store\ Remover.app"

alias pullreq="git checkout -t"
alias pullrebase="git\ pull\ --rebase"

alias cdproject="cd ~/project"
alias cdtanjo="cd ~/project/tanjo"
alias cdgoogleime="cd ~/project/tanjo/google-ime-custom-dictionary"
alias cddotfiles="cd ~/project/tanjo/dotfiles"
alias cdhomepage="cd ~/project/tanjo.github.io"

alias bashedit="atom ~/.bashrc"
alias bashupdate="source ~/.bashrc"
alias zshedit="atom ~/.zshrc"
alias zshupdate="source ~/.zshrc"
alias gitconfigedit="atom ~/.gitconfig"

alias ls="ls -alT"

alias mitmproxy-android="mitmproxy -p 9999"

# git remote update -> git checkout develop -> git pull origin develop
function gitupdatedevelop() {
  echo -e "\e[36;1m[0%]                                                                                [0%]\e[m"
  git remote update;
  echo -e "\e[36;1m[0%]########################                                                        [30%]\e[m"
  git checkout develop;
  echo -e "\e[36;1m[0%]################################################                                [60%]\e[m"
  git pull origin develop;
  echo -e "\e[36;1m[0%]################################################################################[100%]\e[m"
}
