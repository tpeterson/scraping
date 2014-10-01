require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'

URL_FILE = "yahoo_smosh.csv"
headlines = []

url = 'https://screen.yahoo.com/smosh/'

page = Nokogiri::HTML(open(url))

page.css('div.y-page div.y-content div.y-content-inner div.strip-wrap div.Pos-r div.Zoom-1 ul.Grid li').each do |link|
  headlines << link
end

File.open(URL_FILE, 'w') do |f|
  f.puts headlines
end

puts "Copied stats"
