require 'colorize'
require 'artii'
require 'terminal-table'
require 'net/http'
require 'json'

# make ip lookup. use request http://ip-api.com/json

def iplookup
    puts "Enter IP to lookup"
    print " > "
    ip = gets.chomp
    uri = URI("http://ip-api.com/json/#{ip}")
    response = Net::HTTP.get(uri)
    parsed = JSON.parse(response)
    rows = []
    rows << ['IP', parsed['query']]
    rows << ['Country', parsed['country']]
    rows << ['City', parsed['city']]
    rows << ['ISP', parsed['isp']]
    rows << ['Latitude', parsed['lat']]
    rows << ['Longitude', parsed['lon']]
    rows << ['Region', parsed['region']]
    rows << ['Region Name', parsed['regionName']]
    rows << ['Timezone', parsed['timezone']]
    rows << ['Zip', parsed['zip']]
    table = Terminal::Table.new :title => 'IP Lookup', :headings => ['Type', 'Value'], :rows => rows
    puts table
end
