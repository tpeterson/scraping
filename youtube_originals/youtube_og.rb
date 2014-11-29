require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'

URL_FILE = "youtube_originals.csv"
headlines = []

url = 'http://web.archive.org/web/20130831001534/http://youtube.com/yt/advertise/original-channels.html'

page = Nokogiri::HTML(open(url))

page.css('li h3 a').each do |link|
  headlines << link.inner_html
end

File.open(URL_FILE, 'w') do |f|
  f.puts Time.now
  f.puts headlines
end

puts "Copied stats"
