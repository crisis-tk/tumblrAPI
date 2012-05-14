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

blog = client.posts(BASE_HOSTNAME, :type => "text", :limit => 1)
blog.posts.each do |post|
  pp post.blog_name             # => "okinawaevent"
  pp post.id                    # => 22892180485
  pp post.post_url              # => "http://okinawaevent.tumblr.com/22892180485/iphone"
  pp post.type                  # => "text"
  pp post.timestamp             # => 1336810205
  pp post.date                  # => "2012-05-12 08:10:05 GMT"
  pp post.format                # => "html"
  pp post.tags                  # => []
  pp post.title                 # => "[沖縄] iPhoneアプリ開発/自主勉強会"
  pp post.body                  # => 本文
end

