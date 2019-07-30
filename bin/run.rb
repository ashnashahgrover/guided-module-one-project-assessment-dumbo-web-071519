require_relative '../config/environment'
require "pry"


program_exit = false

while(!program_exit)

  cli = Interface.new
  active_user = cli.welcome
  cli.user = active_user

  cli.choices 

  #binding.pry
  

#temp exit
  program_exit = cli.i_am_done
  program_exit = true

end

puts "hello world"
