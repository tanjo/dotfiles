MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH:
ANDROID_HOME=/opt/android-sdk-macosx
ANDROIDNDK_HOME=/opt/android-ndk-r8d
HOMEBREW_TEMP=/usr/local/bin/brew/tmp

export PATH=$HOME/bin:/usr/local:/usr/local/bin:/usr/local/sbin:/usr/local/Cellar:/usr/bin:/opt/local/bin:/opt/local/sbin:/opt/local/include:/opt/local/lib:/opt/local/share:${ANDROID_HOME}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${ANDROIDNDK_HOME}:${PATH}
alias javac="javac -J-Dfile.encoding=UTF-8"
alias javah="javah -J-Dfile.encoding=UTF-8"
alias java="java -Dfile.encoding=UTF-8"
# alias terminal-notifier="terminal-notifier "
alias cot="open -a /Applications/CotEditor.app"
# alias twitter="open /Applications/Twitter.app"
# alias evernote="open -a /Applications/Evernote.app"
# alias skype="open /Applications/Skype.app"
# alias eclipse="open -a /Applications/eclipse/Eclipse.app"
# alias line="open /Applications/Line.app"
# alias Xcode="open -a /Applications/Xcode.app"
# alias gyazo="open /Applications/Gyazo.app"
# alias chrome="open /Applications/Google\ Chrome.app"

alias pullreq="git checkout -t"
alias cdproject="cd ~/project"
alias bashedit="cot ~/.bashrc"
alias zshedit="cot ~/.zshrc"
alias bashupdate="source ~/.bashrc"
alias zshupdate="source ~/.zshrc"
alias gitconfigedit="cot ~/.gitconfig"
alias home="cd ~"
alias project="cd ~/project"
alias ls="ls -l -a"
alias pullrebase="git\ pull\ --rebase"
alias gitnamerev="git\ name-rev\ --name-only"
alias gitbranchcontains="git\ branch\ --contains"
alias logcatcolor="adb logcat | script/coloredlogcat.py"

# git remote update -> git checkout develop -> git pull origin develop
function gitupdatedevelop() {
  echo -e "\e[36;1m[0%] ===============================================================\e[m"
  git remote update;
  echo -e "\e[36;1m[35%] ==============================================================\e[m"
  git checkout develop;
  echo -e "\e[36;1m[70%] ==============================================================\e[m"
  git pull origin develop;
  echo -e "\e[36;1m[100%] =============================================================\e[m"
}

# ずっと現在時刻を表示し続ける
function now() {
  while true
    do
      time=`date +%H:%M:%S`
      echo -e "$time\c"
      sleep 1
      echo -e "\r\c"time=`date +%H:%M:%S`
      echo -e "$time\c"
#      sleep 1
      echo -e "\r\c"
    done
  exit 0
}

