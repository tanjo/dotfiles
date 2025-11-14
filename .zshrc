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
# 履歴ファイルの保存先
HISTFILE="$HOME/.zsh-history"

# メモリに展開する履歴の数
HISTSIZE=100000

# ファイルに保存する履歴の数
SAVEHIST=100000

# =============================================================================
# 補完設定
# =============================================================================
# 補完機能を有効化
autoload -U compinit
compinit

# 補完候補をカーソルで選択可能にする
zstyle ':completion:*:default' menu select=1

# 補完候補に色を付ける
if [ -x /usr/bin/dircolors ]; then
    eval 'dircolors -b'
fi
export ZLS_COLORS="$LS_COLORS"
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
# 色機能を有効化
autoload -Uz colors
colors

# フック機能を有効化
autoload -Uz add-zsh-hook

# バージョン管理システム情報を取得する機能を有効化
autoload -Uz vcs_info

# vcs_info で対応するバージョン管理システム
zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true

# プロンプト設定
# カレントディレクトリ表示（黄色、太字）
local prompt_current_dir="%B%F{yellow}[%~]%f%b"

# コマンド入力マーク（成功時は緑、失敗時は赤）
local prompt_mark=$'\n'"%B%(?, %F{green}, %F{red})>%f%b "

# vcs_info の情報を更新する関数
function _update_vcs_info_msg() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"

    # git stash がある場合、その数を表示
    if [[ -e "$PWD/.git/refs/stash" ]]; then
        local stash_count=$(git stash list 2>/dev/null | wc -l)
        psvar[2]=" @${stash_count// /}"
    fi
}
add-zsh-hook precmd _update_vcs_info_msg

# プロンプトを設定
PROMPT="$prompt_current_dir %1(v|%F{green}%1v%f%F{yellow}%2v%f|)$prompt_mark"
PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT=""

# =============================================================================
# カスタム関数・キーバインド
# =============================================================================
# Enterキーを押したときに git status を表示する関数
function do_enter() {
    # バッファに入力がある場合は通常通り実行
    if [ -n "$BUFFER" ]; then
        zle accept-line
        return 0
    fi
    
    echo
    
    # Gitリポジトリ内の場合は git status を表示
    if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
        git status
    fi
    
    zle reset-prompt
    return 0
}

# 関数をウィジェットとして登録
zle -N do_enter

# Enterキー（Ctrl+M）にバインド
bindkey '^m' do_enter
