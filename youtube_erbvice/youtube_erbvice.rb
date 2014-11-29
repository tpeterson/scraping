

require 'open-uri'

BASE_LIST_URL = 'https://www.youtube.com/user/ERB/about'

LIST_PAGES_SUBDIR = 'erb-about-page'

Dir.mkdir(LIST_PAGES_SUBDIR) unless File.exists?(LIST_PAGES_SUBDIR)

page =  open("#{BASE_LIST_URL}")

file = File.open("#{LIST_PAGES_SUBDIR}/erb-about-page-#{page}", 'w')

file.write(page.readlines)

file.close

puts "Copied page"

