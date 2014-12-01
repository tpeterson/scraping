require 'net/http'
require 'net/https'
require 'uri'

RootCA = '/etc/ssl/certs'
url = URI.parse 'https://api.twitter.com/yourrequestgoeshere'

http = Net::HTTP.new(url.host, url.port) 
http.ca_path = RootCA
http.verify_mode = OpenSSL::SSL::VERIFY_PEER
http.verify_depth = 9

request = Net::HTTP::Get.new(url.path)
# handle oauth here, or whatever you need to do...

response = http.request(request)
# ... process response ...
