require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'

url = 'https://www.google.com/events/io/schedule'

page = Nokogiri::HTML(open(url))

links = page.css('div.event__title')

puts links.length


