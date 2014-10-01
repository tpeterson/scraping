require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'

URL_FILE = "tumblr_yahooplayer.csv"
headlines = []

url = 'https://www.tumblr.com/search/smosh/recent'

page = Nokogiri::HTML(open(url))

page.css('#posts .posts_view_masonry article.is_video').each do |link|
  headlines << link
end

#yahoo = page.css('article.is_video .post_content .video_icon_wrapper .video_embed_source')

#if (yahoo.inner_html == "yahoo")
#  headlines << yahoo
#end

#page.css('article.is_video').each do |link|
#  if (page.css('article.is_video .post_content .video_icon_wrapper .video_embed_source').inner_html = "yahoo")
#    headlines << link
#  end
#end

File.open(URL_FILE, 'w') do |f|
  f.puts headlines
end

puts "Copied stats"
