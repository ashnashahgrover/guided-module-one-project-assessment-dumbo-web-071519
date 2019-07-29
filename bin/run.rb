require_relative '../config/environment'
require "pry"


exit = false

while(!exit)

  cli = Interface.new
  active_user = cli.welcome
  cli.user = active_user
  cli.choices 


  binding.pry

  exit = true

end

puts "hello world"
