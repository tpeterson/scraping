require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'

URL_FILE = "yahooearnings.txt"
stats = []

url = 'https://investor.yahoo.net/releasedetail.cfm?ReleaseID=840365'

page = Nokogiri::HTML(open(url))

stats << page.css('money')

File.open(URL_FILE, 'w') do |f|
  f.puts stats
end

puts "Copied stats"