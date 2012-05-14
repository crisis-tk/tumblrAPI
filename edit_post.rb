# -*- coding: utf-8 -*-

require 'tumblife'
require 'yaml'
require 'pp'


tumblr_config = YAML.load_file("config.yml")

BASE_HOSTNAME = tumblr_config[:base_hostname]

Tumblife.configure do |config|
  config.consumer_key       = tumblr_config[:consumer_key]
  config.consumer_secret    = tumblr_config[:consumer_secret]
  config.oauth_token        = tumblr_config[:oauth_token]
  config.oauth_token_secret = tumblr_config[:oauth_token_secret]
end

client = Tumblife.client

# 投稿データの ID を取得
draft = client.draft(BASE_HOSTNAME, :type  => "text", :limit => 1)
draft_id = draft.posts[0].id
pp draft_id                     # => 22949978213

# 投稿データの編集
edit_id = client.edit_post(
  "okinawaevent.tumblr.com",
  :id    => draft_id,
  :type  => "text",
  :state => "draft",
  :title => "[下書き] 編集投稿テスト",
  :body  => "編集後の本文。 HTMLタグ=> <a href=\"#{BASE_HOSTNAME}\">iRyukyu</a>"
)
pp edit_id                      # => 22949978213

