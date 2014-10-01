require 'rubygems'
require 'nokogiri'
require 'open-uri'

LIST_PAGES_SUBDIR = 'erb-about-page'
URL_FILE = "urls.txt"
all_links = []

Dir.entries(LIST_PAGES_SUBDIR).select{|p| p.match('erb-about-page')}.each do |filename|
  puts "Reading #{filename}"
  n_page = Nokogiri::HTML(open("#{LIST_PAGES_SUBDIR}/#{filename}"))
  all_links << n_page.css('.about-stat')
end

File.open(URL_FILE, 'w') do |f|
  f.puts all_links
end