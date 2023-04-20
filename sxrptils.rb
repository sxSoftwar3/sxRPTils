#!/usr/local/bin/ruby

require 'colorize'
require_relative 'commands.rb'
require 'terminal-table'

$version = "PREVIEW-BETA"

def logo
    asciilogo = <<-'EOF'
    ____ ___  _ ____  ____  _____  _  _     ____ 
    / ___\\  \///  __\/  __\/__ __\/ \/ \   / ___\
    |    \ \  / |  \/||  \/|  / \  | || |   |    \
    \___ | /  \ |    /|  __/  | |  | || |_/\\___ |
    \____//__/\\\_/\_\\_/     \_/  \_/\____/\____/
                                                  
    EOF
    puts asciilogo.colorize(:red)
    puts "sxRPTils by sxSoftwar3 (sxnvte) "
    puts "DISCLAIMER: This tool is for educational purposes only. I am not responsible for any damage caused by this tool.".colorize(:red)
    sleep 1.2
    puts ""
    puts "Welcome to sxRPTils, a framework for pentesting and ethical hacking"
    puts "This framework is still in development, so expect bugs and errors".colorize(:red)
    puts "Information: Want to have more commands? Contact me or make a pull request on github".colorize(:green)
    puts ""
    puts "Note: Most of modules can not work without root privileges. To have most power use this tool with root privileges (especially for Linux systems)".colorize(:yellow)
    puts ""
end

# help commands
def generalhelp
    rows = []
    rows << ['modules', 'See list of modules', 'general']
    rows << ['about', 'See informations about sxRPTils', 'general']
    rows << ['cfu', 'Check For Updates', 'general']
    rows << ['advanced', 'Advanced mode', 'general']
    rows << ['help general or help', 'Shows this list', 'general']
    rows << ['exit', 'Exit sxRPTils', 'general']
    table = Terminal::Table.new :title => 'Commands', :headings => ['Command', 'Description', 'Category'], :rows => rows
    puts table
end

def moduleshelp
    rows = []
    rows << ['modules.lookup', 'Modules with lookup options', 'modules/lookup']
    rows << ['modules.nmap', 'Modules with nmap', 'modules/nmap']
    rows << ['modules.msf', 'Modules with metasploit framework', 'modules/msf']
    rows << ['modules.netcat', 'Modules with netcat', 'modules/netcat']
    rows << ['modules.osint', 'Modules with OSINT', 'modules/osint']
    rows << ['modules.misc', 'Misc modules', 'modules/misc']
    table = Terminal::Table.new :title => 'Modules', :headings => ['Command', 'Description', 'Category'], :rows => rows
    puts table
    puts ""
    puts "To use module type 'use modules.nameofmodule'"
    puts ""
    puts "You can add your own modules by editing this file and commands.rb"
    puts ""
end

# modules 

def lookupmodules
    rows = []
    rows << ['iplookup', 'Lookup IP']
    rows << ['dnslookup', 'Lookup DNS']
    table = Terminal::Table.new :title => 'Lookup Modules', :headings => ['Command', 'Description'], :rows => rows
    puts table
    puts ""
    puts "Use 'back' to go back to main menu"
end

def msfmodules
    rows = []
    rows << ['mp.android.reverse_tcp', 'Create a meterpreter reverse tcp payload for android']
    rows << ['mp.windows.reverse_tcp', 'Create a meterpreter reverse tcp payload for windows']
    rows << ['mp.linux.reverse_tcp', 'Create a meterpreter reverse tcp payload for linux']
    rows << ['mp.php.reverse_tcp', 'Create a meterpreter reverse tcp payload for php']
    table = Terminal::Table.new :title => 'MSF Modules', :headings => ['Command', 'Description'], :rows => rows
    puts table
    puts ""
    puts "Use 'back' to go back to main menu"
end

def nmapmodules
    rows = []
    rows << ['nmap.defscan', 'Default scan']
    rows << ['nmap.fastscan', 'Fast scan']
    rows << ['nmap.udp', 'UDP scan']
    rows << ['nmap.osdetect', 'OS detection']
    rows << ['nmap.stealthscan', 'Stealth scan']
    table = Terminal::Table.new :title => 'Nmap Modules', :headings => ['Command', 'Description'], :rows => rows
    puts table
    puts ""
    puts "Use 'back' to go back to main menu"
end

def netcatmodules
    rows = []
    rows << ['nc.reverseshell.linux', 'Reverse shell for linux']
    rows << ['nc.reverseshell.windows', 'Reverse shell for windows']
    table = Terminal::Table.new :title => 'Netcat Modules', :headings => ['Command', 'Description'], :rows => rows
    puts table
    puts ""
    puts "Use 'back' to go back to main menu"
end

def osintmodules
    rows = []
    rows << ['osint.sherlock', 'Search for username on social media']
    table = Terminal::Table.new :title => 'OSINT Modules', :headings => ['Command', 'Description'], :rows => rows
    puts table
    puts ""
    puts "Use 'back' to go back to main menu"
end

