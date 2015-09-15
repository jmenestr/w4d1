require 'addressable/uri'
require 'rest-client'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/contacts/4'
).to_s

begin
puts RestClient.delete(url)
rescue RestClient::Exception
  puts 'user not created'
end
