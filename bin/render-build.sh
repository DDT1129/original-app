#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate

# 1 Render用の設定ファイルを追加(binフォルダに、render-build.shという名称でファイルを新規作成)
# 2 上記1~8の内容を記述する