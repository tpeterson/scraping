require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'

URL_FILE = "erb_subsviews.csv"
links = []

url = 'https://www.youtube.com/user/ERB/about'

page = Nokogiri::HTML(open(url))

links << page.css('li.about-stat b')

File.open(URL_FILE, 'w') do |f|
  f.puts Time.now
  f.puts links
end

puts "Copied stats"