#
# readme_higappe.sh
# shell script
# version 1.0
#
# Created by Teppei Kobayashi
# Last Modified 2015/11/12
#


# Gitのインストール
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install git


# Gitの初期設定
## ユーザー名
git config --global user.name ${GIT_USER}
## ユーザーのメールアドレス
git config --global user.email ${GIT_MAIL}
## Gitが使うエディタを指定
git config --global core.editor "emacs"
## TerminalでのGit実行時，自動で色をつける
git config --global color.ui auto


# 作業ディレクトリの作成と初期化
## ホームディレクトリ直下に"dotfiles"を作成
cd ~
mkdir dotfiles
cd dotfiles
## ローカルレポジトリを初期化
git init
## リモートレポジトリを登録(githubに"dotfiles"レポジトリが存在する前提)
git remote add dotfiles http://github.com/toronty/dotfiles.git


# ファイルの追跡・ステージング・コミット
## 追跡するファイルの追加
git add readme_higappe.sh
## ステージングエリアのファイルをコミット
## git commit -m "コメント"
git commit -m "readme, higappe!"
## リモートレポジトリにプッシュする
## git push "リモートレポジトリの登録名" "ブランチ名"
git push dotfiles master


# リモートレポジトリからプル（pull, fetch, mergeの違いに注意）
git pull dotfiles master


# よく使うコマンド
## ローカルレポジトリの状況を表示（ファイル変更などがあれば通知）
git status
## 別のリモートレポジトリをローカルにコピー
## git clone "URL"
git clone http://github.com/toronty/dotfiles.git
