require 'colorize'
require_relative 'commands.rb'
require 'terminal-table'

def logo
    asciilogo = <<-'EOF'
    ____ ___  _ ____  ____  _____  _  _     ____ 
    / ___\\  \///  __\/  __\/__ __\/ \/ \   / ___\
    |    \ \  / |  \/||  \/|  / \  | || |   |    \
    \___ | /  \ |    /|  __/  | |  | || |_/\\___ |
    \____//__/\\\_/\_\\_/     \_/  \_/\____/\____/
                                                  
    EOF
    puts asciilogo.colorize(:red)
    puts "sxRPTils v0.0.1 by sxSoftwar3"
    sleep 1.2
    puts ""
    puts "Welcome to sxRPTils, a framework for pentesting and ethical hacking"
    puts "This framework is still in development, so expect bugs and errors".colorize(:red)
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
    table = Terminal::Table.new :title => 'Modules', :headings => ['Command', 'Description', 'Category'], :rows => rows
    puts table
    puts ""
    puts "To use module type 'use modules.nameofmodule'"
end

# modules 

def lookupmodules
    rows = []
    rows << ['iplookup', 'Lookup IP']
    table = Terminal::Table.new :title => 'Lookup Modules', :headings => ['Command', 'Description'], :rows => rows
    puts table
    puts ""
    puts "Use 'back' to go back to main menu"
end

# main loop

logo
puts ""
generalhelp

# make if user input is null or wrong run again loop, logo, generalcmds
loop do
    print "sxRPTils > "
    cmd = gets.chomp
    if cmd == "exit"
      puts "Bye!"
      break
    elsif cmd == "about"
      puts "sxRPTils by sxSoftwar3 (sxnvte), a framework for pentesting and ethical hacking"
      puts "Version: 0.1.0"
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
        puts "this command isn`t secred because you can see it in the code :D"
    elsif cmd == "use modules.lookup"
        loop do
            print "sxRPTils/modules/lookup > "
            cmd = gets.chomp
            if cmd == "iplookup"
                iplookup
            elsif cmd == "help"
                lookupmodules
            elsif cmd.empty?
                next
            elsif cmd == "back"
                break
            else
                puts "Unknown usage of modules"
            end
        end
    else
      puts "Unknown command, type 'help' for a list of commands"
    end
  end

