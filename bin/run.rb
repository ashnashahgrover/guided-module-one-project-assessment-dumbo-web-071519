require_relative '../config/environment'
require "pry"
cli = Interface.new

#create variable that will be utilized by TTY prompt
#prompt = TTY::Prompt.new

exit = false
while(!exit)  ##### start of program loop
    user_object = cli.welcome

    #we can probably change this once the welcome always returns a valid object
    cli.user = user_object









binding.pry
#### prompt to exit program
#exit = prompt.yes?('Would you like to exit?')
exit = true

end

puts "hello world"
