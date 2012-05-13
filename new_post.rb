# -*- coding: utf-8 -*-

require 'tumblife'
require 'yaml'
require 'pp'


tumblr_config = YAML.load_file("config.yml")

Tumblife.configure do |config|
  config.consumer_key       = tumblr_config[:consumer_key]
  config.consumer_secret    = tumblr_config[:consumer_secret]
  config.oauth_token        = tumblr_config[:oauth_token]
  config.oauth_token_secret = tumblr_config[:oauth_token_secret]
end

client = Tumblife.client

post_id = client.create_post(
  "okinawaevent.tumblr.com", 
  :type  => "text", 
  :state => "draft",
  :title => "[下書き] 新規投稿テスト",
  :body  => "ここに本文を書く。 HTMLタグ=> <a href=\"http://okinawaevent.tumblr.com/\">iRyukyu</a>"
)
pp post_id						# => 22949978213
