require 'rubygems'
require 'nokogiri'
require 'open-uri'

class String
  def bstrip
    self.scan(/\w+/) do |s|
      s.gsub('b', '')
      puts s
    end
  end
end

url = 'https://www.youtube.com/user/ERB/about'

page = Nokogiri::HTML(open(url))

stats = page.css('li.about-stat b').to_s
  
puts stats.bstrip

