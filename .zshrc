# =============================================================================
# 基本設定
# =============================================================================
export LANG=ja_JP.UTF-8

# bashrc の読み込み
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# =============================================================================
# パス設定
# =============================================================================
# 重複パスを登録しない
typeset -U path cdpath fpath manpath

# sudo用のpathを設定
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=({/usr/local,/usr,}/sbin(N-/))

# pathを設定
path=(~/bin(N-/) /usr/local/bin(N-/) ${path})

# =============================================================================
# 履歴設定
# =============================================================================
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000

# =============================================================================
# 補完設定
# =============================================================================
autoload -U compinit
compinit

# 補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=1

# 補完候補の色づけ
[ -x /usr/bin/dircolors ] && eval 'dircolors -b'
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# =============================================================================
# その他の基本設定
# =============================================================================
# コアダンプサイズを制限
limit coredumpsize 102400

# 出力の文字列末尾に改行コードが無い場合でも表示
unsetopt promptcr

# Emacsライクキーバインド設定
bindkey -e

# =============================================================================
# setopt 設定
# =============================================================================
# プロンプト
setopt prompt_subst

# ビープを鳴らさない
setopt nobeep

# 内部コマンド jobs の出力をデフォルトで jobs -l にする
setopt long_list_jobs

# 補完候補一覧でファイルの種別をマーク表示
setopt list_types

# サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム
setopt auto_resume

# 補完候補を一覧表示
setopt auto_list

# TAB で順に補完候補を切り替える
setopt auto_menu

# 補完候補を詰めて表示
setopt list_packed

# ディレクトリ名だけで cd
setopt auto_cd

# cd 時に自動で push
setopt auto_pushd

# 同じディレクトリを pushd しない
setopt pushd_ignore_dups

# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

# 最後のスラッシュを自動的に削除しない
setopt noautoremoveslash

# ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt mark_dirs

# スペルチェック
setopt correct

# =command を command のパス名に展開する
setopt equals

# --prefix=/usr などの = 以降も補完
setopt magic_equal_subst

# ファイル名の展開で辞書順ではなく数値的にソート
setopt numeric_glob_sort

# 出力時8ビットを通す
setopt print_eight_bit

# コマンドラインでも # 以降をコメントと見なす
setopt interactive_comments

# Ctrl+S/Ctrl+Q によるフロー制御を使わないようにする
setopt NO_flow_control

# nonomatch
setopt nonomatch

# 履歴関連
setopt extended_history        # zsh の開始, 終了時刻をヒストリファイルに書き込む
setopt share_history           # ヒストリを共有
setopt hist_ignore_dups        # 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_space       # コマンドラインの先頭がスペースで始まる場合ヒストリに追加しない
setopt hist_verify             # ヒストリを呼び出してから実行する間に一旦編集
setopt hist_no_store           # history (fc -l) コマンドをヒストリリストから取り除く

# =============================================================================
# プロンプト・色設定
# =============================================================================
autoload -Uz colors
colors

autoload -Uz add-zsh-hook
autoload -Uz vcs_info

# vcs_info 設定
zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true

# プロンプト設定
local p_cdir="%B%F{yellow}[%~]%f%b"
local p_mark=$'\n'"%B%(?, %F{green}, %F{red})>%f%b "

# vcs_info の更新関数
function _update_vcs_info_msg() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"

    # git stash の数を表示
    if [[ -e $PWD/.git/refs/stash ]]; then
        stashes=$(git stash list 2>/dev/null | wc -l)
        psvar[2]=" @${stashes// /}"
    fi
}
add-zsh-hook precmd _update_vcs_info_msg

PROMPT="$p_cdir %1(v|%F{green}%1v%f%F{yellow}%2v%f|)$p_mark"
PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT=""

# =============================================================================
# カスタム関数・キーバインド
# =============================================================================
# Enter押したら git status を表示する
function do_enter() {
    if [ -n "$BUFFER" ]; then
        zle accept-line
        return 0
    fi
    echo
    if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
        git status
    fi
    zle reset-prompt
    return 0
}
zle -N do_enter
bindkey '^m' do_enter

# =============================================================================
# 外部ファイル読み込み
# =============================================================================
# travis gem
[ -f /Users/tanjo/.travis/travis.sh ] && source /Users/tanjo/.travis/travis.sh
