require_relative '../config/environment'
require "pry"


CLI = Interface.new
active_user = CLI.welcome
CLI.user = active_user
CLI.choices

binding.pry


puts "hello world"