def miscmodules
    rows = []
    rows << ['misc.elpscrk', 'Intelligent user-password profiler']
    table = Terminal::Table.new :title => 'Misc Modules', :headings => ['Command', 'Description'], :rows => rows
    puts table
    puts ""
    puts "Use 'back' to go back to main menu"
end

# main loop

print "\e[2J\e[f"

logo
puts ""
generalhelp

# spaghetti code yay! but it is my first ruby project so i don`t care :D

loop do
    print "sxRPTils > "
    cmd = gets.chomp
    if cmd == "exit"
      puts "Bye!"
      break
    elsif cmd == "about"
      puts "sxRPTils by sxSoftwar3 (sxnvte), a framework for pentesting and ethical hacking"
      puts "Version: #{version}"
    elsif cmd.empty?
      next
    elsif cmd == "modules"
        moduleshelp
    elsif cmd == "help general" || cmd == "help"
        generalhelp
    elsif cmd == "clear"
        print "\e[2J\e[f"
    elsif cmd == "cfu"
        next
    elsif cmd == "advanced"
        next
    elsif cmd == "very secret command"
        puts "this command isn`t secret because you can see it in the code :D"
    elsif cmd == "use modules.lookup"
        puts "Using module: modules/lookup"
        puts "type 'help' to see commands"
        puts ""
        loop do
            print "sxRPTils/modules/lookup > "
            cmd = gets.chomp
            if cmd == "iplookup"
                iplookup
            elsif cmd == "clear"
                print "\e[2J\e[f"
            elsif cmd == "dnslookup"
                dnslookup
            elsif cmd == "help"
                lookupmodules
            elsif cmd.empty?
                next
            elsif cmd == "back" || cmd == "exit"
                break
            else
                puts "Unknown usage of modules"
            end
        end
    elsif cmd == "use modules.msf"
        puts "Using module: modules/msf"
        puts "type 'help' to see commands"
        puts ""
        loop do
            print "sxRPTils/modules/msf > "
            cmd = gets.chomp
            if cmd == "mp.android.reverse_tcp"
                mpandroidreversetcp
            elsif cmd == "mp.windows.reverse_tcp"
                mpwindowsreversetcp
            elsif cmd == "mp.php.reverse_tcp"
                mpphpreversetcp
            elsif cmd == "help"
                msfmodules
            elsif cmd.empty?
                next
            elsif cmd == "back" || cmd == "exit"
                break
            elsif cmd == "clear"
                print "\e[2J\e[f"
            else 
                puts "Unknown usage of modules"
            end
        end
    elsif cmd == "use modules.nmap"
        puts "Using module: modules/nmap"
        puts "type 'help' to see commands"
        puts ""
        loop do
            print "sxRPTils/modules/nmap > "
            cmd = gets.chomp
            if cmd == "help"
                nmapmodules
            elsif cmd.empty?
                next
            elsif cmd == "back" || cmd == "exit"
                break
            elsif cmd == "nmap.defscan"
                defaultscan
            elsif cmd == "nmap.fastscan"
                fastscan
            elsif cmd == "nmap.udp"
                udp
            elsif cmd == "nmap.osdetect"
                osdetect
            elsif cmd == "nmap.stealthscan"
                stealthscan
            elsif cmd == "clear"
                print "\e[2J\e[f"
            else
                puts "Unknown usage of modules"
            end
        end
    elsif cmd == "use modules.netcat"
        puts "Using module: modules/netcat"
        puts "type 'help' to see commands"
        puts ""
        loop do
            print "sxRPTils/modules/netcat > "
            cmd = gets.chomp
            if cmd == "help"
                netcatmodules
            elsif cmd.empty?
                next
            elsif cmd == "back" || cmd == "exit"
                break
            elsif cmd == "nc.reverseshell.linux"
                reverseshelllinux
            elsif cmd == "nc.reverseshell.windows"
                reverseshellwindows
            elsif cmd == "clear"
                print "\e[2J\e[f"
            else
                puts "Unknown usage of modules"
            end
        end 
    elsif cmd == "use modules.osint"
        puts "Using module: modules/osint"
        puts "type 'help' to see commands"
        puts ""
        loop do
            print "sxRPTils/modules/osint > "
            cmd = gets.chomp
            if cmd == "help"
                osintmodules
            elsif cmd.empty?
                next
            elsif cmd == "back" || cmd == "exit"
                break
            elsif cmd == "osint.sherlock"
                osintsherlock
            elsif cmd == "clear"
                print "\e[2J\e[f"
            else
                puts "Unknown usage of modules"
            end
        end  
    elsif cmd == "use modules.misc"
        puts "Using module: modules/misc"
        puts "type 'help' to see commands"
        puts ""
        loop do
            print "sxRPTils/modules/misc > "
            cmd = gets.chomp
            if cmd == "help"
                miscmodules
            elsif cmd.empty?
                next
            elsif cmd == "back" || cmd == "exit"
                break
            elsif cmd == "misc.elpscrk"
                elpscrk
            elsif cmd == "misc.elpscrk.leet"
                elpscrkleet
            elsif cmd == "clear"
                print "\e[2J\e[f"
            else
                puts "Unknown usage of modules"
            end
        end
    else
      puts "Unknown command, type 'help' for a list of commands"
    end
  end

