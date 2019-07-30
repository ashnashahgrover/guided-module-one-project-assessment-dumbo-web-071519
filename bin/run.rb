require_relative '../config/environment'
require "pry"


cli = Interface.new
active_user = cli.welcome
cli.user = active_user
cli.choices 

binding.pry
  

puts "hello world"
